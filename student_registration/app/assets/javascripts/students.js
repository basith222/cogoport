
$(document).ready(function() {
  $("#age_filter").change(function() {
  var age = $("#age_filter").val();
  $.ajax({
  type: "GET",
  url:"/get_student.js",
  data: {age: age}
});
});
});


