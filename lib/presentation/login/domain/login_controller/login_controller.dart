
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mystore/navigation_menu.dart';

class LoginController extends GetxController {
  final Dio _dio = Dio();// Instance de Dio pour effectuer des requêtes HTTP


  Future<void> login(String email, String password) async {
    try {
      // Effectuer une requête POST vers l'URL d'inscription
      final response = await _dio.post(
        'http://localhost:3000/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      // Traitement de la réponse
      if (response.statusCode == 200) {
        // Authentification réussie
        print('Utilisateur connecté avec succès');
        /// Goto email verification screen
        Get.to(()=>const NavigationMenu());
      } else {
        // Gérer les erreurs ou les réponses non valides
        print('Erreur lors de l\'authentification');
      }
    } catch (e) {
      // Gérer les erreurs de connexion ou les exceptions
      print('Erreur lors de la connexion : $e');
    }
  }
}