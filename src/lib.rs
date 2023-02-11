extern "C" {
    fn au3b_hello_world(input: bool) -> bool;
}

pub fn hello_world(input: bool) -> bool {
    unsafe { au3b_hello_world(input) }
}

#[test]
fn test_hello_world() {
    assert!(hello_world(false));
    assert!(!hello_world(true));
}
