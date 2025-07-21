import React, { useState } from 'react'

const OneApp = () => {

    const [number, setNumber] = useState(0);

    const addEvent = () => {

        if (number == 10) {
            alert('10까지만 증가합니다')
            return;
        }

        setNumber(number + 1)

    }

    const minusEvent = () => {

        if (number == -10) {
            alert('-10까지만 감소합니다')
            return;
        }

        setNumber(number - 1)
    }

    return (
        <div>

            <h1 className='alert alert-info'>OneApp</h1>

            <div className='number'>{number}</div>
            <button type='button' className='btn btn-outline-info'
                style={{ marginRight: '20px' }}
                onClick={addEvent}>증가</button>
            <button type='button' className='btn btn-outline-danger'
                onClick={minusEvent}>감소</button>
        </div>
    )
}

export default OneApp