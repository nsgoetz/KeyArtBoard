import UIKit

func imageToArray(input: UIImage) -> [[Pixel]] {
    
    // Scale down
    var size = CGSize(width: input.size.width / 5, height: input.size.height / 5)
    UIGraphicsBeginImageContext(size)
    var context = UIGraphicsGetCurrentContext()
    CGContextTranslateCTM(context, 0.0, size.height)
    CGContextScaleCTM(context, 1.0, -1.0)
    CGContextDrawImage(context, CGRectMake(0.0, 0.0, size.width, size.height), input.CGImage)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    let imageRef = image.CGImage
    let width = Int(CGImageGetWidth(imageRef))
    let height = Int(CGImageGetHeight(imageRef))
    let bytesPerRow = Int(CGImageGetBytesPerRow(imageRef))
        
    var data: NSData = CGDataProviderCopyData(CGImageGetDataProvider(imageRef))
    var pixels: UnsafePointer<UInt8> = UnsafePointer<UInt8>(data.bytes)
    var dots: [[Pixel]] = Array<[Pixel]>(count: height, repeatedValue:
        Array<Pixel>(count: bytesPerRow / 4, repeatedValue: Pixel.White))

    for var i: Int=0; i<data.length; i+=4 {
        var r = pixels[i];
        var g = pixels[i+1];
        var b = pixels[i+2];
        var a = pixels[i+3];
        if r<240 || g<240 || b<240 {
            let row: Int = (i / 4) / (bytesPerRow / 4)
            let col: Int = (i / 4) % (bytesPerRow / 4)
            dots[row][col] = Pixel.Black
        }
    }
    return dots
}