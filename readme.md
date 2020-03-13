> # 12/03/2020
   1. **Steps.md is for first steps**

> # 13/03/2020
 1. HyperWeb User class execute and Create Program ( :thumbsup: )
 2. HSQL we used .That help to increase the performance . This can we  connect with any DB
 3. we should create the __Query__ Object create and 
	 1. __public int executeUpdate()__ is used to execute the update or delete query.
	 2. __public List list()__ returns the result of the ralation as list.
	 3. __public Query setFirstResult(int rowno)__ specified the row number from where record will be retrive
	 4. __setParameter()__ like the PreparedStatement
	##### QuerySyantx 
	1. String hql="FROM Employee"; //Select E.firstName from Employee (AS E) / E
	__Query query=session.createQuery(hql);__
	List result=query.list();
    2.  With Where Clause
		String hql="FROM Employee E where E.id>0"; //Select * from Employee E where E.id>0;
		__Query query=session.createQuery(hql);__
		List result=query.list();
	3. Order BY Clause
		
		String hql="FROM Employee order by E.ID desc"; select * from Employee AS E  order by E.ID desc;
		__Query query=session.createQuery(hql);__
		List result=query.list();
	4. Group By
			String hql="FROM Employee order by E.ID desc groub by E.Name"; select * from Employee AS E  order by E.ID desc;
		__Query query=session.createQuery(hql);__
			List result=query.list();
		__Query query=session.createQuery(hql);__
			List result=query.list();

   ## HibernateDemo
	1. EmployeeCollection added with the __java.util.Set__  for PhoneNumbers;
	2. EmployeeCollection.hb.xml started


