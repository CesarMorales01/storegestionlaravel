<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Database\Query\JoinClause;
use App\Models\Globalvar;

class PromocionesController extends Controller
{
    public $global = null;

    public function __construct()
    {
        $this->global = new Globalvar();
    }

    public function index(): Response
    {
        $auth = Auth()->user();
        $promos = DB::table('promociones')->orderBy('id', 'desc')->get();
        $globalVars = $this->global->getGlobalVars();
        $info = DB::table('info_pagina')->first();      
        return Inertia::render('Promociones/Promociones', compact('auth', 'promos', 'globalVars', 'info'));
    }

    public function create(): Response
    {
        $productos=DB::table('productos')->get();
        foreach($productos as $item){
            $imagen=DB::table($this->global->getGlobalVars()->tablaImagenes)->where('fk_producto', '=', $item->id)->first();
            $item->imagen=$imagen;
        }
        $promo = ['id' => '', 'descripcion' => '', 'imagen' => ''];
        $globalVars = $this->global->getGlobalVars();
        $token = csrf_token();
        $auth = Auth()->user();
        $info = DB::table('info_pagina')->first();      
        return Inertia::render('Promociones/NewPromo', compact('productos', 'promo', 'globalVars', 'token', 'auth', 'info'));
    }

    public function store(Request $request): Response
    {
        $fileName = "";
        if ($request->hasFile('imagen')) {
            $file = $request->file('imagen');
            $fileName = $this->global->getGlobalVars()->tablaImagenes . "/" . time() . "-" . $request->nombreImagen;
            $upload = $request->file('imagen')->move($this->global->getGlobalVars()->dirImagenes, $fileName);
        } else {
            $fileName = $request->nombreImagen;
        }
        DB::table('promociones')->insert([
            'descripcion' => $request->descripcion,
            'imagen' => $fileName,
            'ref_producto' => $request->ref_producto
        ]);
        $auth = Auth()->user();
        $globalVars = $this->global->getGlobalVars();
        $promos = DB::table('promociones')->orderBy('id', 'desc')->get();
        $estado = "¡Promoción creada!";
        $info = DB::table('info_pagina')->first(); 
        return Inertia::render('Promociones/Promociones', compact('auth', 'promos', 'globalVars', 'estado', 'info'));
    }

    public function show(string $id)
    {
        // Eliminar en este metodo porque no se conseguido reescribir el method get por delete en el form react....
        $promo = DB::table('promociones')->where('id', '=', $id)->first();
        

        $token = explode($this->global->getGlobalVars()->tablaImagenes . "/", $promo->imagen);
        $imagen = DB::table($this->global->getGlobalVars()->tablaImagenes)->where('nombre_imagen', '=', $token[1])->first();
        if (!$imagen) {
            //return response()->json($this->global->getDirImagenes().$token[1], 200, []);
            unlink($this->global->getGlobalVars()->dirImagenes.$token[1]);
        }
        $deleted = DB::table('promociones')->where('id', '=', $id)->delete();
        $auth = Auth()->user();
        $globalVars = $this->global->getGlobalVars();
        $promos = DB::table('promociones')->orderBy('id', 'desc')->get();
        $estado = "¡Promoción eliminada!";
        $info = DB::table('info_pagina')->first(); 
        return Inertia::render('Promociones/Promociones', compact('auth', 'promos', 'globalVars', 'estado', 'info'));
    
    }

    public function edit(string $id): Response
    {
        $productos = DB::table('productos')->join($this->global->getGlobalVars()->tablaImagenes, function (JoinClause $join) {
            $join->on('productos.id', '=', $this->global->getGlobalVars()->tablaImagenes . '.fk_producto');
        })->get();
        $promo = DB::table('promociones')->where('id', '=', $id)->first();
        $globalVars = $this->global->getGlobalVars();
        $token = csrf_token();
        $auth = Auth()->user();
        $info = DB::table('info_pagina')->first(); 
        return Inertia::render('Promociones/NewPromo', compact('productos', 'promo', 'globalVars', 'token', 'auth', 'info'));
    }

    public function update(Request $request, string $id)
    {
        return response()->json("update" . $id, 200, []);
    }

    public function destroy(string $id)
    {
        echo "destroy" . $id;
    }

    public function actualizar(Request $request, string $id) //: Response
    {
        $fileName = "";
        if ($request->hasFile('imagen')) {
            $file = $request->file('imagen');
            $fileName = $this->global->getGlobalVars()->tablaImagenes . "/" . time() . "-" . $request->nombreImagen;
            $upload = $request->file('imagen')->move($this->global->getGlobalVars()->dirImagenes, $fileName);
            $token = explode($this->global->getGlobalVars()->tablaImagenes . "/", $request->nombreImagenAnterior);
            $imagen = DB::table($this->global->getGlobalVars()->tablaImagenes)->where('nombre_imagen', '=', $token[1])->first();
            if ($imagen == null) {
                unlink($this->global->getGlobalVars()->dirImagenes . $token[1]);
            }
        } else {
            $fileName = $request->nombreImagen;
        }

        DB::table('promociones')->where('id', $id)->update([
            'descripcion' => $request->descripcion,
            'imagen' => $fileName,
            'ref_producto' => $request->ref_producto
        ]);

        $auth = Auth()->user();
        $globalVars = $this->global->getGlobalVars();
        $promos = DB::table('promociones')->orderBy('id', 'desc')->get();
        $estado = "¡Promoción actualizada!";
        $info = DB::table('info_pagina')->first(); 
        return Inertia::render('Promociones/Promociones', compact('auth', 'promos', 'globalVars', 'estado', 'info'));
    }
}
