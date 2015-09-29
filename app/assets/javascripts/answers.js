var compteur = 0;

function reset(){
  compteur = 0;
}

function check_answer(arg1, arg2){
  if (arg1 == arg2){
    compteur += 1;
  }
}
