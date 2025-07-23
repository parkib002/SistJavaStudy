import React, { useRef, useState } from 'react'
import Alert from '@mui/material/Alert';
import CheckIcon from '@mui/icons-material/Check';

const FiveApp = () => {

    //useRef: 변수 관리하는 기능
    //state와의 차이점: 값이 변경되어도 다시 렌더링 하지 않는다

    const [count, setCount] = useState(0);

    //ref선언
    const countRef = useRef(0);

    console.log("렌더링중....");

    //state변수
    const stateIncre = () => {
        setCount(count + 1);
    }

    //ref변수 증가하는 함수
    const refIncre = () => {
        countRef.current = countRef.current + 1; //ref변수.current
        console.log("countRef: " + countRef.current);
    }

    //점수 입력 예제
    const [result, setResult] = useState('');
    const nameRef = useRef('');
    const javaRef = useRef('');
    const oracleRef = useRef('');
    const reactRef = useRef('');

    //버튼 이벤트
    const buttonResult = () => {

        //데이터 읽어오기
        let name = nameRef.current.value;
        let java = Number(javaRef.current.value);
        let oracle = Number(oracleRef.current.value);
        let react = Number(reactRef.current.value);

        let tot = java + oracle + react;
        let avg = (tot / 3).toFixed(2);

        let s = `[결과 확인]
        이름: ${name}
        자바점수: ${java}
        오라클점수: ${oracle}
        리액트점수: ${react}
        총점: ${tot}
        평균: ${avg}`

        setResult(s);
    }

    return (
        <div>
            <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
                <span style={{ fontSize: '25px' }} >FiveApp입니다_useRef</span>
            </Alert>

            <br /><br />

            <button type='button' className='btn btn-outline-info' onClick={stateIncre}>state증가</button>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <h1>{count}</h1>
            <button type='button' className='btn btn-outline-warning' onClick={refIncre}>ref변수 증가</button>
            <h1>{countRef.current}</h1>

            <hr />

            <div>
                <h2 className='alert alert-info'>useRef 예제</h2>
                <h4>이름입력: <input type="text" className='form-control' ref={nameRef} /></h4>
                <h4>자바점수: <input type="text" className='form-control' ref={javaRef} /></h4>
                <h4>오라클점수: <input type="text" className='form-control' ref={oracleRef} /></h4>
                <h4>리액트점수: <input type="text" className='form-control' ref={reactRef} /></h4>
                <button type='button' className='btn btn-outline-info' onClick={buttonResult}>결과 확인</button>
                <br /><br />
                <h2 className='alert alert-danger' style={{ whiteSpace: 'pre-wrap' }}>{result}</h2>
            </div>

        </div>

    )
}

export default FiveApp