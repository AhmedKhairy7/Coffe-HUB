//
//  CartTableViewCell.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 10/09/2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var cartName: UILabel!
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    var itemCart: CoffeeCart?
    
    var total = 0.0
    var totalNow = 0.0
    var count = 0
    var delegate: CartDataProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        cornerRaduis(myView: backGroundView)
        
    }
    
    func cornerRaduis(myView:UIView) {
        myView.layer.cornerRadius = 10
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        count = count - 1
        quantityLabel.text = "\(count)"
        total = totalNow - (Double(itemCart?.price  ?? "0.0") ?? 0.0)
        updateNewCout(count:count,total: total)
        delegate.updateCart(count: count, total: total, price: total/Double(count))
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        count = count + 1
        quantityLabel.text = "\(count)"
        total = totalNow + (Double(itemCart?.price  ?? "0.0") ?? 0.0)
        updateNewCout(count:count,total: total)
        delegate.updateCart(count: count, total: total, price: total/Double(count))
    }
    
    func updateNewCout(count:Int,total:Double) {
        guard let item = itemCart else {
            return
        }
        DatabaseManger.shared.updateDataOfCart(name: item.name, price: "\(item.price)", totalPrice: String(total), countCoffee: String(count), image: item.image , type: item.type)
    }
    
}

protocol CartDataProtocol{
    func updateCart(count: Int, total: Double,price:Double)
}
