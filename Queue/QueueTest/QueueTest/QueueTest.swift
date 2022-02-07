//
//  QueueTest.swift
//  QueueTest
//
//  Created by NiKhil AroRa on 07/02/22.
//

import XCTest

class QueueTest: XCTestCase {

    func testEmpty() {
        var queues = QueueS<Int>()
        XCTAssertTrue(queues.isEmpty)
        XCTAssertEqual(queues.count, 0)
        XCTAssertEqual(queues.front, nil)
        XCTAssertNil(queues.dequeue())
        
        
        var queueo = QueueO<Int>()
        XCTAssertTrue(queueo.isEmpty)
        XCTAssertEqual(queueo.count, 0)
        XCTAssertEqual(queueo.front, nil)
        XCTAssertNil(queueo.dequeue())
    }
    
    func testOneElement() {
        var queues = QueueS<Int>()
        
        queues.enqueue(123)
        XCTAssertFalse(queues.isEmpty)
        XCTAssertEqual(queues.count, 1)
        XCTAssertEqual(queues.front, 123)
        
        let results = queues.dequeue()
        XCTAssertEqual(results, 123)
        XCTAssertTrue(queues.isEmpty)
        XCTAssertEqual(queues.count, 0)
        XCTAssertEqual(queues.front, nil)
        
        var queueo = QueueO<Int>()
        queueo.enqueue(123)
        XCTAssertFalse(queueo.isEmpty)
        XCTAssertEqual(queueo.count, 1)
        XCTAssertEqual(queueo.front, 123)
        
        let resulto = queueo.dequeue()
        XCTAssertEqual(resulto, 123)
        XCTAssertTrue(queueo.isEmpty)
        XCTAssertEqual(queueo.count, 0)
        XCTAssertEqual(queueo.front, nil)
    }
    
    func testTwoElement(){
        var queues = QueueS<Int>()
        
        queues.enqueue(123)
        queues.enqueue(456)
        XCTAssertFalse(queues.isEmpty)
        XCTAssertEqual(queues.count, 2)
        XCTAssertEqual(queues.front, 123)
        
        let result1 = queues.dequeue()
        XCTAssertEqual(result1, 123)
        XCTAssertFalse(queues.isEmpty)
        XCTAssertEqual(queues.count, 1)
        XCTAssertEqual(queues.front, 456)
        
        let result2 = queues.dequeue()
        XCTAssertEqual(result2, 456)
        XCTAssertTrue(queues.isEmpty)
        XCTAssertEqual(queues.count, 0)
        XCTAssertEqual(queues.front, nil)
        
        var queueo = QueueO<Int>()
        queueo.enqueue(123)
        queueo.enqueue(456)
        XCTAssertFalse(queueo.isEmpty)
        XCTAssertEqual(queueo.count, 2)
        XCTAssertEqual(queueo.front, 123)
        
        let result3 = queueo.dequeue()
        XCTAssertEqual(result3, 123)
        XCTAssertFalse(queueo.isEmpty)
        XCTAssertEqual(queueo.count, 1)
        XCTAssertEqual(queueo.front, 456)
        
        let result4 = queueo.dequeue()
        XCTAssertEqual(result4, 456)
        XCTAssertTrue(queueo.isEmpty)
        XCTAssertEqual(queueo.count, 0)
        XCTAssertEqual(queueo.front, nil)
    }
    
    func testMakeEmpty() {
        var queues = QueueS<Int>()
        
        queues.enqueue(123)
        queues.enqueue(456)
        
        XCTAssertNotNil(queues.dequeue())
        XCTAssertNotNil(queues.dequeue())
        XCTAssertNil(queues.dequeue())
        
        queues.enqueue(789)
        XCTAssertEqual(queues.count, 1)
        XCTAssertEqual(queues.front, 789)
        
        let result = queues.dequeue()
        XCTAssertEqual(result, 789)
        XCTAssertTrue(queues.isEmpty)
        XCTAssertEqual(queues.count, 0)
        XCTAssertEqual(queues.front, nil)
        
        var queueo = QueueO<Int>()
        
        queueo.enqueue(123)
        queueo.enqueue(456)
        
        XCTAssertNotNil(queueo.dequeue())
        XCTAssertNotNil(queueo.dequeue())
        XCTAssertNil(queueo.dequeue())
        
        queueo.enqueue(789)
        XCTAssertEqual(queueo.count, 1)
        XCTAssertEqual(queueo.front, 789)
        
        let result1 = queueo.dequeue()
        XCTAssertEqual(result1, 789)
        XCTAssertTrue(queueo.isEmpty)
        XCTAssertEqual(queueo.count, 0)
        XCTAssertEqual(queueo.front, nil)
    }

}
