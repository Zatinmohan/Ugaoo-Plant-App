class AddressDummy {
  final String? addressType;
  final String? houseno;
  final String? streetName;
  final int? pincode;
  final int? mobile;
  final String? name;
  String? nearby;

  AddressDummy(this.addressType, this.houseno, this.streetName, this.pincode,
      this.name, this.mobile,
      [this.nearby]);
}

List<AddressDummy> dummyAddressList = [
  AddressDummy(
      "Home", "XY-32", "ABC Street", 12345, "Zatin", 0123456789, "Near Jungle"),
  AddressDummy("Others", "A-3", "XYZ Street", 987654, "Adam", 8527419630),
  AddressDummy("Office", "C-69", "LOL Street", 159753, "Sheetal", 9517538524),
  AddressDummy("Others", "55-C", "IDK Street", 12345, "Ravi", 9845321643,
      "Near ABC Bridge"),
];
