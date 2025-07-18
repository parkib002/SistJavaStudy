import React from 'react'
import './MyStyle.css'
import img1 from '../image//Food/1.jpg'
import img2 from '../image/Food/2.jpg'
import img3 from '../image/Food/3.jpg'

const FirstApp = () => {

  //스타일을 변수에 지정
  const styleImg1={
    width: '200px',
    border: '5px solid green',
    marginLeft: '100px'
  }
  return (
    <div>
        <h2 className='alert alert-info'>FirstApp입니다</h2>
        <h3 className='line'>오늘은 리액트 시작하는 날</h3>
    
        <div style={{fontSize:'25px',color:'green',marginLeft:'100px'}}>
            리액트 스타일 연습중
        </div>

        {/* 이미지연습: src영역은 반드시 import */}

        <div>
            <img src={img1} style={{width:'200px',borderRadius:'100px 100px 100px 100px'}}></img>
            <img src={img2} style={{width:'200px',borderRadius:'100px 100px 100px 100px'}}></img>
            <img src={img3} style={{width:'200px',borderRadius:'100px 100px 100px 100px'}}></img>

            {/* public 영역의 이미지 가져오기 */}
            <img src='/avata/b1.png' style={{width:'200px',borderRadius:'100px 100px 100px 100px'}}></img>
            <img src="../avata/b2.png" style={styleImg1}></img>
        </div>
    </div>
  )
}

export default FirstApp