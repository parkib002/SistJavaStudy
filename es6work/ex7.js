const array = [1, 2, 3, 4, 5]; // 3을 제거하고 싶다면?

//const deleteIndex = 2;
array.splice(2, 1); // 삭제할 인덱스, 1개만 삭제(즉 3만 삭제)
console.log(array); // [ 1, 2, 4, 5 ]

// slice: 원본 배열을 건드리지 않고 수정된 복사 배열을 리턴해준다(교체 안됨)
var array2 = [1, 2, 3, 4, 5];
var a2 = array2.slice(2, 4); // 시작 인덱스, 마지막 인덱스-1
console.log(a2); // [ 3, 4 ]

// Array.concat(valueN)
// concat메서드는 원하는 값을 원본 배열 끝에 추가한 뒤 새로운 배열 만든다
let con = [1, 2].concat([3, 4], [5, 6]);
console.log(con); // [ 1, 2, 3, 4, 5, 6 ]

// filter
var arr = [1, 2, 3, 4, 5];
var deleteIndex = 1; // 2의 인덱스
arr = arr.filter(function (item, index) {
    return index !== deleteIndex
});
// 배열을 돌며 인덱스1이 아닌 나머지만 다시 모아 리턴

console.log(arr); // [ 1, 3, 4, 5 ]
