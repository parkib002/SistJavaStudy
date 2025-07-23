import React from 'react'

const RowItemApp = ({ row, ondelete, index }) => {

    return (
        <tr style={{ verticalAlign: 'middle' }}>
            <td>{row.name}</td>
            <td><img src={`../image/연예인사진/${row.photo}.jpg`} style={{ width: '50px', height: '50px', borderRadius: '100px 100px 100px 100px' }}></img></td>
            <td>{row.mbti}</td>
            <td>{row.today.toLocaleDateString('ko-kr')}</td>
            <td><button type='button' className='btn btn-outline-danger' onClick={() => ondelete(index)}>삭제</button></td>
        </tr>
    )
}

export default RowItemApp