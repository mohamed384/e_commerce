
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class HomeScreen extends StatelessWidget {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('products').snapshots();
  late String image;
  late String proId;
  late String name;
  late String price;
  late String oldPrice;
  late String discount;
  late int productCount;
  var cubit;

  @override
  Widget build(BuildContext context) {
    cubit = SocialCubit.get(context);
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var len = snapshot.data!.docs.length;

              return builderBuilder(
                context: context,
                snapshot: snapshot,
                len: len,
              );
            },
          );
        });
  }

  Widget builderBuilder({
    required context,
    required len,
    required snapshot,
  }) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: [
                Image(
                  image: NetworkImage(
                      'https://img.freepik.com/free-vector/special-offer-big-sale-colorful-background_1361-3387.jpg?size=338&ext=jpg'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image(
                  image: NetworkImage(
                      'https://image.freepik.com/free-psd/black-friday-pc-mock-up-with-blue-neon-lights_23-2148330769.jpg'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image(
                  image: NetworkImage(
                      'https://image.freepik.com/free-vector/fast-free-delivery-logo-with-bike-man-courier_1308-46678.jpg'),
                  width: double.infinity,
                  //fit: BoxFit.cover,
                ),
              ],
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                viewportFraction: 1.0,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'hot offers',
                        style: TextStyle(
                          fontSize: titleSize,
                          color: mainColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'see all',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 307.0,

                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildCategoryItem(),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10.0,
                            ),
                        itemCount: 10),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'New Products',
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.7,
                children: List.generate(len, (index) {
                  DocumentSnapshot data = snapshot.data!.docs[index];
                  image = data['image'];
                  name = data['name'];
                  price = data['price'];
                  oldPrice = data['oldPrice'];
                  discount = data['discount'];
                  return buildGridProduct(
                    context: context,
                    data: data,
                    image: image,
                    len: len,
                    price: price,
                    discount: discount,
                    oldPrice: oldPrice,
                    name: name,
                  );
                }),
              ),
            ),
          ],
        ),
      );

  Widget buildCategoryItem() => GestureDetector(
        onTap: () {},
        child: Container(
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey.shade100,),
          child: Column(
            children: [
              Container(
                  height: 200,
                  width: 250,
                child: Image.asset("assets/images/watch.png",),

                  ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  name,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0,),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        price.toString() + " \$",
                        style: TextStyle(
                          color: mainColor,
                          fontSize:16 ,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        oldPrice,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );

  Widget buildGridProduct({
    required context,
    required len,
    required image,
    required name,
    required price,
    required oldPrice,
    required discount,
    required DocumentSnapshot data,
  }) =>
      InkWell(
        onTap: () {
          cubit.takeData(data);
          navigateTo(
            context,
            ProductDetailsScreen(
              data: data.id,
            ),
          );
        },
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Hero(
                    tag: 'homeToDetail-$image',
                    child: Image(
                      image: NetworkImage(
                        image,
                      ),
                      width: double.infinity,
                      height: 200.0,
                      // fit: BoxFit.cover,
                    ),
                  ),
                  if (discount != '')
                    Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        'DISCOUNT',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.0, height: 1.3),
                    ),
                    Row(
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: mainColor,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          oldPrice,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            size: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
