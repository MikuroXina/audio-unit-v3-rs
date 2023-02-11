@testable import audio_unit_v3_bridge
import XCTest

final class audio_unit_v3_bridgeTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(audio_unit_v3_bridge.au3b_hello_world(input: false), true)
        XCTAssertEqual(audio_unit_v3_bridge.au3b_hello_world(input: true), false)
    }
}
