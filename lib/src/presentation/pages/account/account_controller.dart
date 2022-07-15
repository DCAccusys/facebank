import 'package:get/get.dart';

class AccountController extends GetxController {
  List<MovementItem> movementList = <MovementItem>[
    MovementItem('Cargo por emisión d ...', 'dd/mm/yy - Detail  ',
        '- \$1,000.00', 'exit'),
    MovementItem('Text', 'dd/mm/yy - Detail  ', '- \$1,000.00', 'exit'),
    MovementItem('Text', 'dd/mm/yy - Detail  ', '- \$1,000.00', 'entry'),
    MovementItem('Text', 'dd/mm/yy - Detail  ', '- \$1,000.00', 'exit'),
    MovementItem('Text', 'dd/mm/yy - Detail  ', '- \$1,000.00', 'entry'),
    MovementItem('Cargo por emisión d ...', 'dd/mm/yy - Detail  ',
        '- \$1,000.00', 'exit'),
    MovementItem('Text', 'dd/mm/yy - Detail  ', '- \$1,000.00', 'exit'),
    MovementItem('Text', 'dd/mm/yy - Detail  ', '- \$1,000.00', 'entry'),
    MovementItem('Text', 'dd/mm/yy - Detail  ', '- \$1,000.00', 'exit'),
    MovementItem('Text', 'dd/mm/yy - Detail  ', '- \$1,000.00', 'entry'),
  ];
}

class MovementItem {
  final String text;
  final String dateAndDetail;
  final String amount;
  final String movementType;

  MovementItem(this.text, this.dateAndDetail, this.amount, this.movementType);
}