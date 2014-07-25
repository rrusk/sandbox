function reduce(key, values) {
    result = {count:0, first:[], last:[], bdate:[]};
    values.forEach(function (v) {
        result.count += v.count;
        result.first = v.first.concat(result.first);
        result.last = v.last.concat(result.last);
        result.bdate = v.bdate.concat(result.bdate);
    });
    return result;
}
