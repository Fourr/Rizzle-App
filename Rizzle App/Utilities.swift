//
//  videoSetup.swift
//  Rizzle App
//
//  Created by Johnny Sheffer on 1/19/21.
//

import Foundation
import UIKit
import AVKit
func createThumbnailOfVideoFromRemoteUrl(url: String) -> UIImage? {
    let asset = AVAsset(url: URL(string: url)!)
    let assetImgGenerate = AVAssetImageGenerator(asset: asset)
    assetImgGenerate.appliesPreferredTrackTransform = true
    //Can set this to improve performance if target size is known before hand
    //assetImgGenerate.maximumSize = CGSize(width,height)
    let time = CMTimeMakeWithSeconds(1.0, preferredTimescale: 600)
    do {
        let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
        let thumbnail = UIImage(cgImage: img)
        return thumbnail
    } catch {
        (error.localizedDescription)
      return nil
    }
}

extension Notification.Name {
    static let didReceiveData = Notification.Name("didReceiveData")
}
