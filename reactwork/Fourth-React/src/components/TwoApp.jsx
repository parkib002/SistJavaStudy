import React, { useEffect, useState } from 'react'
import Alert from '@mui/material/Alert';
import GitHubIcon from '@mui/icons-material/GitHub';

const TwoApp = () => {

    const [count, setCount] = useState(1);
    const [visible, setVisible] = useState('visible');

    //count값 변경될 때만 호출
    useEffect(() => {
        setVisible(count % 3 == 0 ? 'visible' : 'hidden');
    }, [count])

    return (
        <div>

            <Alert icon={<GitHubIcon fontSize="large" />} severity="success">
                <span style={{ fontSize: '25px' }} >TwoApp입니다_3의 배수일 때만 이미지가 보여지게</span>
            </Alert>

            <br /><br />

            <button type='button' className='btn btn-outline-info'
                onClick={() => {
                    setCount(count + 1);
                }}>count증가</button>

            <h1>{count}</h1>

            <img src="/image/연예인사진/10.jpg" style={{ visibility: visible }} width={300} />
        </div>
    )
}

export default TwoApp