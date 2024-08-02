import Foundation

protocol Text {
    func render() -> String
}

class NormalText: Text {
    private let text: String
    
    init(text: String) {
        self.text = text
    }
    
    func render() -> String {
        return text
    }
}

class TextDecorator: Text {
    private let wrapped: Text
    
    init(_ wrapped: Text) {
        self.wrapped = wrapped
    }
    
    func render() -> String {
        return wrapped.render()
    }
}

class BoldDecorator: TextDecorator {
    override func render() -> String {
        return "<b>\(super.render())</b>"
    }
}

class ItalicDecorator: TextDecorator {
    override func render() -> String {
        return "<i>\(super.render())</i>"
    }
}

class UnderlineDecorator: TextDecorator {
    override func render() -> String {
        return "<u>\(super.render())</u>"
    }
}

let normalText = NormalText(text: "Hello, World!")
let boldText = BoldDecorator(normalText)
let italicText = ItalicDecorator(boldText)
let underlineText = UnderlineDecorator(italicText)

print(normalText.render())
print(boldText.render())
print(italicText.render())
print(underlineText.render())
