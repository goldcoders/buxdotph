import 'package:buxdotph/models/http/headers.dart';
import 'package:buxdotph/models/http/methods.dart';
import 'package:equatable/equatable.dart';

class DirectPayloadEntity extends Equatable {
  final HttpMethod method;
  final Headers headers;
  final String req_id;
  final String client_id;
  final int amount;
  final String description;
  final int? expiry;
  final String? email;
  final String? contact;
  final String? name;
  final String channel;
  final String notification_url;
  final String? redirect_url;
  final String? param1;
  final String? param2;
  final int? cust_shoulder;

  const DirectPayloadEntity(
    this.method,
    this.headers, {
    required this.req_id,
    required this.client_id,
    required this.amount,
    required this.description,
    this.expiry,
    this.email,
    this.contact,
    this.name,
    required this.channel, // directOnly
    required this.notification_url,
    this.redirect_url,
    this.param1,
    this.param2,
    this.cust_shoulder, // directOnly
  });
  @override
  List<Object?> get props => <Object?>[
        req_id,
        client_id,
        amount,
        description,
        expiry,
        email,
        contact,
        name,
        notification_url,
        redirect_url,
        channel,
        param1,
        param2,
        cust_shoulder,
      ];
}

// ignore: lines_longer_than_80_chars
/// Bux Direct API is used when you will generate a payment with a predefined channel already. Either the user already chose the channel on your side or your app already (without redirecting to Bux) has a preferred channel set.
///
/// [Bux Direct Api](https://developers.bux.ph/#tag/Generate-Checkout-URL)
///
// ignore: lines_longer_than_80_chars
/// - [req_id] is the Reference ID from you (Unique ID, will be used for postback), can be your Product ID, Order ID or Transaction ID
///
/// - [amount] Amount to be paid, excluding fees (20 pesos for OTC) , in pesos
// ignore: lines_longer_than_80_chars
/// - [description] Can be the Product Count with name Or List or Product with Count, or Summary or Details of the Item Being Purchased
// ignore: lines_longer_than_80_chars
/// - [notification_url] Endpoint where the status postback will be posted, implement on your backend a logic on creating an order
///
// ignore: lines_longer_than_80_chars
/// - [channel] Channel where payment will be made, Use Channels Class invoke static methods: otc, banking, cards, buy_noyw_pay_later, all
// ignore: lines_longer_than_80_chars
/// Other Params are Optional , but some you might want to add like email, contact, name, redirect_url, param1, param2
class DirectPayload extends DirectPayloadEntity {
  DirectPayload({
    required String req_id,
    required String client_id,
    required int amount,
    required String description,
    int? expiry,
    String? email,
    String? contact,
    String? name,
    required String channel, // Class Channels
    required String notification_url,
    String? redirect_url,
    String? param1,
    String? param2,
    int? cust_shoulder,
  }) : super(
          HttpMethod.POST, // access CheckoutPayload.method
          Headers.setDefault(),
          req_id: req_id,
          client_id: client_id,
          amount: amount,
          description: description,
          expiry: expiry,
          email: email,
          contact: contact,
          name: name,
          notification_url: notification_url,
          redirect_url: redirect_url ?? '',
          channel: channel,
          param1: param1,
          param2: param2,
          cust_shoulder: cust_shoulder ?? 0, // 1 or 0
        );

  factory DirectPayload.fromJson(Map<String, dynamic> json) {
    return DirectPayload(
      req_id: json['req_id'] as String,
      client_id: json['client_id'] as String,
      amount: json['amount'] as int,
      description: json['description'] as String,
      expiry: json['expiry'] as int?,
      email: json['email'] as String?,
      contact: json['contact'] as String?,
      name: json['name'] as String?,
      channel: json['channel'] as String,
      notification_url: json['notification_url'] as String,
      redirect_url: json['redirect_url'] as String?,
      param1: json['param1'] as String?,
      param2: json['param2'] as String?,
      cust_shoulder: json['cust_shoulder'] as int?,
    );
  }

  Map<String, String> toJson() {
    // only push to the Map if the value is not null
    return <String, String>{
      'req_id': req_id,
      'client_id': client_id,
      'amount': amount.toString(),
      'description': description,
      'expiry': expiry.toString(),
      'email': email ?? '',
      'contact': contact ?? '',
      'name': name ?? '',
      'channel': channel,
      'notification_url': notification_url,
      'redirect_url': redirect_url ?? '',
      'param1': param1 ?? '',
      'param2': param2 ?? '',
      'cust_shoulder': cust_shoulder.toString(),
    };
  }
}
