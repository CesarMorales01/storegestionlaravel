<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use stdClass;

class Globalvar extends Model
{
    use HasFactory;

    public $globalVars;

    function __construct()
    {
        $this->globalVars = new stdClass();
        //$this->globalVars->urlRoot = "https://bellohogar.online/";
        $this->globalVars->urlRoot = "https://tucasabonita.site/";

        // $this->globalVars->myUrl="https://gestion.bellohogar.online/";
        $this->globalVars->myUrl = "http://adminboard.test/";

        /*
            Directorio donde se guardaran las imagenes (diferente en el server porque ya esta configurado que las carpetas estan en el root
            del prodyecto, en cambio en laravel solo se puede acceder a los recursos de la carpeta public)
        */
        $this->globalVars->dirImagenes = "C:\/laragon\www\/adminboard\/public\images\/Imagenes_productos\/";
        //  $this->globalVars->dirImagenes = "/home/u629086351/domains/bellohogar.online/public_html/Imagenes_productos/";

        /* Se debe crear una url para las imagenes porque <img /> lee url no directorios.*/
        $this->globalVars->urlImagenes = "http://adminboard.test/images/Imagenes_productos/";
        // $this->globalVars->urlImagenes="https://bellohogar.online/Imagenes_productos/";

        /* El campo imagenes promociones ya esta configurado con el nombre de las imagenes tipo /Imagenes_productos/imagen.png*/
        $this->globalVars->urlImagenesPromociones = "http://adminboard.test/images/";
        // $this->globalVars->urlImagenesPromociones= "https://bellohogar.online/";

        $this->globalVars->dirImagenesCategorias = "C:/laragon\www/adminboard/public/images/ImagenesCategorias/";
        // $this->globalVars->dirImagenesCategorias = "/home/u629086351/domains/bellohogar.online/public_html/ImagenesCategorias/";

        $this->globalVars->urlImagenesCategorias = "http://adminboard.test/images/";
        // $this->globalVars->urlImagenesCategorias = "https://bellohogar.online//ImagenesCategorias/";

        /*laravel no permite tablas con nombre en mayuscula y el proyecto ya esta con esta tabla con mayuscula*/
        $this->globalVars->tablaImagenes = "Imagenes_productos";
    }


    public function getGlobalVars()
    {
        return $this->globalVars;
    }
}
