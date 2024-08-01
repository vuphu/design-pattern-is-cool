mod cpu {
    pub struct CPU;

    impl CPU {
        pub fn new() -> CPU {
            CPU
        }

        pub fn freeze(&self) {
            println!("Freezing CPU...");
        }

        pub fn initialize(&self) {
            println!("Initializing CPU...");
        }

        pub fn execute(&self) {
            println!("Executing instructions...");
        }

        pub fn shutdown(&self) {
            println!("Shutting down CPU...");
        }
    }
}

mod memory {
    pub struct Memory;

    impl Memory {
        pub fn new() -> Memory {
            Memory
        }

        pub fn load(&self) {
            println!("Loading data into memory...");
        }

        pub fn clear(&self) {
            println!("Clearing memory...");
        }
    }
}

mod hard_drive {
    pub struct HardDrive;

    impl HardDrive {
        pub fn new() -> HardDrive {
            HardDrive
        }

        pub fn read(&self) {
            println!("Reading data from hard drive...");
        }

        pub fn spin_down(&self) {
            println!("Spinning down hard drive...");
        }
    }
}

mod computer {
    use super::cpu::CPU;
    use super::memory::Memory;
    use super::hard_drive::HardDrive;

    pub struct Computer {
        cpu: CPU,
        memory: Memory,
        hard_drive: HardDrive,
    }

    impl Computer {
        pub fn new() -> Computer {
            Computer {
                cpu: CPU::new(),
                memory: Memory::new(),
                hard_drive: HardDrive::new(),
            }
        }

        pub fn start_computer(&self) {
            self.cpu.freeze();
            self.hard_drive.read();
            self.memory.load();
            self.cpu.initialize();
            self.cpu.execute();
            println!("Computer start successfully.");
        }

        pub fn shutdown_computer(&self) {
            self.cpu.shutdown();
            self.memory.clear();
            self.hard_drive.spin_down();
            println!("Computer shut down successfully.");
        }
    }
}

fn main() {
    let computer = computer::Computer::new();
    computer.start_computer();
    computer.shutdown_computer();
}
