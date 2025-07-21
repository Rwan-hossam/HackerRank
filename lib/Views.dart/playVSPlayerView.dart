import 'package:final_project_hacker_rank/viewModel/playerVSPlayerViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerVsPlayerView extends StatelessWidget {
  const PlayerVsPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PlayerVsPlayerViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' VS Friend ',
          style: TextStyle(
            fontFamily: 'Bitcount-VariableFont_CRSV,ELSH,ELXP,slnt,wght',
            fontSize: 40,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 142, 11),
        actions: [
          IconButton(
            icon: Icon(Icons.restart_alt),
            onPressed: () {
              viewModel.resetGame();
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
                        '1',
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
                        '1',
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
              viewModel.winner == ''
                  ? 'Turn: ${viewModel.currentPlayer}'
                  : viewModel.winner == 'Draw'
                  ? 'It\'s a Draw!'
                  : 'Winner: ${viewModel.winner}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
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
                onTap: () => viewModel.playMove(index),
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
                      viewModel.board[index],
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
        ],
      ),
    );
  }
}
