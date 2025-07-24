import React from 'react'
import { NavLink } from 'react-router-dom'

const Menu = () => {
    return (
        <div>

            <ul className='menu'>
                <li><NavLink to='/'>Home</NavLink></li>
                <li><NavLink to='/about'>About</NavLink></li>
                <li><NavLink to='/about/lee'>About_Lee</NavLink></li>
                <li><NavLink to='/food/1/2'>점심메뉴</NavLink></li>
                <li><NavLink to='/food/5/6'>저녁메뉴</NavLink></li>
            </ul>

        </div>
    )
}

export default Menu