import React from 'react'
import loading from '../../../../public/Imagenes_config/loading.gif'

const Cargando = () => {
  return (
    <div className='container textAlignCenter'>
      <br></br><br></br><br></br>
      <span>Cargando info...</span>
      <br></br>
      <img  src={loading} width="100" height="100"></img>
  </div>
  )
}

export default Cargando