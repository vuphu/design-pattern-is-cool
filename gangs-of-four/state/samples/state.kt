interface TaskState {
    fun handle()
}

class Task(var title: String) {
    var state: TaskState = TodoState(this)

    fun nextState() {
        state.handle()
    }
}

class TodoState(private val task: Task) : TaskState {
    override fun handle() {
        println("Task ${task.title}: Todo -> InProgress")
        task.state = InProgressState(task)
    }
}

class InProgressState(private val task: Task) : TaskState {
    override fun handle() {
        println("Task ${task.title}: InProgress -> Done")
        task.state = DoneState(task)
    }
}

class DoneState(private val task: Task) : TaskState {
    override fun handle() {
        println("Task ${task.title} already finished")
    }
}

fun main() {
    val task = Task("Deploy Production")

    task.nextState()
    task.nextState()
    task.nextState()
}
