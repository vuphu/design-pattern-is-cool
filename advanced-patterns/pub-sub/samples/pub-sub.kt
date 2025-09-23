data class Event(val topic: String, val payload: String)

class Subscriber(
    val topic: String,
    private val handler: (Event) -> Unit,
    private val bus: EventBus
) {
    fun execute(event: Event): Unit {
        handler(event)
    }

    fun close(): Unit {
        bus.unsubscribe(topic, this)
    }
}

class EventBus {
    private val subscribers = mutableMapOf<String, MutableList<Subscriber>>()

    fun subscribe(topic: String, handler: (Event) -> Unit): Subscriber {
        val subscriber = Subscriber(topic, handler, this)
        subscribers.computeIfAbsent(topic) { mutableListOf() }.add(subscriber)
        return subscriber
    }

    fun unsubscribe(topic: String, subscriber: Subscriber): Unit {
        subscribers[topic]?.remove(subscriber)
        if (subscribers[topic].isNullOrEmpty()) {
            subscribers.remove(topic)
        }
    }

    fun publish(event: Event): Unit {
        subscribers[event.topic]?.forEach { subscriber ->
            subscriber.execute(event)
        }
    }
}

class Publisher(private val bus: EventBus) {
    fun publish(event: Event) = bus.publish(event)
}

fun main() {
    val bus = EventBus()
    val publisher = Publisher(bus)
    val subscriber = bus.subscribe("news") { event ->
        println("Subscriber received event: ${event.payload}")
    }

    publisher.publish(Event("news", "Design patterns are cool!"))
    subscriber.close()
    publisher.publish(Event("news", "Design patterns are hard!"))
}
