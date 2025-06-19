import 'package:flutter/material.dart';
import 'package:laundryhub/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:laundryhub/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:laundryhub/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),

        // -- if [size.infinity: is not true.in stock] error occured -- > 

        child: SizedBox(
          height: 400,
          child: Stack(
            children: [

              /// -- background custom images
              
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColors.textAccent.withAlpha(25),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.textAccent.withAlpha(25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
