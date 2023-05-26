import Login from './Auth/Login';
import Index from './Product/Index';
import { useState, useEffect } from 'react';
import { Head } from '@inertiajs/react';
import Swal from 'sweetalert2'
import loading from '../../../public/Imagenes_config/loading.gif'


export default function Welcome({ auth, laravelVersion, phpVersion }) {

    const [info, setInfo] = useState([])

    useEffect(() => {   
        if (auth.user) {
            window.location.href = window.location.href + "product";
        }else{
            getlogo()
        }
    }, [])

    function getlogo(){
        const url = window.location.href+ 'api/setting/getlogo'
        fetch(url)
            .then((response) => {
                return response.json()
            }).then((json) => {
                setInfo(json)
            })
    }

    function cargando() {
        Swal.fire({
            title: 'Cargando...',
            timerProgressBar: true,
            didOpen: () => {
                Swal.showLoading()
            }
        })
    }

    return (
        <>
            <Head title="Welcome" />
            {auth.user ? (
                <img width='0' height='0' src={loading} onLoad={cargando} />
            ) : (
                <>
                    <Login info={info}></Login>
                </>
            )}
        </>
    );
}
