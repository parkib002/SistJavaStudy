import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom';
import Button from '@mui/material/Button';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';

const ShopDetail = () => {

    const { num } = useParams();
    const [sangpum, setSangpum] = useState('');
    const [photo, setPhoto] = useState('');
    const [dan, setDan] = useState('');
    const [su, setSu] = useState('');
    const [ipgoday, setIpgoday] = useState('');

    const navi = useNavigate();

    let photoUrl = "http://localhost:9000/save/";
    let detailUrl = `http://localhost:9000/shop/detail?num=${num}`;
    let deleteUrl = `http://localhost:9000/shop/delete?num=${num}`;

    const [open, setOpen] = useState(false);

    const handleClickOpen = () => {
        setOpen(true);
    };

    const handleClose = () => {
        setOpen(false);
    };

    // ✅ 진짜 삭제 요청
    const handleDeleteConfirm = () => {
        axios.delete(deleteUrl)
            .then(res => {
                alert("삭제 성공");
                navi("/shop/list");
            })
            .catch(err => {
                alert(err);
            });
        setOpen(false); // 닫기
    }

    const detailData = () => {
        axios.get(detailUrl)
            .then(res => {
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
        detailData();
    }, [num]);

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
                    <tr>
                        <td colSpan='5'>
                            <button type='button' className='btn btn-outline-success' onClick={() => {
                                navi("/shop/list");
                            }}>목록</button>&nbsp;&nbsp;
                            <button type='button' className='btn btn-outline-info'>추가</button>&nbsp;&nbsp;
                            <button type='button' className='btn btn-outline-warning'>수정</button>&nbsp;&nbsp;
                            <button type='button' className='btn btn-outline-danger' onClick={handleClickOpen}>
                                삭제
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>

            {/* ✅ 삭제 다이얼로그 영역 */}
            <Dialog
                open={open}
                onClose={handleClose}
                aria-labelledby="alert-dialog-title"
                aria-describedby="alert-dialog-description"
            >
                <DialogTitle id="alert-dialog-title">정말 삭제하시겠습니까?</DialogTitle>
                <DialogContent>
                    <DialogContentText id="alert-dialog-description">
                        이 상품은 삭제 후 복구할 수 없습니다. 계속하시겠습니까?
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button onClick={handleDeleteConfirm} color="error" autoFocus>
                        삭제
                    </Button>
                    <Button onClick={handleClose} color="primary">
                        취소
                    </Button>
                </DialogActions>
            </Dialog>
        </div>
    )
}

export default ShopDetail;
