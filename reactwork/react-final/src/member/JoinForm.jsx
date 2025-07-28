import axios from 'axios';
import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom';

const JoinForm = () => {

    const [myname, setMyname] = useState('');
    const [myid, setMyid] = useState('');
    const [mypass, setMypass] = useState('');
    const [btnok, setBtnok] = useState(false); //중복체크버튼 클릭 여부
    const [idmsg, setIdmsg] = useState('');

    const navi = useNavigate();


    //아이디 중복체크
    const btnIdCheck = () => {

        localStorage.setItem("url", "http://localhost:9000");
        let checkUrl = localStorage.getItem("url") + "/member/idcheck?myid=" + myid;

        axios.get(checkUrl)
            .then(res => {

                if (res.data == 0) {
                    setIdmsg("가입 가능");
                    setBtnok(true);
                } else {
                    setIdmsg("가입 불가");
                    setBtnok(false);
                }
            })
    }

    //아이디 입력시 호출
    const inputIdChange = (e) => {

        setMyid(e.target.value);
        setBtnok(false); //중복체크 후 아이디 다시 입력할 경우 때문에 추가
        setIdmsg('');
    }

    //회원가입시 중복 체크 없이 submit되는거 방지
    const onSubmitButton = (e) => {

        e.preventDefault(); // 강제 새로고침 방지

        let insertUrl = "http://localhost:9000/member/insert";

        if (!btnok) {
            alert('아이디 중복 체크를 해주세요');
            return;
        } else {

            axios.post(insertUrl, { myname, myid, mypass })
                .then(() => {
                    navi("/member/login");
                })
        }
    }

    return (
        <div className="card" style={{ alignItems: 'center' }}>
            <form onSubmit={onSubmitButton}>
                <table className='table table-bordered' style={{ width: '500px', margin: 'auto 0' }}>
                    <tbody>
                        <tr>
                            <th>이름</th>
                            <td>
                                <input type="text" className='form-control' style={{ width: '120px' }} required
                                    defaultValue={myname} onChange={(e) => {
                                        setMyname(e.target.value);
                                    }} />
                            </td>
                        </tr>

                        <tr>
                            <th>아이디</th>
                            <td>
                                <div className='input-group'>
                                    <input type="text" className='form-control' style={{ maxWidth: '150px', marginRight: '20px' }}
                                        defaultValue={myid} onChange={inputIdChange} required />
                                    <button type='button' className='btn btn-outline-danger'
                                        onClick={() => {
                                            btnIdCheck();
                                        }}>중복 확인</button>&nbsp;&nbsp;&nbsp;
                                    <span><b style={{ color: 'red' }}>{idmsg}</b></span>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>비밀번호</th>
                            <td>
                                <input type="text" className='form-control' style={{ width: '120px' }} required
                                    defaultValue={mypass} onChange={(e) => {
                                        setMypass(e.target.value);
                                    }} />
                            </td>
                        </tr>

                        <tr>
                            <td colSpan='2' align='center'>
                                <button type='submit' className='btn btn-outline-success'>회원가입</button>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </form>
        </div>
    )
}

export default JoinForm