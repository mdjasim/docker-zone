let carColor = 'Blue';

const car = (function () {
  return {
    changedToRedColor: () => {
      carColor = 'Red';
      return carColor;
    },
    changedToWhiteColor: function () {
      carColor = 'White';
      return carColor;
    },
  };
})();

console.log(car.changedToRedColor());

const memoizedAdd = () => {
  let cache = {};
  return (value) => {
    if (value in cache) {
      console.log('Fetching from cache', cache);
      return cache[value];
    } else {
      console.log('Calculating result');
      let result = value + 10;
      cache[value] = result;
      return result;
    }
  };
};
const newAdd = memoizedAdd();
console.log(newAdd(9));
console.log(newAdd(19));
console.log(newAdd(9));
