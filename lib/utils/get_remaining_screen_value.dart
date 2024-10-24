import 'package:flutter/material.dart';

double getRemainingScreenHeight(BuildContext context) {
  // Total height of the screen in logical pixels
  double screenHeight = MediaQuery.of(context).size.height;

  // Height occupied by widgets on the screen
  double occupiedHeight = 0.0;

  // Iterate through the ancestors of the current context
  // and sum up the heights of widgets
  context.visitAncestorElements((element) {
    // Check if the element has a render object attached
    if (element.renderObject != null) {
      // Add the height of the render object to the occupiedHeight
      occupiedHeight += element.renderObject!.paintBounds.size.height;
    }
    return true; // Return true to continue visiting ancestors
  });

  // Calculate the remaining height
  double remainingHeight = screenHeight - occupiedHeight;

  return remainingHeight;
}

