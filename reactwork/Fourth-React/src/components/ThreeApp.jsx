import React, { useState } from 'react'
import Alert from '@mui/material/Alert';
import CheckIcon from '@mui/icons-material/Check';

const ThreeApp = () => {

    //객체 처리 변수
    const [inputs, setInputs] = useState({

        name: '제니',
        addr: '서울시',
        age: 20
    });

    //3개 공통
    const changeData = (e) => {

        console.log("name" + e.target.name);
        console.log("value" + e.target.value);

        //name,value값 얻기
        //e.target이 갖고 있는 객체 한번에 변경하기
        const { name, value } = e.target;

        //변경
        setInputs({

            ...inputs, //기존의 멤버는 유지
            [name]: value //해당값만 나오고 나머지는 사라진다..해결 방법..펼침 연산자

        })


        //변경
    }

    return (
        <div>

            <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
                <span style={{ fontSize: '25px' }} >ThreeApp입니다_state를 객체로</span>
            </Alert>

            <br /><br />

            <h3 className='alert alert-info'>
                이름: <input type="text" name='name' defaultValue={inputs.name}
                    onChange={changeData} />
            </h3>

            <h3 className='alert alert-info'>
                주소: <input type="text" name='addr' defaultValue={inputs.addr}
                    onChange={changeData} />
            </h3>

            <h3 className='alert alert-info'>
                나이: <input type="text" name='age' defaultValue={inputs.age}
                    onChange={changeData} />
            </h3>

            <hr />

            <h2>이름: {inputs.name},{inputs['name']}</h2>
            <h2>주소: {inputs.addr},{inputs['addr']}</h2>
            <h2>나이: {inputs.age},{inputs['age']}</h2>
        </div>
    )
}

export default ThreeApp