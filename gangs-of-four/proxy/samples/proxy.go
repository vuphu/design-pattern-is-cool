package main

import (
    "fmt"
)

type AIService interface {
    Ask(request string) (string, error)
}

type GPTService struct {
}

type GeminiService struct {
}

func (g *GPTService) Ask(request string) (string, error) {
    return fmt.Sprintf("Response from GPT: %s", request), nil
}

func (g *GeminiService) Ask(request string) (string, error) {
    return fmt.Sprintf("Response from Gemini: %s", request), nil
}


type ProxyAIService struct {
    services    []AIService
    currentIndex int
}

func (p *ProxyAIService) Ask(request string) (string, error) {
    if len(p.services) == 0 {
        return "", fmt.Errorf("no GPTService instances available")
    }
    service := p.services[p.currentIndex]
    p.currentIndex = (p.currentIndex + 1) % len(p.services)
    return service.Ask(request)
}

func main() {
    proxy := &ProxyAIService{
        services: []AIService{
            &GPTService{},
            &GPTService{},
            &GeminiService{},
        },
    }

    for i := 1; i <= 10; i++ {
        request := fmt.Sprintf("Request %d", i)
        response, err := proxy.Ask(request)
        if err != nil {
            fmt.Println("Error:", err)
        } else {
            fmt.Println(response)
        }
    }
}
