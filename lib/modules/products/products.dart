import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineauction/modules/about/about.dart';
import 'package:onlineauction/modules/add_product/add.dart';
import 'package:onlineauction/modules/category/category.dart';
import 'package:onlineauction/modules/details/details.dart';
import 'package:onlineauction/modules/instrauctions/instrauctions.dart';
import 'package:onlineauction/modules/login/login.dart';
import 'package:onlineauction/modules/products/cubit/cubit.dart';
import 'package:onlineauction/modules/products/cubit/states.dart';
import 'package:onlineauction/shared/components/components.dart';
import 'package:onlineauction/shared/components/constants.dart';
import 'package:onlineauction/shared/network/local/cache_helper.dart';
import 'package:onlineauction/shared/styles/colors.dart';

class ProductsScreen extends StatelessWidget {
  int type;
  String? name;
  ProductsScreen(this.type, this.name);
  // List<ProductModel> productsItemsphones = [
  //   ProductModel(
  //       "ايفون 13 برو",
  //       "https://shop.orange.eg/content/images/thumbs/0004403_iphone-13-pro_550.jpeg",
  //       '23000',
  //       'مفتوح'),
  //   ProductModel(
  //       "جلاكسي سامسونج",
  //       "https://mobinaas.com/wp-content/uploads/2019/11/%D8%B3%D9%88%D9%82-%D8%A7%D9%84%D9%85%D9%88%D8%A8%D9%8A%D9%84%D8%A7%D8%AA-%D9%84%D8%A3%D8%AD%D8%AF%D8%AB-%D8%A7%D9%84%D9%87%D9%88%D8%A7%D8%AA%D9%81-%D8%A7%D9%84%D8%B9%D8%A7%D9%84%D9%85%D9%8A%D8%A9-Samsung-S10-Plus-296x300.jpg",
  //       '12000',
  //       "انتهي"),
  //   ProductModel(
  //       "ايفون 13 برو",
  //       "https://shop.orange.eg/content/images/thumbs/0004403_iphone-13-pro_550.jpeg",
  //       '23000',
  //       'مفتوح'),
  //   ProductModel(
  //       "جلاكسي سامسونج",
  //       "https://mobinaas.com/wp-content/uploads/2019/11/%D8%B3%D9%88%D9%82-%D8%A7%D9%84%D9%85%D9%88%D8%A8%D9%8A%D9%84%D8%A7%D8%AA-%D9%84%D8%A3%D8%AD%D8%AF%D8%AB-%D8%A7%D9%84%D9%87%D9%88%D8%A7%D8%AA%D9%81-%D8%A7%D9%84%D8%B9%D8%A7%D9%84%D9%85%D9%8A%D8%A9-Samsung-S10-Plus-296x300.jpg",
  //       '12000',
  //       "انتهي"),
  //   ProductModel(
  //       "ايفون 13 برو",
  //       "https://shop.orange.eg/content/images/thumbs/0004403_iphone-13-pro_550.jpeg",
  //       '23000',
  //       'مفتوح'),
  //   ProductModel(
  //       "جلاكسي سامسونج",
  //       "https://mobinaas.com/wp-content/uploads/2019/11/%D8%B3%D9%88%D9%82-%D8%A7%D9%84%D9%85%D9%88%D8%A8%D9%8A%D9%84%D8%A7%D8%AA-%D9%84%D8%A3%D8%AD%D8%AF%D8%AB-%D8%A7%D9%84%D9%87%D9%88%D8%A7%D8%AA%D9%81-%D8%A7%D9%84%D8%B9%D8%A7%D9%84%D9%85%D9%8A%D8%A9-Samsung-S10-Plus-296x300.jpg",
  //       '12000',
  //       "انتهي"),
  //   ProductModel(
  //       "ايفون 13 برو",
  //       "https://shop.orange.eg/content/images/thumbs/0004403_iphone-13-pro_550.jpeg",
  //       '23000',
  //       'مفتوح'),
  //   ProductModel(
  //       "جلاكسي سامسونج",
  //       "https://mobinaas.com/wp-content/uploads/2019/11/%D8%B3%D9%88%D9%82-%D8%A7%D9%84%D9%85%D9%88%D8%A8%D9%8A%D9%84%D8%A7%D8%AA-%D9%84%D8%A3%D8%AD%D8%AF%D8%AB-%D8%A7%D9%84%D9%87%D9%88%D8%A7%D8%AA%D9%81-%D8%A7%D9%84%D8%B9%D8%A7%D9%84%D9%85%D9%8A%D8%A9-Samsung-S10-Plus-296x300.jpg",
  //       '12000',
  //       "انتهي"),
  // ];
  // List<ProductModel> productsItemsWatches = [
  //   ProductModel(
  //       " ساعة كلاسيك  ",
  //       "https://imageengine.victorinox.com/medias/?context=bWFzdGVyfHJvb3R8OTc5NDF8aW1hZ2UvanBlZ3xoMjkvaGQ4LzEzNTE5MTQyNzQ4MTkwL25hdi1jYXJwZXQtd2F0LW1hdmVyaWNrLTY0MHgzNTAuanBnfDU1OGRlNzRmNjE5ZGEzNWI3MjlhN2I3ZWYxNmYzNzZhNDM0MGIwZDI4YTdmZjM0NTVlN2YwNDVlOWRiZTE1YjM",
  //       '23000',
  //       'مفتوح'),
  //   ProductModel(
  //       " ساعة فورمال",
  //       "https://media.gq.com/photos/6176d56ab36b36132bb9ef36/3:2/w_1686,h_1124,c_limit/goldwatches.jpg",
  //       '12000',
  //       "انتهي"),
  //   ProductModel(
  //       "ساعة 13 برو",
  //       "https://imageengine.victorinox.com/medias/?context=bWFzdGVyfHJvb3R8OTc5NDF8aW1hZ2UvanBlZ3xoMjkvaGQ4LzEzNTE5MTQyNzQ4MTkwL25hdi1jYXJwZXQtd2F0LW1hdmVyaWNrLTY0MHgzNTAuanBnfDU1OGRlNzRmNjE5ZGEzNWI3MjlhN2I3ZWYxNmYzNzZhNDM0MGIwZDI4YTdmZjM0NTVlN2YwNDVlOWRiZTE1YjM",
  //       '23000',
  //       'مفتوح'),
  //   ProductModel(
  //       "جلاك ساعه ",
  //       "https://media.gq.com/photos/6176d56ab36b36132bb9ef36/3:2/w_1686,h_1124,c_limit/goldwatches.jpg",
  //       '12000',
  //       "انتهي"),
  //   ProductModel(
  //       " ساعة كلاسيك  ",
  //       "https://imageengine.victorinox.com/medias/?context=bWFzdGVyfHJvb3R8OTc5NDF8aW1hZ2UvanBlZ3xoMjkvaGQ4LzEzNTE5MTQyNzQ4MTkwL25hdi1jYXJwZXQtd2F0LW1hdmVyaWNrLTY0MHgzNTAuanBnfDU1OGRlNzRmNjE5ZGEzNWI3MjlhN2I3ZWYxNmYzNzZhNDM0MGIwZDI4YTdmZjM0NTVlN2YwNDVlOWRiZTE1YjM",
  //       '23000',
  //       'مفتوح'),
  //   ProductModel(
  //       " ساعة فورمال",
  //       "https://media.gq.com/photos/6176d56ab36b36132bb9ef36/3:2/w_1686,h_1124,c_limit/goldwatches.jpg",
  //       '12000',
  //       "انتهي"),
  //   ProductModel(
  //       "ساعة 13 برو",
  //       "https://imageengine.victorinox.com/medias/?context=bWFzdGVyfHJvb3R8OTc5NDF8aW1hZ2UvanBlZ3xoMjkvaGQ4LzEzNTE5MTQyNzQ4MTkwL25hdi1jYXJwZXQtd2F0LW1hdmVyaWNrLTY0MHgzNTAuanBnfDU1OGRlNzRmNjE5ZGEzNWI3MjlhN2I3ZWYxNmYzNzZhNDM0MGIwZDI4YTdmZjM0NTVlN2YwNDVlOWRiZTE1YjM",
  //       '23000',
  //       'مفتوح'),
  //   ProductModel(
  //       "جلاك ساعه ",
  //       "https://media.gq.com/photos/6176d56ab36b36132bb9ef36/3:2/w_1686,h_1124,c_limit/goldwatches.jpg",
  //       '12000',
  //       "انتهي")
  // ];
  // List<ProductModel> productsItemsAntekat = [
  //   ProductModel(
  //       " فازة كلاسيك ",
  //       "https://upload.3dlat.com/uploads/3dlat.com_13924173807.jpeg",
  //       '23000',
  //       'مفتوح'),
  //   ProductModel(
  //       "  كورشية",
  //       "https://sites.google.com/site/elomdaeldomiaty/_/rsrc/1468752211028/gallery/954798_527344067328937_115528906_n.jpg?height=400&width=393",
  //       '12000',
  //       "انتهي"),
  //   ProductModel(
  //       " فازة تحفة ",
  //       "https://www.supermama.me/photos/93977/inter_111954_2_604f692844c24.jpeg",
  //       '23000',
  //       'مفتوح'),
  //   ProductModel(
  //       " فازة قديمة ",
  //       "https://sites.google.com/site/elomdaeldomiaty/_/rsrc/1468752211028/gallery/954798_527344067328937_115528906_n.jpg?height=400&width=393",
  //       '12000',
  //       "انتهي"),
  //   ProductModel(
  //       " فازة كلاسيك ",
  //       "https://upload.3dlat.com/uploads/3dlat.com_13924173807.jpeg",
  //       '23000',
  //       'مفتوح'),
  //   ProductModel(
  //       "  كورشية",
  //       "https://sites.google.com/site/elomdaeldomiaty/_/rsrc/1468752211028/gallery/954798_527344067328937_115528906_n.jpg?height=400&width=393",
  //       '12000',
  //       "انتهي"),
  //   ProductModel(
  //       " فازة تحفة ",
  //       "https://www.supermama.me/photos/93977/inter_111954_2_604f692844c24.jpeg",
  //       '23000',
  //       'مفتوح'),
  //   ProductModel(
  //       " فازة قديمة ",
  //       "https://sites.google.com/site/elomdaeldomiaty/_/rsrc/1468752211028/gallery/954798_527344067328937_115528906_n.jpg?height=400&width=393",
  //       '12000',
  //       "انتهي"),
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProduct(context, name!),
      child: BlocConsumer<ProductCubit, ProductsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Products'),
              centerTitle: true,
              backgroundColor: defaultColor,
              actions: [
                IconButton(
                  onPressed: () {
                    NavigateTo(context, AddProductScreen(name!));
                  },
                  icon: Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
            drawer: DrawerItem(context),
            backgroundColor: defaultColor,
            body: Container(
              color: Colors.grey[300],
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      childAspectRatio: 8.0 / 8.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: ProductCubit.get(context).productModel.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return buildGridProduct(
                        'https://onlineauction-egypt.com/public/uploads/${ProductCubit.get(context).productModel[index].productImg!}',
                        ProductCubit.get(context).productModel[index].title!,
                        ProductCubit.get(context)
                            .productModel[index]
                            .startingPrice!,
                        ProductCubit.get(context)
                            .productModel[index]
                            .describtion!,
                        context,
                        ProductCubit.get(context)
                            .productModel[index]
                            .id
                            .toString());
                  }),
            ),
          );
        },
      ),
    );
  }
}

