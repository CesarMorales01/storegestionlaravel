<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;
use App\Models\Globalvar;
use App\Traits\MetodosGenerales;


class ClientesController extends Controller{
    public $global = null;
    use MetodosGenerales;

    public function __construct(){
        $this->global = new Globalvar();
    }

    public function index()
    {
        $auth = Auth()->user();
        $globalVars = $this->global->getGlobalVars();
        $clientes = DB::table('clientes')->paginate(100);
        foreach ($clientes as $cliente) {
            $telefono = DB::table('telefonos_clientes')->where('cedula', '=', $cliente->cedula)->get();
            $cliente->telefonos = $telefono;
        }
        $info = DB::table('info_pagina')->first();      
        return Inertia::render('Customer/Customers', compact('auth', 'clientes', 'globalVars', 'info'));
    }

    public function create()
    {
        $auth = Auth()->user();
        $cliente = ['id' => '', 'cedula' => '', 'email' => ''];
        $deptos = DB::table('departamentos')->get();
        $municipios = DB::table('municipios')->get();
        $token = csrf_token();
        $info = DB::table('info_pagina')->first();      
        $globalVars = $this->global->getGlobalVars();
        return Inertia::render('Customer/NewClient', compact('auth', 'cliente', 'globalVars', 'deptos', 'municipios', 'token', 'info'));
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
        $this->ingresarCrearClave($request);
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

    public function ingresarCrearClave($request)
    {
        DB::table('crear_clave')->insert([
            'cedula' => $request->cedula,
            'usuario' => $request->usuario,
            'clave' => $request->clave,
            'correo' => $request->correo,
            'fecha_ingreso' => $request->fecha
        ]);
    }

    public function show(string $id)
    {
        // Eliminar en este metodo porque no se conseguido reescribir el method get por delete en el form react....
        $validarEliminar = DB::table('lista_compras')->where('cliente', '=', $id)->first();
        if ($validarEliminar != null) {
            $estado = "¡No puedes eliminar este cliente porque tiene algunas compras!";
            $duracionAlert = 2000;
        }else{
            DB::table('clientes')->where('cedula', '=', $id)->delete();
            DB::table('telefonos_clientes')->where('cedula', '=', $id)->delete();
            DB::table('crear_clave')->where('cedula', '=', $id)->delete();
            $duracionAlert = 1000;
            $estado = "¡Cliente eliminado!";
        }
        $auth = Auth()->user();
        $globalVars = $this->global->getGlobalVars();
        $clientes = DB::table('clientes')->paginate(100);
        foreach ($clientes as $cliente) {
            $telefono = DB::table('telefonos_clientes')->where('cedula', '=', $cliente->cedula)->get();
            $cliente->telefonos = $telefono;
        }
        $info = DB::table('info_pagina')->first();      
        return Inertia::render('Customer/Customers', compact('auth', 'clientes', 'globalVars', 'estado', 'info', 'duracionAlert'));
    }

    public function edit(string $id)
    {
        $cliente = DB::table('clientes')->where('cedula', '=', $id)->first();
        $telefonos = DB::table('telefonos_clientes')->where('cedula', '=', $id)->get();
        $usuario = DB::table('crear_clave')->where('cedula', '=', $id)->get();
        $cliente->telefonos = $telefonos;
        $cliente->usuario = $usuario;
        $cliente->id = $id;
        $auth = Auth()->user();
        $globalVars = $this->global->getGlobalVars();
        $deptos = DB::table('departamentos')->get();
        $municipios = DB::table('municipios')->get();
        $token = csrf_token();
        $info = DB::table('info_pagina')->first();      
        return Inertia::render('Customer/NewClient', compact('auth', 'cliente', 'globalVars', 'deptos', 'municipios', 'token', 'info'));
    }

    public function update(Request $request, string $id){
    }

    public function destroy(string $id){
    }

    public function actualizar(Request $request, string $id)
    {
        $update = DB::table('clientes')->where('cedula', $id)->update([
            'nombre' => $request->nombre,
            'apellidos' => $request->apellidos,
            'cedula' => $request->cedula,
            'direccion' => $request->direccion,
            'info_direccion' => $request->info_direccion,
            'ciudad' => $request->codCiudad,
            'departamento' => $request->codDepto,
            'otros' => $request->otros
        ]);
        $this->ingresar_telefonos($request);
        $this->ActualizarCrearClave($request);
        $cliente = DB::table('clientes')->where('cedula', '=', $id)->first();
        $telefonos = DB::table('telefonos_clientes')->where('cedula', '=', $id)->get();
        $usuario = DB::table('crear_clave')->where('cedula', '=', $id)->get();
        $cliente->telefonos = $telefonos;
        $cliente->usuario = $usuario;
        $cliente->id = $id;
        $auth = Auth()->user();
        $globalVars = $this->global->getGlobalVars();
        $deptos = DB::table('departamentos')->get();
        $municipios = DB::table('municipios')->get();
        $token = csrf_token();
        $estado = "¡Cliente actualizado!";
        $info = DB::table('info_pagina')->first();      
        return Inertia::render('Customer/NewClient', compact('auth', 'cliente', 'globalVars', 'deptos', 'municipios', 'token', 'estado', 'info'));
    }

    public function ActualizarCrearClave($request){
        DB::table('crear_clave')->where('cedula', $request->cedula)->update([
            'usuario' => $request->usuario,
            'clave' => $request->clave,
            'correo' => $request->correo
        ]);
    }

    public function getdatosbyced(string $ced)
    {
        $cliente = null;
        $usuario = null;
        $client = DB::table('clientes')->where('cedula', '=', $ced)->first();
        $user = DB::table('crear_clave')->where('cedula', '=', $ced)->first();
        if ($client != null) {
            $cliente = $client;
        }
        if ($user != null) {
            $usuario = $user;
        }

        $response = [
            'cliente' => $cliente,
            'usuario' => $usuario
        ];
        return response()->json($response, 200, []);
    }

    public function allclients()
    {
      return response()->json($this->all_clientes(), 200, []);
    }
}
