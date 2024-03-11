import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ugaoo/pages/address_page/address_page_dependency_injection.dart';
import 'package:ugaoo/pages/address_page/constants/all_indian_states.dart';
import 'package:ugaoo/pages/address_page/constants/text_field_styles.dart';
import 'package:ugaoo/pages/address_page/domain/entities/pincode_entities/pincode_result_entity.dart';
import 'package:ugaoo/pages/address_page/states/new_address_page_provider.dart';
import 'package:ugaoo/utils/themes/color_constants.dart';
import 'package:ugaoo/utils/utilities/utilities.dart';

part '../widgets/new_address_widgets/use_my_location_widget.dart';
part '../widgets/new_address_widgets/address_type_widget.dart';

class AddAddressPage extends ConsumerStatefulWidget {
  const AddAddressPage({super.key});

  @override
  ConsumerState<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends ConsumerState<AddAddressPage> {
  late final TextEditingController _nameTextField;
  late final TextEditingController _phoneTextField;
  late final TextEditingController _pincodeTextField;
  late final TextEditingController _houseTextField;
  late final TextEditingController _streetTextField;
  late final TextEditingController _landmarkTextField;
  late final TextEditingController _cityTextField;
  late final GlobalKey<FormState> formKey;
  static const double _spaceBetweenTextFields = 16.0;
  String? _dropDownValue;

  @override
  void initState() {
    _nameTextField = TextEditingController();
    _phoneTextField = TextEditingController();
    _pincodeTextField = TextEditingController();
    _houseTextField = TextEditingController();
    _streetTextField = TextEditingController();
    _landmarkTextField = TextEditingController();
    _cityTextField = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _size = MediaQuery.sizeOf(context).width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add Address"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 12.0,
          left: 12.0,
          right: 12.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 5.0),
                Flexible(
                  // height: _textFieldHeight,
                  child: TextFormField(
                    controller: _nameTextField,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      final numericRegex = RegExp(r'\d');
                      if (value?.isEmpty ?? true) {
                        return "Required Field";
                      } else if (numericRegex.hasMatch(value!)) {
                        return "Enter a valid Name";
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.sizeOf(context).width * 0.04,
                        ),
                    decoration: InputDecoration(
                      filled: false,
                      alignLabelWithHint: true,
                      labelText: "Name*",
                      labelStyle: TextFieldStyles.getlabelTextStyle(context),
                      errorStyle: TextFieldStyles.geterrorTextStyle(context),
                      enabledBorder:
                          TextFieldStyles.enabledTextFieldBorderStyle(),
                      border: TextFieldStyles.selectedTextFieldBorderStyle(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: _spaceBetweenTextFields),
                Flexible(
                  child: TextFormField(
                    controller: _phoneTextField,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Required Field";
                      } else if (!Utilities.validPhoneNumber(
                        phoneNumber: value!,
                      )) {
                        return "Enter a valid phone number";
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.sizeOf(context).width * 0.04,
                        ),
                    decoration: InputDecoration(
                      filled: false,
                      alignLabelWithHint: true,
                      labelText: "Mobile Number*",
                      labelStyle: TextFieldStyles.getlabelTextStyle(context),
                      errorStyle: TextFieldStyles.geterrorTextStyle(context),
                      enabledBorder:
                          TextFieldStyles.enabledTextFieldBorderStyle(),
                      border: TextFieldStyles.selectedTextFieldBorderStyle(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: _spaceBetweenTextFields),
                Flexible(
                  // height: _textFieldHeight,
                  child: TextFormField(
                    controller: _pincodeTextField,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                    ],
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Required Field";
                      } else if (!Utilities.isValidPincode(pincode: value!)) {
                        return "Enter a valid pincode";
                      }
                      return null;
                    },
                    onChanged: (value) async {
                      if (value.isNotEmpty && value.length == 6) {
                        try {
                          final PincodeResultEntity data = await ref
                              .read<NewAddressPageProvider>(
                                AddressPageDependencyInjection
                                    .addNewAddressProvider,
                              )
                              .getStatesByPincode(pincode: value);

                          _cityTextField.text = data.district ?? "";
                          _dropDownValue = data.state;
                        } catch (error) {
                          if (context.mounted) {
                            Utilities.hideKeyboard();
                            Utilities.showSnackBar(
                              context: context,
                              message: error.toString(),
                            );
                          }
                        }
                      }
                    },
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.sizeOf(context).width * 0.04,
                        ),
                    decoration: InputDecoration(
                      filled: false,
                      alignLabelWithHint: true,
                      labelText: "Pincode*",
                      labelStyle: TextFieldStyles.getlabelTextStyle(context),
                      errorStyle: TextFieldStyles.geterrorTextStyle(context),
                      enabledBorder:
                          TextFieldStyles.enabledTextFieldBorderStyle(),
                      border: TextFieldStyles.selectedTextFieldBorderStyle(),
                      suffixIcon: ref
                              .watch<NewAddressPageProvider>(
                                AddressPageDependencyInjection
                                    .addNewAddressProvider,
                              )
                              .isLoading
                          ? const Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(),
                            )
                          : const SizedBox.shrink(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: _spaceBetweenTextFields),
                const Flexible(
                  child: UseMyLocationWidget(),
                ),
                const SizedBox(height: _spaceBetweenTextFields),
                Flexible(
                  child: TextFormField(
                    controller: _houseTextField,
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Required Field";
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.sizeOf(context).width * 0.04,
                        ),
                    decoration: InputDecoration(
                      filled: false,
                      alignLabelWithHint: true,
                      labelText: "Flat, House No, Building, Company*",
                      labelStyle: TextFieldStyles.getlabelTextStyle(context),
                      errorStyle: TextFieldStyles.geterrorTextStyle(context),
                      enabledBorder:
                          TextFieldStyles.enabledTextFieldBorderStyle(),
                      border: TextFieldStyles.selectedTextFieldBorderStyle(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: _spaceBetweenTextFields),
                Flexible(
                  child: TextFormField(
                    controller: _streetTextField,
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Required Field";
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.sizeOf(context).width * 0.04,
                        ),
                    decoration: InputDecoration(
                      filled: false,
                      alignLabelWithHint: true,
                      labelText: "Street Name, Area*",
                      labelStyle: TextFieldStyles.getlabelTextStyle(context),
                      errorStyle: TextFieldStyles.geterrorTextStyle(context),
                      enabledBorder:
                          TextFieldStyles.enabledTextFieldBorderStyle(),
                      border: TextFieldStyles.selectedTextFieldBorderStyle(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: _spaceBetweenTextFields),
                Flexible(
                  child: TextFormField(
                    controller: _landmarkTextField,
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) {
                      return null;
                    },
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.sizeOf(context).width * 0.04,
                        ),
                    decoration: InputDecoration(
                      filled: false,
                      alignLabelWithHint: true,
                      labelText: "Landmark",
                      labelStyle: TextFieldStyles.getlabelTextStyle(context),
                      errorStyle: TextFieldStyles.geterrorTextStyle(context),
                      enabledBorder:
                          TextFieldStyles.enabledTextFieldBorderStyle(),
                      border: TextFieldStyles.selectedTextFieldBorderStyle(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: _spaceBetweenTextFields),
                Flexible(
                  child: TextFormField(
                    controller: _cityTextField,
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Required Field";
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.sizeOf(context).width * 0.04,
                        ),
                    decoration: InputDecoration(
                      filled: false,
                      alignLabelWithHint: true,
                      labelText: "City/District*",
                      labelStyle: TextFieldStyles.getlabelTextStyle(context),
                      errorStyle: TextFieldStyles.geterrorTextStyle(context),
                      enabledBorder:
                          TextFieldStyles.enabledTextFieldBorderStyle(),
                      border: TextFieldStyles.selectedTextFieldBorderStyle(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: _spaceBetweenTextFields),
                Flexible(
                  child: DropdownButtonFormField(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Required Value";
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.sizeOf(context).width * 0.04,
                        ),
                    value: _dropDownValue,
                    decoration: InputDecoration(
                      labelText: "State*",
                      filled: false,
                      labelStyle: TextFieldStyles.getlabelTextStyle(context),
                      enabledBorder:
                          TextFieldStyles.enabledTextFieldBorderStyle(),
                      errorStyle: TextFieldStyles.geterrorTextStyle(context),
                      border: TextFieldStyles.enabledTextFieldBorderStyle(),
                    ),
                    items: LIST_OF_INDIAN_STATES
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem(
                            value: value,
                            child: Text("$value"),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      _dropDownValue = value;
                    },
                  ),
                ),
                const SizedBox(height: _spaceBetweenTextFields + 8),
                const Flexible(child: AdressTypeWidget()),
                const SizedBox(height: _spaceBetweenTextFields),
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) {
                      return null;
                    },
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.sizeOf(context).width * 0.04,
                        ),
                    decoration: InputDecoration(
                      enabled: false,
                      filled: false,
                      alignLabelWithHint: true,
                      labelText: "INDIA",
                      labelStyle: TextFieldStyles.getlabelTextStyle(context),
                      enabledBorder:
                          TextFieldStyles.enabledTextFieldBorderStyle(),
                      border: TextFieldStyles.selectedTextFieldBorderStyle(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: _spaceBetweenTextFields),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false)
                      context.pop();
                  },
                  child: Container(
                    width: _size * 0.6,
                    height: _size * 0.16,
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: Card(
                      elevation: 2.0,
                      child: Center(
                        child: Text(
                          "Save Address",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: _size * 0.05,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
