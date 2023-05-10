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
        $url = $this->global->getMyUrl();
        $promos = DB::table('promociones')->orderBy('id', 'desc')->get();
        $urlImagenesPromociones = $this->global->getUrlImagenesPromociones();
        return Inertia::render('Promociones/Promociones', compact('auth', 'promos', 'url', 'urlImagenesPromociones'));
    }

    public function create(): Response
    {
        $productos = DB::table('productos')->join($this->global->getNameTableImages(), function (JoinClause $join) {
            $join->on('productos.id', '=', $this->global->getNameTableImages() . '.fk_producto');
        })->get();
        $promo = ['id' => '', 'descripcion' => '', 'imagen' => ''];
        $url = $this->global->getMyUrl();
        $token = csrf_token();
        $auth = Auth()->user();
        $urlImagenes = $this->global->getUrlImagenes();
        return Inertia::render('Promociones/NewPromo', compact('productos', 'promo', 'url', 'token', 'auth', 'urlImagenes'));
    }

    public function store(Request $request): Response
    {
        $fileName = "";
        if ($request->hasFile('imagen')) {
            $file = $request->file('imagen');
            $fileName = $this->global->getNameTableImages() . "/" . time() . "-" . $request->nombreImagen;
            $upload = $request->file('imagen')->move($this->global->getDirImagenes(), $fileName);
        } else {
            $fileName = $request->nombreImagen;
        }
        DB::table('promociones')->insert([
            'descripcion' => $request->descripcion,
            'imagen' => $fileName,
            'ref_producto' => $request->ref_producto
        ]);
        $auth = Auth()->user();
        $url = $this->global->getMyUrl();
        $promos = DB::table('promociones')->orderBy('id', 'desc')->get();
        $urlImagenes = $this->global->getUrlImagenes();
        $urlImagenesPromociones = $this->global->getUrlImagenesPromociones();
        $estado = "¡Promoción creada!";
        return Inertia::render('Promociones/Promociones', compact('auth', 'promos', 'url', 'urlImagenes', 'urlImagenesPromociones', 'estado'));
    }

    public function show(string $id)
    {
        // Eliminar en este metodo porque no se conseguido reescribir el method get por delete en el form react....
        $promo = DB::table('promociones')->where('id', '=', $id)->first();
        

        $token = explode($this->global->getNameTableImages() . "/", $promo->imagen);
        $imagen = DB::table($this->global->getNameTableImages())->where('nombre_imagen', '=', $token[1])->first();
        if (!$imagen) {
            //return response()->json($this->global->getDirImagenes().$token[1], 200, []);
            unlink($this->global->getDirImagenes().$token[1]);
        }
        $deleted = DB::table('promociones')->where('id', '=', $id)->delete();
        $auth = Auth()->user();
        $url = $this->global->getMyUrl();
        $promos = DB::table('promociones')->orderBy('id', 'desc')->get();
        $urlImagenes = $this->global->getUrlImagenes();
        $urlImagenesPromociones = $this->global->getUrlImagenesPromociones();
        $estado = "¡Promoción eliminada!";
        return Inertia::render('Promociones/Promociones', compact('auth', 'promos', 'url', 'urlImagenes', 'urlImagenesPromociones', 'estado'));
    
    }

    public function edit(string $id): Response
    {
        $productos = DB::table('productos')->join($this->global->getNameTableImages(), function (JoinClause $join) {
            $join->on('productos.id', '=', $this->global->getNameTableImages() . '.fk_producto');
        })->get();
        $promo = DB::table('promociones')->where('id', '=', $id)->first();
        $url = $this->global->getMyUrl();
        $token = csrf_token();
        $auth = Auth()->user();
        $urlImagenes = $this->global->getUrlImagenes();
        $urlImagenesPromociones = $this->global->getUrlImagenesPromociones();
        return Inertia::render('Promociones/NewPromo', compact('productos', 'promo', 'url', 'token', 'auth', 'urlImagenes', 'urlImagenesPromociones'));
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
            $fileName = $this->global->getNameTableImages() . "/" . time() . "-" . $request->nombreImagen;
            $upload = $request->file('imagen')->move($this->global->getDirImagenes(), $fileName);
            $token = explode($this->global->getNameTableImages() . "/", $request->nombreImagenAnterior);
            $imagen = DB::table($this->global->getNameTableImages())->where('nombre_imagen', '=', $token[1])->first();
            if ($imagen == null) {
                unlink($this->global->getDirImagenes() . $token[1]);
            }
            // $this->validarImgBorrarEnProductos($request->nombreImagenAnterior);
        } else {
            $fileName = $request->nombreImagen;
        }

        DB::table('promociones')->where('id', $id)->update([
            'descripcion' => $request->descripcion,
            'imagen' => $fileName,
            'ref_producto' => $request->ref_producto
        ]);

        $auth = Auth()->user();
        $url = $this->global->getMyUrl();
        $promos = DB::table('promociones')->orderBy('id', 'desc')->get();
        $urlImagenes = $this->global->getUrlImagenes();
        $urlImagenesPromociones = $this->global->getUrlImagenesPromociones();
        $estado = "¡Promoción actualizada!";
        return Inertia::render('Promociones/Promociones', compact('auth', 'promos', 'url', 'urlImagenes', 'urlImagenesPromociones', 'estado'));
    }

    public function validarImgBorrarEnProductos(string $img)
    {
        return response()->json("here" . $img, 200, []);
    }
}
