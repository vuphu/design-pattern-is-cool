// dart prototype.dart

class Button {
  final String title;
  final String color;
  final double strokeWidth;

  Button({
    required this.title,
    required this.color,
    required this.strokeWidth,
  });

  Button copyWith({
    String? title,
    String? color,
    double? strokeWidth,
  }) {
    return Button(
      title: title ?? this.title,
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
    );
  }
  
  void printInfo() {
    print('Title: $title, Color: $color, Stroke With: $strokeWidth');
  }
}

void main() {
  Button originalButton = Button(
    title: 'Original',
    color: '#0000FF',
    strokeWidth: 2.0,
  );
  Button newButton = originalButton.copyWith(title: 'New Title');

  originalButton.printInfo();
  newButton.printInfo();
}