import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isBusy = false;
  final FlutterAppAuth _appAuth = const FlutterAppAuth();
  String? _codeVerifier;
  String? _nonce;
  String? _authorizationCode;
  String? _refreshToken;
  String? _accessToken;
  String? _idToken;
  TokenResponse? authResult;

  final TextEditingController _authorizationCodeTextController =
  TextEditingController();
  final TextEditingController _accessTokenTextController =
  TextEditingController();
  final TextEditingController _accessTokenExpirationTextController =
  TextEditingController();

  final TextEditingController _idTokenTextController = TextEditingController();
  final TextEditingController _refreshTokenTextController =
  TextEditingController();
  String? _userInfo;
  final String _clientId = 'flutter';
  final String _clientSecret= '901564A5-E7FE-42CB-DD0D-61EF6A8F3888';
  final String _redirectUrl = 'com.example.myflutter3:/oauthredirect';
  final String _issuer = 'https://oidc-dev.shashago.com';
  final String _discoveryUrl ='https://oidc-dev.shashago.com/.well-known/openid-configuration';
  final String _postLogoutRedirectUrl = 'com.example.myflutter3:/';
  final List<String> _scopes = <String>[
    'openid',
    'profile',
    'email',
    'offline_access',
    'api1',
    'api2'
  ];

  final AuthorizationServiceConfiguration _serviceConfiguration =
  const AuthorizationServiceConfiguration(
    authorizationEndpoint: 'https://oidc-dev.shashago.com/connect/authorize',
    tokenEndpoint:         'https://oidc-dev.shashago.com/connect/token',
    endSessionEndpoint: 'https://oidc-dev.shashago.com/connect/logout',
  );

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Sign in with no code exchange'),
                onPressed: () => _signInWithNoCodeExchange(),
              ),
              ElevatedButton(
                child: const Text(
                    'Sign in with no code exchange and generated nonce'),
                onPressed: () => _signInWithNoCodeExchangeAndGeneratedNonce(),
              ),
              // const SizedBox(height: 8),
              ElevatedButton(
                child: const Text('Exchange code'),
                onPressed: _authorizationCode != null ? _exchangeCode : null,
              ),
              // const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _signInWithAutoCodeExchange,
                child: Text("Sign in with auto code exchange"),
              ),
              ElevatedButton(
                onPressed: _testApi,
                child: Text("test Api"),
              ),
              // const SizedBox(height: 8),
              ElevatedButton(
                child: const Text('Refresh token'),
                onPressed: _refreshToken != null ? _refresh : null,
              ),
              // const SizedBox(height: 8),
              ElevatedButton(
                child: const Text('End session'),
                onPressed: _idToken != null
                    ? () async {
                  await _endSession();
                }
                    : null,
              ),
              // const SizedBox(height: 8),
              const Text('refresh token'),
              TextField(
                controller: _refreshTokenTextController,
              ),
              const Text('test api results'),
              Text(_userInfo ?? ''),
              const Text('authorization code'),
              TextField(
                controller: _authorizationCodeTextController,
              ),
              const Text('access token'),
              TextField(
                controller: _accessTokenTextController,
              ),
              const Text('access token expiration'),
              TextField(
                controller: _accessTokenExpirationTextController,
              ),
              const Text('id token'),
              TextField(
                controller: _idTokenTextController,
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _endSession() async {
    try {
      _setBusyState();
      await _appAuth.endSession(EndSessionRequest(
          idTokenHint: _idToken,
          postLogoutRedirectUrl: _postLogoutRedirectUrl,
          serviceConfiguration: _serviceConfiguration));
      _clearSessionInfo();
    } catch (e) {}
    _clearBusyState();
  }

  void _clearSessionInfo() {
    setState(() {
      _codeVerifier = null;
      _nonce = null;
      _authorizationCode = null;
      _authorizationCodeTextController.clear();
      _accessToken = null;
      _accessTokenTextController.clear();
      _idToken = null;
      _idTokenTextController.clear();
      _refreshToken = null;
      _refreshTokenTextController.clear();
      _accessTokenExpirationTextController.clear();
      _userInfo = null;
    });
  }

  Future<void> _refresh() async {
    try {
      _setBusyState();
      final TokenResponse? result = await _appAuth.token(TokenRequest(
          _clientId, _redirectUrl, clientSecret: _clientSecret,
          refreshToken: _refreshToken, issuer: _issuer, scopes: _scopes,allowInsecureConnections: true));
      _processTokenResponse(result);
      authResult = result;

      // await _testApi();
    } catch (e) {
      _clearBusyState();
      showAboutDialog(context: context, applicationName:'$e');

    }
  }

  Future<void> _exchangeCode() async {
    try {
      _setBusyState();
      final TokenResponse? result = await _appAuth.token(TokenRequest(
          _clientId, _redirectUrl,clientSecret: _clientSecret,
          authorizationCode: _authorizationCode,
          discoveryUrl: _discoveryUrl,
          codeVerifier: _codeVerifier,
          nonce: _nonce,
          // scopes: _scopes,//交换令牌不允许scope?
          allowInsecureConnections: true));
      _processTokenResponse(result);
      // await _testApi(result);
      authResult = result;
    } catch (e) {
      _clearBusyState();

      showAboutDialog(context: context, applicationName:'$e');
    }
  }

  Future<void> _signInWithNoCodeExchange() async {
    try {
      _setBusyState();
      /*
        The discovery endpoint (_discoveryUrl) is used to find the
        configuration. The code challenge generation can be checked here
        > https://github.com/MaikuB/flutter_appauth/search?q=challenge.
        The code challenge is generated from the code verifier and only the
        code verifier is included in the result. This because to get the token
        in the method _exchangeCode (see above) we need only the code verifier
        and the authorization code.
        Code challenge is not used according to the spec
        https://www.rfc-editor.org/rfc/rfc7636 page 9 section 4.5.
      */
      final AuthorizationResponse? result = await _appAuth.authorize(
        AuthorizationRequest(_clientId, _redirectUrl,
            discoveryUrl: _discoveryUrl, scopes: _scopes,/* loginHint: 'bob'*/
        ),
      );

      /*
        or just use the issuer
        var result = await _appAuth.authorize(
          AuthorizationRequest(
            _clientId,
            _redirectUrl,
            issuer: _issuer,
            scopes: _scopes,
          ),
        );
      */

      if (result != null) {
        _processAuthResponse(result);
      }
    } catch (_) {
      _clearBusyState();
    }
  }

  Future<void> _signInWithNoCodeExchangeAndGeneratedNonce() async {
    try {
      _setBusyState();
      final Random random = Random.secure();
      final String nonce =
      base64Url.encode(List<int>.generate(16, (_) => random.nextInt(256)));
      // use the discovery endpoint to find the configuration
      final AuthorizationResponse? result = await _appAuth.authorize(
        AuthorizationRequest(_clientId, _redirectUrl,
            discoveryUrl: _discoveryUrl,
            scopes: _scopes,
            loginHint: 'bob',
            nonce: nonce),
      );

      if (result != null) {
        _processAuthResponse(result);
      }
    } catch (_) {
      _clearBusyState();
    }
  }

  Future<void> _signInWithAutoCodeExchange(
      {bool preferEphemeralSession = false}) async {
    try {
      _setBusyState();

      /*
        This shows that we can also explicitly specify the endpoints rather than
        getting from the details from the discovery document.
      */
      final AuthorizationTokenResponse? result =
      await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          _clientId,
          _redirectUrl,
          clientSecret: _clientSecret,
          serviceConfiguration: _serviceConfiguration,
          scopes: _scopes,
          preferEphemeralSession: preferEphemeralSession,
        ),
      );

      /*
        This code block demonstrates passing in values for the prompt
        parameter. In this case it prompts the user login even if they have
        already signed in. the list of supported values depends on the
        identity provider

        ```dart
        final AuthorizationTokenResponse result = await _appAuth
        .authorizeAndExchangeCode(
          AuthorizationTokenRequest(_clientId, _redirectUrl,
              serviceConfiguration: _serviceConfiguration,
              scopes: _scopes,
              promptValues: ['login']),
        );
        ```
      */
    print('授权结果');
    print(result);
      if (result != null) {
        _processAuthTokenResponse(result);
        authResult = result;
        print("auth结果");
        print(result);
        // await _testApi(result);
      }
    } catch (e) {
      _clearBusyState();
      showAboutDialog(context: context, applicationName:'$e');
      // 'Error: $e'; // Handle the exception first.
     // ToastCom.show('交换失败：Error: $e',context);
    }
  }

  void _clearBusyState() {
    setState(() {
      _isBusy = false;
    });
  }

  void _setBusyState() {
    setState(() {
      _isBusy = true;
    });
  }

  void _processAuthTokenResponse(AuthorizationTokenResponse response) {
    setState(() {
      _accessToken = _accessTokenTextController.text = response.accessToken!;
      _idToken = _idTokenTextController.text = response.idToken!;
      _refreshToken = _refreshTokenTextController.text = response.refreshToken!;
      _accessTokenExpirationTextController.text =
          response.accessTokenExpirationDateTime!.toIso8601String();
    });
  }

  void _processAuthResponse(AuthorizationResponse response) {
    setState(() {
      /*
        Save the code verifier and nonce as it must be used when exchanging the
        token.
      */
      _codeVerifier = response.codeVerifier;
      _nonce = response.nonce;
      _authorizationCode =
          _authorizationCodeTextController.text = response.authorizationCode!;
      _isBusy = false;
    });
  }

  void _processTokenResponse(TokenResponse? response) {
    setState(() {
      _accessToken = _accessTokenTextController.text = response!.accessToken!;
      _idToken = _idTokenTextController.text = response.idToken!;
      _refreshToken = _refreshTokenTextController.text = response.refreshToken!;
      _accessTokenExpirationTextController.text =
          response.accessTokenExpirationDateTime!.toIso8601String();
    });
  }

  Future<void> _testApi() async {
    // TokenResponse? response = authResult;
    final http.Response httpResponse = await http.get(
        Uri.parse('https://oidc-dev.shashago.com/api/message'),
        headers: <String, String>{'Authorization': 'Bearer $_accessToken'});
    setState(() {
      _userInfo = httpResponse.statusCode == 200 ? httpResponse.body : '';
      _isBusy = false;
    });
  }
}
