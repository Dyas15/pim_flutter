bool validarCPF(String cpf) {
  if (cpf.length != 11 ||
      cpf.compareTo('00000000000') == 0 ||
      cpf.compareTo('11111111111') == 0 ||
      cpf.compareTo('22222222222') == 0 ||
      cpf.compareTo('33333333333') == 0 ||
      cpf.compareTo('44444444444') == 0 ||
      cpf.compareTo('55555555555') == 0 ||
      cpf.compareTo('66666666666') == 0 ||
      cpf.compareTo('77777777777') == 0 ||
      cpf.compareTo('88888888888') == 0 ||
      cpf.compareTo('99999999999') == 0) {
    return false;
  }

  List<int> verificadores = [];

  for (int i = 0; i < 2; i++) {
    int soma = 0;
    int multiplicador = 10 + i;

    for (int j = 0; j < multiplicador - 1; j++) {
      soma += int.parse(cpf[j]) * (multiplicador - j);
    }

    int digito = (soma * 10) % 11;
    if (digito >= 10) {
      digito = 0;
    }
    verificadores.add(digito);
  }

  for (int i = 0; i < 2; i++) {
    if (int.parse(cpf[9 + i]) != verificadores[i]) {
      return false;
    }
  }

  return true;
}
