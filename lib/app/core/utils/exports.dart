//--> Third Party Packages
export 'package:get/get.dart'; // State Management Used
export 'package:flutter_svg/flutter_svg.dart'; // For SVG type's of images
export 'package:shimmer/shimmer.dart'; // For Shimmer Effect
export 'package:cached_network_image/cached_network_image.dart'; // For caching images to reduce load
export 'package:google_fonts/google_fonts.dart'; // Google Fonts for better fonts
export 'package:logger/logger.dart'; // Logger

//-->Default Flutter Packages
export 'package:flutter/material.dart'; // Material Package for stl/stf & default widgets
export 'package:flutter/services.dart'; // Service Package

//--> UTILS
export 'package:zero/app/core/utils/extensions.dart'; // Extension's
export 'package:zero/app/core/utils/helpers/dependency_injectors.dart'; // Dependency Injector's
export 'package:zero/app/core/utils/helpers/hex_color_coverter.dart'; // Hex Color Converter
export 'package:zero/app/core/utils/helpers/global_variables.dart'; // Global Variable's
export 'package:zero/app/core/utils/helpers/image_helper.dart'; // Image Helper

//--> App Constanst
export 'package:zero/app/core/constants/app_colors.dart'; // App Color's
export 'package:zero/app/core/constants/image_path.dart'; // Assets Images Path's
export 'package:zero/app/core/constants/app_constants.dart'; // App Constant's

//--> App Theme's
export 'package:zero/app/core/themes/app_theme.dart'; // App Theme's

//--> Routes
export 'package:zero/app/routes/app_pages.dart'; // App Pages

//--> DATA
//--> Enums
export 'package:zero/app/data/enums/services_enums.dart'; // Enum's
//--> Service's
export 'package:zero/app/data/services/rest_services.dart'; // Services

//--> Module's
//--> Splash Screen
export 'package:zero/app/modules/splash_screen/splash_screen_controller.dart'; // Splash Screen Controller
export 'package:zero/app/modules/splash_screen/splash_screen.dart'; // Splash Screen View
export 'package:zero/app/modules/splash_screen/splash_screen_binding.dart'; // Splash Screen Binding's

//--> Main Screen
export 'package:zero/app/modules/main_screen/main_screen.dart'; // Main Screen View
export 'package:zero/app/modules/main_screen/main_screen_binding.dart'; // Main Screen Binding's
export 'package:zero/app/modules/main_screen/main_screen_controller.dart'; // Main Screen Controller

//--> Home Screen
export 'package:zero/app/modules/home_screen/home_screen.dart'; // Home Screen View
export 'package:zero/app/modules/home_screen/home_screen_controller.dart'; // Home Screen Controller

//--> News Screen
export 'package:zero/app/modules/news_screen/news_screen_controller.dart'; // News Screen Controller

//--> TV Screen
export 'package:zero/app/global_widgets/shimmers/tv_screen_shimmer_widget.dart'; // TV Screen Shimmer Effect
export 'package:zero/app/modules/tv_screen/tv_screen_controller.dart'; // TV Screen Controller

// Models
export 'package:zero/app/data/models/movies/movies_list_response_model.dart'; // Movies Response Model
