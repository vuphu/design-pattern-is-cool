data class Style(val backgroundColor: String, val foregroundColor: String)

data class Point(val x: Int, val y: Int)

class Button(val title: String, val position: Point, private val style: Style) {
    fun render() {
        println(
            "Rendering button '$title' at position (${position.x}, ${position.y}) " +
                "with background color ${style.backgroundColor} and foreground color ${style.foregroundColor}"
        )
    }
}

object StyleFactory {
    private val styles = mapOf(
        "default" to Style("Light Gray", "Black"),
        "save" to Style("Light Green", "White"),
        "danger" to Style("Dark Red", "White")
    )

    fun getStyle(type: String): Style {
        return styles[type] ?: styles["default"]!!
    }
}

class Canvas {
    private val components = mutableListOf<Button>()

    fun addButton(title: String, position: Point, style: String = "default") {
        components.add(Button(title, position, StyleFactory.getStyle(style)))
    }

    fun render() {
        for (button in components) {
            button.render()
        }
    }
}

fun main() {
    val canvas = Canvas()
    canvas.addButton("Back", Point(0, 1))
    canvas.addButton("Next", Point(0, 2))
    canvas.addButton("Save", Point(0, 3), "save")
    canvas.addButton("Sync", Point(0, 4), "save")
    canvas.addButton("Delete", Point(0, 5), "danger")
    canvas.render()
}
