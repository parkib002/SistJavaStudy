let a=6;
let b="6";
console.log(a==b); //같다고 뜸 값으로만 비교됨.
console.log(a===b); //타입까지도 같아야 true가 뜸.
console.log(Object.is(a,b)); //===이랑 동일함.

console.log(`a의 타입은${typeof(a)}입니다`);
console.log(`a의 타입은${typeof(b)}입니다`);


