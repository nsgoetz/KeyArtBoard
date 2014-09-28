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

func toASCII(var pixels: [[Pixel]]) -> String {
    
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
                    line += "_"
                }
                else if !isSet(x-1, y) || !isSet(x+1, y) {
                    line += "|"
                } else {
                    line += " "
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

let W = Pixel.White
let B = Pixel.Black
let test1 = [[W, W, W, W],
    [B, B, B, B],
    [B, W, W, B],
    [B, W, W, B],
    [B, B, B, B]]
println(toASCII(test1))
