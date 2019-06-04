/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    BindUserList(1, 10);
});
//function DateFormatter(value, row, index) {
//    return moment(value).format('MM/DD/YY');
//}
function QueryParams(params) {
    var pageNumber = (params.pageNumber === undefined) ? params.offset : params.pageNumber;
    var pageSize = (params.pageSize === undefined) ? params.limit : params.pageSize;
    var sortName = (params.sortName === undefined) ? params.sort : params.sortName;
    var sortOrder = (params.sortOrder === undefined) ? params.order : params.sortOrder;
    params = {'getRequest': "getUserList", 'pageNumber': pageNumber, 'pageSize': pageSize, 'searchText': $('#txtSrchSearchBy').val(), 'sortName': sortName, 'sortOrder': sortOrder};
    return params;
}
function BindUserList() {
    //var url = $BaseURL + '/User/User/GetExpenseList?pageNo=' + pageNo + '&pageSize=' + pageSize + '&searchBy=' + $('#txtSrchSearchBy').val() + '&startDate=' + $('#txtSrchStartDate').val() + '&endDate=' + $('#txtSrchEndDate').val();
    var url = $BaseURL + '/SlotSwap/Admin/UserList';
    try {
        $('#tblUserList').bootstrapTable('destroy');
        $('#tblUserList').bootstrapTable({
            method: 'get',
            url: url,
            striped: true,
            pagination: true,
            sidePagination: "server",
            pageSize: 50,
            pageList: [10, 25, 50, 100, 200],
            queryParams: QueryParams,
            columns: [
//                {
//                    field: '#',
//                    title: '#',
//                    width: '80',
//                    align: 'right',
//                    sortable: true
//                },
                {
                    field: 'firstName',
                    title: 'First Name',
                    width: '80',
                    align: 'left',
                    sortable: true
                },
                {
                    field: 'lastName',
                    title: 'Last Name',
                    align: 'left',
                    valign: 'top',
                    width: '150',
                    sortable: true
                            //,formatter: DateFormatter

                },
                {
                    field: 'email',
                    title: 'Email Id',
                    align: 'left',
                    valign: 'top',
                    width: '80',
                    sortable: true
                },
                {
                    field: 'manager',
                    title: 'Manager',
                    align: 'left',
                    valign: 'top',
                    width: '80',
                    sortable: false
                },
                {
                    field: 'weeklyHours',
                    title: 'Weekly Hours',
                    align: 'left',
                    valign: 'top',
                    width: '80',
                    sortable: false
                },
                {
                    title: 'Action',
                    valign: 'top',
                    width: '80',
                    sortable: false,
                    formatter: EditUser
                }
            ]

        });
    } catch (e) {
        alert("Error occured while processing your request. Please try after some time:" + e)
    }

}
;
function SearchExpenseList() {
    BindUserList(1, 10);
}
function ResetExpenseList() {
    $('#txtSrchSearchBy').val("");
    BindUserList(1, 10);
}
//    function rowStyle(row, index) {
//        if (!row.CanComment) {
//            return {};
//        }
//        return { classes: 'bkgcolor' };
//    }

function EditUser(value, row, index) {
    return '<a href="AddUser" title="Edit"> <img src="../images/ViewEdit.png" /></a><a href="#" title="Delete"><img src="../images/Delete.png" /></a>';
}