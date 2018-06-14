import UIKit
import AVFoundation

/**
 * VideoCamera Delegate
 */
extension CamView:AVCaptureFileOutputRecordingDelegate{
    /**
     * This is called when the video recording starts ( Informs the delegate when the output has started writing to a file.)
     */
    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        /*⚠️️ for some reason this isn't called*/
    }
    /**
     * This is called when the video has finished recording. (Called whenever the output is recording to a file and successfully pauses the recording at the request of the client.)
     * NOTE: When the video has stopped recording, you get an output file URL
     */
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        onVideoCaptureComplete(outputFileURL,nil)
    }
}
/**
 * PhotoCamera delegate
 */
extension CamView:AVCapturePhotoCaptureDelegate{
    /**
     * Called after a takePhoto action has occured
     */
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { onPhotoCaptureComplete(nil,nil,CaptureError.malformedImageData);return }// Convert photo same buffer to a jpeg image data by using AVCapturePhotoOutput
        let capturedImage = UIImage.init(data: imageData , scale: 1.0)/*Initialise an UIImage with our image data*/
        if let image = capturedImage {/*Save our captured image to photos album*/
            let fileURL:URL? = CamUtil.tempURL(suffix: ".jpeg")
            guard let localFilePath:String = fileURL?.path, FileManager().fileExists(atPath: localFilePath) == false else {Swift.print("file already exists 🎉"); return }
            _ = CamUtil.write(path:localFilePath, data:imageData)/*returns true or false depending on if something was written or not*/
            onPhotoCaptureComplete(image,fileURL,nil)
        }
    }
}
