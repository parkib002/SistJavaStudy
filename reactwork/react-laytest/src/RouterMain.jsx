import React from 'react'
import Menu from './components/Menu'
import { Route, Routes } from 'react-router-dom'
import { About, Home, Food } from './pages'

const RouterMain = () => {
    return (
        <div>


            {/* 모든  페이지에서 공통으로 포함될 컴포넌트나 이미지 */}
            <h1 className='alert alert-warning title'>React Router 실습중</h1>
            <Menu />
            <img src="./image/Food/1.jpg" className='main_photo' />

            <hr style={{ clear: 'both', marginBottom: '20px' }} />

            <Routes>
                <Route path='/' element={<Home />} />
                <Route path='/about' element={<About />} />
                <Route path='/about/:name' element={<About />} />
                <Route path='/login/*' element={
                    <div>
                        <h1>로그인 기능은 아직 구현하기 전입니다</h1>
                        <img src="/image/Food/1.jpg" />
                        <h3>점심메뉴는 이것!!!</h3>
                    </div>

                } />z
                <Route path='*' element={
                    <h1>잘못된 주소입니다</h1>
                } />
                <Route path='/food/:food1/:food2' element={<Food />} />
            </Routes>

        </div>
    )
}

export default RouterMain