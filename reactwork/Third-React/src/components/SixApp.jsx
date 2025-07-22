import React, { useState } from 'react'
import Alert from '@mui/material/Alert';
import CheckIcon from '@mui/icons-material/Check';

const SixApp = () => {

    const [names, setNames] = useState(['제니', '리사', '로제', '지수']);

    const [irum, setIrum] = useState('');

    // 추가 버튼 이벤트
    const btnInsert = () => {
        setNames(names.concat(irum)); // 배열에 이름 데이터 추가
    }

    const txtEnter = (e) => {
        if (e.key === 'Enter') {
            btnInsert();
            e.target.value = '';
        }
    }

    // 입력 change 이벤트
    const txtInput = (e) => {
        setIrum(e.target.value);
    }

    const dataRemove = (index) => {
        console.log('remove: ' + index);

        // // 방법1
        // setNames([
        //     ...names.slice(0, index),
        //     ...names.slice(index + 1, names.length)
        // ]); // index번지만 빼고 잘라서 넣는다

        // 방법2
        setNames(names.filter((item, i) => i !== index));
    }

    return (
        <div>

            <Alert icon={<CheckIcon fontSize="inherit" />} severity="primary">
                SixApp_추가/삭제 이벤트
            </Alert>

            <br /><br />

            <input type="text" placeholder='이름을 입력해주세요'
                value={irum} onChange={txtInput} onKeyUp={txtEnter} />

            <button type='button' className='btn btn-outline-info' style={{ marginLeft: '5px' }}
                onClick={btnInsert}>추가</button>

            <br /><br />

            <h5>데이터를 더블 클릭시 삭제됩니다</h5>

            <ul>
                {
                    names.map((name, index) => (<li className='data' key={index}
                        onDoubleClick={() => dataRemove(index)}>{name}</li>))
                }
            </ul>
        </div>
    )
}

export default SixApp