//
//  UserDefaultsProvider.swift
//  QuizApp
//
//  Created by Brais Castro on 18/3/22.
//

import Foundation

enum UserDefaultsKey: String {
    case ranking
}

final class UserDefaultsProvider {
    
    static func setCodable<Element: Codable>(key: UserDefaultsKey, value: Element) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(value)
            let standard = UserDefaults.standard
            standard.setValue(data, forKey: key.rawValue)
            standard.synchronize()
        } catch let jsonError as NSError {
            debugPrint("JSON encode failed: \(jsonError.localizedDescription)")
        }
    }
    
    static func codable<Element: Codable>(key: UserDefaultsKey) -> Element? {
        guard let data = UserDefaults.standard.data(forKey: key.rawValue) else { return nil }
        let decoder = JSONDecoder()
        do {
            let element = try decoder.decode(Element.self, from: data)
            return element
        } catch let jsonError as NSError {
            debugPrint("JSON decode failed: \(jsonError.localizedDescription)")
        }
        return nil
    }
    
    static func string(key: UserDefaultsKey) -> String? {
        return UserDefaults.standard.string(forKey: key.rawValue)
    }
    
    static func bool(key: UserDefaultsKey) -> Bool? {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    static func remove(key: UserDefaultsKey) {
        let standard = UserDefaults.standard
        standard.removeObject(forKey: key.rawValue)
        standard.synchronize()
    }
    
    static func clear() {
        let standard = UserDefaults.standard
        standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        standard.synchronize()
    }
    
}
