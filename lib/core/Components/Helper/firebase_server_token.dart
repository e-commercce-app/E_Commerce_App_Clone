import 'package:googleapis_auth/auth_io.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class FirebaseAccessToken {
  static String firebaseMsgScope =
      'https://www.googleapis.com/auth/firebase.messaging';

  static Future<String> getToken() async {
    final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(
          /*
  Replace the placeholder JSON content in the code with the actual content
  from the generated private key JSON file.
  */
          //!-------------------- JSON FILE DATA REPLACE HERE --------------------//
          {
            'type': 'service_account',
            'project_id': 'flutter-e-commerce-14c75',
            'private_key_id': '6559ad35f1902747c6fc8db2494c52a7dfd5e5b6',
            'private_key':
                '-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC9MigPQeoWlboq\n46xyYSoIR6l8BQIJmCH56dotvdCCCFZvugV6YsImzSp6yxrm+0YO9eUkNcUr+uq5\nQbP/1ocwVANIxivu6qTKNZzKR+p9N7X6A0bzj4jhvrnDNHPJNyYDYP5eJUhl6Sq0\nXFR30/Ixmw6/ljlMBzKNnlcT02RuiyYWnOOB3WVYAJ9wvkkjJisNu4hsdkL4DQft\nCiO6WIK+zktj+fq9qjkooAGXVwDrJuc34mJWt/y+Flr41LiXC+g+U0nTbm9ucv5j\nJFzno5/B8IezlF2ZztevrnO5mydtZTU7Xk5OpahL9FUgny7P/fHYfWc+5jfmFn2D\nZVZ7fDG7AgMBAAECggEAFgOjCPtzddigMTi3/8Bx4prBYXk3s87BjVHPnZOWPRB5\nS5t1OGNgvKESI02aE2xYyjQvIG0n7yZ4GhbyDypyz9scCA4UXe1sP/cdsk/Mkhth\nuktCqI54BURrBbKxvPpaGvnglIB5ZxpKv3J1hafiE4bmSsFRE26hoZGIsk7eQxph\n4J9hWbey9L6YdgMg4jvihSFhQlXMmi2A/teBhlBiTmU1Fm9t4kkqyspVVcXI6llN\nb2A/dcTt1eYNok6TH/GZPXbA82dOQPE9jidOYLaSKLakEPdtA3dY283ovfNXz/Dk\n5be6CQc+9kZeHK6I68rNDRtW72Ff2EaCzTmiFZYrQQKBgQDRDTtAwyye2zsjHyNI\nRHsaX+2L5AULsoSrpA0CE4JPqDjyKCYWJOBGITNq1VOHPCVyDBhOsiJkOtQ+wJ63\nO+JiVplDWNIFZP7CEqCL/YXfKozyCZ34ldKlWH0gOx9J71Hyra3et/JGWEuspgI0\nshRNgaDQ5NX79eBDug0p0YC9GwKBgQDnr2Fprq/QEARYgCu7EzbfoaTnse8QWkPC\nHcFOnstBzLXXEbZoND4UVSuGP6dsYpR4vYfvvnF25Egc20TIy1IJcd7wdl9ZY38v\ndHC64VVlCL329yLxmkfmL4frqgiXRm+S8j8ZDSER71ykCOXzcplNDuf//1g5jixM\nIAJ9xmLH4QKBgQDA5f2r56yvtMmfweazk4UoNCYktDW3snVbUBg0tz3CNQ6+3C8w\ntbxA2ffw94GIwwYmc2SmkRbM97/LW7/YgiiF5zSrATVihuvQtpFwO3KhF0lROXCL\n5eumaL2k1QktFui+DmbmoUOsh2Lkn5Zfe4bicd+rgcy2Hw5eUDo/QTMSywKBgQCy\na6eTIYoXqx4NobcLvIJXuj4qiCbY6wqfZRbHGxbgt2uaEvPsT783HVgFbOPcXhaE\n3UDgakMrEiZOwrW4BIxK5byQZjiLuEnsG7ns0TdYNWFF3ZC1iuCv7g64eBthlEa8\nXX4mJqw/CZzIXmnoD2rrov0bcmNY/5oxjb0dazgLQQKBgA1D1mY2TO9PRcaBZqmS\nWcqXwziWXt2e0O0BSMBLaftOsMiwLDxJUQvJVjhn4CB9MlMHWIz2Ht3Qpjr44qgQ\nK6ctwfHyADGuFLTWug65PvtxFvItU2RHC05XN6hllfovEb2cNDO/h+C5lm44lCUv\nrx2MYopb/qTgAPsDN2ocK/0D\n-----END PRIVATE KEY-----\n',
            'client_email':
                'firebase-adminsdk-365lh@flutter-e-commerce-14c75.iam.gserviceaccount.com',
            'client_id': '107651077876569329939',
            'auth_uri': 'https://accounts.google.com/o/oauth2/auth',
            'token_uri': 'https://oauth2.googleapis.com/token',
            'auth_provider_x509_cert_url':
                'https://www.googleapis.com/oauth2/v1/certs',
            'client_x509_cert_url':
                'https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-365lh%40flutter-e-commerce-14c75.iam.gserviceaccount.com',
            'universe_domain': 'googleapis.com',
          }

          //!---------------------------------------------------//
          ),
      [firebaseMsgScope],
    );

    final token = client.credentials.accessToken.data;
    logger.d('Firebase token: $token');
    return token;
  }
}
