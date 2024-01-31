part of '../home_page.dart';

class HomePageSerchWidget extends StatelessWidget {
  const HomePageSerchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        minimumSize: Size(
          MediaQuery.sizeOf(context).width,
          MediaQuery.sizeOf(context).width * 0.16,
        ),
        maximumSize: Size(
          MediaQuery.sizeOf(context).width,
          MediaQuery.sizeOf(context).width * 0.16,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: MediaQuery.sizeOf(context).width * 0.055,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Serach",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[400],
                      fontSize: MediaQuery.sizeOf(context).width * 0.04,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
