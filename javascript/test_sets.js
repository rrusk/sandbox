/**
 * Created by rrusk on 17/07/14.
 */

function myValues() {
  var index = 0.0;
  var arr = [
    "scXmP8VpC1KniVmEVZEYQ+pgXmc0qwQLmXSqSg==",
    "2pjlPUhoLSd1M8GF1HDWWIqbx1ujVlb9yc1p2Q==",
    "VBG+M1Lnwo1zVFd7podU6yZBst03qDv46nM/VA==",
    "m59ceyj+C/6mnU2V32L/0G5XHZ3folWFlz8NTg==",
    "x0EcRSoFvcFjoyDqJOH0jPoCQ4NXjfkBWn6ilg==",
    "AVoisL2/7pMGi7gOlWP4dDSHwzwGxdN8C63l6w==",
    "uGiGzvhpV6QxIJRzBCfd/KRekrZDsX0n2+WkqA==",
    "cXla2QS/bfr5B9x4Y9KMGjpLfIXq9uKHHzvJSg==",
    "tmHosMoGelX0ObIe1BZDxB0Je4qWE44/rrgeXw==",
    "DY2ntNFpBdOHFYAJDJvR/zkLyAKTynZBLxSIUQ==",
    "VBG+M1Lnwo1zVFd7podU6yZBst03qDv46nM/VA==",
    "AVoisL2/7pMGi7gOlWP4dDSHwzwGxdN8C63l6w=="
  ];

  this.hasNext = function() {
      return index < arr.length;
  };
  this.next = function() {
      return arr[index++];
  };
  this.theArr = function() {
      return arr;
  }
}

key = 'hin'

function reduce(key, values) {
    function StringSet() {
        var setObj = {}, val = {};

        this.add = function(str) {
            setObj[str] = val;
        };

        this.contains = function(str) {
            return setObj[str] === val;
        };

        this.remove = function(str) {
            delete setObj[str];
        };

        this.values = function() {
            var values = [];
            for (var i in setObj) {
                if (setObj[i] === val) {
                    values.push(i);
                }
            }
            return values;
        };
    }
    var valuesSet = new StringSet();
    var duplicatesSet = new StringSet();
    var duplicatesStr = "";

    while (values.hasNext()) {
      value = values.next();
    //var myArr = values.theArr();
    //for (var i = 0; i < myArr.length; i++) {
    //  value = myArr[i];
      if (valuesSet.contains(value)) {
          duplicatesSet.add(value);
      } else {
          valuesSet.add(value);
      }
    }
    var list = duplicatesSet.values();
    duplicatesStr += list.length;
    for (var j = 0, size = list.length; j < size; j++) {
        duplicatesStr += ',' + list[j];
    }
    return duplicatesStr;
}

myval = new myValues()
out = reduce(key, myval);

console.log(out);
