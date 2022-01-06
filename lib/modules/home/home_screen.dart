import 'package:flutter/material.dart';
import 'package:github_bloc/config/themes.dart';
import 'package:github_bloc/modules/user_detail/user_detail_screen.dart';
import 'package:github_bloc/widgets/app_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  bool submitButtonLoading = false;

  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return _buildContent();
  }

  Widget _buildContent() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 24),
            Center(
              child: Text(
                "Github App",
                style: AppTheme.title1,
              ),
            ),
            SizedBox(height: 24),
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                  'https://cdn3.iconfinder.com/data/icons/inficons/512/github.png'),
            ),
            SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(.1),
              ),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: false,
                  controller: _usernameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tidak boleh kosong";
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    hintText: "Github username",
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            AppButton(
              text: "Submit",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, UserDetailScreen.routeName,
                      arguments: _usernameController.text);
                }
                setState(() {});
              },
              options: ButtonOptions(
                width: double.infinity,
                height: 48,
                textStyle: TextStyle(color: Colors.white),
                color: AppTheme.primaryColor,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
              loading: submitButtonLoading,
            )
          ],
        ),
      ),
    );
  }
}
