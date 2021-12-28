import 'package:flutter/material.dart';
import 'package:product/argument/product_detail_arguments.dart';
import 'package:product/data/remote/response/product_response.dart';
import 'package:product/utils/number_utils.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product_detail";

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailArguments;
    final product = arguments.product;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(product),
            _buildName(context, product.name),
            _buildPrice(context, product.price),
            _buildDivider(),
            _buildDescription(context, product.desc),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(ProductResponse product) {
    return Hero(
      tag: product.id,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            product.cover,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  Widget _buildName(BuildContext context, String name) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 4,
      ),
      child: Text(
        name,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget _buildPrice(BuildContext context, int price) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 8,
      ),
      child: Text(
        NumberUtils.getRupiahFormat(
          price.toDouble(),
        ),
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      thickness: 4,
    );
  }

  Widget _buildDescription(BuildContext context, String description) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              "Description",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Text(description),
        ],
      ),
    );
  }
}
