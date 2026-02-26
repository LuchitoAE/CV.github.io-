-- ============================================================
-- POLÍTICAS RLS - Sistema de Alquiler de Vestuario
-- Ejecutar en Supabase SQL Editor si el dashboard muestra todo en 0
--
-- Estas políticas permiten que los usuarios autenticados (admin y empleado)
-- puedan LEER los datos. Las operaciones de escritura (INSERT/UPDATE/DELETE)
-- requieren políticas adicionales si también están fallando.
-- ============================================================

-- ============================================================
-- LECTURA (SELECT) para usuarios autenticados
-- ============================================================

-- Alquileres
DROP POLICY IF EXISTS "Authenticated can read alquileres" ON public.alquileres;
CREATE POLICY "Authenticated can read alquileres"
  ON public.alquileres FOR SELECT
  TO authenticated
  USING (true);

-- Items de alquileres
DROP POLICY IF EXISTS "Authenticated can read alquiler_items" ON public.alquiler_items;
CREATE POLICY "Authenticated can read alquiler_items"
  ON public.alquiler_items FOR SELECT
  TO authenticated
  USING (true);

-- Vestuario modelos
DROP POLICY IF EXISTS "Authenticated can read vestuario_modelos" ON public.vestuario_modelos;
CREATE POLICY "Authenticated can read vestuario_modelos"
  ON public.vestuario_modelos FOR SELECT
  TO authenticated
  USING (true);

-- Vestuario items
DROP POLICY IF EXISTS "Authenticated can read vestuario_items" ON public.vestuario_items;
CREATE POLICY "Authenticated can read vestuario_items"
  ON public.vestuario_items FOR SELECT
  TO authenticated
  USING (true);

-- Clientes
DROP POLICY IF EXISTS "Authenticated can read clientes" ON public.clientes;
CREATE POLICY "Authenticated can read clientes"
  ON public.clientes FOR SELECT
  TO authenticated
  USING (true);

-- Pagos
DROP POLICY IF EXISTS "Authenticated can read pagos" ON public.pagos;
CREATE POLICY "Authenticated can read pagos"
  ON public.pagos FOR SELECT
  TO authenticated
  USING (true);

-- Entregas y devoluciones
DROP POLICY IF EXISTS "Authenticated can read entregas_devoluciones" ON public.entregas_devoluciones;
CREATE POLICY "Authenticated can read entregas_devoluciones"
  ON public.entregas_devoluciones FOR SELECT
  TO authenticated
  USING (true);

-- Categorías de vestuario
DROP POLICY IF EXISTS "Authenticated can read categorias_vestuario" ON public.categorias_vestuario;
CREATE POLICY "Authenticated can read categorias_vestuario"
  ON public.categorias_vestuario FOR SELECT
  TO authenticated
  USING (true);

-- Sucursales
DROP POLICY IF EXISTS "Authenticated can read sucursales" ON public.sucursales;
CREATE POLICY "Authenticated can read sucursales"
  ON public.sucursales FOR SELECT
  TO authenticated
  USING (true);

-- Profiles (solo el propio perfil o admin ve todos)
DROP POLICY IF EXISTS "Users can read own profile" ON public.profiles;
CREATE POLICY "Users can read own profile"
  ON public.profiles FOR SELECT
  TO authenticated
  USING (
    id = auth.uid()
    OR EXISTS (
      SELECT 1 FROM public.profiles p
      WHERE p.id = auth.uid() AND p.role = 'admin'
    )
  );

-- Configuración general
DROP POLICY IF EXISTS "Authenticated can read configuracion" ON public.configuracion_general;
CREATE POLICY "Authenticated can read configuracion"
  ON public.configuracion_general FOR SELECT
  TO authenticated
  USING (true);

-- Solicitudes
DROP POLICY IF EXISTS "Authenticated can read solicitudes" ON public.solicitudes_cliente;
CREATE POLICY "Authenticated can read solicitudes"
  ON public.solicitudes_cliente FOR SELECT
  TO authenticated
  USING (true);

-- Modelo partes
DROP POLICY IF EXISTS "Authenticated can read modelo_partes" ON public.modelo_partes;
CREATE POLICY "Authenticated can read modelo_partes"
  ON public.modelo_partes FOR SELECT
  TO authenticated
  USING (true);


-- ============================================================
-- ESCRITURA (INSERT / UPDATE / DELETE) solo para admin
-- + empleado en sus propias operaciones
-- ============================================================

