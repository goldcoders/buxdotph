import 'package:buxdotph/const/channels.dart';

class Channels {
  final String? value;
  const Channels._(this.value);
  // NON BANK OTC

  static const Channels bayad_center_dragonpay = Channels._(BAYD);
  static const Channels cebuana_dragonpay = Channels._(CEBL);
  static const Channels lbc_dragonpay = Channels._(LBC);
  static const Channels mlhuillier_dragonpay = Channels._(MLH);
  static const Channels sm_supermarket_savemore_dragonpay = Channels._(SMR);
  static const Channels robinsons_dept_store_dragonpay = Channels._(RDS);
  static const Channels ecpay_dragonpay = Channels._(ECPY);
  static const Channels palawan_dragonpay = Channels._(PLWN);
  static const Channels rd_pawnshop_dragonpay = Channels._(RDP);
  static const Channels ruralnet_dragonpay = Channels._(RLNT);
  static const Channels expressway_dragonpay = Channels._(EXPY);

  static const List<Channels> otc_dragonpay = <Channels>[
    bayad_center_dragonpay,
    cebuana_dragonpay,
    lbc_dragonpay,
    mlhuillier_dragonpay,
    sm_supermarket_savemore_dragonpay,
    robinsons_dept_store_dragonpay,
    ecpay_dragonpay,
    palawan_dragonpay,
    rd_pawnshop_dragonpay,
    ruralnet_dragonpay,
    expressway_dragonpay,
  ];

  static const Channels seven11_direct = Channels._(SEVEN11);
  static const Channels posible_direct = Channels._(POSIBLE);
  static const Channels partnerpay_direct = Channels._(PARTNERPAY);
  static const Channels pay_n_go_direct = Channels._(PAYNGO);
  static const Channels da5_direct = Channels._(DA5);
  static const Channels ecpay_direct = Channels._(ECPAY);
  static const Channels i2i_direct = Channels._(I2I);

  static const List<Channels> otc_direct_payments = <Channels>[
    seven11_direct,
    posible_direct,
    partnerpay_direct,
    da5_direct,
    ecpay_direct,
    i2i_direct,
  ];
  // Start OTC
  static const Channels ussc_ecpay = Channels._(USSC);
  static const Channels rd_pawnshop_ecpay = Channels._(RDP_EC);
  static const Channels ruralnet_ecpay = Channels._(RLNT_EC);
  static const Channels rustans_ecpay = Channels._(RUSTAN);
  static const Channels shopwise_ecpay = Channels._(SHOPWISE);
  static const Channels tambunting_ecpay = Channels._(TAMBUNTING);
  static const Channels cvm_ecpay = Channels._(CVM);
  static const Channels wellcome_ecpay = Channels._(WELLCOME);

  static const List<Channels> otc_ecpay = <Channels>[
    ussc_ecpay,
    rd_pawnshop_ecpay,
    ruralnet_ecpay,
    rustans_ecpay,
    shopwise_ecpay,
    tambunting_ecpay,
    cvm_ecpay,
    wellcome_ecpay,
  ];
  // Bayad Center
  static const Channels bayad_center_bayad_center = Channels._(BAYD2);
  static const Channels ruralnet_bayad_center = Channels._(RLNT_BC);
  static const Channels ussc_bayad_center = Channels._(RLNT_BC);
  static const Channels petnet_bayad_center = Channels._(PETNET);
  static const Channels villarica_bayad_center = Channels._(VILLARICA_BC);

  static const List<Channels> otc_bayad_center = <Channels>[
    bayad_center_bayad_center,
    ruralnet_bayad_center,
    ussc_bayad_center,
    petnet_bayad_center,
    villarica_bayad_center,
  ];

  static const List<Channels> otc = <Channels>[
    ...otc_direct_payments,
    ...otc_dragonpay,
    ...otc_ecpay,
    ...otc_bayad_center,
  ];

  static List<String?> otc_list =
      Channels.otc.map((Channels e) => e.value).toList();
  // END OTC

  // BANK
  static const Channels bpi_dragonpay = Channels._(BPI);
  static const Channels unionbank_dragonpay = Channels._(UNIONBANK);
  static const Channels rcbc_dragonpay = Channels._(RCBC);

