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

    const imgArr = [];

    for (let i = 1; i <= 12; i++) {
        imgArr.push(<img src={`../Food/${i}.jpg`} style={{ width: '100px', height: '100px' }} className='box'></img>)
    }
    return (
        <div>

            <h1 className='alert alert-info'>FiveApp</h1>

            {/* 1~3제목은 h2로 하고 mui alert활용할 것 */}

            <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
                <h2>1. Radio 클릭시 이미지 변경할 것 (public이미지를 value로 할 것_일부 or 경로포함전체)</h2>
            </Alert>

            <FormControl>
                <FormLabel id="demo-radio-buttons-group-label">이미지</FormLabel>
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
            {imgArr}
        </div>
    )
}

export default FiveApp