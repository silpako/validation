import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validation/homepage.dart';
import 'package:validation/signinpage.dart';
// StatefulWidget

class Login_Page extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>Login_PageState();

}

class Login_PageState extends State<Login_Page> {

  final _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromARGB(255, 202, 197, 101),
      body: Form(
        key: _formkey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
              // image 
              Image.asset("assets/images/earth.png",height: 150,width: 150,),
              //text 
              Text("Log In",style: GoogleFonts.pacifico(fontSize: 20,fontWeight: FontWeight.bold),),
              //adjust sides 
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField
                (
                  validator: (uname){
                        if(uname!.isEmpty || !uname.contains('@') || !uname.contains('.com')){
                          return "username must be empty or Inavalid";
                        }else{
                          return null;
                        }
                      },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.person,color: Colors.black,),
                    border: OutlineInputBorder
                    (
                      borderRadius: BorderRadius.all(Radius.circular(25.0),)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 52, 177, 166)),
                      borderRadius: BorderRadius.circular(25.0)
                    )
                  ),           
                ),
              ),
        
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField
                (
                  validator: (password)
                      {
                        if(password!.isEmpty || password.length<6){
                          return 'Password must no be empty / length must be <6 ';
                        }else{
                          return null;
                        }
                      },
                cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black,),
                    prefixIcon: Icon(Icons.password,color: Colors.black,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                     focusedBorder: OutlineInputBorder
                     (
                      borderSide: BorderSide(color: Color.fromARGB(255, 52, 177, 166),),
                      borderRadius: BorderRadius.circular(25.0))
                  ),           
                ),
              ),
              // Space 
              SizedBox(height: 20,),
              // ClickButton 
              ElevatedButton(onPressed: ()
              {
                if(_formkey.currentState!.validate())
                {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>home()));

                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid")));
                }          
                
              }, 
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 42, 134, 45),minimumSize: Size(100, 30)),
              child: Text("Login",style: GoogleFonts.pacifico(fontSize: 15,color: Colors.black),)),
      
              //TextButton
              TextButton(onPressed: ()
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Sign_In()));
              },
              child: Text("Not a User? Sign in Here...!",style: GoogleFonts.pacifico(fontSize: 10,color: Colors.black))),
        
            ],
          ),
        ),
      ),
    );
  }
}