console.log(new Array(5)); // <5 empty items>
console.log(...Array(5)); // undefined undefined undefined undefined undefined
console.log(Array.from(Array(5).keys)); // []

const arr = Array.from({ length: 5 }, (_, i) => i + 1);

console.log(arr); // [ 1, 2, 3, 4, 5 ]