import React from 'react'
import GlobalFunctions from '../services/GlobalFunctions';
import { useState, useEffect } from 'react';
import Pagination from '../Product/Pagination';
import PrimaryButton from '@/Components/PrimaryButton';
import SecondaryButton from '@/Components/SecondaryButton';
import DialogoCompraN from './DialogoCompraN';
import Swal from 'sweetalert2'
import DangerButton from '@/Components/DangerButton';

const TablaListaCompras = (params) => {

    const [lista, setLista] = useState([])
    const glob = new GlobalFunctions()
    const optionsSelect = [
        { value: 'Recibida', label: 'Recibida' },
        { value: 'Preparando', label: 'Preparando' },
        { value: 'En camino', label: 'En camino' },
        { value: 'Entregada', label: 'Entregada' }
    ]
    const [datosCompra, setDatosCompra] = useState({})

    useEffect(() => {
        if (params.lista.length !== lista.length) {
            setLista(params.lista)
        }
    })

    function loadingOn(id) {
        document.getElementById(id).style.display = 'none'
        document.getElementById('btnLoadingSelect' + id).style.display = 'inline'
    }

    function loadingOff(id) {
        document.getElementById(id).style.display = 'inline'
        document.getElementById('btnLoadingSelect' + id).style.display = 'none'
    }

    function abrirCompraN(item) {
        setDatosCompra(item)
    }

    function cambioEstado(estado) {
        loadingOn(estado.target.id)
        const url = params.url + 'shopping/shoppingChangeState/' + estado.target.id + '/' + estado.target.value
        fetch(url).then((response) => {
            return response.json()
        }).then((json) => {
            loadingOff(estado.target.id)
            document.getElementById(estado.target.id).value = json
        })
    }

    function confirmarEliminar(id) {
        Swal.fire({
            title: '¿Eliminar esta compra?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Si, eliminar!'
        }).then((result) => {
            if (result.isConfirmed) {
                loadingOn(id)
                document.getElementById(id+'formEliminar').submit()
            }
        })
    }

    function preventDefault(e){
        e.preventDefault()
    }

    return (
        <div className='container table-responsive'>
            <table className="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Fecha</th>
                        <th scope="col">Cliente</th>
                        <th scope="col">N° Compra</th>
                        <th scope="col">Total compra</th>
                        <th scope="col">Costo envio</th>
                        <th scope="col">Medio pago</th>
                        <th scope="col">Comentarios</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    {params.noCompras ?
                        <div style={{ marginTop: '1.5em' }} className='container'>No se han encontrado resultados....</div>
                        :
                        lista.map((item, index) => {
                            return (
                                <tr className='align-middle' key={index}>
                                    <th scope="row">
                                        {item.fecha}
                                    </th>
                                    <td>
                                        <a style={{ textDecoration: 'underline', color: 'blue' }} href={route('customer.edit', item.cliente.cedula)}>{item.cliente.nombre}</a>
                                    </td>
                                    <td>
                                        <PrimaryButton id='btnCompraN' onClick={() => abrirCompraN(item)} className='btn btn-outline-dark rounded' type="button" data-toggle="modal" data-target="#dialogoCompraN">
                                            <svg style={{ marginRight: '0.2em' }} xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-eye" viewBox="0 0 16 16">
                                                <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
                                                <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
                                            </svg>
                                            {item.compra_n}
                                        </PrimaryButton>
                                    </td>
                                    <td>{glob.formatNumber(item.total_compra)}</td>
                                    <td>{item.domicilio}</td>
                                    <td>{item.medio_de_pago}</td>
                                    <td>{item.comentarios}</td>
                                    <td>
                                        <div style={{ width: '8em' }}>
                                            <select onChange={cambioEstado} id={item.id} value={item.estado} className="form-select form-select-sm">
                                                {optionsSelect.map((opcion, index) => {
                                                    return (
                                                        <option key={index} value={opcion.label}>{opcion.label}</option>
                                                    )
                                                })}
                                            </select>
                                            <button id={'btnLoadingSelect' + item.id} style={{ display: 'none', backgroundColor: 'gray' }} className="btn btn-primary" type="button" disabled>
                                                <span className="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                                Loading...
                                            </button>
                                        </div>
                                    </td>
                                    <td>
                                        <form method="POST" id={item.id+"formEliminar"} onSubmit={preventDefault} action={route('shopping.store')}>
                                            <input type="hidden" name='_token' value={params.token} />
                                            <input type='hidden' name='cliente' value={item.cliente.cedula}></input>
                                            <input type='hidden' name='compran' value={item.compra_n}></input>
                                            <input type='hidden' name='idCompra' value={item.id}></input>
                                            <DangerButton type='submit' onClick={() => { confirmarEliminar(item.id) }} className='btn btn-danger btn-sm border border-dark rounded cursorPointer' style={{ marginLeft: '0.2em', padding: '0.2em' }}>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" className="bi bi-trash" viewBox="0 0 16 16">
                                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                                    <path fillRule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                                </svg>
                                            </DangerButton>
                                        </form>
                                    </td>
                                </tr>
                            )
                        })}
                </tbody>
            </table>
            <DialogoCompraN url={params.url} datos={datosCompra} />
            {params.noCompras ?
                ''
                :
                <Pagination class="mt-6" links={params.pagination} />
            }
        </div>
    )
}

export default TablaListaCompras