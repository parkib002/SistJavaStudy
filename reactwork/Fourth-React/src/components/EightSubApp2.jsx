import React, { useState } from 'react'

const EightSubApp2 = ({ colorelt }) => {

    const [color, setColor] = useState('');

    const changeColor = (e) => {

        setColor(e.target.value);
    }

    const addCircle = () => {

        colorelt(color);
    }

    return (
        <div>
            <h3>EightSubApp2_자식2 컴포넌트</h3>

            <b>색상 선택</b>

            <br /><br />

            <input type="color" style={{ width: '100px' }} onChange={changeColor} />

            <br /><br />

            <button type='button' className='btn btn-outline-info' onClick={addCircle}>색상 추가</button>
        </div>
    )
}

export default EightSubApp2