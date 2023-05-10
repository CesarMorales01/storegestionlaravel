<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;
use App\Models\Globalvar;

class QuestionController extends Controller
{
    public $global = null;

    public function __construct()
    {
        $this->global = new Globalvar();
    }
  
    public function index()
    {
        $auth = Auth()->user();
        $url = $this->global->getMyUrl();
        $preguntas = DB::table('preguntas_sobre_productos')->orderBy('fecha', 'desc')->paginate(100);
        foreach($preguntas as $item){
            $cliente=DB::table('clientes')->where('cedula', '=', $item->cliente)->first();
            $item->cliente=$cliente;
            $producto=DB::table('productos')->where('id', '=', $item->producto)->first();
            $item->producto=$producto;
        }
        $token = csrf_token();
        return Inertia::render('Question/Questions', compact('auth', 'preguntas', 'url', 'token'));
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function show(string $id)
    {
        DB::table('preguntas_sobre_productos')->where('id', '=', $id)->delete();
        $auth = Auth()->user();
        $url = $this->global->getMyUrl();
        $preguntas = DB::table('preguntas_sobre_productos')->orderBy('fecha', 'desc')->paginate(100);
        foreach($preguntas as $item){
            $cliente=DB::table('clientes')->where('cedula', '=', $item->cliente)->first();
            $item->cliente=$cliente;
            $producto=DB::table('productos')->where('id', '=', $item->producto)->first();
            $item->producto=$producto;
        }
        $token = csrf_token();
        return Inertia::render('Question/Questions', compact('auth', 'preguntas', 'url', 'token'));
    }

    public function edit(string $id)
    {
        //
    }

    public function update(Request $request, string $id)
    {
        //
    }

    public function destroy(string $id)
    {
        //
    }

    public function setanswer(string $id, string $resp){
        DB::table('preguntas_sobre_productos')->where('id', '=', $id)->update([
            'respuesta'=>$resp
        ]);
        $respuesta=DB::table('preguntas_sobre_productos')->where('id', '=', $id)->pluck('respuesta');
        return response()->json($respuesta, 200, []);
    }

    public function allquestions(){
        $preguntas = DB::table('preguntas_sobre_productos')->get();
        foreach($preguntas as $item){
            $cliente=DB::table('clientes')->where('cedula', '=', $item->cliente)->first();
            $item->cliente=$cliente;
            $producto=DB::table('productos')->where('id', '=', $item->producto)->first();
            $item->producto=$producto;
        }
        return response()->json($preguntas, 200, []);
    }
}
