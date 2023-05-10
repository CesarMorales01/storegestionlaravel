import React from 'react'
import GlobalFunctions from '../services/GlobalFunctions';
import { useState, useEffect } from 'react';
import Swal from 'sweetalert2'
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout'
import { Head } from '@inertiajs/react';
import TablaListaCompras from './TablaListaCompras';


const ListaCompras = (params) => {

    const glob= new GlobalFunctions()
    const [lista, setLista] = useState([])
    const [filterLista, setFilterLista] = useState(params.compras.data)
    const [noCompras, setNoCompras]=useState(false)

    useEffect(() => {
      if (filterLista.length == 0) {
          setNoCompras(true)
      } else {
          setNoCompras(false)
      }
  }, [filterLista, lista])  
 

  function cambioNombre(e){
    const buscar=e.target.value.toLowerCase()
    let newArray=[]
    for(let i=0;i<lista.length; i++){
      if(lista[i].cliente.nombre.toLowerCase().includes(buscar) || lista[i].cliente.apellidos.toLowerCase().includes(buscar) || lista[i].cliente.direccion.toLowerCase().includes(buscar)){
        newArray.push(lista[i])
      }
    }
    setFilterLista(newArray)
  }
  
  function borrarInput(){
    document.getElementById('inputBuscar').value=''
    document.getElementById('inputBuscar').click()
  }

 function buscarInAllCompras(e) {
  if (lista.length == 0) {
      const url = params.url + 'api/shopping/allshopping'
      fetch(url)
          .then((response) => {
              return response.json()
          }).then((json) => {
             setLista(json)
          })
  }else{
    cambioNombre(e)
  }
}

  return (
    <AuthenticatedLayout user={params.auth} >
            <Head title="Productos" />
            <div className='container'>
                <div align="center" className="row justify-content-center">
                    <div className="row">
                        <div style={{ textAlign: 'left', marginTop: '0.8em' }} className="col-lg-3 col-md-6 col-sm-12 col-12" >
                            <a href={route('shopping.create')} style={{ color: 'black' }} className='btn bg-green-700 hover:bg-green-400 btn-sm'>Nueva compra</a>
                        </div>
                        <div style={{ marginTop: '0.2em', textAlign: 'right' }} className="col-lg-9 col-md-6 col-sm-12 col-12" >
                            <form className="w-full max-w-sm">
                                <div className="flex items-center py-2">
                                    <input id='inputBuscar' onClick={buscarInAllCompras} onChange={cambioNombre} className="appearance-none bg-white border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight" type="text" placeholder="Buscar compra..." aria-label="Full name" />
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
                <h1 style={{ marginTop: '0.5em', fontSize: '1.5em' }} id="titulo" className="text-center">Lista de compras</h1>
                <TablaListaCompras token={params.token} url={params.url} pagination={params.compras.links} noCompras={noCompras} lista={filterLista}/>
            </div>
        </AuthenticatedLayout>
  )

}

export default ListaCompras

