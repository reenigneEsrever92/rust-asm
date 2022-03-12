fn main() {
    cc::Build::new()
        .file("src/asm.s")
        .compile("asm");

    println!("cargo:rerun-if-changed=src/asm.s"); 
}
