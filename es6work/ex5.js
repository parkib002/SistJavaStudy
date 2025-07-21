var numbers = [1, 3, 5, 7, 6];

var proc = numbers.map(function (num) {
    return num * num;
});

console.log(proc);

var colors = ['red', 'gray', 'blue', 'white', 'yellow', 'tomate'];

colors.map((color, index) => {
    console.log(color, index);
});