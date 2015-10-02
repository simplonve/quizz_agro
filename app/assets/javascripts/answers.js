var compteur = 0;

function reset(){
  compteur = 0;
}

function check_answer(arg1, arg2){
  if (arg1 == arg2){
    console.log("good:" + arg2);
    console.log("cliqué:" + arg1);
    compteur += 1;
  }else {
    console.log("good:" + arg2);
    console.log("cliqué:" + arg1);
  }
}
