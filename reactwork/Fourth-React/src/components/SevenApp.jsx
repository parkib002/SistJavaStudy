import React, { useState } from 'react'
import Alert from '@mui/material/Alert';
import CheckIcon from '@mui/icons-material/Check';
import RowItemApp from './RowItemApp';
import WriteForm from './WriteForm';

const SevenApp = () => {

    const [board, setBoard] = useState([
        {
            name: "제니",
            photo: "2",
            mbti: "ENFJ",
            today: new Date()
        },
        {
            name: "지수",
            photo: "3",
            mbti: "INFP",
            today: new Date()
        },
        {
            name: "로제",
            photo: "4",
            mbti: "ESTJ",
            today: new Date()
        }
    ]);

    //데이터를 추가하는 함수 이벤트
    //board를 바꾸면 렌더링이 다시 시작되면서 추가
    const dataSave = (data) => {

        setBoard(board.concat({

            // name: data.name,
            // photo: data.photo,
            // mbti: data.mbti

            ...data,
            today: new Date()
        }));
    }

    const dataDelete = (idx) => {

        setBoard(board.filter((_, i) => i !== idx));
    }

    return (
        <div>
            <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
                <span style={{ fontSize: '25px' }} >SevenApp입니다_리스트출력</span>
            </Alert>
            <br /><br />
            <WriteForm onsave={dataSave} />
            <br /><br />
            <table className='table table-bordered' style={{ width: '600px' }}>
                <caption><b>Board 배열 출력</b></caption>
                <thead>
                    <tr className='table-secondary'>
                        <th width="100">이름</th>
                        <th width="120">사진</th>
                        <th width="120">MBTI</th>
                        <th width="180">날짜</th>
                        <th width="100">삭제</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        //데이터 개수만큼 호출함
                        board.map((row, index) => (<RowItemApp row={row} key={index} index={index} ondelete={dataDelete} />))
                    }
                </tbody>
            </table>
        </div >
    )
}

export default SevenApp