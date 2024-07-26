using System;
 
public class Button
{
    public string Title { get; set; }
    public string Color { get; set; }
    public double StrokeWidth { get; set; }

    public Button(string title, string color, double strokeWidth)
    {
        Title = title;
        Color = color;
        StrokeWidth = strokeWidth;
    }

    public Button CopyWith(string title = null, string color = null, double? strokeWidth = null)
    {
        return new Button(
            title ?? this.Title,
            color ?? this.Color,
            strokeWidth ?? this.StrokeWidth
        );
    }
    
    public void PrintInfo()
    {
        Console.WriteLine("Title: " + Title + ", Color: " + Color + ", Stroke Width: " + StrokeWidth);
    }
}

public class Program
{
    public static void Main()
    {
        Button originalButton = new Button("Original", "blue", 2.0);
        Button newButton = originalButton.CopyWith("New Title");

        originalButton.PrintInfo();
        newButton.PrintInfo();
    }
}