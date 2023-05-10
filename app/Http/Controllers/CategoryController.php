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
        $url = $this->global->getMyUrl();
        $categorias = DB::table('categorias')->orderBy('id', 'desc')->get();
        $urlImagenes = $this->global->getUrlCategorias();
        $token = csrf_token();
        return Inertia::render('Category/Categories', compact('auth', 'categorias', 'url', 'urlImagenes', 'token'));
    }

    public function create() //: Response
    {
        $category = ['id' => '', 'nombre' => '', 'imagen' => ''];
        $url = env('MY_URL');
        $token = csrf_token();
        // return Inertia::render('Category/NewCategory', compact('category', 'url', 'token', 'urlImagenes'));
    }


    public function store(Request $request)
    {
        if ($request->hasFile('imagen')) {
            $file = $request->file('imagen');
            $fileName = "ImagenesCategorias/" . time() . "-" . $file->getClientOriginalName();
            $upload = $request->file('imagen')->move($this->global->getDirCategorias(), $fileName);
            DB::table('categorias')->insert([
                'nombre' => $request->categoria,
                'imagen' => $fileName
            ]);
            $auth = Auth()->user();
            $url = $this->global->getMyUrl();
            $categorias = DB::table('categorias')->orderBy('id', 'desc')->get();
            $urlImagenes = $this->global->getUrlCategorias();
            $token = csrf_token();
            $estado = "¡Categoria creada!";
            return Inertia::render('Category/Categories', compact('auth', 'categorias', 'url', 'urlImagenes', 'token', 'estado'));
        }
    }

    public function show(string $id)
    {
        $cate= DB::table('categorias')->where('id', $id)->first();
        $token = explode("ImagenesCategorias/", $cate->imagen);
        unlink($this->global->getDirCategorias() . $token[1]);
        $deleted = DB::table('categorias')->where('id', '=', $id)->delete();
        $auth = Auth()->user();
        $url = $this->global->getMyUrl();
        $categorias = DB::table('categorias')->orderBy('id', 'desc')->get();
        $urlImagenes = $this->global->getUrlCategorias();
        $token = csrf_token();
        $estado = "¡Categoria eliminada!";
        return Inertia::render('Category/Categories', compact('auth', 'categorias', 'url', 'urlImagenes', 'token', 'estado'));
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

    public function actualizar(Request $request, string $id):Response
    {
        if ($request->hasFile('imagen')) {
            $file = $request->file('imagen');
            $fileName = "ImagenesCategorias/" . time() . "-" . $file->getClientOriginalName();
            $upload = $request->file('imagen')->move($this->global->getDirCategorias(), $fileName);
            DB::table('categorias')->where('id', $id)->update([
                'nombre' => $request->categoria,
                'imagen' => $fileName
            ]);
            $token = explode("ImagenesCategorias/", $request->nombreImagenAnterior);
            unlink($this->global->getDirCategorias() . $token[1]);
        }else{
            DB::table('categorias')->where('id', $id)->update([
                'nombre' => $request->categoria
            ]);
        }
        $auth = Auth()->user();
        $url = $this->global->getMyUrl();
        $categorias = DB::table('categorias')->orderBy('id', 'desc')->get();
        $urlImagenes = $this->global->getUrlCategorias();
        $token = csrf_token();
        $estado = "¡Categoria actualizada!";
        return Inertia::render('Category/Categories', compact('auth', 'categorias', 'url', 'urlImagenes', 'token', 'estado'));
    }
}
