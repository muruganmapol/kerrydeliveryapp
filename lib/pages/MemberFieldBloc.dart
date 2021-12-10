import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class MemberFieldBloc extends GroupFieldBloc {
  final TextFieldBloc firstName;
  final TextFieldBloc lastName;
  final ListFieldBloc<TextFieldBloc, dynamic> hobbies;

  MemberFieldBloc({
    required this.firstName,
    required this.lastName,
    required this.hobbies,
    String? name,
  }) : super(name: name, fieldBlocs: [firstName, lastName, hobbies]);
}
