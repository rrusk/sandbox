function map(patient) {
  // hash_id is a hash of hin, first name, last name,
  //   birthdate, and gender
  // var hash_id = patient.json.hash_id;
  // var hash_hin = patient.json.medical_record_number;
   var hash_first = patient.given();
   var hash_last = patient.last();
   var birth_date = patient.birthtime();
  // var gender = patient.gender();

  emit('first,last,birthdate', {count:1, first:[hash_first], last:[hash_last], bdate:[birth_date]});
}
