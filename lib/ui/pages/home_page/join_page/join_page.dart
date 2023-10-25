import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_coffee/data/dto/user_request.dart';

import 'package:project_coffee/ui/pages/home_page/join_page/widget/join_page_body.dart';

import 'package:project_coffee/ui/pages/home_page/join_sucess_page/join_sucess_page.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';

// class JoinPage extends StatefulWidget {
//   const JoinPage({super.key});
//
//   @override
//   State<JoinPage> createState() => _JoinPageState();
// }
//
// class _JoinPageState extends State<JoinPage> {
//   final TextEditingController userIdController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//
//   void Join(){
//     JoinReqDTO joinReqDTO = JoinReqDTO(userId: userIdController.text, password: passwordController.text, email: emailController.text);
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => JoinSucessPage()),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: JoinPageBody(),
//         persistentFooterButtons: [
//         CustomButton("회원가입",double.infinity,50,Join()),
//     ],
//     );
//   }
// }


class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: JoinPageBody()
    );
  }
}
