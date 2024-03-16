import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LayoutBuilder(builder: (context, widget) {
          var width = MediaQuery.of(context).size.width;
          print(width);
          if (width < 672) {
            return SizedBox.shrink();
          }
          return const Row(
            children: [
              Text(
                'APP NAME',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'MY RESPONSIBILITIES',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w100),
              ),
            ],
          );
        }),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LayoutBuilder(builder: (context, widget) {
              var width = MediaQuery.of(context).size.width;
              print(width);
              if (width < 672) {
                return SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Container(
                    width: 300,
                    height: 35,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'SEARCH',
                        fillColor: const Color.fromARGB(255, 176, 217, 250),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1.0),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15.0),
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 14),
                        //textColor: Colors.black,
                      ),
                    )),
              );
            }),
            const SizedBox(
              width: 4,
            ),
            const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              'March 2024',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(
              width: 4,
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.network(
                  'https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?s=612x612&w=0&k=20&c=QjebAlXBgee05B3rcLDAtOaMtmdLjtZ5Yg9IJoiy-VY=',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
