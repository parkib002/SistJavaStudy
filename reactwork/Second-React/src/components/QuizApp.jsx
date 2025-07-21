import React, { useState } from 'react'
import Radio from '@mui/material/Radio';
import RadioGroup from '@mui/material/RadioGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import FormControl from '@mui/material/FormControl';
import FormLabel from '@mui/material/FormLabel';
import { Key } from '@mui/icons-material';

const QuizApp = () => {

    const [name, setName] = useState('');
    const [score, setScore] = useState(0);
    const [grade, setGrade] = useState('');
    const [color, setColor] = useState('gray');

    const handleEvent2 = (e) => {
        if (e.key === 'Enter') {
            setName('');
            setScore(0);
            setGrade('')

            document.getElementById('name').value  // 수정: () 지움
            document.getElementById('score').value // 수정: () 지움

        }
    }

    const handleEvent = (e) => {

        var color = e.target.value;

        setColor(color)

    }
    return (
        <div>

            <h2>QuizApp_이름과 점수를 입력</h2>

            <div className='input'>
                <span>이름</span>
                <input type="text" className='form-control' id='name'
                    onChange={(e) => {

                        setName(e.target.value);
                    }} />
                <span>점수</span>
                <input type="text" className='form-control' id='score'
                    onChange={(e) => {

                        setScore(e.target.value);

                        if (e.target.value >= 90) {
                            setGrade('장학생');
                        } else if (e.target.value >= 80 && e.target.value < 90) {
                            setGrade('평균학생');
                        } else if (e.target.value < 80 && e.target.value >= 0) {
                            setGrade('재시험');
                        } else
                            setGrade('');

                    }}
                    onKeyUp={handleEvent2}
                />



                <FormControl>
                    <RadioGroup
                        row
                        aria-labelledby="demo-row-radio-buttons-group-label"
                        name="row-radio-buttons-group"
                        onClick={handleEvent}>

                        <FormControlLabel value="black" control={<Radio />} label="black" />
                        <FormControlLabel value="red" control={<Radio />} label="red" />
                        <FormControlLabel value="green" control={<Radio />} label="green" />
                        <FormControlLabel value="blue" control={<Radio />} label="blue" />
                        <FormControlLabel value="purple" control={<Radio />} label="purple" />

                    </RadioGroup>
                </FormControl>
            </div>

            {/* 등급은 90점 이상: 장학생 80점 이상: 평균학생 나머지: 재시험 */}
            <div className='output' style={{ color: color }}>
                이름: {name} <br />
                점수: {score} <br />
                등급: {grade}
            </div>

            {/* 라디오버튼 5개 만들고 black,red등의 defaultValue값을 준 후 버튼을 누르면 그 해당색으로 변경되게 하시오 */}

        </div>

    )
}

export default QuizApp