## A-DynamicTable

- [A-DynamicTable](#a-dynamictable)
  - [**Structure**](#structure)
  - [**Row Model Usage**](#row-model-usage)
  - [**Header Model Usage**](#header-model-usage)



### ### Structure

<!-- https://yuml.me/edit/7c6d9d58 -->
<!-- 
%2F%2F Cool Class Diagram, [DynamicTableView|-DynamicForm:form]++1-1>[DynamicForm|-Storage:header@RowModel], [DynamicForm]++-0..*>[HeaderModel|-dynamicHeaderView():UIView;-dynamicHeaderHeight():CGFloat;headerDidCreated(UIView)],[DynamicForm]++-0..*>[RowModel|-dynamicCellHeight:CGFloat;-dynamicCell:UITableViewCell;cellDidLoad(UITableViewCell);onRowSelected();]] 
-->

<!-- ![Structure UML](https://yuml.me/7c6d9d58.png)   -->

```
                         +--------------------------------+
                         | *SingleLineCollapsibleHeader   |
                         | *DynamicSectionGroupHeader     | +----------------------------+
+----------------------+ | *BasicCollapsibleHeader     <----+ CollapsibleHeader Protocol |
|  *SingleLineRow      | | *BasicEmptyHeader              | +----------------------------+
+----------------------+ +--------------------------------+
+----------------------+ +--------------------------------+
|                      | |                                |
|    DynamicRowModel   | |       DynamicHeaderModel       |
|                      | |                                |
+----------------------+ +--------------------------------+
+---------------------------------------------------------+
|                                                         |
|                   Dynamic Table From                    |
|                                                         |
+---------------------------------------------------------+
+---------------------------------------------------------+
|                                                         |
|                   Dynamic Table View                    |
|                                                         |
+---------------------------------------------------------+
```

**DynamicTableView**:  
Inherited from `UITableView`, implemented UITableViewDelegate and UITableViewDataSource, the data information are base on `DynamicForm`.

**DynamicForm**  
Custom collection class to storing Header Models and Row Models for that Dynamic Table.  

**HeaderModel**  

The basic header is `DynamicHeaderModel`, all other header models are derived from it. like `BasicEmptyHeader`, `SingleLineCollapsibleHeader`

**RowModel**

Same as header model, the the basic row model is `DynamicRowModel` and all other row model are derived from it.

**Header Protocol**

Header can have different function them display, like make the table able to `collapse`, or with section title. Header protocol is represeting it.





### Usage



#### Row Model Usage



#### Header Model Usage







