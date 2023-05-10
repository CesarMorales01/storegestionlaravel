<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Globalvar extends Model
{
    use HasFactory;

    public $urlRoot = "https://bellohogar.online/";
    // public $myUrl="https://gestion.bellohogar.online/";
    public $myUrl = "http://adminboard.test/";

    // Directorio donde se guardaran las imagenes (diferente en el server porque ya esta configurado que las carpetas estan en el root
    // del prodyecto, en cambio en laravel solo se puede acceder a los recursos de la carpeta public)
    public $dirImagenes = "C:\/laragon\www\/adminboard\/public\images\/Imagenes_productos\/";
    //  public $dirImagenes = "/home/u629086351/domains/bellohogar.online/public_html/Imagenes_productos/";
    // Se debe crear una url para las imagenes porque <img /> lee url no directorios.
    public $urlImagenes = "http://adminboard.test/images/Imagenes_productos/";
    // public $urlImagenes="https://bellohogar.online/Imagenes_productos/";
    // El campo imagnenes promociones ya esta configurado con el nombre de las imagenes tipo /Imagenes_productos/imagen.png
    public $urlImagenesPromociones = "http://adminboard.test/images/";
    // public $urlImagenesPromociones= "https://bellohogar.online/";

    public $dirImagenesCategorias = "C:/laragon\www/adminboard/public/images/ImagenesCategorias/";
    // public $dirImagenesCategorias = "/home/u629086351/domains/bellohogar.online/public_html/ImagenesCategorias/";

    public $urlImagenesCategorias = "http://adminboard.test/images/";
    // public $urlImagenesCategorias = "https://bellohogar.online/";

    //laravel no permite tablas con nombre en mayuscula y el proyecto ya esta con esta tabla con mayuscula
    public $tablaImagenes = "Imagenes_productos";

    public function getMyUrl()
    {
        return $this->myUrl;
    }

    public function getUrlRoot()
    {
        return $this->urlRoot;
    }

    public function getDirCategorias()
    {
        return $this->dirImagenesCategorias;
    }

    public function getUrlCategorias()
    {
        return $this->urlImagenesCategorias;
    }

    public function getDirImagenes()
    {
        return $this->dirImagenes;
    }

    public function getNameTableImages()
    {
        return $this->tablaImagenes;
    }

    public function getUrlImagenes()
    {
        return $this->urlImagenes;
    }

    public function getUrlImagenesPromociones()
    {
        return $this->urlImagenesPromociones;
    }
}
