import * as React from 'react';
import Alert from '@mui/material/Alert';
import CheckIcon from '@mui/icons-material/Check';
const OneApp = () => {

    const [count, setCount] = React.useState(0);
    const [message, setMessage] = React.useState('Hello');
    const [number, setNumber] = React.useState(100);

    //이벤트들
    const changCount = () => {
        setCount(count + 1);
    }

    const changNumber = () => {
        setNumber(number + 10);
    }

    const changeAll = () => {
        setCount(count + 1);
        setNumber(number + 5);
    }

    const changMessage = (e) => {
        setMessage(e.target.value);
    }

    //useEffect는 여러번 정의가 가능하다
    React.useEffect(() => {
        console.log("처음 시작시 그리고 state값이 변경될 때마다 무조건 호출");
    })

    React.useEffect(() => {
        console.log("처음 시작시 딱 한번만 호출");
    }, [])

    React.useEffect(() => {
        console.log("처음 시작시 그리고 count값 변경 시에만 호출된다");
    }, [count])

    React.useEffect(() => {
        console.log("처음 시작시 그리고 count,number값 변경 시에만 호출된다");
    }, [count, number])

    React.useEffect(() => {
        console.log("처음 시작시 그리고 message값 변경 시에만 호출된다");
    }, [message])

    return (
        <div>

            <Alert icon={<CheckIcon fontSize="inherit" />} severity="success">
                <span style={{ fontSize: '25px' }} >OneApp입니다_UseEffect</span>
            </Alert>

            {/* UseEffect_생성자처럼 한번만 호출될 수도 있고 
            set이 연속적으로 들어가서 일부분만 랜더링이 될 수도 있음 */}

            <button type='button' className='btn btn-info'
                onClick={changCount}>Count만 증가</button>
            <button type='button' className='btn btn-info'
                onClick={changNumber}>Number만 증가</button>
            <button type='button' className='btn btn-info'
                onClick={changeAll}>Count, Number 증가</button>

            <br /><br />
            <b style={{ fontSize: '4em' }}>{count}</b>
            <b style={{ marginLeft: '20px', fontSize: '4em' }}>{number}</b>
            <hr />
            <input type="text" className='form-control'
                defaultValue={message} onKeyUp={changMessage} />

            <h1>{message}</h1>
        </div>
    )
}

export default OneApp