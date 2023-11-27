abstract class ContatoDescricaoState{
   ContatoDescricaoState();
}

class InitStateContatoDescricao extends ContatoDescricaoState  {}

class ErrorContatoDescricao extends ContatoDescricaoState  {
   String erro ="";
   ErrorContatoDescricao({required this.erro}) :super();
}