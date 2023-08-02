//
//  ConfigManager.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 1/08/23.
//

import Foundation

class ConfigManager {
    static let shared = ConfigManager()
    
    private var configDict: [String: Any]?
    
    // Información del archivo
    private let FileName = "Config"
    private let FileExt = "plist"
    
    private init() {
        loadConfig()
    }
    
    private func loadConfig() {
        if let path = Bundle.main.path(forResource: FileName, ofType: FileExt),
           let configDict = NSDictionary(contentsOfFile: path) as? [String: Any] {
            self.configDict = configDict
        } else {
            print("No se pudo cargar el archivo '\(FileName).\(FileExt)'")
        }
    }
    
    func value(for key: String) throws -> Any {
        guard let value = configDict?[key] else {
            throw ConfigError.keyNotFound("La llave '\(key)' no se encontró en '\(FileName).\(FileExt)'")
        }
        
        return value
    }
}
