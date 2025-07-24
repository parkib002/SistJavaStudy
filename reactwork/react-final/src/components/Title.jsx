import React from 'react'
import img from '../assets/react.svg';
import img2 from '../image/logoImg/Spring_Boot.svg.png';
import styles from './Title.module.css'

const Title = () => {
    return (
        <div className={styles.titleWrap}>
            <img src={img} alt="로고" />
            <span className={styles.titleText}>React Spring_boot Project</span>
            <img src={img2} alt="로고" />
        </div>
    )
}

export default Title