//
//  BinarySearchTest.swift
//  BinarySearchTest
//
//  Created by NiKhil AroRa on 24/08/22.
//

import XCTest
import Foundation

class BinarySearchTest: XCTestCase {

    
    var searchList = [Int]()
    
    override func setUp() {
        super.setUp()
        for number in 1...500 {
            searchList.append(number)
        }
    }
    
    func testEmptyArray() {
        let array = [Int]()
        let index = binarySearch(array, key: 123)
        XCTAssertNil(index)
    }
    
    
    

}
