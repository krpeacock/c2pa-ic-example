use c2pa::ManifestStore;

#[ic_cdk::query]
fn greet(name: String) -> String {
    format!("Hello, {}!", name)
}

#[ic_cdk::query]
fn check_manifest(
    format: String, 
    image_bytes: Vec<u8>,
    verify: bool
) -> String {
    // // load ./profile-authenticated.jpeg as bytes
    // // let maybe_file = std::fs::read("../profile-authenticated.jpeg");

    // if maybe_file.is_err() {
    //     return format!("Error reading file");
    // }

    // // convert result to &[u8]
    // let maybe_file = maybe_file.unwrap();

    let ms = ManifestStore::from_bytes(&format, &image_bytes, verify);

    if let Ok(ms) = ms {
        return format!("{}", ms);
    } else {
        return format!("Error");
    }
}
