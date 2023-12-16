import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rebuildbloc/bloc/screan_bloc.dart';
import 'package:rebuildbloc/screan/bloc_screan.dart';
import 'package:rebuildbloc/screan/login_page.dart';
import 'package:rebuildbloc/screan/sign_up.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: HomePage(),
          ),
        )),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity, //chiếm toàn bộ chiều ngang
          height: MediaQuery.of(context).size.height, //toan bộ chiều cao
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          //sử dụng để thêm phần lề (khoảng trắng) xung quanh một phần tử hoặc widget. Đoạn mã này đang tạo ra một khoảng trắng xung quanh phần tử, với 30 đơn vị khoảng trắng theo chiều ngang và 30 đơn vị khoảng trắng theo chiều dọc.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold //thiết lập độ đậm của chữ.
                        ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                      "Welcome to arena of valor, go to login, if you don't have an account, please sign up to continue",
                      textAlign: TextAlign.center, //căn văn bản vào giữa
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]))
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('access/images/1.png'))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(60)),
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
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
                      color: Colors.yellow,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60)),
                      child: Text(
                        'Sigup',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
