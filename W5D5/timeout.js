function setTimeOut(callback) {
   window.setTimeout(callback,5000)
};

const func = function() {
  alert('HAMMERTIME')
};

// setTimeOut(func)


function hammerTime(time,callback) {
window.setTimeout(callback(time),time)
};

const func2 = function(time) {
  alert(time + "is hammertime")
};

hammerTime(5000,func2)
