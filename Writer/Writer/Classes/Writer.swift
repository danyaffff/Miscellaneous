//
//  Writer.swift
//  Writer
//
//  Created by Даниил Храповицкий on 08.03.2021.
//

import Foundation

/// Protocol that describes the behavior for being able to write data from a file.
protocol WriterProtocol {
    
    /// Method that contains the logic for writing text to a file.
    /// - Parameters:
    ///   - text: Saveable text.
    ///   - name: File name.
    ///   - path: File location.
    ///   - fileExtension: Error while writing data.
    func write(text: String, toFileWithName name: String, andPath path: String, andExtension fileExtension: FileExtension) throws
}


/// Сlass responsible for writing data from a file.
final class Writer: WriterProtocol {
    
    // MARK: - Methods
    func write(text: String, toFileWithName name: String, andPath path: String, andExtension fileExtension: FileExtension) throws {
        var url = URL(fileURLWithPath: path)
        url.appendPathComponent(name + fileExtension.rawValue)
        try text.write(to: url, atomically: true, encoding: .utf8)
    }
}

/// Сlass that conforms to WriterProtocol, but doesn't implement expected work.
final class AnotherWriter: WriterProtocol {
    
    // MARK: - Methods
    func write(text: String, toFileWithName name: String, andPath path: String, andExtension fileExtension: FileExtension) throws {
        print("Ням")
    }
}
