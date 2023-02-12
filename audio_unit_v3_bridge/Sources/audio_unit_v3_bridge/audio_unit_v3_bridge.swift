import AudioToolbox
import Cocoa
import CoreAudioKit

enum BridgeError: Error {
    case todo
}

class AudioUnitAdaptor: AUViewController {}

#if os(macOS)
    extension AudioUnitAdaptor: AUAudioUnitFactory {
        func createAudioUnit(with _: AudioComponentDescription) throws -> AUAudioUnit {
            throw BridgeError.todo
        }

        func requestViewController(completionHandler: @escaping (NSViewController?) -> Void) {
            completionHandler(self)
        }
    }
#endif

#if os(iOS)
    extension AudioUnitAdaptor: AUAudioUnitFactory {
        func createAudioUnit(with _: AudioComponentDescription) throws -> AUAudioUnit {
            throw BridgeError.todo
        }

        func requestViewController(completionHandler: @escaping (UIViewController?) -> Void) {
            completionHandler(self)
        }
    }
#endif

@_cdecl("au3b_hello_world")
public func au3b_hello_world(input: Bool) -> Bool {
    return !input
}
