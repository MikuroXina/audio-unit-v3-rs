use std::{env, process::Command};

/// Builds audio_unit_v3_bridge library Swift project
fn build_audio_unit_v3_bridge() {
    let out_dir = env::var("OUT_DIR").unwrap();
    let profile = env::var("PROFILE").unwrap();

    if !Command::new("swift")
        .args(&["build", "-c", &profile, "--scratch-path", &out_dir])
        .current_dir("./audio_unit_v3_bridge")
        .status()
        .unwrap()
        .success()
    {
        panic!("Swift library audio_unit_v3_bridge compilation failed")
    }

    let arch = env::var("CARGO_CFG_TARGET_ARCH")
        .unwrap()
        .replace("aarch64", "arm64");
    println!("cargo:rustc-link-search=native={out_dir}/{arch}-apple-macosx/{profile}");
    println!("cargo:rustc-link-lib=dylib=audio_unit_v3_bridge");
    println!("cargo:rerun-if-changed=audio_unit_v3_bridge/**/*.swift");

    println!("cargo:rustc-link-lib=framework=Cocoa");
    println!("cargo:rustc-link-lib=framework=AudioToolbox");
}

fn main() {
    let target = env::var("CARGO_CFG_TARGET_OS").unwrap();
    if target == "macos" {
        build_audio_unit_v3_bridge();
    }
}
