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
                  height: 430,
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
}
