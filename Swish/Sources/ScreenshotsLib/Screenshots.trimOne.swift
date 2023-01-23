import CoreGraphics
import Foundation
import AVFoundation

extension Screenshots {
  
  func trimOne(screenshotPath: String, maskPath: String, outputPath: String) throws {
    
    guard
      let screenshotImage = CGImage.load(path: screenshotPath) else {
      throw Errors.readingScreenshotImage
    }
    
    guard
      let maskImage = CGImage.load(path: maskPath) else {
      throw Errors.readingMaskImage
    }
    
    var maskImageData = (maskImage.dataProvider!.data! as Data).makeIterator()
    var screenshotImageData = (screenshotImage.dataProvider!.data! as Data).makeIterator()
    
    var target = Data(capacity: (screenshotImage.dataProvider!.data! as Data).count)
    
    while let _ = maskImageData.next(),
          let _ = maskImageData.next(),
          let _ = maskImageData.next(),
          let m3 = maskImageData.next(),
          let s0 = screenshotImageData.next(),
          let s1 = screenshotImageData.next(),
          let s2 = screenshotImageData.next(),
          let s3 = screenshotImageData.next() {
      
      if m3 == 0 {
        target.append(0 as UInt8)
        target.append(0 as UInt8)
        target.append(0 as UInt8)
        target.append(0 as UInt8)
      } else {
        target.append(s0)
        target.append(s1)
        target.append(s2)
        target.append(s3)
      }
    }
    
    
    print("bitsPerComponent", screenshotImage.bitsPerComponent)
    print("bitsPerPixel", screenshotImage.bitsPerPixel)
    
    let provider = CGDataProvider(data: target as CFData)!
    let finalImage = CGImage(width: width, height: height,
                             bitsPerComponent: screenshotImage.bitsPerComponent,
                             bitsPerPixel: screenshotImage.bitsPerPixel,
                             bytesPerRow: screenshotImage.bytesPerRow,
                             space: screenshotImage.colorSpace!,
                             bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue),
                             provider: provider,
                             decode: nil,
                             shouldInterpolate: false,
                             intent: CGColorRenderingIntent.defaultIntent)!
    
    guard let destination = CGImageDestinationCreateWithURL(URL(fileURLWithPath: outputPath) as CFURL, "public.png" as CFString as CFString, 1, nil)
    else {
      throw Errors.creatingDestination
    }
    
    CGImageDestinationAddImage(destination, finalImage, [
      kCGImageDestinationLossyCompressionQuality: 1.0,
    ] as CFDictionary)
    
    if CGImageDestinationFinalize(destination) == false {
      throw Errors.finalizingDestination
    }
  }
}
