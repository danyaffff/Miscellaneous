//
//  Tests.swift
//  Writer
//
//  Created by Даниил Храповицкий on 09.03.2021.
//

import Foundation

/// Generates the random string with given length.
/// - Parameter length: Length of string.
/// - Returns: Random string.
func random(withLength length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
}

/// Starts test with given result.
/// - Parameter result: Value that describes whether the test will completed successfully.
func startTest(_ result: TestPassing) {
    let randomName = random(withLength: 5)
    let fileExtension = Bool.random() ? FileExtension.txt : .none
    let currentPath = FileManager.default.currentDirectoryPath
    
    Filer.createEmptyFile(withName: randomName, andFileExtension: fileExtension, atPath: currentPath)
    
    if !Filer.isExistsFile(withName: randomName, andFileExtension: fileExtension, atPath: currentPath) {
        fatalError("File wasn't created!")
    }
    
    let randomContent = random(withLength: 20)
    
    do {
        if result == .success {
            try Filer.default
                .writer
                .write(text: randomContent,
                       toFileWithName: randomName,
                       andPath: currentPath,
                       andExtension: fileExtension)
        } else {
            try Filer.advanced(reader: AnotherReader(), writer: AnotherWriter())
                .writer
                .write(text: randomContent,
                       toFileWithName: randomName,
                       andPath: currentPath,
                       andExtension: fileExtension)
        }
    } catch {
        print(error.localizedDescription)
    }
    
    var readedContent: String?
    
    do {
        if result == .success {
            readedContent = try Filer.default
                                .reader
                                .read(toFileWithName: randomName,
                                    andPath: currentPath,
                                    andExtension: fileExtension)
        } else {
            readedContent = try Filer.advanced(reader: AnotherReader(), writer: AnotherWriter())
                                .reader
                                .read(toFileWithName: randomName,
                                      andPath: currentPath,
                                      andExtension: fileExtension)
        }
    } catch {
        print(error.localizedDescription)
    }
    
    guard let content = readedContent else {
        fatalError("Unwrap error!")
    }
    
    if content != randomContent {
        fatalError("Readed and writed contents don't matches.")
    }
    
    do {
        try Filer.removeFile(withName: randomName, andFileExtension: fileExtension, atPath: currentPath)
    } catch {
        print(error.localizedDescription)
    }
}

/// Enum that describes the result of test.
enum TestPassing {
    
    /// Test will successfully completed.
    case success
    
    /// Test will fail with an error.
    case fail
}
