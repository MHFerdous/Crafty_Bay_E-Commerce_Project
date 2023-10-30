import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../state_holders/profile_controller.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _fullNameTEController = TextEditingController();
  final TextEditingController _phoneNumberTEController =
      TextEditingController();
  final TextEditingController _countryTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _faxTEController = TextEditingController();
  final TextEditingController _postCodeTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProfileController>().readProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<ProfileController>(
            builder: (updateProfileController) {
              _fullNameTEController.text =
                  updateProfileController.readProfileData.cusName ?? '';
              _shippingAddressTEController.text =
                  updateProfileController.readProfileData.cusAdd ?? '';
              _cityTEController.text =
                  updateProfileController.readProfileData.cusCity ?? '';
              _postCodeTEController.text =
                  updateProfileController.readProfileData.cusPostcode ?? '';
              _countryTEController.text =
                  updateProfileController.readProfileData.cusCountry ?? '';
              _phoneNumberTEController.text =
                  updateProfileController.readProfileData.cusPhone ?? '';
              _emailTEController.text =
                  updateProfileController.readProfileData.user?.email ?? '';
              _faxTEController.text =
                  updateProfileController.readProfileData.cusFax ?? '';

              return Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Update Profile',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 32),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  TextFormField(
                    controller: _fullNameTEController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Full Name',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                    validator: (String? value) {
                      if ((value?.isEmpty ?? true) || value!.length < 5) {
                        return 'Enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _phoneNumberTEController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Phone Number',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your phone number';
                      }
                      if (value!.length < 11 || value.length > 11) {
                        return 'Enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                    width: 50,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 180,
                        child: TextFormField(
                          controller: _countryTEController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Country',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                          ),
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return 'Enter your country name';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _cityTEController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'City',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                          ),
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return 'Enter your city';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 210,
                        child: TextFormField(
                          controller: _faxTEController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Fax',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                          ),
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return 'Enter your fax number';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _postCodeTEController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'PostCode',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                          ),
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return 'Enter your postCode';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    maxLines: 4,
                    controller: _shippingAddressTEController,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: 'Shipping Address',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your shipping address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<ProfileController>(
                      builder: (createProfileController) {
                        if (createProfileController.profileInProgress) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
                          onPressed: () async {
                            final result =
                                await createProfileController.createProfile(
                              _fullNameTEController.text.trim(),
                              _shippingAddressTEController.text.trim(),
                              _cityTEController.text.trim(),
                              _cityTEController.text.trim(),
                              _postCodeTEController.text.trim(),
                              _countryTEController.text.trim(),
                              _phoneNumberTEController.text.trim(),
                              _faxTEController.text.trim(),
                            );
                            if (result) {
                              Get.snackbar(
                                  'Successful!', 'Profile has been created');

                              Get.offAll(
                                () => const MainBottomNavScreen(),
                              );
                            } else {
                              Get.snackbar(
                                  'Failed!', "Profile couldn't be created",
                                  colorText: Colors.red);
                            }
                          },
                          child: const Text(
                            'Update Profile',
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
