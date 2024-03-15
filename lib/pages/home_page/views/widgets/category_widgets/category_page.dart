part of '../../home_page.dart';

class CategoryWidget extends StatelessWidget {
  final String subCategoryName;
  final List<SubCategoryEntity> data;

  const CategoryWidget({
    super.key,
    required this.subCategoryName,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subCategoryName.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            subCategoryName.isEmpty
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      subCategoryName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColorConstants.kPrimaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
            const SizedBox(height: 8.0),
            AspectRatio(
              aspectRatio: 16 / 11,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.sizeOf(context).width * 0.46,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: const CategoryCardWidget(),
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        );
      },
    );
  }
}