  static const List<Channels> banks = <Channels>[
    bpi_dragonpay,
    unionbank_dragonpay,
    rcbc_dragonpay,
  ];

  static List<String?> bank_list =
      Channels.banks.map((Channels e) => e.value).toList();

  // EWALLET
  static const Channels gcash_direct = Channels._(GCASH);
  static const Channels grabpay_direct = Channels._(GRABPAY);

  static const List<Channels> ewallets = <Channels>[
    gcash_direct,
    grabpay_direct,
  ];

  static List<String?> ewallet_list =
      Channels.ewallets.map((Channels e) => e.value).toList();
  // Card payments
  static const Channels cardpayment_xendit = Channels._(CARD);

  static const List<Channels> cards = <Channels>[
    cardpayment_xendit,
  ];

  static List<String?> card_list =
      Channels.cards.map((Channels e) => e.value).toList();
  // Buy Now Pay Later
  static const Channels billease_direct = Channels._(BNPL);

  static const List<Channels> buy_now_pay_later = <Channels>[
    billease_direct,
  ];

  static List<String?> buy_now_pay_later_list =
      Channels.buy_now_pay_later.map((Channels e) => e.value).toList();
  // List All Mode of Payments
  static const List<Channels> all = <Channels>[
    ...otc,
    ...banks,
    ...ewallets,
    ...cards,
    ...buy_now_pay_later,
  ];

  static List<String?> list_all =
      Channels.all.map((Channels e) => e.value).toList();

  static Channels parse(String value) {
    switch (value) {
      case SEVEN11:
        return Channels.seven11_direct;
      case BAYD:
        return Channels.bayad_center_dragonpay;
      case CEBL:
        return Channels.cebuana_dragonpay;
      case LBC:
        return Channels.lbc_dragonpay;
      case MLH:
        return Channels.mlhuillier_dragonpay;
      case SMR:
        return Channels.sm_supermarket_savemore_dragonpay;
      case RDS:
        return Channels.robinsons_dept_store_dragonpay;
      case ECPY:
        return Channels.ecpay_dragonpay;
      case PLWN:
        return Channels.palawan_dragonpay;
      case RDP:
        return Channels.rd_pawnshop_dragonpay;
      case RLNT:
        return Channels.ruralnet_dragonpay;
      case POSIBLE:
        return Channels.posible_direct;
      case PARTNERPAY:
        return Channels.partnerpay_direct;
      case PAYNGO:
        return Channels.pay_n_go_direct;
      case DA5:
        return Channels.da5_direct;
      case ECPAY:
        return Channels.ecpay_direct;
      case USSC:
        return Channels.ussc_ecpay;
      case RUSTAN:
        return Channels.rustans_ecpay;
      case SHOPWISE:
        return Channels.shopwise_ecpay;
      case TAMBUNTING:
        return Channels.tambunting_ecpay;
      case CVM:
        return Channels.cvm_ecpay;
      case WELLCOME:
        return Channels.wellcome_ecpay;
      case EXPY:
        return Channels.expressway_dragonpay;
      case BAYD2:
        return Channels.bayad_center_bayad_center;
      case RLNT_BC:
        return Channels.ruralnet_bayad_center;
      case USSC_BC:
        return Channels.ussc_bayad_center;
      case PETNET:
        return Channels.petnet_bayad_center;
      case VILLARICA_BC:
        return Channels.villarica_bayad_center;
      case RDP_EC:
        return Channels.rd_pawnshop_ecpay;
      case RLNT_EC:
        return Channels.ruralnet_ecpay;
      case I2I:
        return Channels.i2i_direct;
      case BPI:
        return Channels.bpi_dragonpay;
      case UNIONBANK:
        return Channels.unionbank_dragonpay;
      case GCASH:
        return Channels.gcash_direct;
      case RCBC:
        return Channels.rcbc_dragonpay;
      case GRABPAY:
        return Channels.grabpay_direct;
      case BNPL:
        return Channels.billease_direct;

      default:
        return Channels.cardpayment_xendit;
    }
  }

  @override
  String toString() {
    return 'Channels.$value';
  }
}
