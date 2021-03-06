//
//  EPExtensions.swift
//  EPCalendar
//
//  Created by Prabaharan Elangovan on 29/11/15.
//  Copyright © 2015 Prabaharan Elangovan. All rights reserved.
//

import Foundation
import UIKit

//MARK: UIViewController Extensions

extension UIViewController {
    
    func showAlert(_ message: String) {
        showAlert(message, andTitle: "")
    }
    
    func showAlert(_ message: String, andTitle title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: UICollectionView Extension
extension UICollectionView {
    
    func scrollToIndexpathByShowingHeader(_ indexPath: IndexPath) {
        let sections = self.numberOfSections
        
        if indexPath.section <= sections{
            let attributes = self.layoutAttributesForSupplementaryElement(ofKind: UICollectionElementKindSectionHeader, at: indexPath)
            let topOfHeader = CGPoint(x: 0, y: attributes!.frame.origin.y - self.contentInset.top)
            self.setContentOffset(topOfHeader, animated:false)
        }
    }
}

//MARK: Range Extensions

extension Range where Bound: Strideable {
    
    var length: Bound.Stride {
        return lowerBound.distance(to: upperBound)
    }
}

//MARK: Date Extensions

extension Date {
    
    func sharedCalendar(){
        
    }
    
    func firstDayOfMonth () -> Date {
        let calendar = Calendar.current
        var dateComponent = calendar.dateComponents([.year, .month, .day ], from: self)
        dateComponent.day = 1
        return calendar.date(from: dateComponent)!
    }
    
    init(year : Int, month : Int, day : Int) {
        
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        dateComponent.year = year
        dateComponent.month = month
        dateComponent.day = day
        self.init(timeInterval:0, since:calendar.date(from: dateComponent)!)
    }
    
    func dateByAddingMonths(_ months : Int ) -> Date {
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        dateComponent.month = months
        return calendar.date(byAdding: dateComponent, to: self)!
    }
    
    func dateByAddingDays(_ days : Int ) -> Date {
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        dateComponent.day = days
        return calendar.date(byAdding: dateComponent, to: self)!
    }
    
    func hour() -> Int {
        let calendar = Calendar.current
        let dateComponent = calendar.dateComponents([.hour], from: self)
        return dateComponent.hour!
    }
    
    func second() -> Int {
        let calendar = Calendar.current
        let dateComponent = calendar.dateComponents([.second], from: self)
        return dateComponent.second!
    }
    
    func minute() -> Int {
        let calendar = Calendar.current
        let dateComponent = calendar.dateComponents([.minute], from: self)
        return dateComponent.minute!
    }
    
    func day() -> Int {
        let calendar = Calendar.current
        let dateComponent = calendar.dateComponents([.day], from: self)
        return dateComponent.day!
    }
    
    func weekday() -> Int {
        let calendar = Calendar.current
        let dateComponent = calendar.dateComponents([.weekday], from: self)
        return dateComponent.weekday!
    }
    
    func month() -> Int {
        let calendar = Calendar.current
        let dateComponent = calendar.dateComponents([.month], from: self)
        return dateComponent.month!
    }
    
    func year() -> Int {
        let calendar = Calendar.current
        let dateComponent = calendar.dateComponents([.year], from: self)
        return dateComponent.year!
    }
    
    func numberOfDaysInMonth() -> Int {
        let calendar = Calendar.current
        let days = calendar.range(of: .day, in: .month, for: self)!
        return days.length
    }
    
    func dateByIgnoringTime() -> Date {
        let calendar = Calendar.current
        let dateComponent = calendar.dateComponents([.year, .month, .day ], from: self)
        return calendar.date(from: dateComponent)!
    }
    
    func monthNameFull() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM YYYY"
        return dateFormatter.string(from: self)
    }
    
    func isSunday() -> Bool
    {
        return (self.getWeekday() == 1)
    }
    
    func isMonday() -> Bool
    {
        return (self.getWeekday() == 2)
    }
    
    func isTuesday() -> Bool
    {
        return (self.getWeekday() == 3)
    }
    
    func isWednesday() -> Bool
    {
        return (self.getWeekday() == 4)
    }
    
    func isThursday() -> Bool
    {
        return (self.getWeekday() == 5)
    }
    
    func isFriday() -> Bool
    {
        return (self.getWeekday() == 6)
    }
    
    func isSaturday() -> Bool
    {
        return (self.getWeekday() == 7)
    }
    
    func getWeekday() -> Int {
        let calendar = Calendar.current
        return calendar.dateComponents([.weekday], from: self).weekday!
    }
    
    func isToday() -> Bool {
        return self.isDateSameDay(Date())
    }
    
    func isDateSameDay(_ date: Date) -> Bool {

         return (self.day() == date.day()) && (self.month() == date.month() && (self.year() == date.year()))

    }
}
