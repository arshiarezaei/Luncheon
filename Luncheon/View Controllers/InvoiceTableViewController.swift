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
//        tableView.frame  = self.view.frame
//        self.view.addSubview(tableView)
        tableView.register(InvoiceTableViewCell.self, forCellReuseIdentifier: "invoiceTableViewControllerCell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        debugPrint("inja")
        return invoice.count
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return InvoiceTableViewCell()
//    }

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
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
