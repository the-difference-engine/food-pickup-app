function recalculateTotal(){
  var charge = document.getElementById("charge").value;
  if (charge > 100) {
    document.getElementById("costField").innerHTML = "You will be charged $" + charge.toString();
  }
}
