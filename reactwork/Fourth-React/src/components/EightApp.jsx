import React, { useState } from 'react'
import EightSubApp1 from './EightSubApp1';
import EightSubApp2 from './EightSubApp2';

const EightApp = () => {

    //1번째
    const [message, setMessage] = useState('오늘 과제는 리액트 이벤트입니다');
    const [photo, setPhoto] = useState('1');
    const [color, setColor] = useState('magenta');

    //2번째
    const [colorelt, setColorelt] = useState(['pink', 'tomato', 'green', 'gray']);

    const messageEvent = (e) => {

        if (e.key === 'Enter') {
            setMessage(e.target.value);
        }
    }

    const colorEvent = (e) => {

        setColor(e.target.value);
    }

    const imageEvent = (e) => {

        setPhoto(e.target.value);
    }

    const coloreltEvent = (color) => {

        setColorelt(colorelt.concat(color));
    }

    return (
        <div>
            <h2>EightApp_부모 자식간 이벤트 과제</h2>

            <br /><br />

            {/* 첫번째 자식 이벤트로 변경할 곳 */}
            <h3 style={{ color: color }}>{message}</h3>
            <img src={`../image/Food/${photo}.jpg`} style={{ width: '300px' }} />

            {/* 두번째 자식 이벤트로 변경할 곳 */}
            <br /><br />
            {
                colorelt.map((col, idx) => (<div className='circle' key={idx} style={{ backgroundColor: col }}>{idx}</div>))
            }
            <br style={{ clear: 'both' }} />
            <EightSubApp1 message={messageEvent} color={colorEvent} image={imageEvent} />

            <br /><br />

            <EightSubApp2 colorelt={coloreltEvent} />

        </div>
    )
}

export default EightApp