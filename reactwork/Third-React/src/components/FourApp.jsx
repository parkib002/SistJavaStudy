import React from 'react'
import img1 from '../assets/image/만화이미지/01.png';
import img2 from '../assets/image/만화이미지/02.png';
import img3 from '../assets/image/만화이미지/03.png';
import img4 from '../assets/image/만화이미지/04.png';
import img5 from '../assets/image/만화이미지/05.png';

const FourApp = () => {

    //배열 변수 선언
    const names = ['강호동', '손흥민', '김민재', '유재석', '아이유'];

    const nameList = names.map((name) => (<li>{name}</li>));

    //색상을 배열로
    const colors = ['red', 'blue', 'white', 'black', 'purple'];

    const colorList = colors.map((color) => (<div className='box' style={{ backgroundColor: color }}>{color}</div>));

    //이미지를 배열 변수에 넣기
    const imgArr = [img1, img2, img3, img4, img5];

    //이미지 배열 변수_public
    const imgPArr = ['1', '2', '3', '4', '5', '6'];

    return (
        <div>

            <h1 className='alert alert-info'>FourApp_반복문 연습</h1>

            <ol>{nameList}</ol>
            <hr />
            <ul>
                {
                    //반복문을 리턴에 직접 주어도 된다
                    names.map((name, index) => (<b style={{ marginLeft: '10px' }}>{index + 1}: {name}</b>))
                }
            </ul>
            <hr />
            {colorList}
            <hr style={{ clear: 'both' }} />

            {/* src의 이미지를 배열 반복 출력하기 너비 100 */}
            {
                imgArr.map((img) => (<img src={img} style={{ width: '100px' }}></img>))
            }
            <hr />
            {
                imgPArr.map((img) => (<img src={'../image2/img/mycar/mycar' + img + '.png'}
                    style={{ width: '100px', height: '100px' }} className='myphoto'></img>))
            }
            <hr />
            {
                imgPArr.map((img) => (<img src={`../image2/img/mycar/mycar${img}.png`}
                    style={{ width: '100px', height: '100px' }} className='myphoto'></img>))
            }
        </div>
    )
}

export default FourApp