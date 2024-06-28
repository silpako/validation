import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validation/LoginPage1.dart';

class Sign_In extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>Sign_InState();

}
class Sign_InState extends State{
  final formkey=GlobalKey<FormState>();
  String?pass;    //conform password match with password
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 202, 197, 101),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/earth.png",height: 100,width: 100,),
                Text("Sign In",style: GoogleFonts.pacifico(fontSize: 20,fontWeight: FontWeight.bold),),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (email){
                      if(email!.isEmpty || !email.contains('@') || !email.contains('.com')){
                        return "Email must be empty or Inavalid";
                      }else{
                        return null;
                      }
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration
                    (
                      labelText: "Email",
                      labelStyle:TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.email,color: Colors.black,),
                      
                      border: OutlineInputBorder
                      (
                        borderRadius: BorderRadius.circular(25.0),    // shape of the textformfield (border)
                      ),
      
                       focusedBorder: OutlineInputBorder
                      (
                        borderSide: BorderSide(color: Color.fromARGB(255, 52, 177, 166)), // Set the focused border color
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.black),
                      //   borderRadius: BorderRadius.circular(25.0),
                      // )
      
                      ) ,
                  ),
                ),
        
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (phn) {
                      if(phn!.isEmpty || phn.length != 10){ // length below 10 ,empty ,show error and empty 
                        return "Phone Number should have 10 digits/ Field must not be empty";
                      }else{
                        return null;
                      }
                      
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.phone,color: Colors.black,),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                       focusedBorder: OutlineInputBorder
                      (
                        borderSide: BorderSide(color: Color.fromARGB(255, 52, 177, 166)), // Set the focused border color
                        borderRadius: BorderRadius.circular(25.0),
                      ),) ,
                  ),
                ),
      
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (password)
                    {
                      pass=password; // it is called as instance variable for matching with conform password
                      if(password!.isEmpty || password.length<6){
                        return 'Password must no be empty / length must be <6 ';
                      }else{
                        return null;
                      }
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.password,color: Colors.black,),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                       focusedBorder: OutlineInputBorder
                      (
                        borderSide: BorderSide(color: Color.fromARGB(255, 52, 177, 166)), // Set the focused border color
                        borderRadius: BorderRadius.circular(25.0),
                      ),) ,
                  ),
                ),
      
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (cpassword){
                      if(cpassword!.isEmpty || cpassword != pass){ // empty/ conform password not equal and same to the password 
                        return  'Password must no be empty / length must be <6 ';
                      }else{
                        return null;
                      }
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: "Conform Password",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.password,color: Colors.black,),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                       focusedBorder: OutlineInputBorder
                      (
                        borderSide: BorderSide(color: Color.fromARGB(255, 52, 177, 166)), // Set the focused border color
                        borderRadius: BorderRadius.circular(25.0),
                      ),) ,
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: ()
                {
                  final valid=formkey.currentState!.validate();
                  if(valid)
                  {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login_Page()));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid")));
                  }
                },
                style: ElevatedButton.styleFrom(minimumSize:Size(100, 30),backgroundColor: Color.fromARGB(255, 42, 134, 45)),
                 child: Text("Sign In ",style: GoogleFonts.pacifico(fontSize: 15,color: Colors.black),))
        
        
              ],
            ),
          ),
        ),
      ),
      
    );
  }

}