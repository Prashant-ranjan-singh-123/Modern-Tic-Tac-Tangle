import 'dart:core';
import 'dart:math';

class GameCode{
  String getPlayer() {
    List<String> strings = ['Player1', 'Player2'];
    Random random = Random();
    int index = random.nextInt(strings.length);
    return strings[index];
  }

  int isGameWon(List<List<int>> matrix){
    // 0 -> nothing
    // 1 -> X
    // 2 -> 0
    if(matrix[0][0]==matrix[0][1]&&matrix[0][1]==matrix[0][2]&&matrix[0][0]!=0){
      // ***
      // ---
      // ---
      return matrix[0][1];
    }else if(matrix[1][0]==matrix[1][1]&&matrix[1][1]==matrix[1][2]&&matrix[1][0]!=0){
      // ---
      // ***
      // ---
      return matrix[1][0];
    }else if(matrix[2][0]==matrix[2][1]&&matrix[2][1]==matrix[2][2]&&matrix[2][0]!=0){
      // ---
      // ---
      // ***
      return matrix[2][0];
    }else if(matrix[0][0]==matrix[1][0]&&matrix[1][0]==matrix[2][0]&&matrix[0][0]!=0){
      // *--
      // *--
      // *--
      return matrix[0][0];
    }else if(matrix[0][1]==matrix[1][1]&&matrix[1][1]==matrix[2][1]&&matrix[0][1]!=0){
      // -*-
      // -*-
      // -*-
      return matrix[0][1];
    }else if(matrix[0][2]==matrix[1][2]&&matrix[1][2]==matrix[2][2]&&matrix[0][2]!=0){
      // --*
      // --*
      // --*
      return matrix[0][2];
    }else if(matrix[0][0]==matrix[1][1]&&matrix[1][1]==matrix[2][2]&&matrix[0][0]!=0){
      // *--
      // -*-
      // --*
      return matrix[0][0];
    }else if(matrix[0][2]==matrix[1][1]&&matrix[1][1]==matrix[2][0]&&matrix[0][2]!=0){
      // --*
      // -*-
      // *--
      return matrix[0][2];
    }
    return 0;
  }

  bool isGameWonBool(List<List<int>> matrix){
    // 0 -> nothing
    // 1 -> X
    // 2 -> 0
    if(matrix[0][0]==matrix[0][1]&&matrix[0][1]==matrix[0][2]&&matrix[0][0]!=0){
      // ***
      // ---
      // ---
      return true;
    }else if(matrix[1][0]==matrix[1][1]&&matrix[1][1]==matrix[1][2]&&matrix[1][0]!=0){
      // ---
      // ***
      // ---
      return true;
    }else if(matrix[2][0]==matrix[2][1]&&matrix[2][1]==matrix[2][2]&&matrix[2][0]!=0){
      // ---
      // ---
      // ***
      return true;
    }else if(matrix[0][0]==matrix[1][0]&&matrix[1][0]==matrix[2][0]&&matrix[0][0]!=0){
      // *--
      // *--
      // *--
      return true;
    }else if(matrix[0][1]==matrix[1][1]&&matrix[1][1]==matrix[2][1]&&matrix[0][1]!=0){
      // -*-
      // -*-
      // -*-
      return true;
    }else if(matrix[0][2]==matrix[1][2]&&matrix[1][2]==matrix[2][2]&&matrix[0][2]!=0){
      // --*
      // --*
      // --*
      return true;
    }else if(matrix[0][0]==matrix[1][1]&&matrix[1][1]==matrix[2][2]&&matrix[0][0]!=0){
      // *--
      // -*-
      // --*
      return true;
    }else if(matrix[0][2]==matrix[1][1]&&matrix[1][1]==matrix[2][0]&&matrix[0][2]!=0){
      // --*
      // -*-
      // *--
      return true;
    }
    return false;
  }

  bool areGridListsEqual(List<List<int>> list1, List<List<int>> list2) {
    for (int i = 0; i < list1.length; i++) {
      if (list1[i].length != list2[i].length) {
        return false;
      }

      for (int j = 0; j < list1[i].length; j++) {
        if (list1[i][j] != list2[i][j]) {
          return false;
        }
      }
    }
    return true;
  }

  bool areGridFilled(List<List<int>> list1) {

    for (int i = 0; i < list1.length; i++) {
      for (int j = 0; j < list1[i].length; j++) {
        if (list1[i][j] == 0) {
          return false;
        }
      }
    }
    return true;
  }

  String compMove(List<List<int>> list){
    Random random = Random();
    List<String> str=[];
    for(int i=0;i<list.length;++i){
      for(int j=0;j<list[i].length;++j){
        if(list[i][j]==0){
          str.add('${i}${j}');
        }
      }
    }
    if(str.isEmpty){
      return "-1";
    }
    return str[random.nextInt(str.length)];
  }
}