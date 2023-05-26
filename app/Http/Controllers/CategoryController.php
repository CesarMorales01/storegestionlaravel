<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Query\JoinClause;
use App\Models\Globalvar;

class CategoryController extends Controller
{

    public $global = null;

    public function __construct()
    {
        $this->global = new Globalvar();
    }

    public function index(): Response
    {
        $auth = Auth()->user();
        $categorias = DB::table('categorias')->orderBy('id', 'desc')->get();
        $globalVars = $this->global->getGlobalVars();
        $token = csrf_token();
        $info = DB::table('info_pagina')->first();
        return Inertia::render('Category/Categories', compact('auth', 'categorias', 'globalVars', 'token', 'info'));
    }

    public function create()
    {
    }

    public function store(Request $request)
    {
        if ($request->hasFile('imagen')) {
            $file = $request->file('imagen');
            $fileName = "ImagenesCategorias/" . time() . "-" . $file->getClientOriginalName();
            $upload = $request->file('imagen')->move($this->global->getGlobalVars()->dirImagenesCategorias, $fileName);
            DB::table('categorias')->insert([
                'nombre' => $request->categoria,
                'imagen' => $fileName
            ]);
            $auth = Auth()->user();
            $categorias = DB::table('categorias')->orderBy('id', 'desc')->get();
            $globalVars = $this->global->getGlobalVars();
            $token = csrf_token();
            $estado = "¡Categoria creada!";
            $info = DB::table('info_pagina')->first();
            return Inertia::render('Category/Categories', compact('auth', 'categorias', 'globalVars', 'token', 'estado', 'info'));
        }
    }

    public function show(string $id)
    {   
        $cate = DB::table('categorias')->where('id', $id)->first();
        $validarEnproductos=DB::table('productos')->where('categoria', '=', $cate->nombre)->first();
        if($validarEnproductos!=null){
            $estado = "¡No puedes eliminar esta categoria porque esta en algunos productos!";
            $duracionAlert=2000;
        }else{
            $token = explode("ImagenesCategorias/", $cate->imagen);
            unlink($this->global->getGlobalVars()->dirImagenesCategorias . $token[1]);
            $deleted = DB::table('categorias')->where('id', '=', $id)->delete();
            $estado = "¡Categoria eliminada!";
            $duracionAlert=1000;
        }
        $auth = Auth()->user();
        $categorias = DB::table('categorias')->orderBy('id', 'desc')->get();
        $globalVars = $this->global->getGlobalVars();
        $info = DB::table('info_pagina')->first();
        $token = csrf_token();
        return Inertia::render('Category/Categories', compact('auth', 'categorias', 'globalVars', 'token', 'estado', 'info', 'duracionAlert'));
    }


    public function edit(string $id)
    {
        //
    }


    public function update(Request $request, string $id)
    {
        return response()->json("update" . $id, 200, []);
    }


    public function destroy(string $id)
    {
    }

    public function actualizar(Request $request, string $id): Response
    {
        if ($request->hasFile('imagen')) {
            $file = $request->file('imagen');
            $fileName = "ImagenesCategorias/" . time() . "-" . $file->getClientOriginalName();
            $upload = $request->file('imagen')->move($this->global->getGlobalVars()->dirImagenesCategorias, $fileName);
            DB::table('categorias')->where('id', $id)->update([
                'nombre' => $request->categoria,
                'imagen' => $fileName
            ]);
            $token = explode("magenesCategorias/", $request->nombreImagenAnterior);
            unlink($this->global->getGlobalVars()->dirImagenesCategorias . $token[1]);
        } else {
            DB::table('categorias')->where('id', $id)->update([
                'nombre' => $request->categoria
            ]);
        }
        $auth = Auth()->user();
        $globalVars = $this->global->getGlobalVars();
        $categorias = DB::table('categorias')->orderBy('id', 'desc')->get();
        $info = DB::table('info_pagina')->first();
        $token = csrf_token();
        $estado = "¡Categoria actualizada!";
        return Inertia::render('Category/Categories', compact('auth', 'categorias', 'globalVars', 'token', 'estado', 'info'));
    }
}
