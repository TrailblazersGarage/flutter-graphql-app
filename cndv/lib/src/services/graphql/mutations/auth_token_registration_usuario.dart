class authTokenRegistrationUsuario {
  static String authUser = """
    mutation autenticarUsuario(\$cpf: String!, \$senha: String!) {
      autenticarUsuario(input: {cpf: \$cpf, senha: \$senha}) {
        token
        email
        cpf
        nome
      }
    }
  """;

  static String registerNewUser = """
    mutation novoUsuarioAcesso(\$cpf: String!, \$nome: String!, \$senha: String!, \$email: String!, \$dt_nascimento: Date, \$uf: String, \$cidade: String) {
      novoUsuarioAcesso(input: {cpf: \$cpf, nome: \$nome, senha: \$senha, email: \$email, dt_nascimento: \$dt_nascimento, uf: \$uf, cidade: \$cidade}) {
        cpf
        nome
        email
      }
    }
  """;
}
