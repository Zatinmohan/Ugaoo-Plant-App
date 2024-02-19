part of '../cart_page.dart';

class CartProductCardWidget extends StatelessWidget {
  const CartProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double _size = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: AspectRatio(
            aspectRatio: 16 / 7.5,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: _size * 0.3,
                    height: _size * 0.6,
                  ),
                  const SizedBox(width: 16.0),
                  const Expanded(
                    flex: 2,
                    child: _CardDescription(
                      title: "Broken Heart Jade",
                      price: "400",
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: _CustomCartButtonWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10.0,
          child: Image.asset(
            Assets.misc.demoPlant.path,
            width: _size * 0.4,
            height: _size * 0.6,
          ),
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).width * 0.1,
          left: 0.0,
          right: 0.0,
          child: GestureDetector(
            onTap: () {},
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: MediaQuery.sizeOf(context).width * 0.045,
                backgroundColor: ColorConstants.kBackgroundColor,
                child: const Icon(Icons.delete),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomCartButtonWidget extends StatelessWidget {
  const _CustomCartButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 8.0),
        Text(
          "1",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: MediaQuery.sizeOf(context).width * 0.07,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 4.0),
        GestureDetector(
          onTap: () {},
          child: const Icon(Icons.minimize),
        ),
      ],
    );
  }
}

class _CardDescription extends StatelessWidget {
  final String title;
  final String price;
  const _CardDescription({
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: MediaQuery.sizeOf(context).width * 0.07,
                  fontWeight: FontWeight.w600,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 8.0),
        Flexible(
          flex: 1,
          child: Text(
            "Rs. $price",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorConstants.kPrimaryAccentColor,
                  fontSize: MediaQuery.sizeOf(context).width * 0.06,
                ),
          ),
        ),
      ],
    );
  }
}
