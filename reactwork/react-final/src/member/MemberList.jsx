import axios from 'axios';
import React, { useEffect, useState } from 'react'

const MemberList = () => {

  const [memberList, setMemberList] = useState([]);

  const list = () => {

    let url = "http://localhost:9000/member/list";

    axios.get(url)

      .then(res => {

        setMemberList(res.data);

        console.log("len= " + res.data.length);
      });

  }

  const deleteMember = (idx) => {

    let deleteurl = "http://localhost:9000/member/delete?num=" + idx;

    axios.delete(deleteurl)
      .then(() => {

        alert("해당 회원이 정상적으로 삭제되었습니다");
        window.location.reload();
      })
  }

  useEffect(() => {

    console.log("list");
    list();
  }, [])

  return (
    <div className='card'>
      <table className='table table-bordered' style={{ width: '600px', margin: '0 auto' }}>
        <thead>
          <tr className='table table-warning'>
            <th width='80'>번호</th>
            <th width='400'>회원명</th>
            <th width='120'>아이디</th>
            <th width='120'>가입일</th>
            <th width='120'>삭제</th>
          </tr>
        </thead>

        <tbody>
          {
            memberList.map((row, idx) => (

              <tr style={{ verticalAlign: 'middle' }}>
                <td>{idx + 1}</td>
                <td>{row.myname}</td>
                <td>{row.myid}</td>
                <td width='200'>{row.gaipday}</td>
                <td><button type='button' className='btn btn-outline-danger' onClick={() => {
                  deleteMember(row.num);
                }}>삭제</button></td>
              </tr>
            ))
          }
        </tbody>
      </table>
    </div>
  )
}

export default MemberList