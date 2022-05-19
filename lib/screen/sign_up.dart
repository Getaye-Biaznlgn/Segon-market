import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../provider/auth.dart';

class SignUpPage extends StatefulWidget {
  static String routeName = "/singup";
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // TextEditingController nameController=TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _formData = {'email': '', 'password': ''};
  bool isLoading = false;

  Future<void> saveForm() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      // SharedPreferences preferences = await SharedPreferences.getInstance();
      // preferences.setString('userId', 'getaye');
      // Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName('/'));
      await Provider.of<Auth>(context, listen: false).signUp(_formData['email'], _formData['password']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Segon'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  // controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            width: 1,
                            color: Colors.blueAccent,
                            style: BorderStyle.solid)),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return "Please enter email";
                    return null;
                  },
                  onSaved: (value) {
                    _formData['email'] = value.trim();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            width: 1,
                            color: Colors.blueAccent,
                            style: BorderStyle.solid)),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return "Please enter user name";
                    return null;
                  },
                  onSaved: (value) {
                    _formData['password'] = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Reenter password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            width: 1,
                            color: Colors.blueAccent,
                            style: BorderStyle.solid)),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return "Please enter user name";
                    if (passwordController.value.text != value)
                      return 'password don\'t match';
                    return null;
                  },
                  onSaved: (value) {
                    _formData['password'] = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonTheme(
                  minWidth: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                      child: isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              "Signup",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        Fluttertoast.showToast(
                            msg: "Don't kick me, it's my right to say...");
                        await saveForm();
                        setState(() {
                          isLoading = false;
                        });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
