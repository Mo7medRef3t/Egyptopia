import 'package:egyptopia/core/utils/app_router.dart';
import 'package:egyptopia/core/utils/size_config.dart';
import 'package:egyptopia/core/widgets/custom_buttons.dart';
import 'package:egyptopia/core/widgets/custom_indicator.dart';
import 'package:egyptopia/core/widgets/space_widget.dart';
import 'package:egyptopia/features/onbording/presentation/views/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBordingBody extends StatefulWidget {
  const OnBordingBody({super.key});

  @override
  State<OnBordingBody> createState() => _OnBordingBodyState();
}

class _OnBordingBodyState extends State<OnBordingBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VerticalSpace(
                  pageController!.hasClients && pageController?.page == 1
                      ? 11
                      : 15),
              Expanded(
                child: CustomPageView(pageController: pageController),
              ),
              CustomIndicator(
                dotIndex:
                    pageController!.hasClients ? (pageController?.page) : 0,
              ),
              const VerticalSpace(2),
              CustomGeneralButton(
                onTap: () {
                  if (pageController!.page! < 2) {
                    pageController!.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOutBack,
                    );
                  } else {
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.kRegistrationView);
                  }
                },
                text: pageController!.hasClients
                    ? (pageController?.page == 2 ? "Start" : "Next")
                    : "Next",
              ),
              Visibility(
                visible: pageController!.hasClients
                    ? (pageController?.page == 1)
                    : false,
                child: Column(
                  children: [
                    const VerticalSpace(1.5),
                    BackGeneralButton(
                      onTap: () {
                        pageController!.previousPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOutBack,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const VerticalSpace(4)
            ],
          ),
        ),
        Positioned(
          top: SizeConfig.defaultSize! * 2.5,
          right: SizeConfig.defaultSize! * 3.5,
          child: Visibility(
            visible:
                pageController!.hasClients ? (pageController?.page != 2) : true,
            child: InkWell(
              onTap: () {
                pageController!.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInCubic,
                );
              },
              child: Text(
                "Skip",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.defaultSize! * 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
