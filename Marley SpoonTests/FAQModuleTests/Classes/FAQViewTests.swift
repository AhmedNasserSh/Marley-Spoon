//
//  FAQViewTests.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import XCTest
@testable import Marley_Spoon

class FAQViewTests: XCTestCase {
    
    
    var view: FAQSceneViewController?
    var interactor: FAQInteractorMock?
    
    override func setUpWithError() throws {
        view = FAQSceneViewController()
        interactor = FAQInteractorMock()
        view?.interactor = interactor
    }
    
    override func tearDownWithError() throws {
        view = nil
        interactor = nil
    }
    
    func testInitUI() throws {
        view?.viewDidLoad()
        
        XCTAssertTrue(interactor!.didCallFetchFAQ, "view dosen't call interactor on intilization")
    }
    
    
    
    
}
