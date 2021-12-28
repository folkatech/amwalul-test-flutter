import 'package:flutter/material.dart';
import 'package:product/data/remote/response/product_response.dart';
import 'package:product/utils/number_utils.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  final ProductResponse product;
  final Function(ProductResponse) onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => onTap(product),
        child: Column(
          children: [
            _buildImage(product),
            _buildText(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(ProductResponse product) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: product.id,
          child: Image.network(
            product.cover,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildName(context, product.name),
          _buildPrice(context, product.price),
        ],
      ),
    );
  }

  Widget _buildName(BuildContext context, String name) {
    return Text(
      name,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  Widget _buildPrice(BuildContext context, int price) {
    return Text(
      NumberUtils.getRupiahFormat(
        price.toDouble(),
      ),
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}
