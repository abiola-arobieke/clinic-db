CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    date_of_birth DATE,
);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(255),
    name VARCHAR(255)
);


CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patients (id)
);

CREATE TABLE invoices (
    id INT,
    total_amount DECIMAL(5,2),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id),
);

CREATE TABLE invoice_items (
    id INT,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id),
);

CREATE TABLE medical_histories_treatments (
    medical_history_id INT REFERENCES medical_histories (id),
    treatment_id INT REFERENCES treatments_id (id),
    FOREIGN KEY (medical_history_id, treatment_id)
);

CREATE INDEX patient_id_idx ON medical_histories (patient_id);
CREATE INDEX treatments_id_idx ON medical_histories_treatments (treatments_id);
CREATE INDEX invoices_id_idx ON invoices (medical_history_id);
CREATE INDEX invoice_items_id_idx ON invoice_items (invoice_id);
CREATE INDEX invoice_items_treatment_idx ON invoice_items (treatment_id);
CREATE INDEX medical_history_id_idx ON medical_histories_treatments (medical_history_id);
