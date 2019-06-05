//
//  LoginCakeAssembly.swift
//  IMH_BI
//
//  Created by Alexey Ivankov on 24.08.2018.
//  Copyright © 2018 Industrial Metallurgical Holding. All rights reserved.
//

import Foundation
import Cocaine

@objc(MainCakeAssembly)
public class MainCakeAssembly : AssemblyProviderImpl {
    
    public override func assembly() -> I_Assembly? {
        
        return Assembly.init(buildType:IMainCake.self, memoryPolicy: MemoryPolicy.Strong, instanceScope: InstanceScope.Singleton, buildBlock: { (injector:I_Injector) -> AnyObject in
            
            let loaderService:ILoaderService = injector.tryInject()!
        
            let router = MainRouter(loaderService: loaderService)
            
            let director = MainDirector()
            

            let cake:IMainCake = MainCake(router: router,
                                        director:director)
            
            return cake
        })
    }
    
    public override static func buildType() -> Any {
        return IMainCake.self
    }
}
