import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:signup/Data/Models/UserX_Model.dart';

class AuthMethods {
  final FirebaseAuth? _auth = FirebaseAuth.instance;
  GoogleSignIn? _googleSignIn = GoogleSignIn();

  static final FirebaseFirestore? _firestore = FirebaseFirestore.instance;

  static final CollectionReference? _userCollection =
      _firestore!.collection("USERS_COLLECTION");

  Future<bool> authenticateUser(User? user) async {
    // QuerySnapshot result = await _userCollection!
    //     .where(user!.email!, isEqualTo: user.email)
    //     .get();
    bool isUserX = true;
    await _userCollection!.doc(user!.uid).get().then((value) {
      if (value.exists) {
        isUserX = true;
      } else {
        isUserX = false;
      }
    });
    // final List<DocumentSnapshot> docs = result.docs;
    return isUserX;
  }

  Future<User?> getCurrentUser() async {
    User? currentUser;
    currentUser = _auth?.currentUser!;
    return currentUser;
  }

  Future<User?> signInWithGoogle() async {
    GoogleSignInAccount? _signInAccount = await _googleSignIn!.signIn();
    GoogleSignInAuthentication? _signInAuthentication =
        await _signInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: _signInAuthentication.accessToken,
        idToken: _signInAuthentication.idToken);

    final User? user = (await _auth?.signInWithCredential(credential))!.user;

    assert(user!.email != null);
    assert(user!.displayName != null);

    final User? currentUser = _auth?.currentUser;
    assert(user!.uid == currentUser!.uid);

    print("signed in " + user!.displayName.toString());
    return user;
  }

  Future<void> signOut() async {
    await _auth!.signOut();
  }

  Future<UserX?> getUserDetails() async {
    User? currentUser = await getCurrentUser();
    DocumentSnapshot? documentSnapshot =
        await _userCollection!.doc(currentUser!.uid).get();
    Map<String, dynamic> docX = documentSnapshot.data() as Map<String, dynamic>;
    return UserX?.fromJson(docX);
  }

  // Future<UserX?> getUserDetailsById(id) async {
  //   try {
  //     DocumentSnapshot? documentSnapshot = await _userCollection.doc(id).get();
  //     return UserX.fromJson(documentSnapshot.data());
  //   } catch (e) {
  //     print(e);
  //     return UserX(
  //         uid: "uid",
  //         name: "name",
  //         email: "email",
  //         userName: "userName",
  //         profilePhoto: "profilePhoto");
  //   }
  // }

  Future<void> addDataToDb(
      User currentUser, String dob, int age, isEmail, String name) async {
    String userName = currentUser.email!.split("@")[0];

    UserX? user = UserX(
      uid: currentUser.uid,
      email: currentUser.email,
      name: name,
      profilePhoto: isEmail
          ? "https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_account_circle_48px-512.png"
          : currentUser.photoURL,
      userName: userName,
      age: age,
      dob: dob,
    );
    _userCollection!.doc(currentUser.uid).set(user.toJson());
  }

  // Future<void> updateDB(User currentUser, String name) async {
  //   UserX? user = UserX(
  //     name: name,
  //     profilePhoto:
  //         "https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_account_circle_48px-512.png",
  //   );
  //   _userCollection!.doc(currentUser.uid).update(user.toJson());
  // }

  // Future<List<UserX?>> fetchAllUsers(User currentUser) async {
  //   List<UserX?> userList = List<UserX?>.empty(growable: true);

  //   QuerySnapshot querySnapshot = await _userCollection.get();
  //   for (var i = 0; i < querySnapshot.docs.length; i++) {
  //     if (querySnapshot.docs[i].id != currentUser.uid) {
  //       userList.add(UserX.fromJson(querySnapshot.docs[i].data()));
  //     }
  //   }
  //   return userList;
  // }

  Future<User?> signUpWithEmailPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      // // ignore: deprecated_member_use
      // user!.updateProfile(
      //   displayName: name,
      //   photoURL:
      //       "https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_account_circle_48px-512.png",
      // );
      print(user);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth!
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      assert(user != null);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
