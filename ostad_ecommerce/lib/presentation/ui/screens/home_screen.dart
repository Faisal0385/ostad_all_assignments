import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/presentation/ui/widgets/category_card.dart';
import '/presentation/ui/widgets/home/home_slider.dart';
import '/presentation/ui/widgets/home/section_header.dart';
import '/presentation/ui/utility/image_assets_path.dart';
import '/presentation/ui/widgets/home/circular_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
              ImageAssetsPath.craftyBayNavLogoSVG,
            ),
            const Spacer(),
            CircularIconButton(
              icon: Icons.person,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.call,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.notifications_none,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search...',
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const HomeSlider(),
              SectionHeader(title: "Categories", onTap: () {}),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const CategoryCard();
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(title: "Popular", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
