#steps
	1.)create Maven project
	2.) Create Database config file(hibernate.cnf.xml)
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
	8.)
