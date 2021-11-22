// @dart=2.9

class Job {
  final String wo_no;
  final String workorderno;

  Job({this.wo_no, this.workorderno});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      wo_no: json['wo_no'],
      workorderno: json['workorderno'],
    );
  }
}

class Joblist {
  final String wo_no;
  final String term_name_ch;
  final String min;
  final String max;
  final String parameter1;
  final String parameter2;
  final String parameter3;
  final String parameter4;
  final String parameter5;
  final String parameter6;
  final String parameter7;
  final String parameter8;
  final String parameter9;
  final String parameter10;
  final String parameter11;
  final String parameter12;
  final String parameter13;
  final String parameter14;
  final String parameter15;

  Joblist(
      {this.wo_no,
      this.term_name_ch,
      this.min,
      this.max,
      this.parameter1,
      this.parameter2,
      this.parameter3,
      this.parameter4,
      this.parameter5,
      this.parameter6,
      this.parameter7,
      this.parameter8,
      this.parameter9,
      this.parameter10,
      this.parameter11,
      this.parameter12,
      this.parameter13,
      this.parameter14,
      this.parameter15});

  factory Joblist.fromJson(Map<String, dynamic> json) => Joblist(
        wo_no: json['wo_no'],
        term_name_ch: json['term_name_ch'],
        min: json['min'],
        max: json['max'],
        parameter1: json['parameter1'],
        parameter2: json['parameter2'],
        parameter3: json['parameter3'],
        parameter4: json['parameter4'],
        parameter5: json['parameter5'],
        parameter6: json['parameter6'],
        parameter7: json['parameter7'],
        parameter8: json['parameter8'],
        parameter9: json['parameter9'],
        parameter10: json['parameter10'],
        parameter11: json['parameter11'],
        parameter12: json['parameter12'],
        parameter13: json['parameter13'],
        parameter14: json['parameter14'],
        parameter15: json['parameter15'],
      );
  Map<String, dynamic> toJson() => {
        "wo_no": wo_no,
        "term_name_ch": term_name_ch,
        "min": min,
        "max": max,
        "parameter1": parameter1,
        "parameter2": parameter2,
        "parameter3": parameter3,
        "parameter4": parameter4,
        "parameter5": parameter5,
        "parameter6": parameter6,
        "parameter7": parameter7,
        "parameter8": parameter8,
        "parameter9": parameter9,
        "parameter10": parameter10,
        "parameter11": parameter11,
        "parameter12": parameter12,
        "parameter13": parameter13,
        "parameter14": parameter14,
        "parameter15": parameter15
      };
}
