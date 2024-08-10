abstract class Drawable {
  String getBuffer();
}

class Image implements Drawable {
  final String path;

  Image(this.path);

  @override
  String getBuffer() {
    return "Image Buffer";
  }
}

class SVGImage {
  final String path;

  SVGImage(this.path);

  String getContent() {
    return "SVG from $path";
  }
}

class SVGImageAdapter implements Drawable {
  final SVGImage svgImage;

  SVGImageAdapter(this.svgImage);

  @override
  String getBuffer() {
    final svg = svgImage.getContent();
    return "Buffer of $svg";
  }
}

class Canvas {
  void draw(Drawable drawable) {
    final buffer = drawable.getBuffer();
    print(buffer);
  }
}

void main() {
  final canvas = Canvas();
  final pngImage = Image("<png_path>");
  final svgImage = SVGImage("<svg_path>");

  canvas.draw(pngImage);
  canvas.draw(SVGImageAdapter(svgImage));
}
