interface DrawingAPI {
    fun drawCircle(x: Double, y: Double, radius: Double)
    fun drawLine(x1: Double, y1: Double, x2: Double, y2: Double)
}

class OpenGLDrawingAPI : DrawingAPI {
    override fun drawCircle(x: Double, y: Double, radius: Double) {
        println("OpenGL: Drawing circle at ($x, $y) with radius $radius")
    }

    override fun drawLine(x1: Double, y1: Double, x2: Double, y2: Double) {
        println("OpenGL: Drawing line from ($x1, $y1) to ($x2, $y2)")
    }
}

class WebGLDrawingAPI : DrawingAPI {
    override fun drawCircle(x: Double, y: Double, radius: Double) {
        println("WebGL: Drawing circle at ($x, $y) with radius $radius")
    }

    override fun drawLine(x1: Double, y1: Double, x2: Double, y2: Double) {
        println("WebGL: Drawing line from ($x1, $y1) to ($x2, $y2)")
    }
}

abstract class Shape() {
    abstract fun draw(api: DrawingAPI)
}

class Circle(private var x: Double, private var y: Double, private var radius: Double) : Shape() {

    override fun draw(api: DrawingAPI) {
        api.drawCircle(x, y, radius)
    }
}

class Line(private var x1: Double, private var y1: Double, private var x2: Double, private var y2: Double) : Shape() {
    override fun draw(api: DrawingAPI) {
        api.drawLine(x1, y1, x2, y2)
    }

}

fun main() {
    val openGLAPI = OpenGLDrawingAPI()
    val webGLAPI = WebGLDrawingAPI()
    val circle = Circle(5.0, 10.0, 7.0)
    val line = Line(0.0, 0.0, 5.0, 5.0)

    circle.draw(openGLAPI)
    line.draw(openGLAPI)

    circle.draw(webGLAPI)
    line.draw(webGLAPI)
}
