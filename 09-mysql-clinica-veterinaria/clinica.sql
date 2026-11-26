-- Banco de dados fictício de uma clínica veterinária
CREATE DATABASE IF NOT EXISTS clinica_vet;
USE clinica_vet;

CREATE TABLE tutores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(80) NOT NULL,
  telefone VARCHAR(20)
);

CREATE TABLE pets (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  especie VARCHAR(30),
  tutor_id INT,
  FOREIGN KEY (tutor_id) REFERENCES tutores(id)
);

CREATE TABLE consultas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  pet_id INT,
  data_consulta DATE,
  motivo VARCHAR(100),
  valor DECIMAL(8,2),
  FOREIGN KEY (pet_id) REFERENCES pets(id)
);

INSERT INTO tutores (nome, telefone) VALUES ('Paula', '11 90000-0001'), ('Rafael', '11 90000-0002');
INSERT INTO pets (nome, especie, tutor_id) VALUES ('Thor', 'Cachorro', 1), ('Luna', 'Gato', 2);
INSERT INTO consultas (pet_id, data_consulta, motivo, valor) VALUES
  (1, '2026-11-05', 'Vacina', 80.00),
  (2, '2026-11-06', 'Check-up', 120.00),
  (1, '2026-11-20', 'Retorno', 60.00);

-- Consultas
SELECT * FROM pets;
SELECT pets.nome AS pet, tutores.nome AS tutor
  FROM pets JOIN tutores ON pets.tutor_id = tutores.id;
SELECT pets.nome, consultas.motivo, consultas.valor
  FROM consultas JOIN pets ON consultas.pet_id = pets.id;
SELECT SUM(valor) AS faturamento FROM consultas;

-- Alterar e excluir
UPDATE tutores SET telefone = '11 98888-0000' WHERE nome = 'Paula';
DELETE FROM consultas WHERE id = 3;
