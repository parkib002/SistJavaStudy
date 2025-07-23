import React from 'react'

const SixSubApp2 = ({ menu, price, linecolor }) => {
    return (
        <div>

            SixSubApp2_SixApp의 두번째 자식

            <div className='line' style={{ borderColor: linecolor }}>
                {menu} 1개의 가격은 {price}원입니다
            </div>

        </div>
    )
}

export default SixSubApp2