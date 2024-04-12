DROP TABLE IF EXISTS dev001.user_groups;
CREATE table dev001.user_groups(
	id INT NOT NULL AUTO_INCREMENT,
	group_code VARCHAR(7) NOT NULL UNIQUE,
	group_name VARCHAR(100) NOT NULL,
	del_flg BOOLEAN DEFAULT false NOT NULL,
	created_by VARCHAR(7) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_by VARCHAR(7) NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	INDEX group_index_id (id)
);
DROP TABLE IF EXISTS dev001.users;
CREATE table dev001.users(
	id INT NOT NULL AUTO_INCREMENT,
	group_id INT NOT NULL,
	user_code VARCHAR(7) NOT NULL UNIQUE,
	user_name VARCHAR(7) NOT NULL UNIQUE,
	user_first_name VARCHAR(100) NOT NULL,
	user_last_name VARCHAR(100) NOT NULL,
	post_code VARCHAR(20) NOT NULL,
	address VARCHAR(250) NOT NULL,
	tel_number VARCHAR(20) NOT NULL,
	email VARCHAR(100) NOT NULL,
	password VARCHAR(64) NOT NULL,
	del_flg BOOLEAN DEFAULT false NOT NULL,
	created_by VARCHAR(7) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_by VARCHAR(7) NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	INDEX user_index_id (id),
    FOREIGN KEY (group_id) REFERENCES user_groups(id)
);
DROP TABLE IF EXISTS dev001.events;
CREATE table dev001.events(
	id INT NOT NULL AUTO_INCREMENT,
	group_code VARCHAR(7) NOT NULL,
	user_code VARCHAR(7) NOT NULL,
	event_title VARCHAR(100) NOT NULL,
	event_start_date_time DATETIME NOT NULL,
	event_end_date_time DATETIME NOT NULL,
	allday_flg BOOLEAN DEFAULT false NOT NULL,
	repeat_type ENUM("1","2","3","4","5") DEFAULT 1 NOT NULL,
	repeat_until DATETIME,
	repeat_interval INT,
	repeat_day_of_week ENUM("1","2","3","4","5","6","7"),
	repeat_day_of_month INT,
	repeat_month INT,
	event_display_flg BOOLEAN DEFAULT true NOT NULL,
	location VARCHAR(100),
	meet_link VARCHAR(100),
	event_description VARCHAR(250),
	event_theme_color VARCHAR(7) NOT NULL,
	other_visibility_flg BOOLEAN DEFAULT true NOT NULL,
	del_flg BOOLEAN DEFAULT false NOT NULL,
	created_by VARCHAR(7) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_by VARCHAR(7) NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	INDEX event_index_id (id),
    FOREIGN KEY (group_code) REFERENCES user_groups(group_code),
    FOREIGN KEY (user_code) REFERENCES users(user_code)
);
DROP TABLE IF EXISTS dev001.event_reminders;
CREATE table dev001.event_reminders(
	id INT NOT NULL AUTO_INCREMENT,
	event_id INT NOT NULL,
	event_reminder_time TIME NOT NULL,
	noti_method_flg BOOLEAN DEFAULT false NOT NULL,
	del_flg BOOLEAN DEFAULT false NOT NULL,
	created_by VARCHAR(7) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_by VARCHAR(7) NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	INDEX event_reminder_index_id (id),
    FOREIGN KEY (event_id) REFERENCES events(id)
);
DROP TABLE IF EXISTS dev001.tasks;
CREATE table dev001.tasks(
	id INT NOT NULL AUTO_INCREMENT,
	group_code VARCHAR(7) NOT NULL,
	user_code VARCHAR(7) NOT NULL,
	task_title VARCHAR(100) NOT NULL,
	task_due_date_time DATETIME NOT NULL,
	allday_flg BOOLEAN DEFAULT false NOT NULL,
	repeat_type ENUM("1","2","3","4","5") DEFAULT 1 NOT NULL,
	repeat_until DATETIME,
	repeat_interval INT,
	repeat_day_of_week ENUM("1","2","3","4","5","6","7"),
	repeat_day_of_month INT,
	repeat_month INT,
	task_status_flg BOOLEAN DEFAULT false NOT NULL,
	task_description VARCHAR(250),	
	del_flg BOOLEAN DEFAULT false NOT NULL,
	created_by VARCHAR(7) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_by VARCHAR(7) NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	INDEX event_index_id (id),
    FOREIGN KEY (group_code) REFERENCES user_groups(group_code),
    FOREIGN KEY (user_code) REFERENCES users(user_code)
);
DROP TABLE IF EXISTS dev001.task_reminders;
CREATE table dev001.task_reminders(
	id INT NOT NULL AUTO_INCREMENT,
	task_id INT NOT NULL,
	task_reminder_time TIME NOT NULL,
	noti_method_flg BOOLEAN DEFAULT false NOT NULL,
	del_flg BOOLEAN DEFAULT false NOT NULL,
	created_by VARCHAR(7) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_by VARCHAR(7) NOT NULL,
	updated_at DATETIME NOT NULL,
	PRIMARY KEY (id),
	INDEX task_reminder_index_id (id),
    FOREIGN KEY (task_id) REFERENCES tasks(id)
);