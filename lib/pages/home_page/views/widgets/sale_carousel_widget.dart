part of '../home_page.dart';

class HomePageSalesWidget extends StatefulWidget {
  const HomePageSalesWidget({super.key});

  @override
  State<HomePageSalesWidget> createState() => _HomePageSalesWidgetState();
}

class _HomePageSalesWidgetState extends State<HomePageSalesWidget> {
  late PageController _controller;
  late int currentPage;

  @override
  void initState() {
    _controller = PageController();
    currentPage = 0;

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            itemCount: 4,
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.symmetric(
                horizontal: 6.0,
                vertical: 8.0,
              ),
              width: MediaQuery.sizeOf(context).width * 0.025,
              height: MediaQuery.sizeOf(context).width * 0.025,
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: currentPage == index ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
