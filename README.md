## A-DynamicTable

- [A-DynamicTable](#a-dynamictable)
  - [**Structure**](#structure)
  - [**Row Model Usage**](#row-model-usage)
  - [**Header Model Usage**](#header-model-usage)
  - [TODO:](#todo)


### **Structure**
<!-- https://yuml.me/edit/7c6d9d58 -->
<!-- 
%2F%2F Cool Class Diagram, [DynamicTableView|-DynamicForm:form]++1-1>[DynamicForm|-Storage:header@RowModel], [DynamicForm]++-0..*>[HeaderModel|-dynamicHeaderView():UIView;-dynamicHeaderHeight():CGFloat;headerDidCreated(UIView)],[DynamicForm]++-0..*>[RowModel|-dynamicCellHeight:CGFloat;-dynamicCell:UITableViewCell;cellDidLoad(UITableViewCell);onRowSelected();]] 
-->

![Structure UML](https://yuml.me/7c6d9d58.png)  
**DynamicTableView**:  
Inherited from `UITableView`, implemented UITableViewDelegate and UITableViewDataSource, the data information are base on DynamicForm.

**DynamicForm**  
Custom collection class for storing Header Models and Row Models.  

**HeaderModel**  


**RowModel**


### **Row Model Usage**

### **Header Model Usage**



### TODO:
- Add demo project
- Release cell when it's not needed
- Create common row type
- Add status change event
- Add pre-load fucntion  
- Update the way to handle "group header"
