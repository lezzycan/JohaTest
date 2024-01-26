class BusinessProfileModel {
  final String group;
  final String? otherGroup;
  final String? newGroup;
  final String condition;
  final String additionalNote;
  final String type;
  final String severity;
  final String addAdd;

  BusinessProfileModel(
      {required this.group,
      required this.otherGroup,
      required this.newGroup,
      required this.condition,
      required this.additionalNote,
      required this.type,
      required this.severity,
      required this.addAdd});


      toJson() {
    return {
      "Group":group,
      "OtherGroup": otherGroup,
      "NewGroup": newGroup,
      "Condition": condition,
      "AdditionalNote": additionalNote,
      "Type": type,
      "Severity": severity,
      "AddAdd": addAdd,
      
    };
  }
}
