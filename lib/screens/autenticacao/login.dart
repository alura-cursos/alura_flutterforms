import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  TextEditingController _cpfController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/bytebank_logo.png',
                  width: 200,
                ),
              ),

              SizedBox(height: 30,),

              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300,
                  height: 455,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                            'Faça seu Login',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 15,),

                        TextField(
                          decoration: InputDecoration(
                            labelText: 'CPF',
                          ),
                          maxLength: 11,
                          keyboardType: TextInputType.number,
                          controller: _cpfController,
                        ),

                        SizedBox(height: 20,),

                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Senha',
                          ),
                          maxLength: 15,
                          keyboardType: TextInputType.text,
                          controller: _senhaController,
                        ),

                        SizedBox(height: 30,),

                        SizedBox(
                          width: double.infinity,
                          child: OutlineButton(
                            textColor: Theme.of(context).accentColor,
                            highlightColor: Color.fromRGBO(
                                71, 161, 56, 0.2
                            ),
                            borderSide: BorderSide(
                              width: 2,
                              color: Theme.of(context).accentColor
                            ),
                            child: Text('CONTINUAR'),
                            onPressed: () {

                              if(_validaCampos()) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard(),
                                  ),
                                  (route) => false
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('ATENÇÃO'),
                                      content: Text('CPF ou Senha incorretos!'),
                                      actions: [
                                        FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Fechar')
                                        ),
                                      ],
                                    );
                                  }
                                );
                              }
                            },
                          ),
                        ),

                        SizedBox(height: 15),

                        Text(
                          'Esqueci minha senha >',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 25),

                        OutlineButton(
                          onPressed: () {

                          },
                          highlightColor: Color.fromRGBO(71, 161, 56, 0.2),
                          borderSide: BorderSide(
                              width: 2,
                              color: Theme.of(context).accentColor
                          ),
                          textColor: Theme.of(context).accentColor,
                          child: Text(
                            'Criar uma conta >',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
    );
  }

  bool _validaCampos() {
    if(_cpfController.text.length > 0 && _senhaController.text.length > 0)
      return true;

    return false;
  }
}
