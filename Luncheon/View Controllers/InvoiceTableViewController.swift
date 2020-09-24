//
//  InvoiceTableViewController.swift
//  Luncheon
//
//  Created by arshiya on 9/23/20.
//  Copyright © 2020 ir.luncheon. All rights reserved.
//

import UIKit

class InvoiceTableViewController: UITableViewController {
//    private let tableView = UITableView()
    private var invoice:[InvoiceItem]  = []
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultInvoiceItem()
        self.view.layer.cornerRadius = 16
        self.tableView.rowHeight = 50
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(InvoiceTableViewCell.self, forCellReuseIdentifier: "invoiceTableViewControllerCell")
        

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        debugPrint("inja")
        return invoice.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        debugPrint("s")
        let cell = tableView.dequeueReusableCell(withIdentifier: "invoiceTableViewControllerCell", for: indexPath) as! InvoiceTableViewCell

        // Configure the cell...
        cell.setupCell(title: invoice[indexPath.row].getTitle , value: invoice[indexPath.row].getValue)

        return cell
    }
    

    private func defaultInvoiceItem(){
        let i1:InvoiceItem = InvoiceItem(title: "جمع سفارش", value: 40000)
        let i2:InvoiceItem = InvoiceItem(title: " مالیات", value:0)
        let i3:InvoiceItem = InvoiceItem(title: "بسته بندی", value: 0)
        let i4:InvoiceItem = InvoiceItem(title:"هزینه ارسال" , value: 3000)
        let i5:InvoiceItem = InvoiceItem(title: "تخفیف", value: 0)
        let i6:InvoiceItem = InvoiceItem(title: "جمع سفارش", value: 43000)
        self.invoice = [i1,i2,i3,i4,i5,i6]
    }

}
