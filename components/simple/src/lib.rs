use crate::exports::bb::simple::add::Guest;

wit_bindgen::generate!({ generate_all });

struct Adder;

impl Guest for Adder {
    fn add(x:u32,y:u32,) -> u32 {
        x.saturating_add(y)
    }
}

export!(Adder);

