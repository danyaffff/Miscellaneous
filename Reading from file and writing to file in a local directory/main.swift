import Foundation

let inputURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath).appendingPathComponent("input.txt")
let outputURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath).appendingPathComponent("output.txt")

let text = try String(contentsOf: inputURL, encoding: .utf8)

try text.write(to: outputURL, atomically: true, encoding: .utf8)
