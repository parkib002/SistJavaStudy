import React from 'react'

const SixSubApp3 = (props) => {
    return (
        <div>
            SixSubApp3_SixApp의 세번째 자식

            <br /><br />

            <button type='button' className='btn btn-outline-danger' onClick={props.decre}>감소</button>&nbsp;&nbsp;&nbsp;&nbsp;
            <button type='button' className='btn btn-outline-info' onClick={props.incre}>증가</button>

        </div>
    )
}

export default SixSubApp3