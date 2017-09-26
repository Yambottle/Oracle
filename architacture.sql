/*
DATABASE STRUCTURE

//PHYSICS STRUCTURE
1.Datafiles:
  (1)first read,put into cache for second time quick reading;
  (2)Database Write Process, writing into buffer(tempfiles);
2.Control Files:
  (1)like a reference file, contains names and locations;
  (2)when an instance started, this file will locate some data files for 
  it;
  (3)instance:SGA;...;...;
3.Redo Log Files:
  (1)record opreation to protect altered database;
  (2)two kinds: online redo log:/archive redo log;
4.Parameter File:
  (1)contain configuratons;
  (2)pfiles(init param/text)/spfiles(best way)(server param/binary);
  (3)names,locations,limits;
5.Alert and Trace Log Files:
  (1)Trace Files:some errors;
  (2)some automation and assistance:ADR(auto diagnostic repository), 
                                    IPS(incident packageing service);
6.Back up file:copy of data
  (1)datafiles, control files, spfiles;
  (2)back up recovery strategy:Recovery Manager:tool, can create a 
  session on recovery activity

//LOGICAL STRUCTURE
1.Database Block:organize
2.Extents:contains data block
3.Segments:contains extents, auto growth
4.Tablespace:tables, auto sys-tables;
             read-only mode;
        
//SCHEMAS:
  (1)collection of DB objects
  (2)owned by DB user, and had same name
  (3)

//DATABASE OBJECT:all of what you created

//DATA DICTIONARY:

//DATABASE INSTANCE:(1)SGA(sys bg area) located

//Real Application Clusters:share data 



  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  