import React from 'react'
import { useNavigate } from 'react-router-dom'

const Home = () => {

    const navi = useNavigate();

    return (
        <div className='home'>

            <button type='button' className='btn btn-outline-info'
                onClick={() => {
                    navi("/about");
                }}>About</button><br /><br />
            <button type='button' className='btn btn-outline-warning'
                onClick={() => {
                    navi("/about/제니");
                }}>About2</button><br /><br />
            <button type='button' className='btn btn-outline-success'
                onClick={() => {
                    navi("/food/4/5");
                }}>점심메뉴</button><br /><br />
        </div>
    )
}

export default Home