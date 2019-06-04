/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SlotSwap.Entity;

/**
 *
 * @author amitk
 */
public class SearchEntity {
    private int PageNo;
    private int PageSize;
    private String SearchBy;
    private String SortColumn;
    private boolean IsSortOrderAsc;

    public void setPageNo(int PageNo) {
        this.PageNo = PageNo;
    }

    public void setPageSize(int PageSize) {
        this.PageSize = PageSize;
    }

    public void setSearchBy(String SearchBy) {
        this.SearchBy = SearchBy;
    }

    public void setSortColumn(String SortColumn) {
        this.SortColumn = SortColumn;
    }

    public void setIsSortOrderAsc(boolean IsSortOrderAsc) {
        this.IsSortOrderAsc = IsSortOrderAsc;
    }

    public int getPageNo() {
        return PageNo;
    }

    public int getPageSize() {
        return PageSize;
    }

    public String getSearchBy() {
        return SearchBy;
    }

    public String getSortColumn() {
        return SortColumn;
    }

    public boolean isIsSortOrderAsc() {
        return IsSortOrderAsc;
    }
    
}
