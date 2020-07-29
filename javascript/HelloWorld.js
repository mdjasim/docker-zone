console.log('Hello World');
let b1 = new Bike('BMW', 'Red');
console.log(b1.getBikeColor());

let b2 = new Bike('Audi', 'Blue');
console.log(b2.getBikeColor());

console.log(b1.__proto__ === Bike.prototype);

function Bike(name, color) {
  this.name = name;
  this.color = color;

  // this.getBikeColor = function () {
  //   return this.name + ' is a ' + this.color + ' bike';
  // };

  Bike.prototype.getBikeColor = function () {
    return this.name + ' is a ' + this.color + ' bike..';
  };
}

class BikeClass {
  constructor(name, color) {
    this.color = color;
    this.name = name;
  }
  getInfo() {
    return this.name + ' is a ' + this.color + ' bike from class';
  }
}

let b3 = new BikeClass('Volvo', 'White');
console.log(b3.getInfo());
