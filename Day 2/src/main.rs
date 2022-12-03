use std::fs;

fn get_play_score_part_one(oppoonent_move: &str, your_move: &str) -> u32 {
    if (oppoonent_move == "A" && your_move == "Y") || (oppoonent_move == "B" && your_move == "Z") || (oppoonent_move == "C" && your_move == "X") {
        if your_move == "X" {
            return 7;
        } else if your_move == "Y" {
            return 8;
        }
        
        return 9;
    } else if (oppoonent_move == "A" && your_move == "X") || (oppoonent_move == "B" && your_move == "Y") || (oppoonent_move == "C" && your_move == "Z") {
        if your_move == "X" {
            return 4;
        } else if your_move == "Y" {
            return 5;
        }
        
        return 6;
    }

    if your_move == "X" {
        return 1;
    } else if your_move == "Y" {
        return 2;
    }
    
    3
}

fn part_one(strategy_guide: &String) {
    let mut score: u32 = 0;
    for play in strategy_guide.split('\n') {
        let moves: Vec<&str> = play.split(' ').collect();
        if moves.len() != 2 {
            continue
        }

        score = score + get_play_score_part_one(moves[0], moves[1]);
    }

    println!("Part 1: {score}");
}

fn get_play_score_part_two(oppoonent_move: &str, outcome: &str) -> u32 {
    if outcome == "X" {
        if oppoonent_move == "A" {
            return 3
        } else if oppoonent_move == "B" {
            return 1
        }

        return 2
    } else if outcome == "Y" {
        if oppoonent_move == "A" {
            return 4
        } else if oppoonent_move == "B" {
            return 5
        }

        return 6
    }

    if oppoonent_move == "A" {
        return 8;
    } else if oppoonent_move == "B" {
        return 9;
    }
    
    7
}

fn part_two(strategy_guide: &String) {
    let mut score: u32 = 0;
    for play in strategy_guide.split('\n') {
        let moves: Vec<&str> = play.split(' ').collect();
        if moves.len() != 2 {
            continue
        }

        score = score + get_play_score_part_two(moves[0], moves[1]);
    }

    println!("Part 2: {score}");
}

fn main() {
    let strategy_guide = fs::read_to_string("./input")
        .expect("Should have read the strategy guide");

    part_one(&strategy_guide);
    part_two(&strategy_guide);
}
