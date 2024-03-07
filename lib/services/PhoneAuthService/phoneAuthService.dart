import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:food_panda_clone/Screens/map/mapwithbloc.dart';
// import 'package:food_panda_clone/Screens/identify_location.dart';
import 'package:food_panda_clone/features/map/screens/widgets/identify_location.dart';

class PhoneAuthService {
  static Future registerPhoneNumber(
      {required String number,
      required BuildContext context,
      required TextEditingController otpCodeController}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {
        auth.signInWithCredential(credential).then((result) =>
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Success Fully Sign : '))));
      },
      // verificationCompleted: (phoneAuthCredential) => null,
      verificationFailed: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('>>>>>? : ${error.message.toString()}')));
      },

      codeAutoRetrievalTimeout: (verificationId) {
        verificationId = verificationId;
        print('Vericication Id :>  $verificationId');
        print('Timeout');
      },

      codeSent: (verificationId, forceResendingToken) {
        //  SHOW DIALOGE TO TAKE INPUT FROM USER
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  clipBehavior: Clip.antiAlias,
                  title: const Text('Enter OTP Code(SMS)'),
                  content: Column(mainAxisSize: MainAxisSize.min, children: [
                    TextFormField(
                        controller: otpCodeController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: 'Code'))
                  ]),
                  actions: [
                    FloatingActionButton(
                      onPressed: () async {
                        var smsCode = otpCodeController.text.trim();
                        var credential = PhoneAuthProvider.credential(
                            verificationId: verificationId, smsCode: smsCode);
                        await auth
                            .signInWithCredential(credential)
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Code Is Verified: $value')));
                          return Navigator.of(context)
                              .pushNamed(IdentifyLocationPage.pageName);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Code Is Verified')));
                      },
                      child: const Text('Done'),
                    )
                  ],
                ));
      },
    );
  }
}
