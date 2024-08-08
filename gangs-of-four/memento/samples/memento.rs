struct Game {
    level: i32,
    coins: i32,
}

impl Game {
    fn new() -> Self {
        Self { level: 1, coins: 0 }
    }

    fn set_level(&mut self, level: i32) {
        self.level = level;
    }
    
    fn next_level(&mut self) {
        self.level += 1;
    }
    
    fn earn_coins(&mut self, coins: i32) {
        self.coins += coins;
    }
    
    fn print_state(&self) {
        println!("Level: {}, Coins: {}", self.level, self.coins);
    }

    fn create_checkpoint(&self) -> Checkpoint {
        Checkpoint {
            level: self.level,
        }
    }
}

struct Checkpoint {
    level: i32,
}

impl Checkpoint {
    fn restore(&self, game: &mut Game) {
        game.set_level(self.level);
    }
}

fn main() {
    let mut game = Game::new();
    
    game.print_state();
    let checkpoint = game.create_checkpoint();

    game.next_level();
    game.earn_coins(3000);
    game.print_state();

    checkpoint.restore(&mut game);
    game.print_state();
}
