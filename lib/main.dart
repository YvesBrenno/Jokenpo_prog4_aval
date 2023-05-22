import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Jokenpo(),
  ));
}

class Jokenpo extends StatefulWidget {
  @override
  JokenpoState createState() => JokenpoState();
}

//estado inicial do jogo
class JokenpoState extends State<Jokenpo> {
  var playerScore = 0;
  var computerScore = 0;
  var draws = 0;

  var imageApp = AssetImage("assets/images/padrao.gif");
  var message = "Escolha uma opção abaixo";

//Usuario seleciona uma opção e é retornado um resultado, incrementando +1 no contador de vitoria, empate ou derrota
  void selectOption(String userChoice) {
    var options = ["pedra", "papel", "tesoura"];
    var appChoice = options[Random().nextInt(options.length)];

    setState(() {
      switch (appChoice) {
        case "pedra":
          imageApp = AssetImage("assets/images/pedra.png");
          break;
        case "papel":
          imageApp = AssetImage("assets/images/papel.png");
          break;
        case "tesoura":
          imageApp = AssetImage("assets/images/tesoura.png");
          break;
      }

      if ((userChoice == "pedra" && appChoice == "tesoura") ||
          (userChoice == "papel" && appChoice == "pedra") ||
          (userChoice == "tesoura" && appChoice == "papel")) {
        playerScore++;
        message = "Você ganhou :)";
      } else if (userChoice == appChoice) {
        draws++;
        message = "Empate!";
      } else {
        computerScore++;
        message = "Você perdeu :(";
      }
    });
  }


//reinicia o jogo
  void restartGame() {
    setState(() {
      playerScore = 0;
      computerScore = 0;
      draws = 0;
      imageApp = AssetImage("assets/images/padrao.gif");
      message = "Escolha uma opção abaixo";
    });
  }

//interface do aplicativo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpô"),
        backgroundColor: Color(0xFF000262),
      ),
      body: Container(
        color: Color.fromARGB(255, 9, 4, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 200,
              child: Center(
                child: Container(
                  child: Image(image: imageApp, fit: BoxFit.contain),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => selectOption("pedra"),
                  child: Image.asset(
                    "assets/images/pedra.png",
                    height: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => selectOption("papel"),
                  child: Image.asset(
                    "assets/images/papel.png",
                    height: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => selectOption("tesoura"),
                  child: Image.asset(
                    "assets/images/tesoura.png",
                    height: 80,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Player",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      playerScore.toString(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Empates",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      draws.toString(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Computador",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      computerScore.toString(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: restartGame,
              child: Text("Restart"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF000262),
              ),
            ),
          ],
        ),
      ),
    );
  }
}