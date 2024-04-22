import 'package:flutter/material.dart';
import 'package:lexical_corrector/colors/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Corretor Léxico',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  String _errorMessage = '';

  String _validateCode(String code) {
    // Tokens que são permitidos
    List<String> allowedTokens = [
      'if',
      'else',
      'let',
      'var',
      'true',
      'false',
      'true;',
      'false;',
      '===',
      '!==',
      '>',
      '<',
      '>=',
      '<=',
      '+',
      '-',
      '*',
      '/',
      '=',
      '&&',
      '||',
      ';',
      '{',
      '}',
      '(',
      '!(',
      ')',
      ');',
      '()',
      '{}',
      'console.log(',
      ' '
    ];

    // Verifica a estrutura do if
    if (code.contains('if') &&
        !code.contains('{}') &&
        !code.contains('}') &&
        !code.contains('()')) {
      return 'Estrutura incorreta do if. Esperado: if (condição) { corpo }';
    }

    // Verifica se todos os tokens no código estão na lista de tokens permitidos
    List<String> lines = code.split('\n');
    for (var line in lines) {
      List<String> tokens = line.split(' ');
      for (var i = 0; i < tokens.length; i++) {
        if (tokens[i] == 'let' && i + 1 < tokens.length) {
          String token = tokens[i + 1];
          // Verifica se há caracteres especiais na variável
          RegExp specialChars = RegExp(r'[ç().{}!@#%^&*,?":|<>]');
          if (specialChars.hasMatch(token)) {
            return 'A variável não pode conter caracteres especiais.';
          }
          // Verifica se o token começa com um número
          if (RegExp(r'^[0-9]').hasMatch(token)) {
            return 'A variável não pode começar com um número.';
          }
          if (!allowedTokens.contains(token)) {
            String createdToken = '$token';
            allowedTokens.add(createdToken);
            tokens[i + 1] = createdToken;
          }
        } else if ((tokens[i] == '===' ||
                tokens[i] == '=' ||
                tokens[i] == '>' ||
                tokens[i] == '<' ||
                tokens[i] == '<=' ||
                tokens[i] == '>=') &&
            i + 1 < tokens.length) {
          String token = tokens[i + 1];
          if (token.startsWith('"') || token.startsWith("'")) {
            // Verifica se o token começa com um número
            if (RegExp(r'^[0-9]').hasMatch(token)) {
              return 'A variável não pode começar com um número.';
            }
          } else if (RegExp(r'^[0-9]').hasMatch(token)) {
            // Verifica se há caracteres especiais na variável
            RegExp specialChars = RegExp(r'[ç(){}!@#%^&*,?":|<>]');
            if (specialChars.hasMatch(token)) {
              return 'A variável não pode conter caracteres especiais e nem letras.';
            }
            if (RegExp(r'[a-zA-Z]').hasMatch(token)) {
              return 'Um número não pode ter letras.';
            }
          } else {
            continue;
          }
          if (!allowedTokens.contains(token)) {
            String createdToken = '$token';
            allowedTokens.add(createdToken);
            tokens[i + 1] = createdToken;
          }
        }
      }
      for (var token in tokens) {
        if (!allowedTokens.contains(token)) {
          return 'Token não permitido: $token';
        }
      }
    }

    return 'certo';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsD.orangeDark,
        toolbarHeight: 90,
        title: const Center(
          child: Text(
            'Corretor Léxico',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              maxLines: null,
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Lógica do if',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _errorMessage != 'certo'
                  ? _errorMessage
                  : "Parabéns!! Seu código está correto!",
              style: TextStyle(
                color: _errorMessage != 'certo' ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            Material(
              elevation: 20,
              child: InkWell(
                onTap: () {
                  setState(() {
                    // Remover espaços extras antes de validar
                    String code =
                        _controller.text.replaceAll(RegExp(r'\s+'), ' ');
                    _errorMessage = _validateCode(code);
                  });
                },
                child: Container(
                  height: 70,
                  width: 150,
                  decoration: BoxDecoration(
                    color: ColorsD.orangeDark,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "Verificar erros",
                      style: TextStyle(
                        color: ColorsD.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
