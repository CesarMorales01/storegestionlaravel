import React from 'react'
import { useState, useEffect } from 'react';
import GlobalFunctions from '../services/GlobalFunctions';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';
import Swal from 'sweetalert2'
import TablaClientes from './TablaClientes';


const Clientes = (params) => {
    const glob = new GlobalFunctions()
    const [clientes, setClientes] = useState([])
    const [noClientes, setNoClientes] = useState(false)
    const [filterClients, setFilterClients] = useState(params.clientes.data)

    useEffect(() => {
        if (params.estado != null) {
            Swal.fire({
                title: params.estado,
                icon: params.estado.includes('elimin') ? 'warning' : 'success',
                timer: !params.duracionAlert ? 1000 : params.duracionAlert
            })
        }
    }, [])

    useEffect(() => {
        if (filterClients.length == 0) {
            setNoClientes(true)
        } else {
            setNoClientes(false)
        }
    }, [filterClients, clientes])

    function cambioNombre(e) {
        const buscar = e.target.value.toLowerCase()
        let newArray = []
        
        for (let i = 0; i < clientes.length; i++) {
            if (clientes[i].nombre.toLowerCase().includes(buscar) || clientes[i].direccion.toLowerCase().includes(buscar) || clientes[i].usuario[0].email.toLowerCase().includes(buscar)) {
                newArray.push(clientes[i])
            }
        }
        if (newArray.length == clientes.length) {
            newArray = params.clientes.data
        }
        if (newArray.length == 0) {
            setNoClientes(true)
        }
        setFilterClients(newArray)
    }

    function borrarInput() {
        document.getElementById('inputBuscar').value = ''
        document.getElementById('inputBuscar').click()
    }


    function buscarClientesCompletos(e) {
        cambioNombre(e)
        if (clientes.length == 0) {
            const url = params.globalVars.myUrl + 'api/customer/allclients'
            fetch(url)
                .then((response) => {
                    return response.json()
                }).then((json) => {
                    setClientes(json)
                })
        }
    }

    return (
        <AuthenticatedLayout
            user={params.auth} info={params.info} urlImagenes={params.globalVars.urlImagenes}
        >
            <Head title="Clientes" />
            <div style={{ marginTop: '0.2em' }} align="center" className="container">
                <div align="center" className="row justify-content-center">
                    <div className="row">
                        <div style={{ textAlign: 'left', marginTop: '0.8em' }} className="col-lg-3 col-md-6 col-sm-12 col-12" >
                            <a href={route('customer.create')} style={{ color: 'black' }} className='btn bg-green-700 hover:bg-green-400 btn-sm'>Nuevo cliente</a>
                        </div>
                        <div style={{ marginTop: '0.2em', textAlign: 'right' }} className="col-lg-9 col-md-6 col-sm-12 col-12" >
                            <form className="w-full max-w-sm">
                                <div className="flex items-center py-2">
                                    <input id='inputBuscar' onClick={buscarClientesCompletos} onChange={cambioNombre} className="appearance-none bg-white border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight" type="text" placeholder="Buscar cliente..." aria-label="Full name" />
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
            </div>
            <h1 style={{ marginTop: '0.5em', fontSize: '1.5em' }} id="titulo" className="text-center">Lista clientes</h1>
            <br />
            <div className="container">
                <div align="center" className="row justify-content-center">
                    <div className="col-lg-6 col-md-6 col-sm-6 col-6">
                        <a className='btn btn-secondary btn-sm'><span>&#8593;</span> Registro completo</a>
                    </div>
                    <div className="col-lg-6 col-md-6 col-sm-6 col-6">
                        <a href={route('registerincomplete.index')} className='btn btn-success btn-sm'><span>&#8595;</span>Registro incompleto</a>
                    </div>
                </div>
                <br />
            <TablaClientes noClientes={noClientes} clientes={filterClients}></TablaClientes>
            </div>
        </AuthenticatedLayout>
    )
}

export default Clientes