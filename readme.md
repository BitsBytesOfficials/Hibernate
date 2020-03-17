> # 12/03/2020
   1. **Steps.md is for first steps**
2.	**Important**
	1. Commit the Transaction 
	     __sess.getTransaction().commit();__
	2. close the Session
		__sess.close();factory.close();__
> # 13/03/2020
 1. HyperWeb User class execute and Create Program ( :thumbsup: )
 2. HSQL we used .That help to increase the performance . This can we  connect with any DB
 3. we should create the __Query__ Object create and 
	 1. __public int executeUpdate()__ is used to execute the update or delete query.
	 2. __public List list()__ returns the result of the ralation as list.
	 3. __public Query setFirstResult(int rowno)__ specified the row number from where record will be retrive
	 4. __setParameter()__ like the PreparedStatement
	#### QuerySyantx 
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
	1. EmployeeCollection added with the **java.util.Set**  for PhoneNumbers;
	2. EmployeeCollection.hb.xml started
# 17/03/2020
   ## HibernateDemo
 ### Manipulation.jsp
    1.) Update the User Record where Id is 1

__String hql="update User set password=:password where id=:id";__
__Query query=sess.createQuery(hql);__
__query.setParameter("password","testing123");__
__query.setParameter("id",1);__
__int rowAffected=query.executeUpdate();__
__if(rowAffected>0){__
__out.println("Updated"+rowAffected+" rows.");__
__}__
	2.) Delete the User where Id is 3

	
__String hql1="delete from User where id=:id";__
__Query query1=sess.createQuery(hql1);__
__query1.setParameter("id",3);__
__rowAffected=query1.executeUpdate();__
__if(rowAffected>0){__
__out.println("Number of Record Deleted "+rowAffected);__
__}__

### Criteria.jsp
1. import the __org.hibernate.criterion.*__
2. Create Object 
__Criteria cr=sess.createCriteria(User.class)__ //any class with **CLASSName.class** extenstion
#### For Where Clause we use **Restriction Class** in **add()** 
cr.add(Restrictions.eq("column_name","value"));
###### Equal
cr.add(__Restrictions.eq("salary",10000)__); 
###### LIKE
cr.add(__Restrictions.like("name","d%")__)
##### Greater than
cr.add(__Restrictions.gt("salary",10000)__);
##### Less Than 
cr.add(__Restrictions.lt("salary",10000)__);

##### OrderBy  using add()
cr.addOrder(__Order.asc("name")__)
cr.addOrder(__Order.desc("name")__)

##### Restrict the ResultSet
cr.__setMaxResults(<Integer Value>)__