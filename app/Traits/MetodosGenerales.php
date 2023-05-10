<?php 
namespace App\Traits;
use Illuminate\Support\Facades\DB;

trait MetodosGenerales{

    public function ingresar_telefonos($request){
        DB::table('telefonos_clientes')->where('cedula', '=', $request->cedula)->delete();
        for ($i = 0; $i < count($request->telefonos); $i++) {
            $token = strtok($request->telefonos[$i], ",");
            while ($token !== false) {
                DB::table('telefonos_clientes')->insert([
                    'cedula' => $request->cedula,
                    'telefono' => $token
                ]);
                $token = strtok(",");
            }
        }
    }

    public function all_clientes()
    {
        $clientes = DB::table('clientes')->get();
        foreach ($clientes as $cliente) {
            $telefono = DB::table('telefonos_clientes')->where('cedula', '=', $cliente->cedula)->get();
            $usuario = DB::table('crear_clave')->where('cedula', '=', $cliente->cedula)->get();
            $cliente->telefonos = $telefono;
            $cliente->usuario = $usuario;
        }
       return $clientes;
    }


    public function all_products()
    {
       return $productos = DB::table('productos')->get();
    }

    public function get_compra_n($cliente){
        $compran=1;
        $validarNCompra=DB::table('lista_compras')->where('cliente', '=', $cliente)->orderBy('compra_n', 'desc')->first();
       if($validarNCompra){
          $compran=$validarNCompra->compra_n+1;  
       }
        return $compran;
    }
}
?>