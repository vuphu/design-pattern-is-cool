package main

import "fmt"

type TaskHandler interface {
    HandleRequest(task Task)
}

type Task struct {
    Title string
}

type Handler struct {
    Position     string
    NextHandler  TaskHandler
}

func (h *Handler) HandleRequest(task Task) {
    fmt.Printf("[%s] Processing task with title: %s\n", h.Position, task.Title)
    if h.NextHandler != nil {
        h.NextHandler.HandleRequest(task)
    }
}

func main() {
    manager := &Handler{Position: "Manager"}
    qa := &Handler{Position: "QA", NextHandler: manager}
    developer := &Handler{Position: "Developer", NextHandler: qa}

    task1 := Task{Title: "First Application"}
    task2 := Task{Title: "Application Reverified"}

    developer.HandleRequest(task1)
    qa.HandleRequest(task2)
}