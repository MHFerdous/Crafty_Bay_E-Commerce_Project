# Crafty Bay

Hi, I'm Md Mahmud Hossain Ferdous, and I want to share my project, an e-commerce app called 'Crafty Bay'. I used the Flutter framework to build it.




## Video

[Click here](https://drive.google.com/file/d/10Mpccv6FC6KfvUOQru_e27pj2jLvBSfA/view?usp=sharing)

## APK File 

[Click here](https://drive.google.com/file/d/1RimI9G1LqIg-y-Cc91WOmFnGm83mfOfD/view?usp=sharing)

## Flowchart

[Click here](https://drive.google.com/file/d/1wnIfmGZU1lztOpPModpQRblfoTXw3pat/view?usp=sharing)

## Goal 

In today's fast-paced world, we don't always have time to go to physical stores to buy what we need. That's why I created this app, which allows users to browse available products, add items to their cart, and complete the purchase process all in one place. I also integrated a payment gateway, so that users can have a similar experience to other e-commerce apps, even though it's not fully functional yet.
## Features

- Light/dark mode toggle
- Internet connection checking
- Payment gateway
- Checking whether the user has a profile or not
- Cross-platform

## Tools
- Framework: Flutter
- State Management: GetX
- Backend: API
- Architecture: MVC 

## Architecture

```bash
.
├── assets/
│   └── images/
│       ├── logo.svg
│       └── logo_nav.svg
└── lib/
    ├── application/
    │   ├── app.dart
    │   └── state_holder_binders.dart
    ├── data/
    │   ├── models/
    │   │   ├── brand.dart
    │   │   ├── cart_list_model.dart
    │   │   ├── category_data.dart
    │   │   ├── category_model.dart
    │   │   ├── create_profile_model.dart
    │   │   ├── create_review_model.dart
    │   │   ├── create_wish_list_model.dart
    │   │   ├── invoice_create_response_model.dart
    │   │   ├── network_response.dart
    │   │   ├── payment_method.dart
    │   │   ├── product.dart
    │   │   ├── product_details.dart
    │   │   ├── product_details_model.dart
    │   │   ├── product_model.dart
    │   │   ├── read_profile_model.dart
    │   │   ├── review_list_model.dart
    │   │   ├── show_wish_list_model.dart
    │   │   ├── slider_data.dart
    │   │   └── slider_model.dart
    │   ├── services/
    │   │   └── network_caller.dart
    │   └── utility/
    │       └── urls.dart
    ├── presention/
    │   ├── state_holders/
    │   │   ├── add_to_cart_controller.dart
    │   │   ├── auth_controller.dart
    │   │   ├── cart_list_controller.dart
    │   │   ├── category_controller.dart
    │   │   ├── create_invoice_controller.dart
    │   │   ├── create_profile_controller.dart
    │   │   ├── create_review_controller.dart
    │   │   ├── email_verification_controller.dart
    │   │   ├── home_silder_controller.dart
    │   │   ├── main_bottom_nav_controller.dart
    │   │   ├── new_product_controller.dart
    │   │   ├── otp_verification_controller.dart
    │   │   ├── popular_product_controller.dart
    │   │   ├── product_details_controller.dart
    │   │   ├── product_list_controller.dart
    │   │   ├── read_profile_controller.dart
    │   │   ├── review_list_controller.dart
    │   │   ├── special_product_controller.dart
    │   │   └── wish_list_controller.dart
    │   └── ui/
    │       ├── screens/
    │       │   ├── auth/
    │       │   │   ├── complete_profile_screen.dart
    │       │   │   ├── email_verification_screen.dart
    │       │   │   ├── otp_verification_screen.dart
    │       │   │   └── update_profile_screen.dart
    │       │   ├── add_review_screen.dart
    │       │   ├── cart_screen.dart
    │       │   ├── category_list_screen.dart
    │       │   ├── checkout_screen.dart
    │       │   ├── home_screen.dart
    │       │   ├── main_bottom_nav_screen.dart
    │       │   ├── new_product_list_screen.dart
    │       │   ├── popular_product_list_screen.dart
    │       │   ├── product_details_screen.dart
    │       │   ├── product_list_screen.dart
    │       │   ├── review_list_screen.dart
    │       │   ├── special_product_list_screen.dart
    │       │   ├── splash_screen.dart
    │       │   ├── webview_screen.dart
    │       │   └── wish_list_screen.dart
    │       ├── utility/
    │       │   ├── app_colors.dart
    │       │   └── image_assets.dart
    │       └── widgets/
    │           ├── home/
    │           │   ├── home_slider.dart
    │           │   ├── product_image_slider.dart
    │           │   └── section_header.dart
    │           ├── cart_product_card.dart
    │           ├── category_card.dart
    │           ├── circular_icon_button.dart
    │           ├── custom_stepper.dart
    │           ├── product_card.dart
    │           ├── size_picker.dart
    │           └── wish_product_card.dart
    └── main.dart
```

