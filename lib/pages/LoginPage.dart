import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freedom_app/Bloc/Rememberme/Bloc.dart';
import 'package:freedom_app/Bloc/Rememberme/Event.dart';
import 'package:freedom_app/Bloc/Rememberme/State.dart';
import 'package:freedom_app/api/Login.dart';
import 'package:freedom_app/pages/HeadOutPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isrememberme = false;
  final TextEditingController username=TextEditingController();
  final TextEditingController password=TextEditingController();

  bool isNumeric(String str) {
    if (str.isEmpty) {
      return false;
    }
    final number = num.tryParse(str);
    return number != null;
  }
  
  Future<void> localstorage() async {
    var storage = await SharedPreferences.getInstance();
    if((storage.getString('username') == '' || storage.getString('username') == null || storage.getString('username').toString() == 'null' || storage.getString('password') == '' || storage.getString('password') == '' || storage.getString('password').toString() == 'null')){
      username.text='';
      password.text='';
    }
    else{
      username.text=storage.getString('username').toString();
      password.text=storage.getString('password').toString();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    localstorage();
    
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RememberMeBloc,RememberMeState>(
        builder: (context,state){
          return SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1.10 * MediaQuery.of(context).size.height / 3,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color(0xffbd1861),
                      Color(0xff9a1d87),
                      Color(0xff73158d)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1.90 * MediaQuery.of(context).size.height / 3,
                    color: Colors.black26,
                  )
                ],
              ),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.0,
                        0.27 * MediaQuery.of(context).size.height, 20.0, 30.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Center(
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 27.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 28.0, 8.0, 8.0),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black26),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: TextField(
                                        controller: username,
                                        decoration: InputDecoration(
                                            hintText: 'User Name',
                                            hintStyle: TextStyle(fontSize: 18),
                                            icon: Container(
                                              decoration: BoxDecoration(
                                                  gradient: const LinearGradient(
                                                      colors: [
                                                        Color(0xffbd1861),
                                                        Color(0xff9a1d87),
                                                        Color(0xff73158d)
                                                      ],
                                                      begin: Alignment.topCenter,
                                                      end:
                                                          Alignment.bottomCenter),
                                                  borderRadius:
                                                      BorderRadius.circular(100)),
                                              child: const Padding(
                                                padding: EdgeInsets.all(6.0),
                                                child: Icon(
                                                  Icons.person_2_outlined,
                                                  size: 30.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2, color: Colors.black26),
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: TextField(
                                          controller: password,
                                          decoration: InputDecoration(
                                              hintText: 'Password',
                                              hintStyle:
                                                  const TextStyle(fontSize: 18),
                                              icon: Container(
                                                decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                            colors: [
                                                          Color(0xffbd1861),
                                                          Color(0xff9a1d87),
                                                          Color(0xff73158d)
                                                        ],
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(6.0),
                                                  child: Icon(
                                                    Icons.lock_outlined,
                                                    size: 30.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 5.0, 13.0, 5.0),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.zero,
                                        child: Checkbox(
                                          value: state.Remember,
                                          onChanged:(bool? value) => context.read<RememberMeBloc>().add(RememberMeEvent()),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          splashRadius: 0,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.zero,
                                        child: Text(
                                          'Remember me',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      const Text(
                                        'Forgot Password',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff73158d),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xffbd1861),
                                        Color(0xff73158d)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: ElevatedButton(
                                  onPressed: () async{
                                    if(username.text==''){
                                      ShowSnackBar("Username Can't be Empty");
                                    }
                                    else if(password.text==''){
                                      ShowSnackBar("Password Can't be Empty");
                                    }
                                    else{
                                      final login=await Login(username.text, password.text);
                                      if(login!='401' && isNumeric(login)){
                                        ShowSnackBar("Something went wrong. Try again Later");
                                      }
                                      else if(login=="401"){
                                        ShowSnackBar('username or password is incorrect');
                                      }
                                      else{
                                        if(state.Remember==true){
                                          var storage = await SharedPreferences.getInstance();
                                          storage.setString('username', username.text);
                                          storage.setString('password', password.text);
                                        }
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const headoutpage()));
                                      }
                                    }
                                    
                                    
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    overlayColor: Colors.white10,
                                  ),
                                  child: const Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Still not connected? ',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                    children: <InlineSpan>[
                                      WidgetSpan(
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: const Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff73158d),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 19.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      color: Color(0xff73158d),
                                      thickness: 1.0,
                                      indent:
                                          100.0, 
                                      endIndent:
                                          5.0,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xff73158d),width: 1.5),
                                      borderRadius: BorderRadius.circular(100.0)
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Text(
                                        'OR',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      color: Color(0xff73158d),
                                      thickness: 1.0,
                                      indent:
                                          5.0, 
                                      endIndent:
                                          100.0, 
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 17.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.facebook,color: Color.fromARGB(255, 3, 64, 115),size: 40,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Container(child: Icon(FontAwesomeIcons.twitter,color: Colors.white,size: 25,),decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.0),color: Colors.blue),width: 35, height: 35,),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        }),
    );
  }

  ShowSnackBar(String msg){
    final snack = new SnackBar(content: Text(msg),duration: Duration(seconds: 3));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
