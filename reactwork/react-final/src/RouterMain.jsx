import React from 'react'
import { About, Main, Menu, Title } from './components'
import { Route, Routes } from 'react-router-dom'
import { Shop, ShopForm, ShopDetail } from './shop'
import Board from './board/Board'
import Login from './login/Login'
import { JoinForm, LoginForm, MemberList } from './member'

const RouterMain = () => {
    return (
        <div>
            <div><Title /></div>
            <div><Menu /></div>
            <div>
                <Routes>
                    <Route path='/' element={<Main />} />

                    {/* Shop */}
                    <Route path='/shop'>
                        <Route path='list' element={<Shop />} />
                        <Route path='form' element={<ShopForm />} />
                        <Route path='detail/:num' element={<ShopDetail />} />
                    </Route>

                    <Route path='/board/list' element={<Board />} />

                    <Route path='/member'>
                        <Route path='form' element={<JoinForm />} />
                        <Route path='login' element={<LoginForm />} />
                        <Route path='list' element={<MemberList />} />
                    </Route>

                    <Route path='/login' element={<Login />} />
                    <Route path='/about' element={<About />} />
                    <Route path='*' element={

                        <div>
                            <h1>잘못된 주소입니다</h1>
                        </div>
                    } />
                </Routes>
            </div>

        </div>
    )
}

export default RouterMain