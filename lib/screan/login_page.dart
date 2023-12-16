import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rebuildbloc/bloc/screan_bloc.dart';
import 'package:rebuildbloc/screan/bloc_screan.dart';
import 'package:rebuildbloc/screan/sign_up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //resizeToAvoidBottomInset: false được sử dụng trong một Scaffold để điều chỉnh cách ứng dụng xử lý việc thay đổi kích thước của không gian hiển thị khi bàn phím hiển thị hoặc ẩn đi trên màn hình.
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:
            0, //elevation: 0 được sử dụng trong AppBar để chỉ định độ nâng của thanh ứng dụng. Thuộc tính elevation xác định độ cao của thanh, đặc biệt là độ bóng đổ mà thanh đó có thể tạo ra để tạo hiệu ứng sâu, nổi bật.
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context); // Quay lại Màn hình A
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Login to your account',
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(children: [
                    makeInput(label: 'Email'),
                    makeInput(label: 'Password', obscureText: true),
                    // makeInput(label: 'Confirm Password', obscureText: true),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 2, left: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      color: Color.fromARGB(255, 228, 73, 26),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Provider<ScreanBloc>.value(
                              value: ScreanBloc(),
                              child: BlocUi(),
                            );
                          },
                        ));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60)),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't heve an account?",
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                      },
                      child: Text(
                        "Sing up",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 238, 83, 72)),
                      ),
                    ),
                  ],
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 4,
                    // height: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('access/images/2.png'),
                            fit: BoxFit.fitHeight))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    //obscureText để ẩn văn bản nhập vào để bảo mật.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 105, 102, 102))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 105, 102, 102)))),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
