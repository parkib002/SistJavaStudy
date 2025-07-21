import React, { useState } from 'react'
import img1 from '../assets/image/연예인사진/1.jpg';
import img2 from '../assets/image/연예인사진/2.jpg';
import img3 from '../assets/image/연예인사진/3.jpg';
import img4 from '../assets/image/연예인사진/4.jpg';

const TwoApp = () => {

    const [num1, setNum1] = useState(0);
    const [num2, setNum2] = useState(0);
    const [num3, setNum3] = useState(0);
    const [img, setImg] = useState('');

    const numberEvent = (e) => {

        if (e.key === 'Enter') {

            let num1 = document.getElementById('num1').value;
            let num2 = document.getElementById('num2').value;
            let num3 = document.getElementById('num3').value;

            setNum1(num1);
            setNum2(num2);
            setNum3(num3);
        }
    }

    const changeImg = () => {

        let imgName = document.getElementById('selectImg').value;

        setImg(imgName);
    }

    return (
        <div>

            <h1 className='alert alert-info'>TwoApp</h1>
            <br /><br />
            <div className='input-group'>
                <select className='form-control' style={{ width: '100px' }} id='num1'>
                    <option value="02">02</option>
                    <option value="010">010</option>
                    <option value="031">031</option>
                    <option value="017">017</option>
                </select>
                <b>-</b>
                <input type="text" maxLength='4' className='form-control'
                    style={{ width: '100px' }} id='num2' />
                <b>-</b>
                <input type="text" maxLength='4' className='form-control'
                    style={{ width: '100px' }} id='num3'
                    onKeyUp={numberEvent} />
            </div>

            <br />
            <div className='input-img'>

                <b>이미지선택: </b>
                <select id='selectImg' onChange={changeImg}>
                    <option value={img1}>이미지1</option>
                    <option value={img2}>이미지2</option>
                    <option value={img3}>이미지3</option>
                    <option value={img4}>이미지4</option>

                </select>
            </div>
            <div className='output'>

                {num1}-{num2}-{num3}
            </div>

            <div className='output_image'>
                {/* src의 이미지를 출력해보세요 */}
                <img src={img} style={{ width: '100px', height: '100px', border: '1px solid blue' }} />
            </div>
        </div>
    )
}

export default TwoApp