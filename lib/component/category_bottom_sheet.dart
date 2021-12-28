import 'package:flutter/material.dart';
import 'package:product/data/remote/category.dart';
import 'package:product/utils/number_utils.dart';
import 'package:product/widget/animated_clip_r_rect.dart';

class CategoryBottomSheet extends StatefulWidget {
  const CategoryBottomSheet({
    Key? key,
    required this.categoryList,
    this.onExpanded,
  }) : super(key: key);

  final List<Category> categoryList;
  final Function(bool)? onExpanded;

  @override
  _CategoryBottomSheetState createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  final double _minExtent = 0.2;

  final double _maxPadding = 24;
  double _padding = 0;

  final double _maxBorderRadius = 32;
  double _borderRadius = 0;

  @override
  void initState() {
    super.initState();

    _padding = _maxPadding;
    _borderRadius = _maxBorderRadius;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: _buildListener(
        child: _buildAnimatedPadding(
          child: DraggableScrollableSheet(
            initialChildSize: _minExtent,
            minChildSize: _minExtent,
            builder: (context, controller) {
              return _buildAnimatedContainer(
                child: _buildAnimatedClipRRect(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: _buildCategoryList(controller),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListener({required Widget child}) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        setState(() {
          final normalizedExtent = NumberUtils.normalizeReversed(
            value: notification.extent,
            min: _minExtent,
            max: 0.3,
          );

          _padding = _maxPadding * normalizedExtent;
          _borderRadius = _maxBorderRadius * normalizedExtent;

          if (widget.onExpanded != null) {
            widget.onExpanded!(notification.extent > 0.7);
          }
        });
        return true;
      },
      child: child,
    );
  }

  Widget _buildAnimatedPadding({required Widget child}) {
    return AnimatedPadding(
      duration: Duration.zero,
      padding: EdgeInsets.all(_padding),
      child: child,
    );
  }

  Widget _buildAnimatedContainer({required Widget child}) {
    return AnimatedContainer(
      duration: Duration.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildAnimatedClipRRect({required Widget child}) {
    return AnimatedClipRRect(
      duration: Duration.zero,
      borderRadius: BorderRadius.circular(_borderRadius),
      child: child,
    );
  }

  Widget _buildCategoryList(ScrollController controller) {
    return GridView.count(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 4,
      children: widget.categoryList
          .map(
            (category) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue,
                  ),
                  child: category.icon,
                ),
                Text(category.text),
              ],
            ),
          )
          .toList(),
    );
  }
}
