import 'package:buxdotph/src/models/channels.dart';
import 'package:collection/collection.dart';
import 'package:test/test.dart';

void main() {
  group('Bux OTC Channels Test\n', () {
    test('Fetch Dragonpay OTC payments', () {
      final List<Channels> gateways = <Channels>[
        Channels.bayad_center_dragonpay,
        Channels.cebuana_dragonpay,
        Channels.lbc_dragonpay,
        Channels.mlhuillier_dragonpay,
        Channels.sm_supermarket_savemore_dragonpay,
        Channels.robinsons_dept_store_dragonpay,
        Channels.ecpay_dragonpay,
        Channels.palawan_dragonpay,
        Channels.rd_pawnshop_dragonpay,
        Channels.ruralnet_dragonpay,
        Channels.expressway_dragonpay,
      ];
      expect(Channels.otc_dragonpay, gateways);
    });

    test('Fetch  OTC Direct Payments', () {
      final List<Channels> gateways = <Channels>[
        Channels.seven11_direct,
        Channels.posible_direct,
        Channels.partnerpay_direct,
        Channels.da5_direct,
        Channels.ecpay_direct,
        Channels.i2i_direct,
      ];
      expect(Channels.otc_direct_payments, gateways);
    });

    test('Fetch  OTC ECPAY Payments', () {
      final List<Channels> gateways = <Channels>[
        Channels.ussc_ecpay,
        Channels.rd_pawnshop_ecpay,
        Channels.ruralnet_ecpay,
        Channels.rustans_ecpay,
        Channels.shopwise_ecpay,
        Channels.tambunting_ecpay,
        Channels.cvm_ecpay,
        Channels.wellcome_ecpay,
      ];
      expect(Channels.otc_ecpay, gateways);
    });

    test('Fetch  OTC Bayad Center Payments', () {
      final List<Channels> gateways = <Channels>[
        Channels.bayad_center_bayad_center,
        Channels.ruralnet_bayad_center,
        Channels.ussc_bayad_center,
        Channels.petnet_bayad_center,
        Channels.villarica_bayad_center,
      ];
      expect(Channels.otc_bayad_center, gateways);
    });

    test('Fetch  All OTC Payments', () {
      final List<Channels> gateways = <Channels>[
        Channels.bayad_center_dragonpay,
        Channels.cebuana_dragonpay,
        Channels.lbc_dragonpay,
        Channels.mlhuillier_dragonpay,
        Channels.sm_supermarket_savemore_dragonpay,
        Channels.robinsons_dept_store_dragonpay,
        Channels.ecpay_dragonpay,
        Channels.palawan_dragonpay,
        Channels.rd_pawnshop_dragonpay,
        Channels.ruralnet_dragonpay,
        Channels.expressway_dragonpay,
        Channels.seven11_direct,
        Channels.posible_direct,
        Channels.partnerpay_direct,
        Channels.da5_direct,
        Channels.ecpay_direct,
        Channels.i2i_direct,
        Channels.ussc_ecpay,
        Channels.rd_pawnshop_ecpay,
        Channels.ruralnet_ecpay,
        Channels.rustans_ecpay,
        Channels.shopwise_ecpay,
        Channels.tambunting_ecpay,
        Channels.cvm_ecpay,
        Channels.wellcome_ecpay,
        Channels.bayad_center_bayad_center,
        Channels.ruralnet_bayad_center,
        Channels.ussc_bayad_center,
        Channels.petnet_bayad_center,
        Channels.villarica_bayad_center,
      ];
      expect(unOrdDeepEq(Channels.otc, gateways), true);
    });
  });

  group('Bux Bank Channel Test\n', () {
    test('Fetch Bank Channels', () {
      final List<Channels> gateways = <Channels>[
        Channels.bpi_dragonpay,
        Channels.unionbank_dragonpay,
        Channels.rcbc_dragonpay,
      ];
      expect(Channels.banks, gateways);
    });
  });

  group('Bux Ewallet Channels Test\n', () {
    test('Fetch Ewallet Channels', () {
      final List<Channels> gateways = <Channels>[
        Channels.gcash_direct,
        Channels.grabpay_direct,
      ];
      expect(Channels.ewallets, gateways);
    });
  });

  group('Bux Card Channels Test\n', () {
    test('Fetch Cards Channels', () {
      final List<Channels> gateways = <Channels>[
        Channels.cardpayment_xendit,
      ];
      expect(Channels.cards, gateways);
    });
  });

  group('Bux Buy Now Pay Later Channels Test\n', () {
    test('Fetch Buy Now Pay Later Channels', () {
      final List<Channels> gateways = <Channels>[
        Channels.billease_direct,
      ];
      expect(Channels.buy_now_pay_later, gateways);
    });
  });
}

Function unOrdDeepEq = const DeepCollectionEquality.unordered().equals;
