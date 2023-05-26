<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;
use App\Models\Globalvar;
use App\Traits\MetodosGenerales;

class ClientesImcompletosController extends Controller
{
    use MetodosGenerales;
    public $global = null;

    public function __construct(){
        $this->global = new Globalvar();
    }
    
    public function index()
    {
        $auth = Auth()->user();
        $globalVars = $this->global->getGlobalVars();
        $clientes = DB::table('crear_clave')->where('cedula','=', null)->orWhere('cedula', '=', '')->paginate(100);
        $info = DB::table('info_pagina')->first();      
        return Inertia::render('Incompleteregister/List', compact('auth', 'clientes', 'globalVars', 'info'));
    }

    public function create(){        
    }


    public function store(Request $request)
    {
        DB::table('clientes')->insert([
            'nombre' => $request->nombre,
            'apellidos' => $request->apellidos,
            'cedula' => $request->cedula,
            'direccion' => $request->direccion,
            'info_direccion' => $request->info_direccion,
            'ciudad' => $request->codCiudad,
            'departamento' => $request->codDepto,
            'otros' => $request->otros,
            'fecha_ingreso' => $request->fecha
        ]);
        $this->ingresar_telefonos($request);
        $this->ActualizarCrearClave($request);
        $auth = Auth()->user();
        $globalVars = $this->global->getGlobalVars();
        $clientes = DB::table('clientes')->paginate(100);
        foreach ($clientes as $cliente) {
            $telefono = DB::table('telefonos_clientes')->where('cedula', '=', $cliente->cedula)->get();
            $cliente->telefonos = $telefono;
        }
        $estado = "¡Nuevo cliente registrado!";
        $info = DB::table('info_pagina')->first();
        return Inertia::render('Customer/Customers', compact('auth', 'clientes', 'globalVars', 'estado', 'info'));
    }

    public function ActualizarCrearClave($request){
        DB::table('crear_clave')->where('correo', '=', $request->correo)->update([
            'cedula'=> $request->cedula,
            'usuario' => $request->usuario,
            'clave' => $request->clave
        ]);
    }

    public function show(string $id)
    {
        
    }

    public function edit(string $id)
    {
        $cliente = DB::table('crear_clave')->where('correo', '=', $id)->first();
        $auth = Auth()->user();
        $globalVars = $this->global->getGlobalVars();
        $deptos = DB::table('departamentos')->get();
        $municipios = DB::table('municipios')->get();
        $token = csrf_token();
        $info = DB::table('info_pagina')->first();      
        return Inertia::render('Incompleteregister/EditClient', compact('auth', 'cliente', 'globalVars', 'deptos', 'municipios', 'token', 'info'));
    }

    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function allclients()
    {
        $clientes = DB::table('crear_clave')->get();
       return response()->json($clientes, 200, []);
    }
}
