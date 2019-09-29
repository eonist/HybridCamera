import UIKit
import AVFoundation
/**
 * File utilities
 * - Fixme: ⚠️️ Move this to FileUtil in /common
 */
public class FileUtil {
   /**
    * Returns a file-path to temporary storage
    * - Note: file path becomes similar to: file:///private/var/mobile/Containers/Data/Application/7A735556D-364C-4D11-9E8A-6676BF11A1E1/tmp/F3888C7E-B1C6-49AC-9DV0-E4F92749204E.mp4
    * - Note: Use NSDocumentDirectory for long term storage
    * - Note: the TempDir wil get wiped automatically when the device run out of memory
    * - Note: The nsuuidstring automagically creates a random unique filename every time it's called
    * - Fixme: ⚠️️ Use Result here with sucess or failure with meaningful err msg etc
    */
   public static func tempURL(suffix: String =  ".mp4") -> URL? {
      let directory: String = NSTemporaryDirectory()
      guard !directory.isEmpty else { return nil }
      let url: URL = .init(fileURLWithPath: directory)
      let videoURL: URL = url.appendingPathComponent(NSUUID().uuidString + suffix)
      return videoURL
   }
   /**
    * Writes a file to a file-path
    * ## Examples:
    * write(path:"~/Desktop/del.txt".tildePath, data:data)//returns true or false depending on if something was written or not
    * - Fixme: ⚠️️ Use Result here with sucess or failure with meaningful err msg etc
    * - Parameters:
    *   - path: path to file
    *   - data: data to save
    */
//   @discardableResult
   public static func write(path: String, data: Data) throws {
      try data.write(to: URL(fileURLWithPath: path), options: [.atomic])
   }
}
