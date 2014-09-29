enum Pixel: Printable {
    case White
    case Black
    var description: String {
        switch self {
        case .White:
            return "white"
        case .Black:
            return "black"
            }
    }
}

extension Array {
    func at(index: Int) -> T? {
        return 0 <= index && index < self.count ? self[index] : nil
    }
}

func toASCII(var pixels: [[Pixel]], edges: Bool) -> String {
    
    let isSet: (Int, Int) -> Bool = { (x, y) in
        return pixels.at(y)?.at(x)? == Pixel.Black
    }
    
    var output = ""
    for var y=0; y<pixels.count; y++ {
        var line = ""
        for var x=0; x<pixels[y].count; x++ {
            if isSet(x, y) {
                if !isSet(x-1, y) && !isSet(x, y-1) {
                    line += "/"
                }
                else if !isSet(x,y-1) && !isSet(x, y+1) && !isSet(x+1,y-1) && !isSet(x+1,y) && !isSet(x+1,y+1) {
                    line += "|"
                }
                else if !isSet(x+1, y) && !isSet(x, y-1) {
                    line += "\\"
                }
                else if !isSet(x-1, y) && !isSet(x, y+1) {
                    line += "\\"
                }
                else if !isSet(x+1,y) && !isSet(x, y+1) {
                    line += "/"
                }
                else if !isSet(x, y+1) {
                    line += edges ? "_" : "#"
                }
                else if !isSet(x-1, y) || !isSet(x+1, y) {
                    line += "|"
                } else {
                    line += edges ? " " : "#"
                }
            } else if isSet(x, y+1) && isSet(x-1, y+1) && isSet(x+1, y+1) {
                line += "_"
            } else {
                line += " "
            }
        }
        output += (line + "\n")
    }
    
    return output
}

// factor must be >= 1
func scaleDown(pixels:[[Pixel]], factor: Int, threshold: Float = 0.5) -> [[Pixel]] {
    var result : [[Pixel]] = []
    var x = 0
    var y = 0
    while y < pixels.count {
        var row : [Pixel] = []
        x = 0
        while x < pixels[y].count {
            //print (x)
            var sum = 0
            for i in 0..<factor {
                if (y+i >= pixels.count) {
                    continue
                }
                for j in 0..<factor {
                    if (x+j >= pixels[y+i].count) {
                        continue
                    }
                    if pixels[y+i][x+j] == Pixel.Black {
                        sum++
                    }
                }
            }
            print("at (\(x),\(y))\n")
            row += (sum >= Int(Float(factor*factor)*threshold*threshold)) ? [Pixel.Black] : [Pixel.White]
            x += factor
        }
        result += [row]
        y += factor
    }
    println(pixels)
    println("->")
    println(result)
    return result
}

func test() {
let W = Pixel.White
let B = Pixel.Black
let test1 = [[W, B, B, W],
    [B, B, B, B],
    [B, W, W, B],
    [B, W, W, B],
    [B, B, B, B]]
    let test2 = [[W, W, W, W, B, B, B, B, W, W],
    [W,W,W, B, B, B,B,B,B,W],
    [W,W,B,B,B,B,B,B,B,B,B,W],
    [W,B,B,W,W,W,B,B,B,B],
    [W,B,B,B,W,B,B,
        B,B,B],
    [B,B,B,B,B,B,B,B,B,B]]
    println(toASCII(scaleDown(test2, 2, threshold: 0.25), false))
}

func returnStr() -> String {
    var W = Pixel.White
    var B = Pixel.Black
    var test2 = [[W, W, W, W, B, B, B, B, W, W],
        [W,W,W, B, B, B,B,B,B,W],
        [W,W,B,B,B,B,B,B,B,B,B,W],
        [W,B,B,W,W,W,B,B,B,B],
        [W,B,B,B,W,B,B,B,B,B],
        [B,B,B,B,B,B,B,B,B,B]]
    var testString : String = toASCII(scaleDown(test2, 2, threshold: 0.25), false)
    return testString
}
