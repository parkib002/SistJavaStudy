import React from 'react'
import myimg from '../image/Food/2.jpg'

const SecondApp = () => {

    const imgStyle2={

        border: '5px dotted pink',
        borderRadius: '30px',
        width: '300px'
    }
    
    let hello_Message=<h3>안녕 오늘은 리액트만 할겁니다</h3>;

  return (
    <div>
        
        <h2 className='alert alert-warning'>SecondApp입니다</h2>

        {/* src이미지 가져와서 imgStyle2 적용해보기 */}
        <img src={myimg} style={imgStyle2}></img>

        {hello_Message}
        {hello_Message}
        
    </div>
  )
}

export default SecondApp