//
//  Observer.swift
//  Landiak06
//
//  Created by Andrew Landiak on 03.11.2020.
//

import Foundation

protocol Observer {
    var id: Int {get}
    func update<T>(with newValue: T)
}

protocol Observable {
    associatedtype T
    var value: T { get set}
    var observers: [Observer] { get set }
    
    func add(obs: Observer)
    func remove(obs: Observer)
    func notify<T>(with newValue: T)
}

class Variable<T>: Observable {
    private var _val : T! = nil
    private var _obs : [Observer] = []
    
    var value: T {
        get {
            return self._val
        }
        set {
            self._val = newValue
            self.notify(with: newValue)
        }
    }
    
    var observers: [Observer] {
        get {
            return self._obs
        }
        set {
            self._obs = newValue
        }
    }
    
    func add(obs: Observer) {
        observers.append(obs)
    }
    func remove(obs: Observer) {
        observers = observers.filter({$0.id != obs.id})
    }
    func notify<T>(with newValue: T) {
        for observer in observers {
            observer.update(with: newValue)
        }
    }
}

