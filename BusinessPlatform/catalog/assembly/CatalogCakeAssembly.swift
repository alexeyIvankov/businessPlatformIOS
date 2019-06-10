//
//  CatalogAssembly.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import Cocaine

@objc(CatalogCakeAssembly)
public class CatalogCakeAssembly : AssemblyProviderImpl {
    
    public override func assembly() -> I_Assembly? {
        
        return Assembly.init(buildType:ICatalogCake.self, memoryPolicy: MemoryPolicy.Strong, instanceScope: InstanceScope.Singleton, buildBlock: { (injector:I_Injector) -> AnyObject in
            
            let router:ICatalogRouter = CatalogRouter()
            let director:ICatalogDirector = CatalogDirector()
            
            let cake:ICatalogCake = CatalogCake(director: director, router: router)
            
            return cake
        })
    }
    
    public override static func buildType() -> Any {
        return ICatalogCake.self
    }
}
