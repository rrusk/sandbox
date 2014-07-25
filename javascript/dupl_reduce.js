function reduce(key, values) {
    result = {count:0, u:[]};
    values.forEach(function (v) {
        result.count += v.count;
        result.u = v.u.concat(result.u);
    });
    return result;
}
