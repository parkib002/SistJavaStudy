import React from 'react'
import { NavLink } from 'react-router-dom'
import styles from './Menu.module.css'

const Menu = () => {
    return (
        <ul className={styles.menu}>
            <li><NavLink to='/' className={({ isActive }) => isActive ? 'active' : ''}>Home</NavLink></li>
            <li><NavLink to='/login' className={({ isActive }) => isActive ? 'active' : ''}>Login</NavLink></li>
            <li><NavLink to='/member/form' className={({ isActive }) => isActive ? 'active' : ''}>Member</NavLink></li>
            <li><NavLink to='/shop/list' className={({ isActive }) => isActive ? 'active' : ''}>Shop</NavLink></li>
            <li><NavLink to='/board/list' className={({ isActive }) => isActive ? 'active' : ''}>Board</NavLink></li>
            <li><NavLink to='/about' className={({ isActive }) => isActive ? 'active' : ''}>오시는 길</NavLink></li>
        </ul>
    )
}

export default Menu