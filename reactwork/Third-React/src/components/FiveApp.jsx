import React, { useState } from 'react'
import Radio from '@mui/material/Radio';
import RadioGroup from '@mui/material/RadioGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import FormControl from '@mui/material/FormControl';
import FormLabel from '@mui/material/FormLabel';
import Alert from '@mui/material/Alert';
import CheckIcon from '@mui/icons-material/Check';

const FiveApp = () => {

    const [img, setImg] = useState('../image2/img/mycar/mycar1.png');

    const changeImg = (e) => {

        setImg(e.target.value);
    }

    const changeImg2 = (e) => {

        setImg('../image2/img/mycar/mycar' + e.target.value + '.png');
    }

    const colorArr = ['red', 'blue', 'black', 'green', 'magenta', 'purple'];

    const colors = colorArr.map((color) => (<div className='box' style={{ backgroundColor: color }}>{color}</div>))

    // const imgArr = [];

    // for (let i = 1; i <= 12; i++) {
    //     imgArr.push(<img src={`../Food/${i}.jpg`} style={{ width: '100px', height: '100px' }} className='box'></img>)
    // }

    // 문제3
    // 1~12배열 만들기
    const images = [...Array(12)].map((_, i) => i + 1);

    const shopImg = new Array(20);

    // 2차 배열
    const array2 = [{ "name": "영덕", "addr": "서울" },
    { "name": "승윤", "addr": "인천" },
    { "name": "현규", "addr": "LA" },
    { "name": "창연", "addr": "구리" },
    { "name": "희찬", "addr": "원주" }];

    return (
        <div>

            <h1 className='alert alert-info'>FiveApp</h1>

            {/* 1~3제목은 h2로 하고 mui alert활용할 것 */}

            <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
                <h2>1. Radio 클릭시 이미지 변경할 것 (public이미지를 value로 할 것_일부 or 경로포함전체)</h2>
            </Alert>

            <FormControl>
                <RadioGroup
                    aria-labelledby="demo-radio-buttons-group-label"
                    defaultValue="female"
                    name="radio-buttons-group"
                >
                    <FormControlLabel value="../image2/img/mycar/mycar1.png" onClick={changeImg} control={<Radio />} defaultChecked label="img1" />
                    <FormControlLabel value="../image2/img/mycar/mycar2.png" onClick={changeImg} control={<Radio />} label="img2" />
                    <FormControlLabel value="3" onClick={changeImg2} control={<Radio />} label="img3" />
                </RadioGroup>
            </FormControl>
            <br /><br />
            <img src={img} style={{ width: '100px', height: '100px' }} />
            <br /><br />
            <Alert icon={<CheckIcon fontSize="inherit" />} severity="info">
                <h2>2.색상 6개를 배열 선언 후 동그라미 원 안에 1~6까지를 각각의 색 안에 출력하시오</h2>
            </Alert>

            <br /><br />
            {colors}
            <hr style={{ clear: 'both' }} />
            <Alert icon={<CheckIcon fontSize="inherit" />} severity="warning">
                <h2>3.public에 Food이미지를 넣고 1~12까지를 모두 출력하시오</h2>
            </Alert>
            <br /><br />
            {/* {imgArr} */}
            {
                images.map(num => (<img key={num} src={`/Food/${num}.jpg`}
                    width="100" style={{ marginLeft: '5px', marginBottom: '5px' }} className='box' />))
            }
            <hr style={{ clear: 'both' }} />
            <Alert icon={<CheckIcon fontSize="inherit" />} severity="secondary">
                <h2>4.public에 쇼핑몰 이미지를 넣고 1~20까지를 모두 출력하시오</h2>
            </Alert>
            {
                [...shopImg].map((num, idx) => (<img key={idx} src={`/쇼핑몰사진/${idx + 1}.jpg`}
                    width="100" style={{ marginLeft: '5px', marginBottom: '5px' }} className='box' />))
            }
            <hr style={{ clear: 'both' }} />
            <Alert icon={<CheckIcon fontSize="inherit" />} severity="primary">
                <h2>6.2중 배열 출력</h2>
            </Alert>
            {
                array2.map((info, idx) =>
                    (<h5 key={idx}>이름: {info.name}, 지역: {info.addr}</h5>)
                )
            }
        </div>
    )
}

export default FiveApp