import 'package:flutter/material.dart';
import 'package:product/argument/product_detail_arguments.dart';
import 'package:product/component/category_bottom_sheet.dart';
import 'package:product/component/product_card.dart';
import 'package:product/data/remote/category.dart';
import 'package:product/data/remote/response/product_response.dart';
import 'package:product/provider/product_list_provider.dart';
import 'package:product/screen/product_detail/product_detail_screen.dart';
import 'package:product/ui/ui_state.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  static const routeName = "/product_list";

  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen>
    with SingleTickerProviderStateMixin {

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((_isExpanded) ? "Product List" : "Category"),
        leading: (_isExpanded) ? _showCategoryBackButton() : null,
      ),
      body: Stack(
        children: [
          Consumer<ProductListProvider>(
            builder: (context, provider, child) {
              final state = provider.state;
              if (state is Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is Success) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.92,
                    children: (state.data as List<ProductResponse>)
                        .map((product) => ProductCard(
                              product: product,
                              onTap: (product) {
                                Navigator.pushNamed(
                                  context,
                                  ProductDetailScreen.routeName,
                                  arguments: ProductDetailArguments(
                                    product: product,
                                  ),
                                );
                              },
                            ))
                        .toList(),
                  ),
                );
              }

              if (state is Failure) {
                return Center(
                  child: Text(state.message),
                );
              }

              return Container();
            },
          ),
          CategoryBottomSheet(
            categoryList: const [
              Category(text: "test", icon: Icon(Icons.add, color: Colors.white,)),
              Category(text: "test", icon: Icon(Icons.add, color: Colors.white,)),
              Category(text: "test", icon: Icon(Icons.add, color: Colors.white,)),
              Category(text: "test", icon: Icon(Icons.add, color: Colors.white,)),
              Category(text: "test", icon: Icon(Icons.add, color: Colors.white,)),
              Category(text: "test", icon: Icon(Icons.add, color: Colors.white,)),
              Category(text: "test", icon: Icon(Icons.add, color: Colors.white,)),
              Category(text: "test", icon: Icon(Icons.add, color: Colors.white,)),
            ],
            onExpanded: (isExpanded) {
              setState(() {
                _isExpanded = isExpanded;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _showCategoryBackButton() {
    return InkWell(
      onTap: () {
      },
      child: const Icon(Icons.arrow_back),
    );
  }
}
