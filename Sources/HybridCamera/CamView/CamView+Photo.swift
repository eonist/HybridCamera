import UIKit
import AVFoundation
/**
 * PhotoCamera delegate
 */
extension CamView: AVCapturePhotoCaptureDelegate {
   /**
    * Called after a takePhoto action has occured (Delegate method)
    * - Fixme: ⚠️️ Explain the process this method performs
    */
   @objc open func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
      guard let imageData = photo.fileDataRepresentation() else { onPhotoCaptureComplete(.failure(.malformedImageData)); return }// Convert photo same buffer to a jpeg image data by using AVCapturePhotoOutput
      if let capturedImage = UIImage(data: imageData, scale: 1.0) { // Initialise an UIImage with our image data
         guard let fileURL: URL = FileUtil.tempURL(suffix: ".jpeg").value() else {
            onPhotoCaptureComplete(.failure(.unableToCreateTempFilePath))
            return
         }
         guard !FileManager().fileExists(atPath: fileURL.path) else {
            onPhotoCaptureComplete(.failure(.filePathAlreadyExists))
            return
         } // This will never happen because it uses a very random file name
         do { try FileUtil.write(path: fileURL.path, data: imageData) } // throws or not depending on if something was written or not
         catch { onPhotoCaptureComplete(.failure(.failedToWriteFile(error))) }
         onPhotoCaptureComplete(.success((capturedImage, fileURL)))
      }
   }
}
