part of '../../home_page.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: AspectRatio(
            aspectRatio: 1,
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _DescriptionWidget(),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 60.0,
          right: 0.0,
          left: 0.0,
          child: Center(
            child: Image.asset(
              Assets.misc.demoPlant.path,
              width: MediaQuery.sizeOf(context).width * 0.62,
              height: MediaQuery.sizeOf(context).width * 0.62,
            ),
          ),
        ),
      ],
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              "Jade Plant Mini",
              maxLines: 2,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.sizeOf(context).width * 0.05,
                    height: 0.0,
                  ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "Rs.400",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.sizeOf(context).width * 0.045,
                        color: ColorConstants.kPrimaryAccentColor,
                      ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_outline,
                  size: MediaQuery.sizeOf(context).width * 0.05,
                  weight: 1.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
