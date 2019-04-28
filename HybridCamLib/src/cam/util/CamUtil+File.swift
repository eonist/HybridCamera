import UIKit
import AVFoundation

/**
 * File utilities
 */
extension CamUtil {
   /**
    * - Note: file path becomes similar to: file:///private/var/mobile/Containers/Data/Application/7A735556D-364C-4D11-9E8A-6676BF11A1E1/tmp/F3888C7E-B1C6-49AC-9DV0-E4F92749204E.mp4
    * - NOte: Use NSDocumentDirectory for long term storage
    * - Note: the TempDir wil get wiped automatically when the device run out of memory
    * - Note: The nsuuidstring automagically creates a random unique filename every time it's called
    */
   public static func tempURL(suffix: String =  ".mp4") -> URL? {
      let directory: String = NSTemporaryDirectory()
      guard directory != "" else { return nil }
      let url: URL = .init(fileURLWithPath: directory)
      let videoURL: URL = url.appendingPathComponent(NSUUID().uuidString + suffix)
      return videoURL
   }
   /**
    * ## Examples:
	 * write(path:"~/Desktop/del.txt".tildePath, data:data)//returns true or false depending on if something was written or not
    */
	@discardableResult
   public static func write(path: String, data: Data) -> Bool {
      do {
         try data.write(to: URL(fileURLWithPath: path), options: [.atomic])
         return true
      } catch let error {
         Swift.print("failed to write file – bad permissions, bad filename, missing permissions, or something else error: \(error.localizedDescription)")
         return false
      }
   }
}
