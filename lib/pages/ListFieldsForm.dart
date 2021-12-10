import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:fml/pages/multimember.dart';
import 'package:flutter/material.dart';

import 'LoadingDialog.dart';
import 'MemberCard.dart';
import 'MemberFieldBloc.dart';

class ListFieldsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListFieldFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = context.read<ListFieldFormBloc>();

          return Theme(
            data: Theme.of(context).copyWith(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              // appBar: AppBar(title: Text('List and Group Fields')),
              // floatingActionButton: FloatingActionButton(
              //   onPressed: formBloc.submit,
              //   child: Icon(Icons.send),
              // ),
              body: FormBlocListener<ListFieldFormBloc, String, String>(
                onSubmitting: (context, state) {
                  LoadingDialog.show(context);
                },
                onSuccess: (context, state) {
                  LoadingDialog.hide(context);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: SingleChildScrollView(
                        child: Text(state.successResponse!)),
                    duration: Duration(milliseconds: 1500),
                  ));
                },
                onFailure: (context, state) {
                  LoadingDialog.hide(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.failureResponse!)));
                },
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFieldBlocBuilder(
                          textFieldBloc: formBloc.clubName,
                          decoration: InputDecoration(
                            labelText: 'GCN Number',
                            prefixIcon: Icon(Icons.format_list_numbered_sharp),
                          ),
                        ),
                      ),
                      BlocBuilder<ListFieldBloc<MemberFieldBloc, dynamic>,
                          ListFieldBlocState<MemberFieldBloc, dynamic>>(
                        bloc: formBloc.members,
                        builder: (context, state) {
                          if (state.fieldBlocs.isNotEmpty) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.fieldBlocs.length,
                              itemBuilder: (context, i) {
                                return MemberCard(
                                  memberIndex: i,
                                  memberField: state.fieldBlocs[i],
                                  onRemoveMember: () =>
                                      formBloc.removeMember(i),
                                  onAddHobby: () =>
                                      formBloc.addHobbyToMember(i),
                                );
                              },
                            );
                          }
                          return Container();
                        },
                      ),
                      ElevatedButton(
                          onPressed: formBloc.addMember,
                          child: Text('ADD MEMBER'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue[900])),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
