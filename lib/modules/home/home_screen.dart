import 'package:flutter/material.dart';
import 'package:github_bloc/config/themes.dart';
import 'package:github_bloc/modules/user_detail/user_detail_screen.dart';
import 'package:github_bloc/widgets/app_button.dart';
import 'package:github_bloc/widgets/components/ticket_clipper_widget.dart';

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
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return _buildPopUpTicket();
                  },
                );
              },
              child: Text("Show Popup"),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPopUpTicket() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 100, 24, 32),
      child: ClipPath(
        clipper: DolDurmaClipper(bottom: MediaQuery.of(context).size.height / 2.0 - 70, holeRadius: 30),
        child: Material(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24)
            ),
            margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Gunung Tangkuban Perahu via Sulur",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2A74B3),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Center(
                  child: Text(
                    "Pembayaran Offline",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF505050)),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order no. #IF34356"),
                    Text(
                      "Rp 200.000",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2A74B3),
                      ),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 16),
                Text(
                  "Nama Pengguna",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFFB1B1B1),
                  ),
                ),
                Text("Jenny Simmons"),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Waktu",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFB1B1B1),
                          ),
                        ),
                        Text(
                          "13.15",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Tanggal",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFB1B1B1),
                          ),
                        ),
                        Text(
                          "25 Juli 2001",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Jumlah",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFB1B1B1),
                          ),
                        ),
                        Text(
                          "3 Tiket",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  "Silahkan melakukan scan QR Code pada Destinasi Anda",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF2A74B3),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Image.asset("assets/images/qrcode.png"),
                ),
                SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color(0xFF2C79BA),
                    child: Text(
                      "Kembali",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
