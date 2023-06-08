
CREATE TABLE patient (
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  hashedPassword VARCHAR(255) NOT NULL,
  phone_number INT,
  adress_number INT,
  adress_streetname TEXT,
  city VARCHAR(100),
  mental_score INT
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE intervention (
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  intervention_name VARCHAR(100) NOT NULL,
  date DATE NOT NULL,
  patient_id  INT NOT NULL,
  CONSTRAINT fk_intervention_patient
  FOREIGN KEY (patient_id)
  REFERENCES patient(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE practicioner (
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  hashedPassword VARCHAR(255) NOT NULL,
  phone_number INT,
  roles VARCHAR(100),
  intervention_id INT NOT NULL,
  FOREIGN KEY (intervention_id)
  REFERENCES intervention(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE operation (
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  operation_name VARCHAR(100) NOT NULL,
  practicioner_id INT NOT NULL,
  CONSTRAINT fk_operation_practicioner
  FOREIGN KEY (practicioner_id)
  REFERENCES practicioner(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE protocol (
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  protocol_name VARCHAR(100) NOT NULL,
  operation_id INT(11) NOT NULL,
  CONSTRAINT fk_protocol_operation
  FOREIGN KEY (operation_id)
  REFERENCES operation(id),
  intervention_id INT(11) NOT NULL,
  CONSTRAINT fk_protocol_intervention
  FOREIGN KEY(intervention_id)
  REFERENCES intervention(id),
  practicioner_id INT(11) NOT NULL,
  CONSTRAINT fk_protocol_practicioner
  FOREIGN KEY(practicioner_id)
  REFERENCES practicioner(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE protocol_item (
  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  protocol_item_name VARCHAR(100) NOT NULL,
  protocol_description TEXT,
  image_uri VARCHAR(255) NULL,
  protocol_id INT(11) NOT NULL,
  CONSTRAINT fk_protocol_item
  FOREIGN KEY (protocol_id)
  REFERENCES protocol(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE preparing (
  protocol_item_id INT NOT NULL,
  CONSTRAINT fk_preparing_protocol_item
  FOREIGN KEY (protocol_item_id)
  REFERENCES protocol_item(id),
  intervention_id INT(11) NOT NULL,
  CONSTRAINT fk_preparing_intervention
  FOREIGN KEY (intervention_id)
  REFERENCES intervention(id),
  preparing_state INT
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE programming (
  operation_id INT NOT NULL,
  CONSTRAINT fk_programming_operation
  FOREIGN KEY (operation_id)
  REFERENCES operation(id),
  intervention_id INT,
  CONSTRAINT fk_programming_intervention
  FOREIGN KEY (intervention_id)
  REFERENCES intervention(id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

