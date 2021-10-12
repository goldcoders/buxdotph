import 'package:buxdotph/const/env.dart';
import 'package:buxdotph/models/http/headers.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Map<String, String> buxEnv = <String, String>{
  BUX_API_KEY: dotenv.get('BUX_API_KEY', fallback: ''),
  BUX_BASE_URL: dotenv.get('BUX_BASE_URL', fallback: ''),
  BUX_CLIENT_ID: dotenv.get('BUX_CLIENT_ID', fallback: ''),
  BUX_NOTIFY_URL: dotenv.get('BUX_NOTIFY_URL', fallback: ''),
  BUX_REDIRECT_URL: dotenv.get('BUX_REDIRECT_URL', fallback: ''),
  BUX_SITE_DOMAIN: dotenv.get('BUX_SITE_DOMAIN', fallback: ''),
};

Map<String, dynamic> endpoints = <String, dynamic>{
  BUX_CHECKOUT_API: <String, dynamic>{
    'headers': Headers.setDefault(),
    'method': 'POST',
    'body': BUX_CHECKOUT_PAYLOAD_CLASS,
    // move all links to the class itself
    'sandbox': Uri.parse('https://api.bux.ph/v1/api/sandbox/open/checkout/'),
    'production': Uri.parse('https://api.bux.ph/v1/api/open/checkout/'),
  },
  BUX_GENERATE_CODE_API: <String, dynamic>{
    'headers': Headers.setDefault(),
    'method': 'POST',
    'body': BUX_DIRECT_PAYLOAD_CLASS,
    'sandbox': Uri.parse('https://api.bux.ph/v1/api/sandbox/generate_code/'),
    'production': Uri.parse('https://api.bux.ph/v1/api/generate_code/'),
  },
  BUX_CHECK_CODE_API: <String, dynamic>{
    'headers': Headers.setDefault(acceptJson: false),
    'method': 'GET',
    'query': CHECK_CODE_QUERY_CLASS,
    'sandbox': Uri.parse('https://api.bux.ph/v1/api/sandbox/check_code/'),
    'production': Uri.parse('https://api.bux.ph/v1/api/check_code/'),
  },
  BUX_CANCEL_TRANSACTION_API: <String, dynamic>{
    'headers': Headers.setDefault(),
    'method': 'POST',
    'body': CANCEL_PAYLOAD_CLASS,
    'sandbox':
        Uri.parse('https://api.bux.ph/v1/api/sandbox/cancel_transaction/'),
    'production': Uri.parse('https://api.bux.ph/v1/api/cancel_transaction/'),
  },
};
