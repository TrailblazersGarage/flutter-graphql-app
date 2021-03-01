import 'package:cndv/src/services/graphql/mutations/auth_token_registration_usuario.dart';
import 'package:cndv/src/widgets/blue_button.dart';
import 'package:cndv/src/widgets/custom_input.dart';
import 'package:cndv/src/widgets/labels.dart';
import 'package:cndv/src/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: <Widget>[
               Logo(),
               Form(),
               Labels(
                   message: 'Termos de uso e condições de uso.',
                   callToActionText: 'Criar minha CNDV',
                   route: 'cadastro'
               )
              ],
            ),
          ),
        )
      )
    );
  }
}

class Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {

  final cpfCtrl = TextEditingController();
  final passCtrl  =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric( horizontal: 50 ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomInput(
              icon: Icons.mail_outline,
              placeholder: 'CPF',
              keyboardType: TextInputType.emailAddress,
              textController: cpfCtrl
          ),
          CustomInput(
              icon: Icons.lock_outline,
              placeholder: 'Senha',
              keyboardType: TextInputType.emailAddress,
              textController: passCtrl,
              isPassword: true,
          ),
          Mutation(
              options: MutationOptions(
                document: gql(authTokenRegistrationUsuario.authUser),
                update: (GraphQLDataProxy cache, QueryResult result) {
                  return cache;
                },
                onCompleted: (dynamic resultData){
                  print(resultData);
                }
              ),
              builder: (
                RunMutation runMutation,
                QueryResult result
              ) {
                return BlueButton(text: 'Entrar', onPressed: () => runMutation({
                    'cpf':    cpfCtrl.text,
                    'senha':  passCtrl.text
                  }),
                );
              }
          )
        ],
      ),
    );
  }
}


