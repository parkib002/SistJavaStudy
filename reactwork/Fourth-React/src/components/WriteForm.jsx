import React, { useState } from 'react'

const WriteForm = ({ onsave }) => {

    const [name, setName] = useState('');
    const [photo, setPhoto] = useState('2');
    const [mbti, setMbti] = useState('ENFJ');

    //버튼 이벤트
    const addDataEvent = () => {

        //부모 컴포넌트 onsave호출
        onsave({ name, photo, mbti });
    }

    return (
        <div className='input-group'>
            <input type="text" className='form-control'
                placeholder='이름' style={{ width: '100px' }}
                onChange={(e) => {
                    setName(e.target.value);
                }} />&nbsp;&nbsp;

            <input type="text" className='form-control'
                placeholder='mbti' style={{ width: '100px' }}
                onChange={(e) => {
                    setMbti(e.target.value);
                }} />&nbsp;&nbsp;

            <select onChange={(e) => {
                setPhoto(e.target.value);
            }} className='form-control' style={{ width: '50px' }}>
                {
                    //1~10까지만 map으로 돌리기
                    [...new Array(10)].map((a, idx) => (<option key={idx}>{idx + 1}</option>))
                }
            </select>

            <button type='button' className='btn btn-outline-info'
                style={{ marginLeft: '50px' }} onClick={addDataEvent}>추가</button>
        </div>
    )
}

export default WriteForm