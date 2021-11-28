import 'package:equatable/equatable.dart';

class CheckoutPayloadEntity extends Equatable {
  final String req_id;
  final String client_id;
  final int amount;
  final String description;
  final int? expiry;
  final String? email;
  final String? contact;
  final String? name;
  final String notification_url;
  final String? redirect_url;
  final String? param1;
  final String? param2;

  const CheckoutPayloadEntity({
    required this.req_id,
    required this.client_id,
    required this.amount,
    required this.description,
    required this.notification_url,
    this.expiry,
    this.email,
    this.contact,
    this.name,
    this.redirect_url,
    this.param1,
    this.param2,
  });
  @override
  List<Object?> get props => <Object?>[
        req_id,
        client_id,
        amount,
        description,
        redirect_url,
        expiry,
        email,
        contact,
        name,
        notification_url,
        param1,
        param2,
      ];
}

/// Bux Cancel API is used to cancel a generated payment link
///
/// [Bux Checkout API](https://developers.bux.ph/#tag/Generate-Checkout-URL)
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
/// Other Params are Optional , but some you might want to add like email, contact, name, redirect_url, param1, param2
class CheckoutPayload extends CheckoutPayloadEntity {
  const CheckoutPayload({
    required String req_id,
    required String client_id,
    required int amount,
    required String description,
    int? expiry,
    String? email,
    String? contact,
    String? name,
    required String notification_url,
    String? redirect_url,
    String? param1,
    String? param2,
  }) : super(
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
          param1: param1,
          param2: param2,
        );

  factory CheckoutPayload.fromJson(Map<String, dynamic> json) {
    return CheckoutPayload(
      req_id: json['req_id'] as String,
      client_id: json['client_id'] as String,
      amount: json['amount'] as int,
      description: json['description'] as String,
      expiry: json['expiry'] as int?,
      email: json['email'] as String?,
      contact: json['contact'] as String?,
      name: json['name'] as String?,
      notification_url: json['notification_url'] as String,
      redirect_url: json['redirect_url'] as String?,
      param1: json['param1'] as String?,
      param2: json['param2'] as String?,
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
      'notification_url': notification_url,
      'redirect_url': redirect_url ?? '',
      'param1': param1 ?? '',
      'param2': param2 ?? '',
    };
  }
}
