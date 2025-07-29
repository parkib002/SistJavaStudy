import React, { useEffect, useState } from 'react'
import { NavLink, useNavigate } from 'react-router-dom'
import styles from './Menu.module.css'

const Menu = () => {

    const [myname, setMyname] = useState('');

    const navi = useNavigate();

    useEffect(() => {
        setMyname(localStorage.myname);
    }, []);

    return (
        <ul className={styles.menu}>
            <li><NavLink to='/' className={({ isActive }) => isActive ? 'active' : ''}>Home</NavLink></li>
            {
                localStorage.loginok == null ?
                    <li><NavLink to='/member/form' className={({ isActive }) => isActive ? 'active' : ''}>Member</NavLink></li>
                    : <li><NavLink to='/member/list' className={({ isActive }) => isActive ? 'active' : ''}>Member</NavLink></li>
            }
            <li><NavLink to='/shop/list' className={({ isActive }) => isActive ? 'active' : ''}>Shop</NavLink></li>
            <li><NavLink to='/board/list' className={({ isActive }) => isActive ? 'active' : ''}>Board</NavLink></li>
            <li><NavLink to='/about' className={({ isActive }) => isActive ? 'active' : ''}>오시는 길</NavLink></li>

            {/* 로그인인지 아웃인지 설정 */}
            {
                localStorage.loginok == null ?
                    <li><NavLink to='/member/login' className={({ isActive }) => isActive ? 'active' : ''}>Login</NavLink></li>
                    :
                    <div>
                        &nbsp;&nbsp;&nbsp;
                        <b>{myname}님</b>&nbsp;&nbsp;&nbsp;
                        <button type='button' className='btn btn-outline-danger'
                            onClick={() => {
                                localStorage.removeItem("loginok");
                                localStorage.removeItem("myid");
                                localStorage.removeItem("myname");
                                navi("/");
                            }}>로그아웃</button>
                    </div>
            }
        </ul>
    )
}

export default Menu