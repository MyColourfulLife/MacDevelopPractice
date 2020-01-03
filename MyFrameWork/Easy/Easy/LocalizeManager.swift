//
//  LocalizeManager.swift
//  VPNGO
//
//  Created by Ekko on 2019/12/18.
//  Copyright © 2019 Ekko. All rights reserved.
//

import Cocoa

/// 本地化资源管理类
/// 加载本地化字符串使用字符串的扩展属性localizedString即可
public class LocalizeManager {
   public var supportLanguages:[String]?// 支持的国际化语言列表
   public var currentLanguage:String = "en"//当前程序使用的语言
   public var recommendLanguage:[String]?//系统推荐使用的语言
   public var languageBundle:Bundle = Bundle.main
   public static let shared:LocalizeManager = LocalizeManager()
    
   public var supportLangsReadable:[String]?  {
        return supportLanguages?.map{convertCodeToReadable(langCode: $0)}
    }
    
    
    private let humanLangs:[String:String] = [
        "zh-Hans":"简体中文"
        ,"zh-Hant":"繁體中文"
        ,"en":"English"
        ,"ja":"日本語"
        ,"id":"Orang indonesia"
        ,"ru":"русский"
        ,"ar":"العربية"]
    
    init() {
        supportLanguages = Bundle.main.localizations
        recommendLanguage = Bundle.main.preferredLocalizations
        currentLanguage = UserDefaults.standard.stringArray(forKey: "AppleLanguages")?.first ?? "en"
        if let index = supportLanguages?.firstIndex(of: "Base") {
            supportLanguages?.remove(at: index)
        }
        // 将当前语言排在第一位
        if let index = supportLanguages?.firstIndex(of: currentLanguage) {
            supportLanguages?.remove(at: index)
            supportLanguages?.insert(currentLanguage, at: 0)
        }
        if let bundlePath = Bundle.main.path(forResource: currentLanguage, ofType: "lproj"), let bundle = Bundle(path: bundlePath)  {
          languageBundle = bundle
        }
    }
    
    /// 修改程序语言
    /// - Parameter language: 程序语言
    /// ["ar", "zh-Hans", "ja", "en", "zh-Hant", "ru", "id"]
   public func change(to language:String) {
        if !language.isEmpty  && language != currentLanguage {
            if let support = supportLanguages, support.contains(language) {
                UserDefaults.standard.set([language], forKey: "AppleLanguages")
                currentLanguage = language
                if let bundlePath = Bundle.main.path(forResource: currentLanguage, ofType: "lproj"), let bundle = Bundle(path: bundlePath)  {
                  languageBundle = bundle
                }
                // 服务端lang code
                var serverLang:String = currentLanguage
                switch currentLanguage {
                case "zh-Hans":
                    serverLang = "cn"
                case "zh-Hant":
                    serverLang = "tc"
                default:
                    break
                }
                NotificationCenter.default.post(name: .LanguageChanged, object: serverLang)
            }
        }
    }
    
    /// 返回本地化的字符串
    /// - Parameter key: key
    /// 有更简单的调用方法，使用String的扩展属性localizedString
   public func localized(_ key:String) -> String {
        return languageBundle.localizedString(forKey: key, value: key, table: nil)
    }
    
   public func convertCodeToReadable(langCode:String) -> String {
        return humanLangs[langCode] ?? langCode
    }
    
   public func convertReadableToCode(readableLang:String) -> String {
        return humanLangs.first { $0.value == readableLang}?.key ?? readableLang
    }
    
}


public extension String {
    var localizedString:String {
        return LocalizeManager.shared.localized(self)
    }
}

public extension Notification.Name {
    static let LanguageChanged = Notification.Name("LanguageChanged")
}
