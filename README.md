 # Bux.ph Dark SDK

## Secure Bux Credentials Implementation (Optional)

1. Add [envify] to pubspec.yaml

```
dependencies:
  envify: any

dev_dependencies:
  envify_generator: any
  build_runner: any
```

2. Set up .env

// .env
```toml
BUX_API_KEY=api_key
BUX_SANDBOX=true
BUX_CLIENT_ID=0000000001
BUX_API_SECRET=secret
```

3. create `lib/env/env.dart` on your project

//env.dart
```
import 'package:envify/envify.dart';

part 'env.g.dart';

@Envify()
abstract class Env {
  static const bool buxSandbox = _Env.buxSandbox;
  static const String buxApiKey = _Env.buxApiKey;
  static const String buxClientId = _Env.buxClientId;
  static const String buxApiSecret = _Env.buxApiSecret;
}
```

4. Run Build Runner

```sh
# dart
pub run build_runner build
# flutter
flutter pub run build_runner build
```

Note: Make sure to re-run this if you change any in your .env file

5. add to .gitigniore this entry `env.g.dart` and `.env`


## Usage
1. Add to Your pubspec.yaml

```
dependencies:
  buxdotph: ^0.1.1
```

2. Initialize Bux

```dart
// generated env.dart
import 'env/env.dart';
import 'package:buxdotph/buxdotph.dart';

final Bux bux = const Bux(
    apiKey: Env.buxApiKey,
    apiSecret: Env.buxApiSecret,
    clientId: Env.buxClientId,
    sandbox: Env.buxSandbox,
);
```

3. Create CheckoutPayload

// with all paramaters filled up
```dart
import 'package:buxdotph/buxdotph';
import 'package:example/env/env.dart';
...


final CheckoutPayload payload = CheckoutPayload(
    amount: 1000,
    req_id: 'uuid_from_backend',
    client_id: ${Env.buxClientId},
    description: 'subscription',
    notification_url: 'https://google.com',
    expiry: 2,
    email: 'dummy@gmail.com',
    contact: '09155555555',
    name: 'John Dela Cruz',
    redirect_url: 'https://goldcoders.dev',
    param1: 'username',
    param2: 'address',
  );
```

// with minimum required parameters filled up

```dart
CheckoutPayload payload = CheckoutPayload(
  amount: 1000,
  req_id: 'bux001',
  client_id: clientId,
  description: 'test',
  notification_url: 'https://goldcoders.dev/notify',
);
```

4. Pass the Payload to bux checkout

```dart
import 'package:buxdotph/buxdotph.dart';

...
await bux.checkout(payload);
```
