trait Logger {
    fn log(&self, message: &str);
}

struct ConsoleLogger;

impl Logger for ConsoleLogger {
    fn log(&self, message: &str) {
        println!("Console: {}", message);
    }
}

struct RemoteLogger;

impl Logger for RemoteLogger {
    fn log(&self, message: &str) {
        println!("Remote: {}", message);
    }
}

struct ComposeLogger {
    loggers: Vec<Box<dyn Logger>>,
}

impl ComposeLogger {
    fn new(loggers: Vec<Box<dyn Logger>>) -> Self {
        Self { loggers }
    }
}

impl Logger for ComposeLogger {
    fn log(&self, message: &str) {
        for logger in &self.loggers {
            logger.log(message);
        }
    }
}

fn main() {
    let logger = ComposeLogger::new(vec![
        Box::new(ConsoleLogger),
        Box::new(RemoteLogger),
    ]);

    logger.log("Hello, World!");
}
