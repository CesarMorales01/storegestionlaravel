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
    public $global=null;
    
    public function __construct()
    {
        $this->global = new Globalvar();
    }

    public function index(): Response
    {
        $auth = Auth()->user();
        $url = $this->global->getMyUrl();
        $productos = DB::table('productos')->orderBy('id', 'desc')->paginate(100);
        return Inertia::render('Product/Index', compact('auth', 'productos', 'url'));
    }

    public function allproducts()
    {
       return response()->json($this->all_products(), 200, []);
    }

    public function create(): Response
    {
        $categorias = DB::table('categorias')->get();
        $producto = ['id' => '', 'nombre' => '', 'imagen' => ''];
        $url = $this->global->getMyUrl();
        $token = csrf_token();
        return Inertia::render('Product/NewProduct', compact('producto', 'categorias', 'url', 'token'));
    }

    public function store(Request $request)
    {
        if ($request->hasFile('imagen')) {
            $file = $request->file('imagen');
            $fileName = time() . "-" . $file->getClientOriginalName();
            $upload = $request->file('imagen')->move($this->global->getDirImagenes(), $fileName);
            DB::table('productos')->insert([
                'referencia' => $request->referencia,
                'categoria' => $request->categoria,
                'nombre' => $request->nombre,
                'descripcion' => $request->descripcion,
                'valor' => $request->valor
            ]);
            $id = DB::getPdo()->lastInsertId();
            DB::table($this->global->getNameTableImages())->insert([
                'nombre_imagen' => $fileName,
                'fk_producto' => $id
            ]);

            $auth = Auth()->user();
            $producto = DB::table('productos')->join($this->global->getNameTableImages(), function (JoinClause $join) use ($id) {
                $join->on('productos.id', '=', $this->global->getNameTableImages().".fk_producto")
                    ->where('productos.id', '=', $id);
            })->get();
            $categorias = DB::table('categorias')->get();
            $url = $this->global->getMyUrl();
            $token = csrf_token();
            $estado = "¡Producto registrado!";
            $urlImagenes=$this->global->getUrlImagenes();
            return Inertia::render('Product/NewProduct', compact('producto', 'categorias', 'url', 'estado', 'token', 'urlImagenes'));
        }
    }

    public function show(string $id)//: Response
    {
        // Eliminar en este metodo porque no se conseguido reescribir el method get por delete en el form react....
        $producto = DB::table('productos')->join($this->global->getNameTableImages(), function (JoinClause $join) use ($id) {
            $join->on('productos.id', '=', $this->global->getNameTableImages().'.fk_producto')
                ->where('productos.id', '=', $id);
        })->get();
        for($i=0; $i<count($producto); $i++){
            unlink("images/Imagenes_productos/" . $producto[$i]->nombre_imagen);
        }     
        $deleted = DB::table('productos')->where('id', '=', $id)->delete();
        $deleted1 = DB::table($this->global->getNameTableImages())->where('fk_producto', '=', $id)->delete();
        $auth = Auth()->user();
        $url = $this->global->getMyUrl();
        $estado = "¡Producto eliminado!";
        $productos = DB::table('productos')->orderBy('id', 'desc')->paginate(100);
        return Inertia::render('Product/Index', compact('auth', 'productos', 'url', 'deleted', 'estado'));
    }

    public function edit(string $id): Response
    {
        //Este metodo devuelve un array, por tanto en componente react se debe tomar en los parms[0] y el id se registra en fk_producto.
        $producto = DB::table('productos')->join($this->global->getNameTableImages(), function (JoinClause $join) use ($id) {
            $join->on('productos.id', '=', $this->global->getNameTableImages().'.fk_producto')
                ->where('productos.id', '=', $id);
        })->get();
        $categorias = DB::table('categorias')->get();
        $url = $this->global->getMyUrl();
        $token = csrf_token();
        $urlImagenes=$this->global->getUrlImagenes();
        return Inertia::render('Product/NewProduct', compact('producto', 'categorias', 'url', 'token', 'urlImagenes'));
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
            'valor' => $request->valor,
        ]);
        $producto = DB::table('productos')->join($this->global->getNameTableImages(), function (JoinClause $join) use ($id) {
            $join->on('productos.id', '=', $this->global->getNameTableImages().'.fk_producto')
                ->where('productos.id', '=', $id);
        })->get();
        $categorias = DB::table('categorias')->get();
        $url = $this->global->getMyUrl();
        $estado = "¡Producto actualizado!";
        $urlImagenes=$this->global->getUrlImagenes();
        return Inertia::render('Product/NewProduct', compact('producto', 'categorias', 'url', 'estado', 'urlImagenes'));
    }

    public function getimages(string $id)
    {
        $imagenes = DB::table($this->global->getNameTableImages())->where('fk_producto', '=', $id)->get();
        return response()->json($imagenes, 200, []);
    }

    public function image(Request $request, string $id)
    {
        if ($request->hasFile('image')) {
            $fileName = time() . "-" . $request->name;
            $upload = $request->file('image')->move($this->global->getDirImagenes(), $fileName);
            DB::table($this->global->getNameTableImages())->insert([
                'nombre_imagen' => $fileName,
                'fk_producto' => $id
            ]);
            return response()->json("ok", 200, []);
        }
    }

    public function deleteImage(Request $request, string $id)
    {
        unlink($this->global->getDirImagenes() . $request->nombre);
        DB::table($this->global->getNameTableImages())->where('id', '=', $id)->delete();
        return response()->json('ok', 200, []);
    }
}
