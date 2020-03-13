# steps
	1.)create Maven project
	2.) Create Database config file(hibernate.cfg.xml)
		if any version not shown then go to 
	
			Help->Eclipse Market Place->Jboss->Install/change->
			select [hibernate tool+ marven hibernate configuration+maven maven Integration]
	3.) create new file and then search hibernate and hibernate config xml came
	4.)then do next next then config page came and then write the configuration according the database
	5.)add one tag  in hibernate.cfg.xml inside the <session-factory>
		<mapping resource="user.hbm.xml"/>
	6.) Now create a Pojo class
		in pojo class must have one ID type INT as primary Key
	7.)new->hibernate XML MAPPING file -> Add Class [Select the class]
	       a file is created then (<fileName>.hbm.xml)

 ## HibernateDemo
### Employee.hbm.xml

In FileName.hbm.xml having one tag name is generator 

genrator tag class having 4 options [assigned/native/increment/?]
### Hibernate.cfg.xml

 <session-factory>

	1.)added 
	> <property name="hbm2ddl.auto"> *create* </property> 
		create for creating the schema
	             or
	  _ <property name="hbm2ddl.auto"> *update* </property> _
	     update for update the schema		     
        <property name="hibernate.connection.driver_class">com.mysql.jdbc.Driver</property>
        <property name="hibernate.connection.password">root</property>
        <property name="hibernate.connection.url">jdbc:mysql://localhost:3307/hibernatedb</property>
        <property name="hibernate.connection.username">root</property>
        <property name="hibernate.dialect">org.hibernate.dialect.MySQLDialect</property>
       2.)  <mapping resource="user.hbm.xml"/>
           >changed
        <mapping resource="Employee.hbm.xml"/>
        
    </session-factory>
_________________________________________________________________________________

______________________________________________________________________________>
## HyberWeb Project

---______----___-__--__-____-______-----______-_------_--------_____----__-_--_____

1.)Create java folder if not there  
