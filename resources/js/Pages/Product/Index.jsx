import React from 'react'
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';
import { useState, useEffect } from 'react';
import { TablaProductos } from './TablaProductos'
import Swal from 'sweetalert2'

const Index = (params) => {
    const [productos, setProductos] = useState([])
    const [filterProducts, setFilterProducts] = useState(params.productos.data)
    const [noproductos, setNoProductos] = useState(false)

    if(params.info==null){
       window.location.href=params.globalVars.myUrl+"setting"
    }

    useEffect(() => {
        if (filterProducts.length == 0) {
            setNoProductos(true)
        } else {
            setNoProductos(false)
        }
    }, [filterProducts, productos])

    useEffect(() => {
        if (params.estado != null) {
            Swal.fire({
                title: params.estado,
                icon: params.estado.includes('elimin') ? 'warning' : 'success',
                timer: !params.duracionAlert ? 1000 : params.duracionAlert
            })
        }
    }, [])

    function cambioNombre(e) {
        const buscar = e.target.value.toLowerCase()
        let newArray = []
        for (let i = 0; i < productos.length; i++) {
            if (productos[i].nombre.toLowerCase().includes(buscar) || productos[i].descripcion.toLowerCase().includes(buscar)) {
                newArray.push(productos[i])
            }
        }
        if (newArray.length == productos.length) {
            newArray = params.productos.data
        }
        if (newArray.length == 0) {
            setNoProductos(true)
        }
        setFilterProducts(newArray)
    }

    function borrarInput() {
        document.getElementById('inputBuscar').value = ''
        document.getElementById('inputBuscar').click()
        document.getElementById('inputBuscar').focus()
    }

    function buscarInAllProducts(e) {
        cambioNombre(e)
        if (productos.length == 0) {
            const url = params.globalVars.myUrl + 'api/product/allproducts'
            fetch(url)
                .then((response) => {
                    return response.json()
                }).then((json) => {
                    setProductos(json)
                })
        }
    }

    return (
        <AuthenticatedLayout user={params.auth} info={params.info} url={params.globalVars.urlRoot} urlImagenes={params.globalVars.urlImagenes}>
            <Head title="Productos" />
            <div className='container'>
                <div align="center" className="row justify-content-center">
                    <div className="row">
                        <div style={{ textAlign: 'left', marginTop: '0.8em' }} className="col-lg-3 col-md-6 col-sm-12 col-12" >
                            <a href={route('product.create')} style={{ color: 'black' }} className='btn bg-green-700 hover:bg-green-400 btn-sm'>Nuevo producto</a>
                        </div>
                        <div style={{ marginTop: '0.2em', textAlign: 'right' }} className="col-lg-9 col-md-6 col-sm-12 col-12" >
                            <form className="w-full max-w-sm">
                                <div className="flex items-center py-2">
                                    <input id='inputBuscar' onClick={buscarInAllProducts} onChange={cambioNombre} className="appearance-none bg-white border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight" type="text" placeholder="Buscar producto..." aria-label="Full name" />
                                    <button onClick={borrarInput} className="flex-shrink-0 border-transparent border-4 text-teal-500 hover:text-teal-800 text-sm py-1 px-2 rounded" type="button">
                                        <svg style={{ padding: '0.2em', backgroundColor: 'gray', cursor: 'pointer' }} xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" className="rounded bi bi-x" viewBox="0 0 16 16">
                                            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                                        </svg>
                                    </button>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <h1 style={{ marginTop: '0.5em', fontSize: '1.5em' }} id="titulo" className="text-center">Lista de productos</h1>
            </div>
            <TablaProductos noProductos={noproductos} pagination={params.productos.links} productos={filterProducts}></TablaProductos>
        </AuthenticatedLayout>
    )
}

export default Index