/*********************************************
 *
 * This code is under the MIT License (MIT)
 *
 * Copyright (c) 2016 AliSoftware
 *
 *********************************************/

import UIKit

public protocol NibLoadable: class {
  static var nib: UINib { get }
}

public extension NibLoadable {
  static var nib: UINib {
    return UINib(nibName: String(self), bundle: NSBundle(forClass: self))
  }
}


public extension NibLoadable where Self: UIView {
  static func loadFromNib() -> Self {
    guard let view = nib.instantiateWithOwner(nil, options: nil).first as? Self else {
      fatalError("The nib \(nib) expected its root view to be of type \(self)")
    }
    return view
  }
}
