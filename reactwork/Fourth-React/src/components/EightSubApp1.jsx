import React from 'react'

const EightSubApp1 = ({ message, color, image }) => {
    return (
        <div>
            <h3>EightSubApp1_자식1 컴포넌트</h3>

            <b>메세지</b>

            <input type="text" className='form-control' onKeyUp={message} />

            <b>글자색 변경</b>

            <input type="color" className='form-control' value="#ffccff" onChange={color} />

            <b>이미지 변경</b>

            <select className='form-control' onChange={image}>
                {/* option은 1~10번까지만 배열로 생성할 것 */}
                {
                    [...Array(10)].map((a, idx) => (<option key={a}>{idx + 1}</option>))
                }
            </select>
        </div>
    )
}

export default EightSubApp1