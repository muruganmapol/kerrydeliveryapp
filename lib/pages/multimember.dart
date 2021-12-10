import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'MemberFieldBloc.dart';

class ListFieldFormBloc extends FormBloc<String, String> {
  final clubName = TextFieldBloc(name: 'clubName');

  final members = ListFieldBloc<MemberFieldBloc, dynamic>(name: 'members');

  ListFieldFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        clubName,
        members,
      ],
    );
  }

  void addMember() {
    members.addFieldBloc(MemberFieldBloc(
      name: 'member',
      firstName: TextFieldBloc(name: 'firstName'),
      lastName: TextFieldBloc(name: 'lastName'),
      hobbies: ListFieldBloc(name: 'hobbies'),
    ));
  }

  void removeMember(int index) {
    members.removeFieldBlocAt(index);
  }

  void addHobbyToMember(int memberIndex) {
    members.value[memberIndex].hobbies.addFieldBloc(TextFieldBloc());
  }

  void removeHobbyFromMember(
      {required int memberIndex, required int hobbyIndex}) {
    members.value[memberIndex].hobbies.removeFieldBlocAt(hobbyIndex);
  }

  @override
  void onSubmitting() async {
    // Without serialization
    final clubV1 = Club(
      clubName: clubName.value,
      members: members.value.map<Member>((memberField) {
        return Member(
          firstName: memberField.firstName.value,
          lastName: memberField.lastName.value,
          hobbies: memberField.hobbies.value
              .map((hobbyField) => hobbyField.value)
              .toList(),
        );
      }).toList(),
    );

    print('clubV1');
    print(clubV1);

    // With Serialization
    final clubV2 = Club.fromJson(state.toJson());

    ('clubV2');
    print(clubV2);

    emitSuccess(
      canSubmitAgain: true,
      successResponse: JsonEncoder.withIndent('    ').convert(
        state.toJson(),
      ),
    );
  }
}

class Club {
  String? clubName;
  List<Member>? members;

  Club({this.clubName, this.members});

  Club.fromJson(Map<String, dynamic> json) {
    clubName = json['clubName'];
    if (json['members'] != null) {
      members = <Member>[];
      json['members'].forEach((v) {
        members!.add(Member.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['clubName'] = this.clubName;
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() => '''Club {
  clubName: $clubName,
  members: $members
}''';
}

class Member {
  String? firstName;
  String? lastName;
  List<String?>? hobbies;

  Member({this.firstName, this.lastName, this.hobbies});

  Member.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    hobbies = json['hobbies'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['hobbies'] = this.hobbies;
    return data;
  }

  @override
  String toString() => '''Member {
  firstName: $firstName,
  lastName: $lastName,
  hobbies: $hobbies
}''';
}
