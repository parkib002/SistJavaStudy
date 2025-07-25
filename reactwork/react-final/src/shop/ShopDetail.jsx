import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom';

const ShopDetail = () => {

    const { num } = useParams();
    const [sangpum, setSangpum] = useState('');
    const [photo, setPhoto] = useState('');
    const [dan, setDan] = useState('');
    const [su, setSu] = useState('');
    const [ipgoday, setIpgoday] = useState('');

    const navi = useNavigate();

    let photoUrl = "http://localhost:9000/save/";

    const detailData = () => {

        let url = `http://localhost:9000/shop/detail?num=${num}`;


        //axios
        axios.get(url)
            .then(res => {
                // res.data 안에 있다고 가정
                setSangpum(res.data.sangpum);
                setPhoto(res.data.photo);
                setDan(res.data.dan);
                setSu(res.data.su);
                setIpgoday(res.data.ipgoday);
            })
            .catch(err => {
                alert(err);
            });
    }

    useEffect(() => {

        console.log("list");
        detailData();
    }, [num])

    return (

        <div>

            <h1>{sangpum} 상세 페이지</h1>

            <table className='table table-bordered' style={{ width: '700px', margin: '0 auto' }}>
                <thead>
                    <tr className='table table-warning'>
                        <th width='80'>상품명</th>
                        <th width='400'>이미지</th>
                        <th width='120'>가격</th>
                        <th width='120'>입고량</th>
                        <th width='120'>입고일</th>
                    </tr>
                </thead>

                <tbody>
                    <tr style={{ verticalAlign: 'middle' }}>
                        <td>{sangpum}</td>
                        <td>
                            <img src={photoUrl + photo} style={{ width: '100px', height: '100px' }} /><br />
                        </td>
                        <td>{dan}원</td>
                        <td>{su}개</td>
                        <td>{ipgoday}</td>

                    </tr>
                </tbody>
            </table>
            <br /><br />
            <button type='button' className='btn btn-outline-success' onClick={() => {

                navi("/shop/list");
            }}>목록</button>
        </div>
    )
}

export default ShopDetail