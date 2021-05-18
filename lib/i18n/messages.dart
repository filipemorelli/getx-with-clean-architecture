import 'package:get/get.dart';
import 'package:get_test/i18n/en_US.dart';
import 'package:get_test/i18n/pt_br.dart';

class Messages extends Translations {
  Map<String, Map<String, String>> _messages = <String, Map<String, String>>{};

  Messages() {
    _messages['en_US'] = EnUs.message;
    _messages['pt_BR'] = PtBr.message;
  }

  @override
  Map<String, Map<String, String>> get keys => _messages;
}
