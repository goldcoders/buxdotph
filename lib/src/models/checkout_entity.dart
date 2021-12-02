import 'package:equatable/equatable.dart';

class CheckoutPayloadEntity extends Equatable {
  final String req_id;
  final String client_id;
  final int amount;
  final String description;
  final String notification_url;
  final int? expiry;
  final String? email;
  final String? contact;
  final String? name;
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
        notification_url,
        expiry,
        email,
        contact,
        name,
        redirect_url,
        param1,
        param2,
      ];
}
