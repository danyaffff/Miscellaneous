//
//  Filer.swift
//  Writer
//
//  Created by Даниил Храповицкий on 09.03.2021.
//

import Foundation

// MARK: - Filer
/// Entry point for fast reading and writing to the file system.
final class Filer {
    
    // MARK: - Shareds
    /// Returns the default shared instance of *Filer*.
    static let `default` = Filer(reader: Reader(), writer: Writer())
    
    /// Returns the advanced shared instance of *Filer* with custom reader and writer.
    /// - Parameters:
    ///   - reader: Class conforming to the ReaderProtocol.
    ///   - writer: Class conforming to the WriterProtocol.
    /// - Returns: Filer that initialized with custom Reader and Writer.
    class func advanced(reader: ReaderProtocol, writer: WriterProtocol) -> Filer { Filer(reader: reader, writer: writer) }
    
    // MARK: - Properties
    /// Class conforming to the ReaderProtocol and allows *Filer* to read data from files.
    let reader: ReaderProtocol
    
    /// Class conforming to the ReaderProtocol and allows *Filer* to write data to files.
    let writer: WriterProtocol
    
    // MARK: - Initializer
    /// Private initializer.
    /// - Parameters:
    ///   - reader: Class conforming to the ReaderProtocol.
    ///   - writer: Class conforming to the WriterProtocol.
    private init(reader: ReaderProtocol, writer: WriterProtocol) {
        self.reader = reader
        self.writer = writer
    }
    
    // MARK: - Class Methods
    /// Creates new empty file at given path with given name and extension.
    /// - Parameters:
    ///   - name: File name.
    ///   - fileExtension: File extension.
    ///   - path: File path.
    class func createEmptyFile(withName name: String, andFileExtension fileExtension: FileExtension, atPath path: String) {
        let wholePath = path + "/\(name)\(fileExtension.rawValue)"
        FileManager.default.createFile(atPath: wholePath, contents: nil)
    }
    
    /// Removes new empty file at given path with given name and extension.
    /// - Parameters:
    ///   - name: File name.
    ///   - fileExtension: File extension.
    ///   - path: File path.
    /// - Throws: Thrwos error when it can't removes file with given parameters.
    class func removeFile(withName name: String, andFileExtension fileExtension: FileExtension, atPath path: String) throws {
        let wholePath = path + "/\(name)\(fileExtension.rawValue)"
        try FileManager.default.removeItem(atPath: wholePath)
    }
    
    /// Checks if file with given name and extension exists at given path.
    /// - Parameters:
    ///   - name: File name.
    ///   - fileExtension: File extension.
    ///   - path: File path.
    /// - Returns: Returns whether the file exists at the given path.
    class func isExistsFile(withName name: String, andFileExtension fileExtension: FileExtension, atPath path: String) -> Bool {
        let wholePath = path + "/\(name)\(fileExtension.rawValue)"
        return FileManager.default.fileExists(atPath: wholePath)
    }
}
