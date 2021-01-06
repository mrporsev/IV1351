CREATE TABLE guardian (
 id INT NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 age VARCHAR(3) NOT NULL,
 social_security_number VARCHAR(12) NOT NULL
);

ALTER TABLE guardian ADD CONSTRAINT PK_guardian PRIMARY KEY (id);


CREATE TABLE person (
 age VARCHAR(3),
 first_name VARCHAR(500),
 last_name VARCHAR(500),
 social_security_number VARCHAR(12) NOT NULL
);


CREATE TABLE sibling_discount (
 percentage_number VARCHAR(3)
);


CREATE TABLE soundgood_music_school_facility (
 id INT NOT NULL,
 available_spots VARCHAR(500) NOT NULL,
 minimum_student_age VARCHAR(2) NOT NULL
);

ALTER TABLE soundgood_music_school_facility ADD CONSTRAINT PK_soundgood_music_school_facility PRIMARY KEY (id);


CREATE TABLE student (
 id INT NOT NULL,
 sibling VARCHAR(2),
 age VARCHAR(3) NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 social_security_number VARCHAR(12) NOT NULL,
 guardian_id INT,
 school_Id INT
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE administrative_staff (
 id INT NOT NULL,
 role VARCHAR(500),
 school_id INT NOT NULL
);

ALTER TABLE administrative_staff ADD CONSTRAINT PK_administrative_staff PRIMARY KEY (id);


CREATE TABLE application (
 student_id INT NOT NULL,
 admin_id INT NOT NULL
);

ALTER TABLE application ADD CONSTRAINT PK_application PRIMARY KEY (student_id,admin_id);


CREATE TABLE audition (
 student_id INT NOT NULL,
 admin_id INT NOT NULL,
 date DATE,
 grade VARCHAR(10) NOT NULL
);

ALTER TABLE audition ADD CONSTRAINT PK_audition PRIMARY KEY (student_id,admin_id);


CREATE TABLE children (
 guardian_id INT NOT NULL,
 amount VARCHAR(10) NOT NULL
);

ALTER TABLE children ADD CONSTRAINT PK_children PRIMARY KEY (guardian_id);


CREATE TABLE instructor (
 id INT NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 age VARCHAR(3),
 social_security_number VARCHAR(12) NOT NULL,
 school_id INT
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE played_instrument (
 student_Id INT NOT NULL,
 type_of_instrument VARCHAR(500) NOT NULL
);

ALTER TABLE played_instrument ADD CONSTRAINT PK_played_instrument PRIMARY KEY (student_Id);


CREATE TABLE price (
 school_id INT NOT NULL,
 price_weekdays VARCHAR(500) NOT NULL,
 price_specific_skill_levels VARCHAR(500) NOT NULL,
 price_specific_lesson VARCHAR(500) NOT NULL
);

ALTER TABLE price ADD CONSTRAINT PK_price PRIMARY KEY (school_id);


CREATE TABLE rental (
 school_id INT NOT NULL,
 student_id INT NOT NULL,
 amount_of_rented_instruments VARCHAR(500),
 rental_start_date DATE,
 rental_end_date DATE
);

ALTER TABLE rental ADD CONSTRAINT PK_rental PRIMARY KEY (school_id,student_id);


CREATE TABLE rental_instrument_quantity (
 school_id INT NOT NULL,
 student_id INT NOT NULL,
 no_of_rented_instruments VARCHAR(500) NOT NULL,
 no_of_available_instruments VARCHAR(500) NOT NULL
);

ALTER TABLE rental_instrument_quantity ADD CONSTRAINT PK_rental_instrument_quantity PRIMARY KEY (school_id,student_id);


CREATE TABLE skill_level (
 student_id INT NOT NULL,
 admin_id INT NOT NULL,
 level VARCHAR(500) NOT NULL
);

ALTER TABLE skill_level ADD CONSTRAINT PK_skill_level PRIMARY KEY (student_id,admin_id);


CREATE TABLE teaching_area (
 instructor_id INT NOT NULL,
 teaching_area VARCHAR(500)
);

ALTER TABLE teaching_area ADD CONSTRAINT PK_teaching_area PRIMARY KEY (instructor_id);


CREATE TABLE appointment (
 admin_id INT NOT NULL,
 instructor_id INT NOT NULL,
 student_id INT NOT NULL,
 type_of_class VARCHAR(500),
 time TIMESTAMP(10)
);

ALTER TABLE appointment ADD CONSTRAINT PK_appointment PRIMARY KEY (admin_id,instructor_id,student_id);


CREATE TABLE bill (
 school_id INT NOT NULL,
 student_id INT NOT NULL,
 total_price VARCHAR(500),
 amount_of_lessons VARCHAR(500)
);

ALTER TABLE bill ADD CONSTRAINT PK_bill PRIMARY KEY (school_id,student_id);


CREATE TABLE contact_details (
 student_id INT NOT NULL,
 school_id INT NOT NULL,
 instructor_id INT NOT NULL,
 admin_id INT NOT NULL,
 guardian_id INT NOT NULL,
 zip_code VARCHAR(5) NOT NULL,
 street_name VARCHAR(500) NOT NULL,
 city_name VARCHAR(500) NOT NULL
);

ALTER TABLE contact_details ADD CONSTRAINT PK_contact_details PRIMARY KEY (student_id,school_id,instructor_id,admin_id,guardian_id);


CREATE TABLE email (
 student_id INT NOT NULL,
 school_id INT NOT NULL,
 instructor_id INT NOT NULL,
 admin_id INT NOT NULL,
 guardian_id INT NOT NULL,
 email VARCHAR(500) NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (student_id,school_id,instructor_id,admin_id,guardian_id);


CREATE TABLE ensembles (
 admin_id INT NOT NULL,
 instructor_id INT NOT NULL,
 student_id INT NOT NULL,
 number_of_students VARCHAR(500),
 min_no_of_students VARCHAR(500) NOT NULL,
 max_no_of_students VARCHAR(500) NOT NULL,
 genre VARCHAR(500) NOT NULL
);

ALTER TABLE ensembles ADD CONSTRAINT PK_ensembles PRIMARY KEY (admin_id,instructor_id,student_id);


CREATE TABLE group_lesson (
 admin_id INT NOT NULL,
 instructor_id INT NOT NULL,
 student_id INT NOT NULL,
 number_of_students VARCHAR(500),
 min_no_of_students VARCHAR(500) NOT NULL,
 max_no_of_students VARCHAR(500) NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (admin_id,instructor_id,student_id);


CREATE TABLE individual_lesson (
 admin_id INT NOT NULL,
 instructor_id INT NOT NULL,
 student_id INT NOT NULL,
 type_of_instrument VARCHAR(500) NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (admin_id,instructor_id,student_id);


CREATE TABLE instrument (
 school_id INT NOT NULL,
 student_id INT NOT NULL,
 type_of_instrument VARCHAR(500) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (school_id,student_id);


CREATE TABLE phone_number (
 student_id INT NOT NULL,
 school_id INT NOT NULL,
 instructor_id INT NOT NULL,
 admin_id INT NOT NULL,
 guardian_id INT NOT NULL,
 phone_number VARCHAR(500) NOT NULL
);

ALTER TABLE phone_number ADD CONSTRAINT PK_phone_number PRIMARY KEY (student_id,school_id,instructor_id,admin_id,guardian_id);


CREATE TABLE scheduled_time_slots (
 admin_id INT NOT NULL,
 instructor_id INT NOT NULL,
 student_id INT NOT NULL,
 date DATE
);

ALTER TABLE scheduled_time_slots ADD CONSTRAINT PK_scheduled_time_slots PRIMARY KEY (admin_id,instructor_id,student_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (guardian_id) REFERENCES guardian (id);
ALTER TABLE student ADD CONSTRAINT FK_student_1 FOREIGN KEY (school_Id) REFERENCES soundgood_music_school_facility (id);


ALTER TABLE administrative_staff ADD CONSTRAINT FK_administrative_staff_0 FOREIGN KEY (school_id) REFERENCES soundgood_music_school_facility (id);


ALTER TABLE application ADD CONSTRAINT FK_application_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE application ADD CONSTRAINT FK_application_1 FOREIGN KEY (admin_id) REFERENCES administrative_staff (id);


ALTER TABLE audition ADD CONSTRAINT FK_audition_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE audition ADD CONSTRAINT FK_audition_1 FOREIGN KEY (admin_id) REFERENCES administrative_staff (id);


ALTER TABLE children ADD CONSTRAINT FK_children_0 FOREIGN KEY (guardian_id) REFERENCES guardian (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (school_id) REFERENCES soundgood_music_school_facility (id);


ALTER TABLE played_instrument ADD CONSTRAINT FK_played_instrument_0 FOREIGN KEY (student_Id) REFERENCES student (id);


ALTER TABLE price ADD CONSTRAINT FK_price_0 FOREIGN KEY (school_id) REFERENCES soundgood_music_school_facility (id);


ALTER TABLE rental ADD CONSTRAINT FK_rental_0 FOREIGN KEY (school_id) REFERENCES soundgood_music_school_facility (id);
ALTER TABLE rental ADD CONSTRAINT FK_rental_1 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE rental_instrument_quantity ADD CONSTRAINT FK_rental_instrument_quantity_0 FOREIGN KEY (school_id,student_id) REFERENCES rental (school_id,student_id);


ALTER TABLE skill_level ADD CONSTRAINT FK_skill_level_0 FOREIGN KEY (student_id,admin_id) REFERENCES audition (student_id,admin_id);


ALTER TABLE teaching_area ADD CONSTRAINT FK_teaching_area_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE appointment ADD CONSTRAINT FK_appointment_0 FOREIGN KEY (admin_id) REFERENCES administrative_staff (id);
ALTER TABLE appointment ADD CONSTRAINT FK_appointment_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE appointment ADD CONSTRAINT FK_appointment_2 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE bill ADD CONSTRAINT FK_bill_0 FOREIGN KEY (school_id) REFERENCES price (school_id);
ALTER TABLE bill ADD CONSTRAINT FK_bill_1 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE contact_details ADD CONSTRAINT FK_contact_details_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE contact_details ADD CONSTRAINT FK_contact_details_1 FOREIGN KEY (school_id) REFERENCES soundgood_music_school_facility (id);
ALTER TABLE contact_details ADD CONSTRAINT FK_contact_details_2 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE contact_details ADD CONSTRAINT FK_contact_details_3 FOREIGN KEY (admin_id) REFERENCES administrative_staff (id);
ALTER TABLE contact_details ADD CONSTRAINT FK_contact_details_4 FOREIGN KEY (guardian_id) REFERENCES guardian (id);


ALTER TABLE email ADD CONSTRAINT FK_email_0 FOREIGN KEY (student_id,school_id,instructor_id,admin_id,guardian_id) REFERENCES contact_details (student_id,school_id,instructor_id,admin_id,guardian_id);


ALTER TABLE ensembles ADD CONSTRAINT FK_ensembles_0 FOREIGN KEY (admin_id,instructor_id,student_id) REFERENCES appointment (admin_id,instructor_id,student_id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (admin_id,instructor_id,student_id) REFERENCES appointment (admin_id,instructor_id,student_id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (admin_id,instructor_id,student_id) REFERENCES appointment (admin_id,instructor_id,student_id);


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (school_id,student_id) REFERENCES rental (school_id,student_id);


ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_0 FOREIGN KEY (student_id,school_id,instructor_id,admin_id,guardian_id) REFERENCES contact_details (student_id,school_id,instructor_id,admin_id,guardian_id);


ALTER TABLE scheduled_time_slots ADD CONSTRAINT FK_scheduled_time_slots_0 FOREIGN KEY (admin_id,instructor_id,student_id) REFERENCES appointment (admin_id,instructor_id,student_id);


