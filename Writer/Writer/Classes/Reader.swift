//
//  Reader.swift
//  Writer
//
//  Created by Даниил Храповицкий on 08.03.2021.
//

import Foundation

/// Protocol that describes the behavior for being able to read data from a file.
protocol ReaderProtocol {
    
    /// Method that contains the logic for reading text from a file.
    /// - Parameter url: File location.
    /// - Returns: Readed text.
    /// - Throws: Error while reading data.
    func read(toFileWithName name: String, andPath path: String, andExtension fileExtension: FileExtension) throws -> String
}

/// Сlass responsible for reading data from a file.
final class Reader: ReaderProtocol {
    
    // MARK: - Methods
    func read(toFileWithName name: String, andPath path: String, andExtension fileExtension: FileExtension) throws -> String {
        var url = URL(fileURLWithPath: path)
        url.appendPathComponent(name + fileExtension.rawValue)
        return try String(contentsOf: url, encoding: .utf8)
    }
}

/// Сlass that conforms to ReaderProtocol, but doesn't implement expected work.
final class AnotherReader: ReaderProtocol {
    
    // MARK: - Methods
    func read(toFileWithName name: String, andPath path: String, andExtension fileExtension: FileExtension) throws -> String {
        return "This doesn't work."
    }
}
