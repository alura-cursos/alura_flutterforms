import 'package:brasil_fields/brasil_fields.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome',
                    ),
                    controller: _nomeController,
                    maxLength: 255,
                    keyboardType: TextInputType.text,
                    validator: (value) {

                      if(value.contains(" "))
                        return 'Informe pelo menos um sobrenome!';

                      if(value.length < 3)
                        return 'Nome inválido!';

                      return null;
                    },
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    controller: _emailController,
                    maxLength: 255,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {

                      if(!value.contains("@") || !value.contains('.'))
                        return 'Email inválido!';

                      if(value.length < 3)
                        return 'Email muito curto!';

                      return null;
                    },
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'CPF',
                    ),
                    controller: _cpfController,
                    maxLength: 14,
                    keyboardType: TextInputType.number,
                    validator: (value) {

                      if(value.length != 14)
                        return 'CPF inválido';

                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter()
                    ],
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Celular',
                    ),
                    controller: _celularController,
                    maxLength: 14,
                    keyboardType: TextInputType.number,
                    validator: (value) {

                      if(value.length < 11)
                        return 'Celular inválido';

                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter()
                    ],
                  ),

                  DateTimePicker(
                    controller: _nascimentoController,
                    type: DateTimePickerType.date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    dateLabelText: 'Nascimento',
                    dateMask: 'dd/MM/yyyy',

                    validator: (value) {
                      if(value.isEmpty)
                        return 'Data inválida!';

                      return null;
                    },
                  ),

                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Cep',
                    ),
                    controller: _cepController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    validator: (value) {

                      if(value.length < 10)
                        return 'CEP inválido';

                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter()
                    ],
                  ),

                  DropdownButtonFormField(
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: 'Estado'
                    ),
                    items: Estados.listaEstadosSigla.map((String estado) {
                      return DropdownMenuItem(
                          child: Text(estado),
                          value: estado,
                      );
                    }).toList(),
                    onChanged: (String novoEstadoSelecionado) {
                      _estadoController.text = novoEstadoSelecionado;
                    },

                    validator: (value) {

                      if(value == null)
                        return 'Selecione um estado!';

                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
