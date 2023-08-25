import 'package:go_router/go_router.dart';

import '../pages/providerCart/MyCart.dart';
import '../pages/providerCart/MyCatalog.dart';
import '../pages/providerCart/MyLogin.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const MyLogin(),
      ),
      GoRoute(
        path: '/catalog',
        builder: (context, state) => const MyCatalog(),
        routes: [
          GoRoute(
            path: 'cart',
            builder: (context, state) => const MyCart(),
          ),
        ],
      ),
    ],
  );
}
