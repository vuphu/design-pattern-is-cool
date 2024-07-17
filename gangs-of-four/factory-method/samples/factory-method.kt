// kotlinc factory-method.kt -include-runtime -d factory-method.jar && java -jar factory-method.jar

interface Notification {
    fun send(message: String): Unit
}

class EmailNotification: Notification {
    override fun send(message: String) {
        println("Sending an email notification: $message")
    }
}

class AppNotification: Notification {
    override fun send(message: String) {
        println("Sending an app notification: $message")
    }
}

class SMSNotification: Notification {
    override fun send(message: String) {
        println("Sending a SMS notification: $message")
    }
}

fun chooseNotification(via: String): Notification {
    return when (via) {
        "email" -> EmailNotification()
        "app" -> AppNotification()
        "sms" -> SMSNotification()
        else -> throw IllegalArgumentException("Cannot found notification")
    }
}

fun main() {
    val notification = chooseNotification("app")
    notification.send("Hello, World!")
}