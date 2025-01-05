//
//  KeychainManager.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 29/12/24.
//

import Foundation
import Security

/// An actor that provides a thread-safe interface for storing and retrieving sensitive data in the Keychain.
///
/// Use this actor to securely manage credentials and other sensitive information in your iOS application.
///
/// ```swift
/// let manager = KeychainManager()
/// try await manager.set("userToken", forKey: "auth.token")
/// let token: String? = try await manager.get(forKey: "auth.token")
/// ```
actor KeychainManager {
    
    /// Represents possible errors that can occur during Keychain operations.
    enum KeychainError: Error {
        case storageError(OSStatus)
        case retrievalError(OSStatus)
        case dataConversionError
        case unexpectedPasswordData
    }
    
    /// Stores a value in the Keychain for a given key.
    /// - Parameters:
    ///   - value: The value to store in the Keychain.
    ///   - key: The key to associate with the stored value.
    /// - Throws: ``KeychainError`` if the storage operation fails.
    func set<T: Codable>(_ value: T, forKey key: String) async throws {
        let data = try JSONEncoder().encode(value)
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecDuplicateItem {
            let updateQuery: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key
            ]
            
            let attributesToUpdate: [String: Any] = [
                kSecValueData as String: data
            ]
            
            let updateStatus = SecItemUpdate(
                updateQuery as CFDictionary,
                attributesToUpdate as CFDictionary
            )
            
            guard updateStatus == errSecSuccess else {
                throw KeychainError.storageError(updateStatus)
            }
        } else if status != errSecSuccess {
            throw KeychainError.storageError(status)
        }
    }
    
    /// Retrieves a value from the Keychain for a given key.
    /// - Parameter key: The key associated with the stored value.
    /// - Returns: The stored value if found and successfully decoded.
    /// - Throws: ``KeychainError`` if the retrieval operation fails.
    func get<T: Codable>(forKey key: String) async throws -> T? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess else {
            if status == errSecItemNotFound {
                return nil
            }
            throw KeychainError.retrievalError(status)
        }
        
        guard let data = result as? Data else {
            throw KeychainError.unexpectedPasswordData
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    /// Removes a value from the Keychain for a given key.
    /// - Parameter key: The key associated with the value to remove.
    /// - Throws: ``KeychainError`` if the removal operation fails.
    func remove(forKey key: String) async throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainError.storageError(status)
        }
    }
}