Widget buildGridProduct(String image, String title, String price, String status,
        context, String id) =>
    Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Colors.red),
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 12.0,
      shadowColor: defaultColor,
      child: Container(
        color: defaultColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage('${image}'),
                  width: double.infinity,
                  height: 100.0,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${title}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${price}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Spacer(),
                      Text(
                        '${status}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  defaultButton(
                      function: () {
                        TOKEN = CacheHelper.getData(key: 'token');
                        if (TOKEN != '' && TOKEN != null) {
                          NavigateTo(context, DetailsScreen(id));
                        } else {
                          showToast(
                              message: 'Please Login First',
                              toastStates: ToastStates.WARNING);
                          NavigateTo(context, LoginScreen());
                        }
                      },
                      text: 'المزايدة',
                      radius: 12,
                      background: Color.fromARGB(255, 228, 107, 58))
                ],
              ),
            ),
          ],
        ),
      ),
    );


/**
 * GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.3,
                childAspectRatio: 1 / 1.73,
                children: List.generate(
                  ProductCubit.get(context).productModel.length,
                  (index) {
                    if (type == 0) {
                      return buildGridProduct(
                          ProductCubit.get(context).productModel[index].productImg!,
                          ProductCubit.get(context).productModel[index].title!,
                          ProductCubit.get(context).productModel[index].startingPrice!,
                          ProductCubit.get(context).productModel[index].describtion!,
                          context,
                          name!);
                    } else if (type == 1) {
                      return buildGridProduct(
                          productsItemsWatches[index].image,
                          productsItemsWatches[index].name,
                          productsItemsWatches[index].price,
                          productsItemsWatches[index].status,
                          context,
                          name!);
                    } else {
                      return buildGridProduct(
                          productsItemsAntekat[index].image,
                          productsItemsAntekat[index].name,
                          productsItemsAntekat[index].price,
                          productsItemsAntekat[index].status,
                          context,
                          name!);
                    }
                  },
                  // (index) => type==0?buildGridProduct(
                  //     productsItemsphones[index].image,
                  //     productsItemsphones[index].name,
                  //     productsItemsphones[index].price,
                  //     productsItemsphones[index].status,
                  //     context):,
                ),
              ),
 */