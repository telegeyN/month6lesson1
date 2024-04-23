//
//  UserSessionManager.swift
//  month6lesson1
//
//  Created by Telegey Nurbekova on 23/04/24.
//

import Foundation

final class UserSessionManager {
    
    static let shared = UserSessionManager()
    
    private init() { }
    
    var isSessionActive: Bool {
        let currentDate = Date()
        guard
            let sessionDate = UserDefaults.standard.object(forKey: "sessionDate") as? Date
        else {
            return false
        }
        return sessionDate > currentDate
    }
    
    var isDataCorrect: Bool = false
    
    func saveSession(with name: String, phoneNumber: String) {
        if name == "Geeks" && phoneNumber == "00" {
            isDataCorrect = true
            print("Session is saved")
            let currentDate = Date()
            let thirtySecondsAfter = Calendar.current.date(
                byAdding: .second,
                value: 30,
                to: currentDate
            )
            UserDefaults.standard.setValue(thirtySecondsAfter, forKey: "sessionDate")
        } else {
            print("The data isn't correct")
        }
    }
}
