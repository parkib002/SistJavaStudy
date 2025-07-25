import axios from 'axios';
import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom';

const ShopForm = () => {

    const [photo, setPhoto] = useState('');
    const [sangpum, setSangpum] = useState('');
    const [su, setSu] = useState('');
    const [dan, setDan] = useState('');

    const navi = useNavigate(); //인서트 후 목록

    //url등록
    let uploadUrl = "http://localhost:9000/shop/upload";
    let photoUrl = "http://localhost:9000/save/";
    let insertUrl = "http://localhost:9000/shop/insert";

    //file change이벤트
    const uploadImage = (e) => {

        const uploadFile = e.target.files[0];
        const imageFile = new FormData(); //axios==>data

        imageFile.append("uploadFile", uploadFile);

        //axios
        axios({

            method: 'post',
            url: uploadUrl,
            data: imageFile,
            headers: { 'Content-Type': 'multipart/form-data' }

        }).then(res => {

            setPhoto(res.data);

        }).catch(err => {

            alert(err);
        });
    }

    //insert
    const onInsert = () => {

        axios.post(insertUrl, { sangpum, su, dan })  //{"sangpum":sangpum} 같을땐 생략 (key값이 스프링 이름과 일치)
            .then(res => {
                //insert성공후 처리할 코드
                navi("/shop/list");
            })
    }

    return (
        <div className="card" style={{ alignItems: 'center' }}>

            <table className='table table-bordered' style={{ width: '600px' }}>
                <caption style={{ captionSide: 'top' }}><b>상품등록</b></caption>
                <tbody>
                    <tr>
                        <th width='150' className='table-secondary'>상품명</th>
                        <td>
                            <input type="text" className='form-control'
                                style={{ width: '200px' }} onChange={(e) => {

                                    setSangpum(e.target.value);
                                }} />
                        </td>
                        <th>{sangpum}</th>
                    </tr>

                    <tr>
                        <th width='150' className='table-secondary'>상품 이미지</th>
                        <td>
                            <input type="file" className='form-control'
                                style={{ width: '300px' }} onChange={uploadImage} />
                        </td>
                        <th></th>
                    </tr>

                    <tr>
                        <th width='150' className='table-secondary'>수량</th>
                        <td>
                            <input type="text" className='form-control'
                                style={{ width: '200px' }} onChange={(e) => {

                                    setSu(e.target.value);
                                }} />
                        </td>
                        <th>{su}</th>
                    </tr>

                    <tr>
                        <th width='150' className='table-secondary'>단가</th>
                        <td>
                            <input type="text" className='form-control'
                                style={{ width: '200px' }}
                                onChange={(e) => {

                                    setDan(e.target.value);
                                }} />
                        </td>
                        <th>{dan}</th>
                    </tr>

                    <tr>
                        <td colSpan='2'>
                            <img src={photo == '' ? '../vite.svg' : photoUrl + photo} style={{ width: '120px', marginLeft: '100px' }} />
                        </td>
                        <td>
                            <button type='button' className='btn btn-outline-info'
                                style={{ width: '120px', height: '120px' }}
                                onClick={onInsert}>상품등록</button>
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
    )
}

export default ShopForm