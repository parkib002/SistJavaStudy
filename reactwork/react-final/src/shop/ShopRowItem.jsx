import React from 'react'
import { useNavigate } from 'react-router-dom';

const ShopRowItem = ({ idx, row }) => {

    let photoUrl = "http://localhost:9000/save/";

    const navi = useNavigate();

    const detailPage = (idx) => {

        navi("/shop/detail/" + idx);
    }
    return (

        <tr style={{ verticalAlign: 'middle' }}>
            <td>{idx + 1}</td>
            <td>
                <img src={photoUrl + row.photo} style={{ width: '100px', height: '100px' }} /><br />
                <b>{row.sangpum}</b>
            </td>
            <td><button type='button' className='btn btn-outline-success'
                onClick={() => {

                    detailPage(row.num);
                }}>상세보기</button></td>
        </tr>
    )
}

export default ShopRowItem