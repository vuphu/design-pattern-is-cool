# adapter

## Example 01: Image Adapter

Implemented in `samples/adapter.dart`

This code apply the Adapter pattern for handling different image formats with the following components:

- **Drawable**: An abstract class defining the `getBuffer` method.
- **Image**: A class implementing `Drawable` for PNG images.
- **SVGImage**: A class with a method to retrieve SVG content.
- **SVGImageAdapter**: An adapter class that implements `Drawable` and adapts `SVGImage` to provide a compatible buffer representation.

The `main` function shows how to use the `Canvas` class to draw both PNG and SVG images using the adapter.





