-- ============================================================
-- SEED DATA DEMO - Sistema de Alquiler de Vestuario
-- Ejecutar en el SQL Editor de Supabase (Dashboard → SQL Editor)
-- Ejecutar cada bloque en orden
-- ============================================================

-- ============================================================
-- BLOQUE 1: SUCURSALES
-- ============================================================
INSERT INTO public.sucursales (id, nombre, direccion, telefono, email, ciudad, is_active)
VALUES
  ('aaaaaaaa-0001-0001-0001-000000000001', 'Sucursal Centro',  'Av. Abancay 123, Lima Centro',     '01-4281234', 'centro@disfraces.com', 'Lima', true),
  ('aaaaaaaa-0001-0001-0001-000000000002', 'Sucursal Norte',   'Av. Túpac Amaru 456, Independencia','01-5231234', 'norte@disfraces.com',  'Lima', true)
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- BLOQUE 2: CATEGORÍAS DE VESTUARIO
-- ============================================================
INSERT INTO public.categorias_vestuario (id, nombre, descripcion, codigo)
VALUES
  ('bbbbbbbb-0002-0002-0002-000000000001', 'Fantasía',     'Hadas, magos, brujas y criaturas fantásticas',        'FAN'),
  ('bbbbbbbb-0002-0002-0002-000000000002', 'Histórico',    'Épocas históricas y personajes clásicos',             'HIS'),
  ('bbbbbbbb-0002-0002-0002-000000000003', 'Superhéroes',  'Personajes de cómics y películas de acción',          'SUP'),
  ('bbbbbbbb-0002-0002-0002-000000000004', 'Animales',     'Disfraces de animales y mascotas',                    'ANI'),
  ('bbbbbbbb-0002-0002-0002-000000000005', 'Profesiones',  'Médico, policía, bombero y otros oficios',            'PRO'),
  ('bbbbbbbb-0002-0002-0002-000000000006', 'Terror',       'Vampiros, zombies, fantasmas y monstruos',            'TER')
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- BLOQUE 3: CLIENTES
-- ============================================================
INSERT INTO public.clientes (id, nombre_completo, tipo_documento, numero_documento, telefono, email, ciudad, is_active)
VALUES
  ('cccccccc-0003-0003-0003-000000000001', 'Carlos Mendoza Ríos',    'DNI', '45123456',    '987654321', 'carlos.mendoza@gmail.com',      'Lima',                  true),
  ('cccccccc-0003-0003-0003-000000000002', 'María García López',     'DNI', '47891234',    '985321456', 'maria.garcia@hotmail.com',      'Lima',                  true),
  ('cccccccc-0003-0003-0003-000000000003', 'Luis Torres Vega',       'DNI', '43567890',    '991234567', null,                            'Callao',                true),
  ('cccccccc-0003-0003-0003-000000000004', 'Ana Flores Castillo',    'DNI', '48234567',    '997654321', 'ana.flores@gmail.com',          'Lima',                  true),
  ('cccccccc-0003-0003-0003-000000000005', 'Roberto Silva Paredes',  'DNI', '41987654',    '984567890', null,                            'Lima',                  true),
  ('cccccccc-0003-0003-0003-000000000006', 'Lucía Ramírez Huanca',   'DNI', '46543210',    '993456789', 'lucia.ramirez@gmail.com',       'Lima',                  true),
  ('cccccccc-0003-0003-0003-000000000007', 'Jorge Chávez Lima',      'DNI', '44678901',    '986789012', null,                            'San Juan de Lurigancho',true),
  ('cccccccc-0003-0003-0003-000000000008', 'Patricia Quispe Mamani', 'DNI', '49012345',    '992345678', 'patricia.quispe@outlook.com',   'Lima',                  true),
  ('cccccccc-0003-0003-0003-000000000009', 'Eventos Mágicos SAC',    'RUC', '20512345678', '014561234', 'eventos@magicossac.com',        'Lima',                  true),
  ('cccccccc-0003-0003-0003-000000000010', 'Diego Morales Castro',   'DNI', '42345678',    '988901234', null,                            'Miraflores',            true)
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- BLOQUE 4: MODELOS DE VESTUARIO
-- ============================================================
INSERT INTO public.vestuario_modelos (id, codigo, nombre, descripcion, categoria_id, precio_dia, tipo, color, estado, tipo_vestuario)
VALUES
  ('dddddddd-0004-0004-0004-000000000001', 'SUP-BAT-001', 'Batman Clásico',      'Disfraz completo de Batman con capa y máscara',            'bbbbbbbb-0002-0002-0002-000000000003', 45.00, 'multiple', 'Negro',            'activo', 'completo'),
  ('dddddddd-0004-0004-0004-000000000002', 'SUP-SPM-001', 'Superman',            'Traje de Superman con capa roja',                          'bbbbbbbb-0002-0002-0002-000000000003', 40.00, 'multiple', 'Azul/Rojo',        'activo', 'completo'),
  ('dddddddd-0004-0004-0004-000000000003', 'SUP-WON-001', 'Wonder Woman',        'Traje de Wonder Woman con tiara y accesorios dorados',     'bbbbbbbb-0002-0002-0002-000000000003', 45.00, 'multiple', 'Rojo/Azul/Dorado', 'activo', 'completo'),
  ('dddddddd-0004-0004-0004-000000000004', 'TER-VAM-001', 'Vampiro Elegante',    'Conde Drácula con capa, colmillos y accesorios',           'bbbbbbbb-0002-0002-0002-000000000006', 50.00, 'multiple', 'Negro/Rojo',       'activo', 'completo'),
  ('dddddddd-0004-0004-0004-000000000005', 'TER-ZOM-001', 'Zombie Enfermera',    'Disfraz de enfermera zombie con efectos de maquillaje',    'bbbbbbbb-0002-0002-0002-000000000006', 40.00, 'multiple', 'Blanco/Rojo',      'activo', 'completo'),
  ('dddddddd-0004-0004-0004-000000000006', 'FAN-HAD-001', 'Hada del Bosque',     'Vestido de hada con alas y varita mágica incluidas',       'bbbbbbbb-0002-0002-0002-000000000001', 55.00, 'multiple', 'Verde/Dorado',     'activo', 'completo'),
  ('dddddddd-0004-0004-0004-000000000007', 'FAN-BRU-001', 'Bruja Clásica',       'Vestido negro largo con sombrero puntiagudo',              'bbbbbbbb-0002-0002-0002-000000000001', 35.00, 'multiple', 'Negro',            'activo', 'completo'),
  ('dddddddd-0004-0004-0004-000000000008', 'HIS-EGI-001', 'Cleopatra',           'Vestido egipcio dorado con collar y peluca',               'bbbbbbbb-0002-0002-0002-000000000002', 60.00, 'multiple', 'Dorado/Negro',     'activo', 'completo'),
  ('dddddddd-0004-0004-0004-000000000009', 'HIS-GLA-001', 'Gladiador Romano',    'Armadura romana completa con escudo y lanza decorativa',   'bbbbbbbb-0002-0002-0002-000000000002', 55.00, 'multiple', 'Plateado/Rojo',    'activo', 'completo'),
  ('dddddddd-0004-0004-0004-000000000010', 'ANI-LEO-001', 'León Infantil',       'Mameluco de león con capucha, cola y manoplas',            'bbbbbbbb-0002-0002-0002-000000000004', 30.00, 'multiple', 'Amarillo/Marrón',  'activo', 'completo'),
  ('dddddddd-0004-0004-0004-000000000011', 'PRO-POL-001', 'Policía Nacional',    'Uniforme de policía con gorra, placa y accesorios',        'bbbbbbbb-0002-0002-0002-000000000005', 35.00, 'multiple', 'Azul marino',      'activo', 'completo'),
  ('dddddddd-0004-0004-0004-000000000012', 'PRO-MED-001', 'Doctor/Médico',       'Bata médica blanca con estetoscopio y gafas',              'bbbbbbbb-0002-0002-0002-000000000005', 30.00, 'multiple', 'Blanco',           'activo', 'completo')
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- BLOQUE 5: ITEMS DE VESTUARIO (unidades físicas)
-- ============================================================
INSERT INTO public.vestuario_items (id, modelo_id, codigo_individual, talla, sucursal_id, estado_fisico, estado_disponibilidad)
VALUES
  -- Batman (3 unidades)
  ('eeeeeeee-0005-0005-0005-000000000001', 'dddddddd-0004-0004-0004-000000000001', 'BAT-001-M',  'M',  'aaaaaaaa-0001-0001-0001-000000000001', 'excelente', 'disponible'),
  ('eeeeeeee-0005-0005-0005-000000000002', 'dddddddd-0004-0004-0004-000000000001', 'BAT-001-L',  'L',  'aaaaaaaa-0001-0001-0001-000000000001', 'bueno',     'alquilado'),
  ('eeeeeeee-0005-0005-0005-000000000003', 'dddddddd-0004-0004-0004-000000000001', 'BAT-001-XL', 'XL', 'aaaaaaaa-0001-0001-0001-000000000002', 'excelente', 'disponible'),
  -- Superman (2 unidades)
  ('eeeeeeee-0005-0005-0005-000000000004', 'dddddddd-0004-0004-0004-000000000002', 'SPM-001-L',  'L',  'aaaaaaaa-0001-0001-0001-000000000001', 'excelente', 'alquilado'),
  ('eeeeeeee-0005-0005-0005-000000000005', 'dddddddd-0004-0004-0004-000000000002', 'SPM-001-XL', 'XL', 'aaaaaaaa-0001-0001-0001-000000000002', 'bueno',     'disponible'),
  -- Wonder Woman (2 unidades)
  ('eeeeeeee-0005-0005-0005-000000000006', 'dddddddd-0004-0004-0004-000000000003', 'WON-001-S',  'S',  'aaaaaaaa-0001-0001-0001-000000000001', 'excelente', 'disponible'),
  ('eeeeeeee-0005-0005-0005-000000000007', 'dddddddd-0004-0004-0004-000000000003', 'WON-001-M',  'M',  'aaaaaaaa-0001-0001-0001-000000000001', 'bueno',     'alquilado'),
  -- Vampiro Elegante (3 unidades)
  ('eeeeeeee-0005-0005-0005-000000000008', 'dddddddd-0004-0004-0004-000000000004', 'VAM-001-M',  'M',  'aaaaaaaa-0001-0001-0001-000000000001', 'excelente', 'disponible'),
  ('eeeeeeee-0005-0005-0005-000000000009', 'dddddddd-0004-0004-0004-000000000004', 'VAM-001-L',  'L',  'aaaaaaaa-0001-0001-0001-000000000002', 'excelente', 'alquilado'),
  ('eeeeeeee-0005-0005-0005-000000000010', 'dddddddd-0004-0004-0004-000000000004', 'VAM-001-XL', 'XL', 'aaaaaaaa-0001-0001-0001-000000000002', 'bueno',     'disponible'),
  -- Zombie Enfermera (2 unidades)
  ('eeeeeeee-0005-0005-0005-000000000011', 'dddddddd-0004-0004-0004-000000000005', 'ZOM-001-S',  'S',  'aaaaaaaa-0001-0001-0001-000000000001', 'bueno',     'disponible'),
  ('eeeeeeee-0005-0005-0005-000000000012', 'dddddddd-0004-0004-0004-000000000005', 'ZOM-001-M',  'M',  'aaaaaaaa-0001-0001-0001-000000000001', 'regular',   'disponible'),
  -- Hada del Bosque (2 unidades)
  ('eeeeeeee-0005-0005-0005-000000000013', 'dddddddd-0004-0004-0004-000000000006', 'HAD-001-S',  'S',  'aaaaaaaa-0001-0001-0001-000000000001', 'excelente', 'alquilado'),
  ('eeeeeeee-0005-0005-0005-000000000014', 'dddddddd-0004-0004-0004-000000000006', 'HAD-001-M',  'M',  'aaaaaaaa-0001-0001-0001-000000000002', 'excelente', 'disponible'),
  -- Bruja Clásica (2 unidades)
  ('eeeeeeee-0005-0005-0005-000000000015', 'dddddddd-0004-0004-0004-000000000007', 'BRU-001-M',  'M',  'aaaaaaaa-0001-0001-0001-000000000001', 'bueno',     'disponible'),
  ('eeeeeeee-0005-0005-0005-000000000016', 'dddddddd-0004-0004-0004-000000000007', 'BRU-001-L',  'L',  'aaaaaaaa-0001-0001-0001-000000000001', 'bueno',     'disponible'),
  -- Cleopatra (2 unidades)
  ('eeeeeeee-0005-0005-0005-000000000017', 'dddddddd-0004-0004-0004-000000000008', 'EGI-001-S',  'S',  'aaaaaaaa-0001-0001-0001-000000000001', 'excelente', 'alquilado'),
  ('eeeeeeee-0005-0005-0005-000000000018', 'dddddddd-0004-0004-0004-000000000008', 'EGI-001-M',  'M',  'aaaaaaaa-0001-0001-0001-000000000002', 'excelente', 'disponible'),
  -- Gladiador Romano (2 unidades)
  ('eeeeeeee-0005-0005-0005-000000000019', 'dddddddd-0004-0004-0004-000000000009', 'GLA-001-L',  'L',  'aaaaaaaa-0001-0001-0001-000000000001', 'bueno',     'disponible'),
  ('eeeeeeee-0005-0005-0005-000000000020', 'dddddddd-0004-0004-0004-000000000009', 'GLA-001-XL', 'XL', 'aaaaaaaa-0001-0001-0001-000000000002', 'bueno',     'disponible'),
  -- León Infantil (3 unidades)
  ('eeeeeeee-0005-0005-0005-000000000021', 'dddddddd-0004-0004-0004-000000000010', 'LEO-001-XS', 'XS', 'aaaaaaaa-0001-0001-0001-000000000001', 'excelente', 'disponible'),
  ('eeeeeeee-0005-0005-0005-000000000022', 'dddddddd-0004-0004-0004-000000000010', 'LEO-001-S',  'S',  'aaaaaaaa-0001-0001-0001-000000000001', 'excelente', 'disponible'),
  ('eeeeeeee-0005-0005-0005-000000000023', 'dddddddd-0004-0004-0004-000000000010', 'LEO-001-M',  'M',  'aaaaaaaa-0001-0001-0001-000000000002', 'bueno',     'alquilado'),
  -- Policía Nacional (2 unidades)
  ('eeeeeeee-0005-0005-0005-000000000024', 'dddddddd-0004-0004-0004-000000000011', 'POL-001-M',  'M',  'aaaaaaaa-0001-0001-0001-000000000001', 'bueno',     'disponible'),
  ('eeeeeeee-0005-0005-0005-000000000025', 'dddddddd-0004-0004-0004-000000000011', 'POL-001-L',  'L',  'aaaaaaaa-0001-0001-0001-000000000001', 'bueno',     'disponible'),
  -- Doctor (2 unidades)
  ('eeeeeeee-0005-0005-0005-000000000026', 'dddddddd-0004-0004-0004-000000000012', 'MED-001-M',  'M',  'aaaaaaaa-0001-0001-0001-000000000001', 'excelente', 'disponible'),
  ('eeeeeeee-0005-0005-0005-000000000027', 'dddddddd-0004-0004-0004-000000000012', 'MED-001-L',  'L',  'aaaaaaaa-0001-0001-0001-000000000002', 'excelente', 'disponible')
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- BLOQUE 6: ALQUILERES
-- Mezcla de estados para que el dashboard muestre todo
--   activo      → KPI "alquileres activos"
--   reservado   → KPI "reservas de hoy" (fecha_retiro = HOY)
--   devuelto    → historial
--   vencido     → alertas (fecha_devolucion_estimada ya pasó)
-- ============================================================
INSERT INTO public.alquileres
  (id, codigo, cliente_id, sucursal_id, fecha_retiro, fecha_devolucion_estimada, fecha_devolucion_real,
   dias_alquiler, subtotal, descuento, total, estado, estado_pago, notas)
