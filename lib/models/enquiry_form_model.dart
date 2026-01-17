class EnquiryFormDataModel {
  String businessName = '';
  String contactPerson = '';
  String phone = '';
  String email = '';
  String? businessType;

  String? monthlyQuantity; // dropdown value

  final Set<String> bottleSizes = {}; // multi-select

  String? city;
  String? state;
  String? deliveryLocation;
  String? additionalNotes;

}
