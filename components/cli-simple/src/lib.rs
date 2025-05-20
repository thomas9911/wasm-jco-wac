// use crate::imports::bb::simple::add::Guest;
use crate::exports::wasi::cli::run::Guest;
use bb::simple::add;
wit_bindgen::generate!({ generate_all });

struct Runner;

impl Guest for Runner {
    #[doc = " Run the program."]
    fn run() -> Result<(), ()> {
        println!("{:?}", add::add(123, 9129));

        Ok(())
    }
}

export!(Runner);
