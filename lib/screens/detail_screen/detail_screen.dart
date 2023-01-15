import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app/app_consts.dart';
import '../../components/app_buttons.dart';
import '../../models/DataModel.dart';

class DetailScreen extends StatefulWidget {
  final Data data;

  const DetailScreen({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;

  showConfirmationDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Confirmation',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
              'Are you sure you want to add $quantity ${widget.data.pName} of \$${quantity * widget.data.pCost} to cart?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Hero(
                tag: widget.data.pId,
                child: Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/pictures/${widget.data.pName}.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 15,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.pName,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      '\$${widget.data.pCost}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_outlined),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:   DecorationImage(
                  image: AssetImage('assets/pictures/${widget.data.pName}.jpeg'),
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(color: AppColors.grey, blurRadius: 8),
                ],
              ),
            ),
            title: Row(
              children: [
                const Text(
                  'Flower Store',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 15),
                SvgPicture.asset(
                  'assets/svg/verified.svg',
                  height: 18,
                  width: 18,
                ),
              ],
            ),
            subtitle: const Text('Official Store'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.darkGrey,
              ),
              child: FittedBox(
                child: Row(
                  children: const [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.data.pDetails,
              style: const TextStyle(color: AppColors.grey),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Select Quantity',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.lightGrey,
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 17,
                        ),
                      ),
                    ),
                    Text("  $quantity  "),
                    InkWell(
                      onTap: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.lightGrey,
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 25),
        ],
      ),
      bottomNavigationBar: Builder(builder: (context) {
        return InkWell(
          onTap: () {
            showConfirmationDialog(context);
          },
          child: Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(color: AppColors.lightGrey, blurRadius: 20),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: AppButton.normalButton(title: 'Order Now', height: 40),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
