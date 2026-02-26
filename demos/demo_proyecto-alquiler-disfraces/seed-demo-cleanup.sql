-- ============================================================
-- CLEANUP: Eliminar datos demo
-- Ejecutar en Supabase SQL Editor
-- Orden importante: primero las tablas hijo, luego las padre
-- ============================================================

-- 1. Entregas y devoluciones
DELETE FROM public.entregas_devoluciones
WHERE id LIKE '33333333-0009%';

-- 2. Pagos
DELETE FROM public.pagos
WHERE id LIKE '22222222-0008%';

-- 3. Items por alquiler
DELETE FROM public.alquiler_items
WHERE id LIKE '11111111-0007%';

-- 4. Alquileres
DELETE FROM public.alquileres
WHERE id LIKE 'ffffffff-0006%';

-- 5. Items de vestuario
DELETE FROM public.vestuario_items
WHERE id LIKE 'eeeeeeee-0005%';

-- 6. Modelos de vestuario
DELETE FROM public.vestuario_modelos
WHERE id LIKE 'dddddddd-0004%';

-- 7. Clientes
DELETE FROM public.clientes
WHERE id LIKE 'cccccccc-0003%';

-- 8. Categorías
DELETE FROM public.categorias_vestuario
WHERE id LIKE 'bbbbbbbb-0002%';

-- 9. Sucursales
DELETE FROM public.sucursales
WHERE id LIKE 'aaaaaaaa-0001%';

-- 10. Configuración
DELETE FROM public.configuracion_general
WHERE id LIKE '44444444-0010%';

-- Verificación: todo debe quedar en 0
SELECT 'alquileres'              AS tabla, COUNT(*) FROM public.alquileres        WHERE id LIKE 'ffffffff-0006%'
UNION ALL
SELECT 'vestuario_items',                  COUNT(*) FROM public.vestuario_items   WHERE id LIKE 'eeeeeeee-0005%'
UNION ALL
SELECT 'clientes',                         COUNT(*) FROM public.clientes          WHERE id LIKE 'cccccccc-0003%'
UNION ALL
SELECT 'vestuario_modelos',                COUNT(*) FROM public.vestuario_modelos WHERE id LIKE 'dddddddd-0004%';
