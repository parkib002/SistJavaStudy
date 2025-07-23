import React, { useState } from 'react'
import Alert from '@mui/material/Alert';
import CheckIcon from '@mui/icons-material/Check';

const FourApp = () => {

    const [boards, setBoards] = useState([
        {
            num: 1,
            writer: '제니',
            subject: 'hello jenny',
            photo: '11'
        },
        {
            num: 2,
            writer: '지수',
            subject: 'hello jisoo',
            photo: '12'
        },
        {
            num: 3,
            writer: '로제',
            subject: 'hello rose',
            photo: '13'
        },
        {
            num: 4,
            writer: '리사',
            subject: 'hello lisa',
            photo: '14'
        }
    ])

    return (
        <div>

            <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
                <span style={{ fontSize: '25px' }} >FourApp입니다_배열 안에 객체 출력</span>
            </Alert>

            <br /><br />

            <table className='table table-bordered' style={{ width: '500px' }}>
                <thead>
                    <tr className='table-info'>
                        <th width='80'>번호</th>
                        <th width='100'>이미지</th>
                        <th width='300'>제목</th>
                        <th width='100'>작성자</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        boards.map((row, index) => (
                            <tr key={index} style={{ verticalAlign: 'middle' }}>
                                <td>{row.num}</td>
                                <td><img src={`../image/연예인사진/${row.photo}.jpg`} style={{ width: '50px' }} /></td>
                                <td>{row.subject}</td>
                                <td>{row.writer}</td>
                            </tr>
                        ))
                    }
                </tbody>
            </table>


        </div>
    )
}

export default FourApp