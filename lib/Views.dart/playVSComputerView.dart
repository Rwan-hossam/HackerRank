import 'package:final_project_hacker_rank/viewModel/playVSComputerViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Playvscomputerview extends StatefulWidget {
  Playvscomputerview({super.key});

  @override
  State<Playvscomputerview> createState() => _PlayvscomputerviewState();
}

class _PlayvscomputerviewState extends State<Playvscomputerview> {
  @override
  Widget build(BuildContext context) {
    final viewModel2 = Provider.of<Playvscomputerviewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' VS Computer ',
          style: TextStyle(
            fontFamily: 'Bitcount-VariableFont_CRSV,ELSH,ELXP,slnt,wght',
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 142, 11),
        actions: [
          IconButton(
            icon: Icon(Icons.restart_alt),
            onPressed: () {
              viewModel2.resetGame();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 37, 152, 24),
                        Color.fromARGB(255, 9, 132, 14),
                        Color.fromARGB(255, 6, 98, 6),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'X',
                        style: TextStyle(
                          fontFamily:
                              'Bitcount-VariableFont_CRSV,ELSH,ELXP,slnt,wght',
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        'Score',
                        style: TextStyle(
                          fontFamily:
                              'Bitcount-VariableFont_CRSV,ELSH,ELXP,slnt,wght',
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '${viewModel2.counter1}',
                        style: TextStyle(
                          fontFamily:
                              'Bitcount-VariableFont_CRSV,ELSH,ELXP,slnt,wght',
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 37, 152, 24),
                        Color.fromARGB(255, 9, 132, 14),
                        Color.fromARGB(255, 6, 98, 6),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'O',
                        style: TextStyle(
                          fontFamily:
                              'Bitcount-VariableFont_CRSV,ELSH,ELXP,slnt,wght',
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        'Score',
                        style: TextStyle(
                          fontFamily:
                              'Bitcount-VariableFont_CRSV,ELSH,ELXP,slnt,wght',
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '${viewModel2.counter2}',
                        style: TextStyle(
                          fontFamily:
                              'Bitcount-VariableFont_CRSV,ELSH,ELXP,slnt,wght',
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              viewModel2.winner == ''
                  ? 'Turn: ${viewModel2.currentPlayer}'
                  : viewModel2.winner == 'Draw'
                  ? 'It\'s a Draw!'
                  : 'Winner: ${viewModel2.winner}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => viewModel2.playMove(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 10, 127, 14),
                    border: Border.all(
                      color: const Color.fromARGB(255, 10, 17, 10),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      viewModel2.board[index],
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                viewModel2.NextGame();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  const Color.fromARGB(255, 78, 126, 8),
                ),
              ),
              child: Text(
                'Next Round',
                style: TextStyle(
                  fontFamily: 'Bitcount-VariableFont_CRSV,ELSH,ELXP,slnt,wght',
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