-- Alquileres: admin y empleado pueden crear
DROP POLICY IF EXISTS "Authenticated can insert alquileres" ON public.alquileres;
CREATE POLICY "Authenticated can insert alquileres"
  ON public.alquileres FOR INSERT
  TO authenticated
  WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated can update alquileres" ON public.alquileres;
CREATE POLICY "Authenticated can update alquileres"
  ON public.alquileres FOR UPDATE
  TO authenticated
  USING (true);

-- Pagos: admin y empleado pueden registrar pagos
DROP POLICY IF EXISTS "Authenticated can insert pagos" ON public.pagos;
CREATE POLICY "Authenticated can insert pagos"
  ON public.pagos FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- Clientes: admin y empleado pueden crear clientes
DROP POLICY IF EXISTS "Authenticated can insert clientes" ON public.clientes;
CREATE POLICY "Authenticated can insert clientes"
  ON public.clientes FOR INSERT
  TO authenticated
  WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated can update clientes" ON public.clientes;
CREATE POLICY "Authenticated can update clientes"
  ON public.clientes FOR UPDATE
  TO authenticated
  USING (true);

-- Vestuario: solo admin puede modificar inventario
DROP POLICY IF EXISTS "Authenticated can insert vestuario_items" ON public.vestuario_items;
CREATE POLICY "Authenticated can insert vestuario_items"
  ON public.vestuario_items FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );

DROP POLICY IF EXISTS "Authenticated can update vestuario_items" ON public.vestuario_items;
CREATE POLICY "Authenticated can update vestuario_items"
  ON public.vestuario_items FOR UPDATE
  TO authenticated
  USING (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );

DROP POLICY IF EXISTS "Authenticated can insert vestuario_modelos" ON public.vestuario_modelos;
CREATE POLICY "Authenticated can insert vestuario_modelos"
  ON public.vestuario_modelos FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );

DROP POLICY IF EXISTS "Authenticated can update vestuario_modelos" ON public.vestuario_modelos;
CREATE POLICY "Authenticated can update vestuario_modelos"
  ON public.vestuario_modelos FOR UPDATE
  TO authenticated
  USING (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- Alquiler items
DROP POLICY IF EXISTS "Authenticated can insert alquiler_items" ON public.alquiler_items;
CREATE POLICY "Authenticated can insert alquiler_items"
  ON public.alquiler_items FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- Entregas devoluciones
DROP POLICY IF EXISTS "Authenticated can insert entregas_devoluciones" ON public.entregas_devoluciones;
CREATE POLICY "Authenticated can insert entregas_devoluciones"
  ON public.entregas_devoluciones FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- Solicitudes
DROP POLICY IF EXISTS "Authenticated can insert solicitudes" ON public.solicitudes_cliente;
CREATE POLICY "Authenticated can insert solicitudes"
  ON public.solicitudes_cliente FOR INSERT
  TO authenticated
  WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated can update solicitudes" ON public.solicitudes_cliente;
CREATE POLICY "Authenticated can update solicitudes"
  ON public.solicitudes_cliente FOR UPDATE
  TO authenticated
  USING (true);

-- Perfil propio: usuario puede actualizar su propio perfil
DROP POLICY IF EXISTS "Users can update own profile" ON public.profiles;
CREATE POLICY "Users can update own profile"
  ON public.profiles FOR UPDATE
  TO authenticated
  USING (id = auth.uid());

-- Admin puede gestionar todos los perfiles
DROP POLICY IF EXISTS "Admin can insert profiles" ON public.profiles;
CREATE POLICY "Admin can insert profiles"
  ON public.profiles FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- Configuración: solo admin puede modificar
DROP POLICY IF EXISTS "Admin can update configuracion" ON public.configuracion_general;
CREATE POLICY "Admin can update configuracion"
  ON public.configuracion_general FOR UPDATE
  TO authenticated
  USING (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );

DROP POLICY IF EXISTS "Admin can insert configuracion" ON public.configuracion_general;
CREATE POLICY "Admin can insert configuracion"
  ON public.configuracion_general FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (SELECT 1 FROM public.profiles WHERE id = auth.uid() AND role = 'admin')
  );


-- ============================================================
-- VERIFICACIÓN: ver las políticas creadas
-- ============================================================
SELECT tablename, policyname, cmd
FROM pg_policies
WHERE schemaname = 'public'
ORDER BY tablename, cmd;
