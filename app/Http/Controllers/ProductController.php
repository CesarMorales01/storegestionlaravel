<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Query\JoinClause;
use App\Models\Globalvar;
use App\Traits\MetodosGenerales;

class ProductController extends Controller
{
    use MetodosGenerales;
    public $global = null;

    public function __construct()
    {
        $this->global = new Globalvar();
    }

    public function index()
    {
        $auth = Auth()->user();
        $globalVars = $this->global->getGlobalVars();
        $productos = DB::table('productos')->orderBy('id', 'desc')->paginate(100);
        $info = DB::table('info_pagina')->first();
        return Inertia::render('Product/Index', compact('auth', 'productos', 'info', 'globalVars'));
    }

    public function allproducts()
    {
        return response()->json($this->all_products(), 200, []);
    }

    public function create(): Response
    {
        $categorias = DB::table('categorias')->get();
        $producto = ['id' => '', 'nombre' => '', 'imagen' => ''];
        $globalVars = $this->global->getGlobalVars();
        $token = csrf_token();
        $info = DB::table('info_pagina')->first();
        return Inertia::render('Product/NewProduct', compact('producto', 'categorias', 'globalVars', 'token', 'info'));
    }

    public function store(Request $request)
    {
        if ($request->hasFile('imagen')) {
            $file = $request->file('imagen');
            $fileName = time() . "-" . $file->getClientOriginalName();
            $upload = $request->file('imagen')->move($this->global->getGlobalVars()->dirImagenes, $fileName);
            DB::table('productos')->insert([
                'referencia' => $request->referencia,
                'categoria' => $request->categoria,
                'nombre' => $request->nombre,
                'descripcion' => $request->descripcion,
                'cantidad' => $request->cantidad,
                'costo' => $request->costo,
                'valor' => $request->valor
            ]);
            $id = DB::getPdo()->lastInsertId();
            DB::table($this->global->getGlobalVars()->tablaImagenes)->insert([
                'nombre_imagen' => $fileName,
                'fk_producto' => $id
            ]);

            $auth = Auth()->user();
            $producto = DB::table('productos')->join($this->global->getGlobalVars()->tablaImagenes, function (JoinClause $join) use ($id) {
                $join->on('productos.id', '=', $this->global->getGlobalVars()->tablaImagenes . ".fk_producto")
                    ->where('productos.id', '=', $id);
            })->get();
            $categorias = DB::table('categorias')->get();
            $globalVars = $this->global->getGlobalVars();
            $token = csrf_token();
            $estado = "¡Producto registrado!";
            $info = DB::table('info_pagina')->first();
            return Inertia::render('Product/NewProduct', compact('producto', 'categorias', 'globalVars', 'estado', 'token', 'info'));
        }
    }

    public function show(string $id) //: Response
    {
        // Eliminar en este metodo porque no se conseguido reescribir el method get por delete en el form react....

        $validarEliminar = DB::table('promociones')->where('ref_producto', '=', $id)->first();
        if ($validarEliminar != null) {
            $estado = "¡No puedes eliminar este producto porque esta en algunas promociones!";
            $duracionAlert = 2000;
        } else {
            $estado = "¡Producto eliminado!";
            $duracionAlert = 1000;
            $producto = DB::table('productos')->join($this->global->getGlobalVars()->tablaImagenes, function (JoinClause $join) use ($id) {
                $join->on('productos.id', '=', $this->global->getGlobalVars()->tablaImagenes . '.fk_producto')
                    ->where('productos.id', '=', $id);
            })->get();
            $deleted = DB::table('productos')->where('id', '=', $id)->delete();
            $deleted1 = DB::table($this->global->getGlobalVars()->tablaImagenes)->where('fk_producto', '=', $id)->delete();
            $deleted2 = DB::table('preguntas_sobre_productos')->where('producto', '=', $id)->delete();
            for ($i = 0; $i < count($producto); $i++) {
                unlink($this->global->getGlobalVars()->dirImagenes . $producto[$i]->nombre_imagen);
            }
        }
        $auth = Auth()->user();
        $globalVars = $this->global->getGlobalVars();
        $productos = DB::table('productos')->orderBy('id', 'desc')->paginate(100);
        $info = DB::table('info_pagina')->first();
        return Inertia::render('Product/Index', compact('auth', 'productos', 'estado', 'info', 'globalVars', 'duracionAlert'));
    }

    public function edit(string $id)
    {
        //Este metodo devuelve un array, por tanto en componente react se debe tomar en los parms[0] y el id se registra en fk_producto.
        $producto = DB::table('productos')->join($this->global->getGlobalVars()->tablaImagenes, function (JoinClause $join) use ($id) {
            $join->on('productos.id', '=', $this->global->getGlobalVars()->tablaImagenes . '.fk_producto')
                ->where('productos.id', '=', $id);
        })->get();
        $categorias = DB::table('categorias')->get();
        $globalVars = $this->global->getGlobalVars();
        $token = csrf_token();
        $info = DB::table('info_pagina')->first();
        return Inertia::render('Product/NewProduct', compact('producto', 'categorias', 'globalVars', 'token', 'info'));
    }

    public function update(Request $request, string $id)
    {
        return response()->json("no llega a update" . $id, 200, []);
    }

    public function destroy(string $id)
    {
        return response()->json("no llega a delete" . $id, 200, []);
    }

    public function actualizar(Request $request, string $id)
    {
        DB::table('productos')->where('id', $id)->update([
            'referencia' => $request->referencia,
            'categoria' => $request->categoria,
            'nombre' => $request->nombre,
            'descripcion' => $request->descripcion,
            'cantidad' => $request->cantidad,
            'costo' => $request->costo,
            'valor' => $request->valor,
        ]);
        $producto = DB::table('productos')->join($this->global->getGlobalVars()->tablaImagenes, function (JoinClause $join) use ($id) {
            $join->on('productos.id', '=', $this->global->getGlobalVars()->tablaImagenes . '.fk_producto')
                ->where('productos.id', '=', $id);
        })->get();
        $categorias = DB::table('categorias')->get();
        $globalVars = $this->global->getGlobalVars();
        $estado = "¡Producto actualizado!";
        $info = DB::table('info_pagina')->first();
        $token = csrf_token();
        return Inertia::render('Product/NewProduct', compact('producto', 'categorias', 'globalVars', 'estado', 'info', 'token'));
    }

    public function getimages(string $id)
    {
        $imagenes = DB::table($this->global->getGlobalVars()->tablaImagenes)->where('fk_producto', '=', $id)->get();
        return response()->json($imagenes, 200, []);
    }

    public function image(Request $request, string $id)
    {
        if ($request->hasFile('image')) {
            $fileName = time() . "-" . $request->name;
            $upload = $request->file('image')->move($this->global->getGlobalVars()->dirImagenes, $fileName);
            DB::table($this->global->getGlobalVars()->tablaImagenes)->insert([
                'nombre_imagen' => $fileName,
                'fk_producto' => $id
            ]);
            return response()->json("ok", 200, []);
        }
    }

    public function deleteImage(Request $request, string $id)
    {
        unlink($this->global->getGlobalVars()->dirImagenes . $request->nombre);
        DB::table($this->global->getGlobalVars()->tablaImagenes)->where('id', '=', $id)->delete();
        return response()->json('ok', 200, []);
    }
}
