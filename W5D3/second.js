function titleize(names, callback) {
  let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(titleized);
};

function titleize(names, callback) {
  let titleized = names.map(name => 'Mx. ${name} ');
  callback(titleized);
};


// constructors prototypes and this

function Elephant(name,height,tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}
Elephant.prototype.trumpet = function () {
  console.log('${this.name} elephant phrr');
};

Elephant.prototype.grow = function () {
  this.height = this.height + 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.paradeHelper = function (elephant) {
  console.log('${elephant.name} is trotting by');
};
