//
//  StringTests.swift
//  Vipect_Example
//
//  Created by Saul Moreno Abril on 2/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import Vipect

class StringTests: QuickSpec {
    override func spec() {
        describe("String") {
            beforeEach {}

            context("as safe") {
                it("if it is nil") {
                    let optionalObject: String? = nil
                    let nonOptionalString = optionalObject.safeString
                    expect(nonOptionalString) == ""
                }

                it("if it is not nil") {
                    let optionalObject: String? = "Hey there"
                    let nonOptionalString = optionalObject.safeString
                    expect(nonOptionalString) == optionalObject
                }
            }

            it("can uppercase the first letter") {
                let noUpperCased = "hey there"
                let uppercasedFirst = noUpperCased.uppercasedFirst
                expect(uppercasedFirst) == "Hey there"
            }
        }
    }
}
