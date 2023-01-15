create schema amusment_park;
set search_path = "amusment_park";
create Table PhotoIdProof (photoid_number varchar(20) 
primary key, id_type varchar(50), image_link text);

create Table customer (cust_id varchar(20) primary key,
 cust_name varchar(50),gender char, email varchar(50), 
 phone varchar, pid varchar(20),FOREIGN KEY (pid) REFERENCES photoidproof(photoid_number));


 create Table employee(emp_id varchar(20) primary key, emp_name varchar(50),gender char, email varchar(50), 
 phone varchar, pid varchar(20),FOREIGN KEY (pid) REFERENCES photoidproof(photoid_number));
 
 create Table location (location_id varchar primary key, latitude numeric, longitude numeric, location_description varchar);

create Table food_shops (shop_no varchar  primary key, shop_name varchar, capacity integer, shop_location varchar,FOREIGN KEY (shop_location) REFERENCES location(location_id));
create Table food_items (item_no integer primary key , item_name varchar, rate numeric);
create table food_shop_item_relation (shop_no varchar, item_no integer, FOREIGN KEY (shop_no) REFERENCES food_shops(shop_no), FOREIGN KEY (item_no) REFERENCES food_items(item_no) );
create Table food_order (order_id integer primary key , food_item_no integer, shop_number varchar, cust_id varchar, order_date date, qty integer
						FOREIGN KEY (food_item_no) REFERENCES food_items(item_no),
						FOREIGN KEY (shop_number) REFERENCES food_shops(shop_no),
						FOREIGN KEY (cust_id) REFERENCES customer(cust_id));
create Table events (event_id varchar primary key, event_name varchar(20),event_date date,capacity integer,event_time TIME,duration numeric
                    ,loc varchar,
                    FOREIGN KEY (loc) REFERENCES location(location_id)
					); 

create Table event_tickets (tno varchar primary key, no_of_seats integer,rate integer ,cust_id varchar ,event_id varchar,
                    FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
					FOREIGN KEY (event_id) REFERENCES events(event_id)); 

create Table ride (ride_id varchar primary key, capacity integer,ride_name varchar ,price numeric, min_height numeric, min_age integer);

create Table ride_ticket(tno varchar primary key, ride_date date, ride_time time, ride_id varchar, cust_id varchar, 
                    FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
					FOREIGN KEY (ride_id) REFERENCES ride(ride_id)); 
create table items (item_code varchar primary key, item_name varchar, rate numeric);
create table invoice(invoice_number integer primary key, cust_id varchar,purchase_date Date , purchace_time time);
create table invoice_details(invoice_number integer, item_code varchar,qty integer,
                    FOREIGN KEY (item_code) REFERENCES items(item_code),
					FOREIGN KEY (invoice_number) REFERENCES invoice(invoice_number));             
create table break_down_records(br_id varchar PRIMARY KEY, reporting_date date, reporting_time time, ride_id varchar,
                         FOREIGN KEY (ride_id) REFERENCES ride(ride_id));
create table maintaince_ticket(ticket_number varchar, cost integer, contact_number varchar, M_date date, bid varchar, rid varchar,
                            FOREIGN KEY (bid) REFERENCES break_down_records(br_id),
					  FOREIGN KEY (rid) REFERENCES ride(ride_id));
					  
create table lost_and_found (complaint_id varchar primary key, item_name varchar, item_desc text,
loc_id varchar, cust_id varchar ,FOREIGN KEY (cust_id)
 REFERENCES customer(cust_id),FOREIGN KEY (loc_id) REFERENCES location(location_id));

create table department (dept_id varchar primary key, dept_name varchar, manager varchar, FOREIGN KEY (manager) REFERENCES employee(emp_id));
create table salaried_employee (emp_id varchar ,post varchar ,salary integer,dept_id varchar
							 FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
							 ,FOREIGN KEY (dept_id) REFERENCES department(dept_id));
create table contractual_employee (emp_id varchar, start_date  date ,end_date date ,total_contract_wages integer, profession varchar ,FOREIGN KEY (emp_id) REFERENCES employee(emp_id));
create table supplies (sup_id varchar primary key, item_name varchar, price integer);
create table supply_order ( order_id varchar primary key, sup_id varchar , qty integer, manager varchar, order_date date ,
						   FOREIGN KEY (manager) REFERENCES employee(emp_id)
						  ,FOREIGN KEY (sup_id) REFERENCES supplies(sup_id)
						  );
create Table perfroms_at (emp_id varchar ,event_id varchar,
                    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
					FOREIGN KEY (event_id) REFERENCES events(event_id)); 
 
