import 'package:brasil_fields/brasil_fields.dart';
import 'package:bytebank/models/cliente.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Registrar extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _nascimentoController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _logradouroController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de cliente'),
        ),
        body: Consumer<Cliente>(
          builder: (context, cliente, child) {
            return Stepper(
              currentStep: cliente.stepAtual,
              onStepContinue: () {
                final functions = [
                  _salvarStep1,
                  _salvarStep2,
                  _salvarStep3,
                ];

                return functions[cliente.stepAtual](context);
              },
              onStepCancel: () {
                cliente.stepAtual > 0 ? cliente.stepAtual -1 : 0;
              },
              steps: _construirSteps(context, cliente),
            );
          },
        ),
        // body: SingleChildScrollView(
        //   child: Form(
        //     key: _formKey,
        //     child: Padding(
        //       padding: EdgeInsets.all(20),
        //       child: Column(
        //         children: [

        //
        //           SizedBox(height: 15),
        //           TextFormField(
        //             decoration: InputDecoration(
        //               labelText: 'Cep',
        //             ),
        //             controller: _cepController,
        //             maxLength: 10,
        //             keyboardType: TextInputType.number,
        //             validator: (value) {
        //
        //               if(value.length < 10)
        //                 return 'CEP inválido';
        //
        //               return null;
        //             },
        //             inputFormatters: [
        //               FilteringTextInputFormatter.digitsOnly,
        //               CepInputFormatter()
        //             ],
        //           ),
        //
        //           DropdownButtonFormField(
        //             isExpanded: true,
        //             decoration: InputDecoration(
        //               labelText: 'Estado'
        //             ),
        //             items: Estados.listaEstadosSigla.map((String estado) {
        //               return DropdownMenuItem(
        //                   child: Text(estado),
        //                   value: estado,
        //               );
        //             }).toList(),
        //             onChanged: (String novoEstadoSelecionado) {
        //               _estadoController.text = novoEstadoSelecionado;
        //             },
        //
        //             validator: (value) {
        //
        //               if(value == null)
        //                 return 'Selecione um estado!';
        //
        //               return null;
        //             },
        //           ),
        //
        //           SizedBox(height: 15),
        //           TextFormField(
        //             decoration: InputDecoration(
        //               labelText: 'Cidade',
        //             ),
        //             controller: _cidadeController,
        //             maxLength: 255,
        //             keyboardType: TextInputType.text,
        //             validator: (value) {
        //
        //               if(value.length < 3)
        //                 return 'Cidade inválida';
        //
        //               return null;
        //             },
        //           ),
        //
        //           TextFormField(
        //             decoration: InputDecoration(
        //               labelText: 'Bairro',
        //             ),
        //             controller: _bairroController,
        //             maxLength: 255,
        //             keyboardType: TextInputType.text,
        //             validator: (value) {
        //
        //               if(value.length < 3)
        //                 return 'Bairro inválido';
        //
        //               return null;
        //             },
        //           ),
        //
        //           TextFormField(
        //             decoration: InputDecoration(
        //               labelText: 'Logradouro',
        //             ),
        //             controller: _logradouroController,
        //             maxLength: 255,
        //             keyboardType: TextInputType.text,
        //             validator: (value) {
        //
        //               if(value.length < 3)
        //                 return 'Logradouro inválido';
        //
        //               return null;
        //             },
        //           ),
        //
        //           TextFormField(
        //             decoration: InputDecoration(
        //               labelText: 'Número',
        //             ),
        //             controller: _numeroController,
        //             maxLength: 255,
        //             keyboardType: TextInputType.text,
        //           ),
        //
        //           SizedBox(height: 25),
        //           OutlineButton(
        //             onPressed: () {
        //
        //               if(_formKey.currentState.validate()) {
        //                 _salvar(context);
        //                 Navigator.pushAndRemoveUntil(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => Dashboard()
        //                   ),
        //                   (route) => false,
        //                 );
        //               }
        //             },
        //             highlightColor: Color.fromRGBO(71, 161, 56, 0.2),
        //             borderSide: BorderSide(
        //                 width: 2,
        //                 color: Theme.of(context).accentColor
        //             ),
        //             textColor: Theme.of(context).accentColor,
        //             child: Text(
        //               'Finalizar cadastro >',
        //               style: TextStyle(
        //                 color: Theme.of(context).accentColor,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
    );
  }

  // void _salvar(context) {
  //   Provider.of<Cliente>(context).nome = _nomeController.text;
  // }

  _salvarStep1(contex) {

  }

  _salvarStep2(contex) {

  }

  _salvarStep3(contex) {

  }

  _construirSteps(context, cliente) {

  }

  _proximoStep(context) {
    Cliente cliente = Provider.of<Cliente>(context, listen: false);
    irPara(cliente.stepAtual + 1, cliente);
  }

  irPara(int step, cliente) {
    cliente.stepAtual = step;
  }
}
