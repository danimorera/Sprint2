SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio*1.01 FROM producto;
SELECT nombre AS 'nom de producto', precio AS 'euros', precio * 1.01 AS 'dòlars' FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS first2 FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
SELECT f.codigo FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT DISTINCT(f.codigo) FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT nombre FROM fabricante ORDER BY nombre;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre FROM producto ORDER BY nombre, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3,2;
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT p.nombre, p.precio, f.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre;
SELECT p.codigo, p.nombre, p.codigo_fabricante, f.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio LIMIT 1;
SELECT p.nombre, p.precio, f.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;
SELECT p.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
SELECT p.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;
SELECT p.codigo, p.nombre, f.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate' OR f.nombre = 'Asus';
SELECT p.codigo, p.nombre, f.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ( 'Hewlett-Packard', 'Seagate', 'Asus' );
SELECT p.nombre, p.precio FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE ('%e');
SELECT p.nombre, p.precio FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE ('%w%');
SELECT p.nombre, p.precio, f.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre;
SELECT p.codigo_fabricante, f.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo;
SELECT * FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo;
SELECT * FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo WHERE p.codigo IS NULL;
SELECT * FROM producto p, fabricante f WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Lenovo';
SELECT * FROM producto p WHERE p.precio = ( SELECT MAX(p.precio) FROM producto WHERE codigo_fabricante = ( SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo' ) );
SELECT p.nombre FROM producto p, fabricante f WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;
SELECT p.nombre FROM producto p, fabricante f WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Hewlett-Packard' ORDER BY p.precio LIMIT 1;
SELECT * FROM producto p WHERE p.precio >= ( SELECT MAX(p.precio) FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'Lenovo' );
SELECT * FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'Asus' AND p.precio > ( SELECT AVG(p.precio) FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'Asus' );