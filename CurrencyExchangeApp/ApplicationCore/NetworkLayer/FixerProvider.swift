//
//  FixerProvider.swift
//  CurrencyExchangeApp
//
//  Created by Kiro on 10/10/20.
//  Copyright © 2020 Kiro. All rights reserved.
//

import Foundation
import Moya

public enum FixerApi {
    case latest(base: String)
}

extension FixerApi: TargetType {
    
    public var headers: [String: String]? {
        return nil
    }
    
    public var baseURL: URL {
        return URL(string: "http://data.fixer.io/api")!
    }
    
    public var path: String {
        switch self {
        case .latest:
            return "/latest"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Task {
        let baseParameters = [FixerParams.access_key.rawValue: AppConstants.apiFixerKey]
        switch self {
        case .latest(let base):
            var parameters = [FixerParams.base.rawValue : base]
            parameters.merge(dict: baseParameters)
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    public var sampleData: Data {
         return "".data(using: String.Encoding.utf8)!
    }
}


enum FixerParams: String {
    case access_key
    case base
}
