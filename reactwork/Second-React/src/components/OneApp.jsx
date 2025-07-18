import React, { useState } from 'react'
import './MyStyle.css'
import styled from 'styled-components';

const OneApp = () => {


    //초기상태는 '',0,0,0으로 한다
    const [name, setName] = useState('');
    const [java, setJava] = useState(0);
    const [spring, setSpring] = useState(0);
    const [react, setReact] = useState(0);
    const [total, setTotal] = useState(0);
    const [avg, setAvg] = useState(0);
    //값을 입력 후 결과 확인을 누르면 결과창에 출력한다

    const handleEvent = () => {

        let java = document.getElementById('java').value;
        let spring = document.getElementById('spring').value;
        let react = document.getElementById('react').value;

        setTotal(Number(java) + Number(spring) + Number(react));
        setAvg((Number(java) + Number(spring) + Number(react)) / 3);
    }

    //style
    const Title = styled.h1`
    font-size: 1.5em;
    text-align: center;
    color: #BF4F74;
    `;

    // Create a Wrapper component that'll render a <section> tag with some styles
    const Wrapper = styled.section`
    padding: 4em;
    background: papayawhip;
    `;

    return (
        <div>
            <Title>
                Hello World!
            </Title>



            <h2>OneApp_useState이용 상태변수 연습하기</h2>

            <div className='inp'>
                이름: <input type="text" style={{ width: '100px' }} id='name'
                    onChange={(e) => {
                        setName(e.target.value)
                    }} /> <br />
                자바점수: <input type="text" style={{ width: '100px' }} id="java" onChange={(e) => {
                    setJava(e.target.value)
                }} /><br />
                스프링점수: <input type="text" style={{ width: '100px' }} id="spring" onChange={(e) => {
                    setSpring(e.target.value)
                }} /><br />
                리액트점수: <input type="text" style={{ width: '100px' }} id="react" onChange={(e) => {
                    setReact(e.target.value)
                }} /><br />

                <button type='button' className='btn btn-outline-info' onClick={handleEvent}>결과확인</button>
            </div>

            <div className='result' style={{ color: 'white' }}>
                <h2>이름: {name}</h2>
                <h2>자바점수: {java}</h2>
                <h2>스프링점수: {spring}</h2>
                <h2>리액트점수: {react}</h2>

                <h2>합계: {total}점</h2>
                <h2>평균: {avg}점</h2>

            </div>

        </div>
    )
}

export default OneApp