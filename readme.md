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



# 18/02/2020 working in HyberWeb
 > Hibernate Collections Mapping
    + Employee.java (Collection File)
	+ Employee.hbm.xml (Mapping file)
	    <hibernate-mapping>
   <class name="com.niit.hyberweb.Employee" table=" __EMPLOYEE200__ ">
        <id name="employeeId" type="int">
            <column name="EMPLOYEEID" />
   <generator class=" **increment** "  />
        </id>
        <property name="employeeName" type="java.lang.String">
            <column name="EMPLOYEENAME" />
        </property>
  <set name="phoneNumbers" table="**EMP_PHONE**" inverse="false" lazy="true">
            <key>
                <column name="EMPLOYEEID" />
            </key>
            <element type="java.lang.String">
                <column name="PHONENUMBER" />
            </element>
        </set>
    </class>
</hibernate-mapping>

## lazy=true means employee200 is parent and emp_phone is the child one


# HAS-A Relationship between Address and Emp Class  in HyperWeb
    ## STEPS
1. create POJO  *ADDRESS* class 
2. create POJO *EMP* class
3. create EMP.hbm.xml mapping file of EMP.java
4.  for Aggregation we change the EMP.hbm.xml

		<component name="address" class="com.niit.hyberweb.Address">
			<property name="city"></property>
			<property name="country" type="java.lang.String">

			</property>
			<property name="pincode" type="int">

			</property>
		</component>

# Inheritence Mapping Relationship [parent class object also created so we need to upcast that]
> In HyberWeb having
 1. Person1.java (POJO [Parent of Employee1])
 2. Employee1.java( POJO [child of Person1])
 3. Mapping class (Person1.hbm.xml)
    3.1. [<subclass name="Employee1" extends="Person1" discriminator-value="E">
			<property name="departmentName" column="department_name" />
<property name="joiningDate" type="date" column="joining_date" />
</subclass> ] add before closing the class tag

    3.2. <hibernate-mapping **package="com.niit.hyberweb"**>
	3.3. <class name="Person1" table="Person_Inherit_Mapping" **discriminator-value="P"**>
    3.4.  + <discriminator column="DISCRIMINATOR" type="string"/>
