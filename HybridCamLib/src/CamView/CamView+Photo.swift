import UIKit
import AVFoundation
/**
 * PhotoCamera delegate
 */
extension CamView: AVCapturePhotoCaptureDelegate {
   /**
    * Called after a takePhoto action has occured
    */
   @objc open func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
      guard let imageData = photo.fileDataRepresentation() else { onPhotoCaptureComplete(nil, nil, CaptureError.malformedImageData); return }// Convert photo same buffer to a jpeg image data by using AVCapturePhotoOutput
      if let capturedImage = UIImage(data: imageData, scale: 1.0) { // Initialise an UIImage with our image data
         let fileURL: URL? = CamUtil.tempURL(suffix: ".jpeg")
         guard let localFilePath: String = fileURL?.path, FileManager().fileExists(atPath: localFilePath) == false else { Swift.print("file already exists 🎉"); return } // This will never happen because it uses a very random file name
         _ = CamUtil.write(path: localFilePath, data: imageData) // Returns true or false depending on if something was written or not
         onPhotoCaptureComplete(capturedImage, fileURL, nil)
      }
   }
}
