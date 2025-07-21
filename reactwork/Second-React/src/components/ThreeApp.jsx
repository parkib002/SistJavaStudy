import React, { useState } from 'react'
import Alert from '@mui/material/Alert';
import CheckIcon from '@mui/icons-material/Check';
import AppleIcon from '@mui/icons-material/Apple';
import img1 from './image/avata/b1.png';
import img2 from './image/avata/b2.png';
import img3 from './image/avata/b3.png';
import img4 from './image/avata/b5.png';

const ThreeApp = () => {

    const [msg, setMsg] = useState('리액트 복습좀 합시다');
    const [photo, setPhoto] = useState(img1);
    const [width, setWidth] = useState(400);
    const [border, setBorder] = useState('');

    const changeImg = () => {

        let img = document.getElementById('img').value;


        //setPhoto(img);

        setBorder(img);
    }

    //점점작게 이벤트
    const smallImg = () => {

        setWidth(width - 10);
    }
    //점점크게 이벤트
    const bigImg = () => {

        setWidth(width + 10);
    }
    return (
        <div>

            <div>
                <select className='form-select' style={{ width: '200px' }} id='img'
                    onChange={changeImg}>
                    <option value='10px solid green'>이미지1</option>
                    <option value='10px dotted red'>이미지2</option>
                    <option value='10px solid blue'>이미지3</option>
                    <option value='10px dotted purple'>이미지4</option>
                </select>

                <select className='form-select' style={{ width: '200px' }} id='img'
                    onChange={changeImg}>
                    <option value='10px solid green'>이미지1</option>
                    <option value='10px dotted red'>이미지2</option>
                    <option value='10px solid blue'>이미지3</option>
                    <option value='10px dotted purple'>이미지4</option>
                </select>

                <br /><br /><br />
                <button type='button' className='btn btn-info'
                    style={{ marginLeft: '10px' }}
                    onClick={smallImg}>점점작게</button>

                <button type='button' className='btn btn-info'
                    style={{ marginLeft: '10px' }}
                    onClick={bigImg}>점점크게</button>

            </div>

            <br /><br /><br />

            <h2 className='alert alert-info'>{msg}</h2>

            <Alert icon={<AppleIcon fontSize="inherit" />} severity="success">
                {msg}
            </Alert>

            <br /><br />
            <div>
                <input type="text" className='form-control' style={{ width: '400px' }}
                    placeholder='메세지를 입력해주세요'
                    onChange={(e) => {
                        setMsg(e.target.value);
                    }} />

            </div>


            {/* 이미지 나타내기 */}
            <img src={img1} alt="" style={{ width: `${width}px`, border: `${border}` }} />
        </div>
    )
}

export default ThreeApp