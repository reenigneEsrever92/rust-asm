#[no_mangle]
pub extern fn rust_add(a: i64, b: i64) -> i64 {
    a + b
}

extern "C" {
    fn add_asm(a: i64, b: i64) -> i64;
    fn sub_asm(a: i64, b: i64) -> i64;
    fn sum_up_eight_arguments_asm(a: i64, b: i64, c: i64, d: i64, e: i64, f: i64, g: i64, h: i64) -> i64;
    fn call_rust_add(a: i64, b: i64) -> i64;
}

fn main() {
    unsafe {
        println!("add_asm: {}", add_asm(6, 4));
        println!("sub_asm: {}", sub_asm(6, 4));
        println!("sum_up_eight_arguments_asm: {}", sum_up_eight_arguments_asm(1, 1, 1, 1, 2, 2, 2, 2));
        println!("call rust add: {}", call_rust_add(6, 4));
    }
}


