import React, { useState } from 'react'
import Alert from '@mui/material/Alert';
import CheckIcon from '@mui/icons-material/Check';
import SixSubApp from './SixSubApp';
import SixSubApp2 from './SixSubApp2';
import SixSubApp3 from './SixSubApp3';

const SixApp = () => {

    const [number, setNumber] = useState(0);

    //증가하는 이벤트 함수
    const numberIncre = () => {
        setNumber(number + 1);
    }

    //감소하는 이벤트 함수
    const numberDecre = () => {
        setNumber(number - 1);
    }

    return (
        <div>

            <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
                <span style={{ fontSize: '25px' }} >SixApp입니다_부모 자식간 컴포넌트 통신</span>
            </Alert>

            <SixSubApp name="제니" age="22" />
            <SixSubApp name="지수" age="23" />
            <SixSubApp name="로제" age="24" />

            <br /><br />

            <SixSubApp2 menu="짜장면" price="12000" linecolor="blue" />
            <SixSubApp2 menu="짬뽕" price="13000" linecolor="red" />
            <SixSubApp2 menu="탕수육" price="20000" linecolor="yellow" />

            <br /><br />

            <h1>{number}</h1>

            <SixSubApp3 incre={numberIncre} decre={numberDecre} />
        </div>
    )
}

export default SixApp