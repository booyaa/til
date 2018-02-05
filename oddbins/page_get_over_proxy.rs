extern crate reqwest; // add reqwest = "0.8.4" to your [dependencies] section of your Cargo.toml

fn main() {
    let client = reqwest::Client::builder()
        .proxy(reqwest::Proxy::http("http://127.0.0.1:8888").unwrap())
        .build()
        .unwrap()
        .get("http://google.com")
        .send()
        .unwrap();

    if client.status().is_success() {
        println!("Successfully downloaded the google index!");
    } else {
        println!("Failed to reach google, got the following status code: {}.", client.status());
    }

    // without a proxy
    let res = reqwest::get("http://google.com").expect("Failed to reach google.");

}