VALUES
  -- ACTIVOS con devolución próxima (esta semana)
  ('ffffffff-0006-0006-0006-000000000001', 'ALQ-2026-001',
   'cccccccc-0003-0003-0003-000000000001', 'aaaaaaaa-0001-0001-0001-000000000001',
   '2026-02-21', '2026-02-25', null,
   4, 180.00, 0, 180.00, 'activo', 'parcial',
   'Fiesta de cumpleaños - Batman y Superman'),

  ('ffffffff-0006-0006-0006-000000000002', 'ALQ-2026-002',
   'cccccccc-0003-0003-0003-000000000002', 'aaaaaaaa-0001-0001-0001-000000000001',
   '2026-02-22', '2026-02-26', null,
   4, 220.00, 20.00, 200.00, 'activo', 'parcial',
   'Evento de empresa - Wonder Woman y Cleopatra'),

  ('ffffffff-0006-0006-0006-000000000003', 'ALQ-2026-003',
   'cccccccc-0003-0003-0003-000000000003', 'aaaaaaaa-0001-0001-0001-000000000002',
   '2026-02-23', '2026-02-27', null,
   4, 200.00, 0, 200.00, 'activo', 'pendiente',
   'Fiesta de disfraces - Vampiro y Hada'),

  -- VENCIDOS (fecha_devolucion_estimada ya pasó → genera alertas en dashboard)
  ('ffffffff-0006-0006-0006-000000000004', 'ALQ-2026-004',
   'cccccccc-0003-0003-0003-000000000004', 'aaaaaaaa-0001-0001-0001-000000000001',
   '2026-02-17', '2026-02-20', null,
   3, 165.00, 0, 165.00, 'activo', 'parcial',
   'PENDIENTE DE DEVOLUCIÓN - 4 días de retraso'),

  ('ffffffff-0006-0006-0006-000000000005', 'ALQ-2026-005',
   'cccccccc-0003-0003-0003-000000000005', 'aaaaaaaa-0001-0001-0001-000000000002',
   '2026-02-16', '2026-02-19', null,
   3, 120.00, 0, 120.00, 'activo', 'pendiente',
   'PENDIENTE DE DEVOLUCIÓN - 5 días de retraso'),

  -- RESERVAS DE HOY (fecha_retiro = hoy → KPI reservas del día)
  ('ffffffff-0006-0006-0006-000000000006', 'ALQ-2026-006',
   'cccccccc-0003-0003-0003-000000000006', 'aaaaaaaa-0001-0001-0001-000000000001',
   CURRENT_DATE, CURRENT_DATE + 3, null,
   3, 105.00, 0, 105.00, 'reservado', 'pendiente',
   'Cumpleaños infantil - León y Doctor'),

  ('ffffffff-0006-0006-0006-000000000007', 'ALQ-2026-007',
   'cccccccc-0003-0003-0003-000000000009', 'aaaaaaaa-0001-0001-0001-000000000001',
   CURRENT_DATE, CURRENT_DATE + 2, null,
   2, 190.00, 10.00, 180.00, 'reservado', 'parcial',
   'Evento corporativo Eventos Mágicos SAC'),

  -- DEVUELTOS (historial)
  ('ffffffff-0006-0006-0006-000000000008', 'ALQ-2026-008',
   'cccccccc-0003-0003-0003-000000000007', 'aaaaaaaa-0001-0001-0001-000000000001',
   '2026-02-10', '2026-02-13', '2026-02-13',
   3, 105.00, 0, 105.00, 'devuelto', 'pagado',
   null),

  ('ffffffff-0006-0006-0006-000000000009', 'ALQ-2026-009',
   'cccccccc-0003-0003-0003-000000000008', 'aaaaaaaa-0001-0001-0001-000000000002',
   '2026-02-08', '2026-02-11', '2026-02-12',
   3, 150.00, 0, 150.00, 'devuelto', 'pagado',
   'Devuelto con 1 día de retraso, cargo cobrado'),

  ('ffffffff-0006-0006-0006-000000000010', 'ALQ-2026-010',
   'cccccccc-0003-0003-0003-000000000010', 'aaaaaaaa-0001-0001-0001-000000000001',
   '2026-02-05', '2026-02-08', '2026-02-08',
   3, 135.00, 15.00, 120.00, 'devuelto', 'pagado',
   null)
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- BLOQUE 7: ITEMS POR ALQUILER
-- ============================================================
INSERT INTO public.alquiler_items (id, alquiler_id, item_id, precio_dia, dias, subtotal)
VALUES
  -- ALQ-001: Batman L + Superman L
  ('11111111-0007-0007-0007-000000000001', 'ffffffff-0006-0006-0006-000000000001', 'eeeeeeee-0005-0005-0005-000000000002', 45.00, 4, 180.00),
  ('11111111-0007-0007-0007-000000000002', 'ffffffff-0006-0006-0006-000000000001', 'eeeeeeee-0005-0005-0005-000000000004', 40.00, 4,   0.00),
  -- ALQ-002: Wonder Woman M + Cleopatra S
  ('11111111-0007-0007-0007-000000000003', 'ffffffff-0006-0006-0006-000000000002', 'eeeeeeee-0005-0005-0005-000000000007', 45.00, 4, 180.00),
  ('11111111-0007-0007-0007-000000000004', 'ffffffff-0006-0006-0006-000000000002', 'eeeeeeee-0005-0005-0005-000000000017', 55.00, 4, 220.00),
  -- ALQ-003: Vampiro L + Hada S
  ('11111111-0007-0007-0007-000000000005', 'ffffffff-0006-0006-0006-000000000003', 'eeeeeeee-0005-0005-0005-000000000009', 50.00, 4, 200.00),
  ('11111111-0007-0007-0007-000000000006', 'ffffffff-0006-0006-0006-000000000003', 'eeeeeeee-0005-0005-0005-000000000013', 55.00, 4, 220.00),
  -- ALQ-004 (vencido): Batman L + Policía M
  ('11111111-0007-0007-0007-000000000007', 'ffffffff-0006-0006-0006-000000000004', 'eeeeeeee-0005-0005-0005-000000000002', 45.00, 3, 135.00),
  ('11111111-0007-0007-0007-000000000008', 'ffffffff-0006-0006-0006-000000000004', 'eeeeeeee-0005-0005-0005-000000000024', 30.00, 3,  90.00),
  -- ALQ-005 (vencido): León M
  ('11111111-0007-0007-0007-000000000009', 'ffffffff-0006-0006-0006-000000000005', 'eeeeeeee-0005-0005-0005-000000000023', 40.00, 3, 120.00),
  -- ALQ-006 (reserva hoy): León XS + Doctor M
  ('11111111-0007-0007-0007-000000000010', 'ffffffff-0006-0006-0006-000000000006', 'eeeeeeee-0005-0005-0005-000000000021', 30.00, 3,  90.00),
  ('11111111-0007-0007-0007-000000000011', 'ffffffff-0006-0006-0006-000000000006', 'eeeeeeee-0005-0005-0005-000000000026', 35.00, 3, 105.00),
  -- ALQ-007 (reserva hoy): Superman XL + Bruja M
  ('11111111-0007-0007-0007-000000000012', 'ffffffff-0006-0006-0006-000000000007', 'eeeeeeee-0005-0005-0005-000000000005', 40.00, 2,  80.00),
  ('11111111-0007-0007-0007-000000000013', 'ffffffff-0006-0006-0006-000000000007', 'eeeeeeee-0005-0005-0005-000000000015', 35.00, 2,  70.00),
  -- ALQ-008 (devuelto): Bruja L
  ('11111111-0007-0007-0007-000000000014', 'ffffffff-0006-0006-0006-000000000008', 'eeeeeeee-0005-0005-0005-000000000016', 35.00, 3, 105.00),
  -- ALQ-009 (devuelto): Gladiador L + Doctor M
  ('11111111-0007-0007-0007-000000000015', 'ffffffff-0006-0006-0006-000000000009', 'eeeeeeee-0005-0005-0005-000000000019', 55.00, 3, 165.00),
  -- ALQ-010 (devuelto): Batman M
  ('11111111-0007-0007-0007-000000000016', 'ffffffff-0006-0006-0006-000000000010', 'eeeeeeee-0005-0005-0005-000000000001', 45.00, 3, 135.00)
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- BLOQUE 8: PAGOS
-- Incluye pagos de HOY para el KPI de ingresos diarios
-- ============================================================
INSERT INTO public.pagos (id, codigo, alquiler_id, monto, metodo_pago, tipo_pago, fecha_pago, notas)
VALUES
  -- Pagos históricos (alquileres devueltos - pagados completo)
  ('22222222-0008-0008-0008-000000000001', 'PAG-2026-001', 'ffffffff-0006-0006-0006-000000000008',  105.00, 'efectivo',     'alquiler',   '2026-02-10 10:30:00+05', null),
  ('22222222-0008-0008-0008-000000000002', 'PAG-2026-002', 'ffffffff-0006-0006-0006-000000000009',  150.00, 'transferencia','alquiler',   '2026-02-08 11:00:00+05', 'Op. 9923847'),
  ('22222222-0008-0008-0008-000000000003', 'PAG-2026-003', 'ffffffff-0006-0006-0006-000000000009',   35.00, 'efectivo',     'cargo_adicional','2026-02-12 09:15:00+05', 'Cargo por 1 día de retraso'),
  ('22222222-0008-0008-0008-000000000004', 'PAG-2026-004', 'ffffffff-0006-0006-0006-000000000010',  120.00, 'yape',         'alquiler',   '2026-02-05 14:00:00+05', null),

  -- Adelantos/separaciones de alquileres activos
  ('22222222-0008-0008-0008-000000000005', 'PAG-2026-005', 'ffffffff-0006-0006-0006-000000000001',   90.00, 'efectivo',     'separacion', '2026-02-21 10:00:00+05', 'Adelanto 50%'),
  ('22222222-0008-0008-0008-000000000006', 'PAG-2026-006', 'ffffffff-0006-0006-0006-000000000002',  100.00, 'yape',         'separacion', '2026-02-22 11:30:00+05', 'Adelanto inicial'),
  ('22222222-0008-0008-0008-000000000007', 'PAG-2026-007', 'ffffffff-0006-0006-0006-000000000007',   90.00, 'transferencia','separacion', '2026-02-23 15:00:00+05', 'Eventos Mágicos SAC - Op. 443281'),

  -- Pagos de HOY → aparecen en KPI "ingresos del día"
  ('22222222-0008-0008-0008-000000000008', 'PAG-2026-008', 'ffffffff-0006-0006-0006-000000000006',   52.50, 'efectivo',     'separacion', NOW(), 'Adelanto 50% reserva hoy'),
  ('22222222-0008-0008-0008-000000000009', 'PAG-2026-009', 'ffffffff-0006-0006-0006-000000000001',   90.00, 'tarjeta',      'alquiler',   NOW(), 'Saldo restante ALQ-001'),
  ('22222222-0008-0008-0008-000000000010', 'PAG-2026-010', 'ffffffff-0006-0006-0006-000000000004',   82.50, 'efectivo',     'alquiler',   NOW(), 'Pago parcial ALQ-004 vencido')
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- BLOQUE 9: ENTREGAS Y DEVOLUCIONES
-- ============================================================
INSERT INTO public.entregas_devoluciones (id, alquiler_id, tipo, fecha, estado_devolucion, dias_retraso, cargo_retraso, observaciones)
VALUES
  -- Entrega de ALQ-001
  ('33333333-0009-0009-0009-000000000001', 'ffffffff-0006-0006-0006-000000000001', 'entrega',    '2026-02-21 10:00:00+05', null,              0, 0.00,  'Entrega sin inconvenientes'),
  -- Entrega y devolución de ALQ-008
  ('33333333-0009-0009-0009-000000000002', 'ffffffff-0006-0006-0006-000000000008', 'entrega',    '2026-02-10 10:30:00+05', null,              0, 0.00,  null),
  ('33333333-0009-0009-0009-000000000003', 'ffffffff-0006-0006-0006-000000000008', 'devolucion', '2026-02-13 16:00:00+05', 'perfecto',        0, 0.00,  'Todo en perfecto estado'),
  -- Entrega y devolución de ALQ-009 (con retraso)
  ('33333333-0009-0009-0009-000000000004', 'ffffffff-0006-0006-0006-000000000009', 'entrega',    '2026-02-08 11:00:00+05', null,              0, 0.00,  null),
  ('33333333-0009-0009-0009-000000000005', 'ffffffff-0006-0006-0006-000000000009', 'devolucion', '2026-02-12 12:00:00+05', 'leve_desgaste',   1, 35.00, '1 día de retraso. Leve desgaste en capa del gladiador'),
  -- Entrega y devolución de ALQ-010
  ('33333333-0009-0009-0009-000000000006', 'ffffffff-0006-0006-0006-000000000010', 'entrega',    '2026-02-05 14:00:00+05', null,              0, 0.00,  null),
  ('33333333-0009-0009-0009-000000000007', 'ffffffff-0006-0006-0006-000000000010', 'devolucion', '2026-02-08 17:30:00+05', 'perfecto',        0, 0.00,  null)
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- BLOQUE 10: CONFIGURACIÓN GENERAL DEL SISTEMA
-- ============================================================
INSERT INTO public.configuracion_general (id, clave, valor, descripcion)
VALUES
  ('44444444-0010-0010-0010-000000000001', 'nombre_negocio',        '"Disfraces & Fantasías"',                           'Nombre del negocio'),
  ('44444444-0010-0010-0010-000000000002', 'telefono_negocio',      '"01-4281234"',                                       'Teléfono principal'),
  ('44444444-0010-0010-0010-000000000003', 'direccion_negocio',     '"Av. Abancay 123, Lima Centro"',                     'Dirección principal'),
  ('44444444-0010-0010-0010-000000000004', 'dias_gracia',           '1',                                                  'Días de gracia antes de cobrar mora'),
  ('44444444-0010-0010-0010-000000000005', 'recargo_por_dia',       '15',                                                 'Recargo en soles por día de retraso'),
  ('44444444-0010-0010-0010-000000000006', 'deposito_minimo_pct',   '50',                                                 'Porcentaje mínimo de adelanto al reservar'),
  ('44444444-0010-0010-0010-000000000007', 'moneda',                '"PEN"',                                              'Moneda del sistema'),
  ('44444444-0010-0010-0010-000000000008', 'dias_max_alquiler',     '7',                                                  'Máximo de días por alquiler'),
  ('44444444-0010-0010-0010-000000000009', 'permite_reservas',      'true',                                               'Habilitar reservas con adelanto')
ON CONFLICT (clave) DO NOTHING;


-- ============================================================
-- VERIFICACIÓN FINAL
-- Ejecutar para confirmar que los datos se insertaron correctamente
-- ============================================================
SELECT 'sucursales'           AS tabla, COUNT(*) AS total FROM public.sucursales
UNION ALL
SELECT 'categorias',                    COUNT(*) FROM public.categorias_vestuario
UNION ALL
SELECT 'clientes',                      COUNT(*) FROM public.clientes
UNION ALL
SELECT 'vestuario_modelos',             COUNT(*) FROM public.vestuario_modelos
UNION ALL
SELECT 'vestuario_items',               COUNT(*) FROM public.vestuario_items
UNION ALL
SELECT 'alquileres',                    COUNT(*) FROM public.alquileres
UNION ALL
SELECT 'alquiler_items',                COUNT(*) FROM public.alquiler_items
UNION ALL
SELECT 'pagos',                         COUNT(*) FROM public.pagos
UNION ALL
SELECT 'entregas_devoluciones',         COUNT(*) FROM public.entregas_devoluciones
UNION ALL
SELECT 'configuracion_general',         COUNT(*) FROM public.configuracion_general;
