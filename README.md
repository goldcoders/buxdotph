 # Bux.ph Dark SDK


## Checkout API
- Allows you to checkout

All the parameters that can be used on Checkout Api in JSON
```json
{
"req_id": "TEST123d",
"client_id": "0000001", // Set this up in your .env
"amount": "50",
"description": "test",
"expiry": 2,
"email": "test@example.ph",
"contact": "9161234567",
"name": "Juan Dela Cruz",
"notification_url": "https://example.ph/bux_notif/",
"redirect_url": "https://example.ph/sample_redirect/",
"param1": "referral link",
"param2": "delivery address"
}
```

## Usage

1. Set up .env

for production use `https://api.bux.ph/v1/api` as your BUX_BASE_URL

```toml
BUX_API_KEY=api_key
BUX_BASE_URL=https://api.bux.ph/v1/api/sandbox
BUX_CLIENT_ID=0000000001
BUX_API_SECRET=secret
```

Initialize dotenv on your main function

```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(MyApp());
}
```

Add to Your pubspec.yaml

```yaml
flutter:
  assets:
    - .env
```


2. Create CheckoutPayload

```dart
import 'package:buxdotph/models/api/checkout_payload.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
...


final CheckoutPayload payload = CheckoutPayload(
    amount: 1000,
    req_id: 'uuid_from_backend',
    client_id: dotenv.env['BUX_CLIENT_ID']!,
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

- Pass the Payload to Bux.checkout()

```dart
import 'package:buxdotph/buxdotph.dart';

...
await Bux.checkout(payload);
```

the returned response is a `String?` type , you can `json_encode` it if there is no errors
