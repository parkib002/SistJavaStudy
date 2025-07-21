import React, { useState } from 'react'

const ThreeApp = () => {

    const [photo, setPhoto] = useState('../image2/img/mycar/mycar1.png');

    const changePhoto = (e) => {

        let img = e.target.value;

        setPhoto(img);
    }

    return (
        <div>

            <h1 className='alert alert-info'>ThreeApp</h1>

            <div onClick={changePhoto}>
                <b>이모티콘 선택:</b>
                <label><input type="radio" name='photo' value='../image2/img/mycar/mycar1.png' defaultChecked />이미지1</label>&nbsp;&nbsp;
                <label><input type="radio" name='photo' value='../image2/img/mycar/mycar2.png' />이미지2</label>&nbsp;&nbsp;
                <label><input type="radio" name='photo' value='../image2/img/mycar/mycar3.png' />이미지3</label>&nbsp;&nbsp;
                <label><input type="radio" name='photo' value='../image2/img/mycar/mycar4.png' />이미지4</label>&nbsp;&nbsp;
                <label><input type="radio" name='photo' value='../image2/img/mycar/mycar5.png' />이미지5</label>&nbsp;&nbsp;
                <label><input type="radio" name='photo' value='../image2/img/mycar/mycar6.png' />이미지6</label>&nbsp;&nbsp;
                <label><input type="radio" name='photo' value='../image2/img/mycar/mycar7.png' />이미지7</label>&nbsp;&nbsp;
            </div>

            <img src={photo} />
        </div>
    )
}

export default ThreeApp