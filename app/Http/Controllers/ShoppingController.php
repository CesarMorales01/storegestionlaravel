<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;
use App\Models\Globalvar;
use App\Traits\MetodosGenerales;

class ShoppingController extends Controller
{
    public $global = null;
    use MetodosGenerales;

    public function __construct()
    {
        $this->global = new Globalvar();
    }

    public function index()
    {
        $auth = Auth()->user();
        $url = $this->global->getMyUrl();
        $compras = DB::table('lista_compras')->orderBy('fecha', 'desc')->paginate(100);
        foreach($compras as $compra){
            $cliente=DB::table('clientes')->where('cedula', '=', $compra->cliente)->first();
            $compra->cliente=$cliente;
        }
        $token = csrf_token();
        return Inertia::render('Shopping/Shopping', compact('auth', 'compras', 'url', 'token'));
    }

    public function create()
    {
        $deptos = DB::table('departamentos')->get();
        $municipios = DB::table('municipios')->get();
        $clientes = $this->all_clientes();
        $auth = Auth()->user();
        $url = $this->global->getMyUrl();
        $productos = $this->all_products();
        $token = csrf_token();
        $datosPagina = DB::table('info_pagina')->first();
        return Inertia::render('Shopping/NewShopping', compact('auth', 'clientes', 'url', 'deptos', 'municipios', 'productos', 'datosPagina', 'token'));
    }

    public function save(Request $request)
    {
        $datos = json_decode(file_get_contents('php://input'));
        $compra_n = strval($this->get_compra_n($datos->cliente));
        
        DB::table('lista_compras')->insert([
            'cliente' => $datos->cliente,
            'compra_n' => $compra_n,
            'fecha' => $datos->fecha,
            'total_compra' => $datos->total_compra,
            'domicilio' => $datos->domicilio,
            'medio_de_pago' => $datos->medio_de_pago.": ".$datos->costo_medio_pago,
            'comentarios' => $datos->comentarios,
            'estado' => 'Recibida',
            'vendedor' => Auth()->user()->name
        ]);
        
        $nums = count($datos->listaProductos);
        for ($i = 0; $i < $nums; $i++) {
            DB::table('lista_productos_comprados')->insert([
                'cliente' => $datos->cliente,
                'compra_n' => $compra_n,
                'codigo' => $datos->listaProductos[$i]->codigo,
                'producto' => $datos->listaProductos[$i]->nombre,
                'cantidad' => $datos->listaProductos[$i]->cantidad,
                'precio' => $datos->listaProductos[$i]->precio
            ]);
           
        }
        
        return response()->json('ok', 200, []);
    }

    public function store(Request $request){
        // Eliminar aqui porque no se usa para guardar y admite post...
        DB::table('lista_productos_comprados')->where('cliente', '=', $request->cliente)->where('compra_n', '=', $request->compran)->delete();
        DB::table('lista_compras')->where('id', '=', $request->idCompra)->delete();
        $auth = Auth()->user();
        $url = $this->global->getMyUrl();
        $compras = DB::table('lista_compras')->orderBy('fecha', 'desc')->paginate(100);
        foreach($compras as $compra){
            $cliente=DB::table('clientes')->where('cedula', '=', $compra->cliente)->first();
            $compra->cliente=$cliente;
        }
        $token = csrf_token();
        return Inertia::render('Shopping/Shopping', compact('auth', 'compras', 'url', 'token'));
    }

    public function show(string $id)
    {
        
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

    public function allshopping()
    {
        $compras = DB::table('lista_compras')->get();
        foreach($compras as $compra){
            $cliente=DB::table('clientes')->where('cedula', '=', $compra->cliente)->first();
            $compra->cliente=$cliente;
        }
        return response()->json($compras, 200, []);
    }

    public function getProductosComprados(string $id, string $compran){
        $compras = DB::table('lista_productos_comprados')->where('cliente', '=', $id)->where('compra_n', '=', $compran)->get();
        return response()->json($compras, 200, []);
    }

    public function shoppingChangeState(string $id, string $state){
        DB::table('lista_compras')->where('id', '=', $id)->update([
            'estado'=> $state
        ]);
        $estado= DB::table('lista_compras')->where('id', '=', $id)->pluck('estado');
        return response()->json($estado, 200, []);
    }
}
