import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return _buildContent();
  }

  Widget _buildContent() {
    return Column(
      children: [
        _ticketCard(),
        _detailTiket(),
      ],
    );
  }

  Widget _ticketCard() {
    return Container(
      child: Text("Ticket card"),
    );
  }

  Widget _detailTiket() {
    return Container(
      child: Text("Detail Ticket"),
    );
  }

}
