//
//  NewsViewController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/5/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var arrList:[[String]] = [["2","A","1","Những thuốc được quảng cáo làm tăng cân có thể chứa chất steroid. Đây là một thuốc thuộc loại kích thích tố tuyến thượng thận, có tác dụng làm tăng cân nhanh và gây những làn rạn nứt ở da. Tôi không thể biết sản phẩm Cậu ghi trong thư thật sự gồm những nguyên liệu và dược chất gì và có chất steroid trong đó hay không."],["1","B","2","Những thuốc được quảng cáo làm tăng cân có thể chứa chất steroid. Đây là một thuốc thuộc loại kích thích tố tuyến thượng thận, có tác dụng làm tăng cân nhanh và gây những làn rạn nứt ở da. Tôi không thể biết sản phẩm Cậu ghi trong thư thật sự gồm những nguyên liệu và dược chất gì và có chất steroid trong đó hay không."],["2","A","1","Những thuốc được quảng cáo làm tăng cân có thể chứa chất steroid. Đây là một thuốc thuộc loại kích thích tố tuyến thượng thận, có tác dụng làm tăng cân nhanh và gây những làn rạn nứt ở da. Tôi không thể biết sản phẩm Cậu ghi trong thư thật sự gồm những nguyên liệu và dược chất gì và có chất steroid trong đó hay không."],["1","B","2","Những thuốc được quảng cáo làm tăng cân có thể chứa chất steroid. Đây là một thuốc thuộc loại kích thích tố tuyến thượng thận, có tác dụng làm tăng cân nhanh và gây những làn rạn nứt ở da. Tôi không thể biết sản phẩm Cậu ghi trong thư thật sự gồm những nguyên liệu và dược chất gì và có chất steroid trong đó hay không."],["2","A","1","Những thuốc được quảng cáo làm tăng cân có thể chứa chất steroid. Đây là một thuốc thuộc loại kích thích tố tuyến thượng thận, có tác dụng làm tăng cân nhanh và gây những làn rạn nứt ở da. Tôi không thể biết sản phẩm Cậu ghi trong thư thật sự gồm những nguyên liệu và dược chất gì và có chất steroid trong đó hay không."],["1","B","2","Những thuốc được quảng cáo làm tăng cân có thể chứa chất steroid. Đây là một thuốc thuộc loại kích thích tố tuyến thượng thận, có tác dụng làm tăng cân nhanh và gây những làn rạn nứt ở da. Tôi không thể biết sản phẩm Cậu ghi trong thư thật sự gồm những nguyên liệu và dược chất gì và có chất steroid trong đó hay không."],["2","A","1","Những thuốc được quảng cáo làm tăng cân có thể chứa chất steroid. Đây là một thuốc thuộc loại kích thích tố tuyến thượng thận, có tác dụng làm tăng cân nhanh và gây những làn rạn nứt ở da. Tôi không thể biết sản phẩm Cậu ghi trong thư thật sự gồm những nguyên liệu và dược chất gì và có chất steroid trong đó hay không."],["1","B","2","Những thuốc được quảng cáo làm tăng cân có thể chứa chất steroid. Đây là một thuốc thuộc loại kích thích tố tuyến thượng thận, có tác dụng làm tăng cân nhanh và gây những làn rạn nứt ở da. Tôi không thể biết sản phẩm Cậu ghi trong thư thật sự gồm những nguyên liệu và dược chất gì và có chất steroid trong đó hay không."],["2","A","1","Những thuốc được quảng cáo làm tăng cân có thể chứa chất steroid. Đây là một thuốc thuộc loại kích thích tố tuyến thượng thận, có tác dụng làm tăng cân nhanh và gây những làn rạn nứt ở da. Tôi không thể biết sản phẩm Cậu ghi trong thư thật sự gồm những nguyên liệu và dược chất gì và có chất steroid trong đó hay không."],["1","B","2","Những thuốc được quảng cáo làm tăng cân có thể chứa chất steroid. Đây là một thuốc thuộc loại kích thích tố tuyến thượng thận, có tác dụng làm tăng cân nhanh và gây những làn rạn nứt ở da. Tôi không thể biết sản phẩm Cậu ghi trong thư thật sự gồm những nguyên liệu và dược chất gì và có chất steroid trong đó hay không."]]
    
    @IBOutlet var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        myTable.rowHeight = UITableViewAutomaticDimension
        myTable.estimatedRowHeight = 140
    }
    //tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        cell.lblHeader.text = "Câu hỏi của người dùng cần tư vấn \(arrList[indexPath.row][0])"
        cell.lblQuestion.text = "Bác sĩ \(arrList[indexPath.row][1]) trả lời \(arrList[indexPath.row][2]) câu hỏi"
        cell.lblAnswer.text = arrList[indexPath.row][3]
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
