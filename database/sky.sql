--
-- Base de datos: `sky`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_admin` (IN `num` INT, IN `st` INT)  BEGIN
DECLARE cnt INT DEFAULT 0;
set foreign_key_checks=0;
WHILE cnt < num DO
    insert into administrativo values (
st+cnt,
truncate(1500+rand()*15000,2),
FLOOR( 1 + RAND( ) *8 ),
"pass"
);
    SET cnt = cnt + 1;
END WHILE;
set foreign_key_checks=1;
END$$

CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_canpaq` (IN `num` INT)  BEGIN
DECLARE cnt INT DEFAULT 0;
DECLARE exi INT DEFAULT 0;
DECLARE idp INT DEFAULT 0;
DECLARE idc INT DEFAULT 0;
set foreign_key_checks=0;
WHILE cnt < num DO
set idp = FLOOR( 1 + RAND( ) *10 );
set idc = FLOOR( 1 + RAND( ) *100 );
set exi = (select count(*) from canalpaquete where idpaquete=idp and idcanal = idc );
if exi = 0 then
   insert into canalpaquete values (idp,idc);
    SET cnt = cnt + 1;
end if;
END WHILE;
set foreign_key_checks=1;
END$$

CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_dopaquete` (IN `num` INT, IN `st` INT)  BEGIN
DECLARE cnt INT DEFAULT 0;
set foreign_key_checks=0;
WHILE cnt < num DO
    insert into dopaquete values (
FLOOR( 1 + RAND( ) *50 ),
FLOOR( 1 + RAND( ) *10 ),
st+cnt,
(SELECT NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
NULL
);
    SET cnt = cnt + 1;
END WHILE;
set foreign_key_checks=1;
END$$

CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_doservicio` (IN `num` INT)  BEGIN
DECLARE cnt INT DEFAULT 0;
set foreign_key_checks=0;
WHILE cnt < num DO
    insert into doservicio values (
    (FLOOR( 1 + RAND( ) *10 )),
    (FLOOR( 1 + RAND( ) *50 )),
    (FLOOR( 1 + RAND( ) *40 )),
    (SELECT NOW() - INTERVAL FLOOR(RAND() * 365) DAY));
    SET cnt = cnt + 1;
END WHILE;
set foreign_key_checks=1;
END$$

CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_equipo` (IN `num` INT, IN `provnum` INT)  BEGIN
DECLARE cnt INT DEFAULT 0;
set foreign_key_checks=0;
WHILE cnt < num DO
    insert into equipo values (NULL,(FLOOR( 100000 + RAND()*900000)),(FLOOR( 1 + RAND() * provnum )) );
    SET cnt = cnt + 1;
END WHILE;
set foreign_key_checks=1;
END$$

CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_pago` (IN `concept` VARCHAR(45), IN `tipo` INT, IN `num` INT)  BEGIN
DECLARE cont INT DEFAULT 0;
DECLARE ide INT DEFAULT NULL;
DECLARE idc INT DEFAULT NULL;
DECLARE idp INT DEFAULT NULL;
set foreign_key_checks = 0;
WHILE cont < num DO
if tipo = 1 then set ide = (FLOOR( 1 + RAND( ) *50 ));
elseif tipo = 2 then set idc = (FLOOR( 1 + RAND( ) *50 ));
elseif tipo = 3 then set idp = (FLOOR( 1 + RAND( ) *10 ));
end if;
    insert into pago values (NULL, truncate(rand()*1000,2), concept ,(SELECT TIMESTAMP(NOW())-INTERVAL FLOOR(RAND()*720) Hour),ide,idc,idp);
    SET cont = cont + 1;
END WHILE;
set foreign_key_checks = 1;
END$$

CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_tecnico` (IN `num` INT, IN `area` VARCHAR(45), IN `st` INT)  BEGIN
DECLARE cnt INT DEFAULT 0;
set foreign_key_checks=0;
WHILE cnt < num DO
    insert into tecnico values (
st+cnt,
area
);
    SET cnt = cnt + 1;
END WHILE;
set foreign_key_checks=1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativo`
--

CREATE TABLE `administrativo` (
  `idEmpleado` int(11) NOT NULL,
  `Salario` double DEFAULT NULL,
  `Horas` int(11) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canal`
--

CREATE TABLE `canal` (
  `idCanal` int(11) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `imagen` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `canal`
--

INSERT INTO `canal` (`idCanal`, `Descripcion`, `Nombre`, `imagen`) VALUES
(1, 'Entretenimiento real', 'FOX', 'fox.jpg'),
(2, 'Musica para tus oidos', 'Mosaico Música y Audio', 'mosaico.jpg'),
(3, 'Solo lo mejor de Latinoamérica', 'MTV Latino', 'mtvlatino.jpg'),
(4, 'Lo mejor de la música del momento', 'MTV Hits', 'mtv.jpg'),
(5, 'The best for Europe', 'VH1 Classic Europe', 'classic.jpg'),
(6, 'Escucha lo mejor de Latinoamérica', 'VH1 Latino', 'vh1.png'),
(7, 'Para bailar un rato', 'Ritmoson Latino', 'ritmoson.jpe'),
(8, 'Solo la mejor musica en español', 'Telehit', 'telehit.png'),
(9, 'Lo mejor de las bandas!!', 'Bandamax', 'bandama.png'),
(10, 'Siempre a la vanguardia de la información', 'FOX News', 'foxnews.png'),
(11, 'Mantente informado', 'CNN en Español', 'cnnespa.jpg'),
(12, 'News for you', 'CNN International', 'cnnint.png'),
(13, 'Worldwide News!!', 'BBC World News', 'bbc.gif'),
(14, 'Only important news', 'Management TV', 'manag.jpe'),
(15, 'National Football League', 'NFL', 'nfl.png'),
(16, 'Canal de las Estrellas México', 'Canal 2', 'ca2.jpg'),
(17, 'Solo entretenimiento', 'Canal 5', 'ca5.png'),
(18, 'Informado todo el dia', 'Foro TV', 'foro.jpg'),
(19, 'Diviertete en grande...', 'Azteca 7', 'can7.png'),
(20, 'Peliculas para pasar el rato!!', 'Galavisión', 'gala.gif'),
(21, 'Canal del IPN', 'Once TV', 'canalonce.png'),
(22, 'Un canal cerca de ti', 'Azteca 13', 'azt13.png'),
(23, 'Todo bajo el análisis de los expertos', 'Milenio TV', 'milenio.png'),
(24, 'El canal de CONACULTA', 'Canal 22', 'can22.png'),
(25, 'Un nuevo concepto de TV', 'Proyecto 40', 'can40.png'),
(26, 'El mejor del norte', 'Canal 34 de Monterrey TV', 'can34.png'),
(27, 'El más destacado de Guadalajara', 'Canal 4 de Guadalajara TV', 'can4.jpg'),
(28, 'La mejor señal de Tv abierta del Golfo', 'Canal 3 Puebla-Veracruz', 'can3.png'),
(29, 'Canal del gobierno del Estado de México', 'Canal 34 Televisión Mexiquense', 'can34me.jpg'),
(30, 'La TV más interesante!!', 'Teleantillas', 'telea.png'),
(31, 'La mejor TV del centro de América', 'TVN-2 Panama', 'tvn.jpe'),
(32, 'Máximo entretenimiento', 'TV MAX', 'tvmax.png'),
(33, 'The best movies, series...', 'BBC Entertainment', 'BBCEnt.png'),
(34, 'Solo la mejor diversión', 'Unicable', 'unicable.gif'),
(35, 'Las mejores películas!!!', 'Warner Channel México', 'warner.png'),
(36, 'Entretenimiento puro!!!', 'E! Entertainment', 'e!.png'),
(37, 'Pura diversion y ocio', 'FX Latino', 'fx.png'),
(38, 'Calidad y diversión', 'Universal Channel América Latina', 'universal.png'),
(39, 'Buen entretenimiento para todos', 'A&E Mundo', 'ae.png'),
(40, 'Encontraste el mejor!!!', 'AXN Latinoamérica', 'axn.jpg'),
(41, 'Distracción y pasatiempo', 'Telemundo Internacional', 'telemundo.jpg'),
(42, 'Cuidandote y entreteniéndote...', 'Discovery Home & Health', 'home.png'),
(43, 'Una nueva idea de ocio', 'Fox Life', 'foxlife.png'),
(44, 'Una nueva forma perder el tiempo', 'Glitz', 'glitz.png'),
(45, 'No dejaras de reír!!', 'Distrito Comedia', 'distritoc.png'),
(46, 'El mundo real llevado a tus ojos', 'Reality Tv', 'reality.png'),
(47, 'Descubre la naturaleza y más', 'Animal Planet', 'animal.png'),
(48, 'Descubre tu mundo...', 'Discovery Channel', 'discovery.png'),
(49, 'Conoce tu pasado...', 'History Channel', 'histoey.jpe'),
(50, 'Descubre tu planeta', 'National Geographic', 'national.jpg'),
(51, 'El canal de la UNAM', 'TV UNAM', 'tvunam.jpg'),
(52, 'Conoce la vida de importantes personajes', 'Biography Channel', 'bio.png'),
(53, 'La televisión del futuro', 'Marlavision', 'maria.jpg'),
(54, 'Comunicados con el presente', 'Enlace TBN', 'enlace.jpe'),
(55, 'Entretenimiento mundial', 'TVE International', 'tve.jpe'),
(56, 'Descubre el nuevo entretenimiento', 'Antena 3', 'antena.gif'),
(57, '...Una nueva forma de entretenerte', 'Galicia TV', 'galicia.png'),
(58, 'Conoce tu planeta', 'TV Globo Internacional', 'tv globo.jpg'),
(59, 'Descubre tu mente', 'TV 5 Monde Latina', 'tv5.jpe'),
(60, 'Entretenimiento con un nuevo enfoque', 'Deutsche Welle', 'dw.gif'),
(61, 'La mejor de Italia', 'RAI UNO Italia', 'rai.jpg'),
(62, 'Japón en tu pantalla', 'NHK Japon World Premium', 'nhk.jpe'),
(63, 'La mejor para niños', 'Mosaico Kids', 'kids.jpe'),
(64, 'A challenge for kids', 'Discovery Kids', 'diskids.png'),
(65, 'Entertainment for kids', 'Nickelodeon', 'nick.jpg'),
(66, 'Funny and fool!!', 'Disney XD', 'disney.png'),
(67, 'The best for kids', 'Cartoon Network', 'cn4.png'),
(68, 'Diviértete como niño', 'Tiin', 'tinn.png'),
(69, 'Disney at your TV', 'Disney Channel', 'disneycha.png'),
(70, '...Destroy your TV!!', 'Boomerang Mexico', 'boomerang.jpg'),
(71, 'The first in your life', 'Baby Tv', 'baby.png'),
(72, 'For little kids!!!', 'Nick Jr', 'nickjr.jpe'),
(73, 'Childs at the BBC', 'CBeebies BBC', 'bbcbaby.jpe'),
(74, 'Entertainment for your baby', 'Disney Junior', 'disneyjr.png'),
(75, 'Para tus tardes...', 'De Pelicula', 'dp.jpg'),
(76, 'Golden at your TV', 'Golden', 'golden.jpg'),
(77, 'The best of Golden', 'Golden Edge', 'goldened.png'),
(78, 'The unique Golden', 'Golden Multiplex', 'goldenmul.png'),
(79, 'Real, and unique entertainment', 'TNT', 'tnt.png'),
(80, 'Mejorando tu día', 'Film & Arts', 'film.png'),
(81, 'An entertainment area', 'Film Zone', 'filmzone.jpe'),
(82, 'The best movies', 'Moviecity Premieres', 'moviecity.pngcit'),
(83, 'Movies at your home', 'City Family', 'cityfam.png'),
(84, 'Lo mejor de la temporada', 'Cinecanal', 'cinecanal.png'),
(85, 'HBO at your home', 'HBO 2 Latinoamerica', 'hbo.png'),
(86, 'Las mejores producciones para ti', 'HBO Plus', 'HBOPLUS.png'),
(87, 'Together... in family', 'HBO Family', 'HBOFamily.png'),
(88, 'Premieres, cine... y diversión', 'Max Prime', 'maxprime.gif'),
(89, 'Disfruta del futbol', 'Planeta Futbol 1', 'planeta.jpe'),
(90, 'Lo mejor de los deportes', 'TDN', 'tdn.jpe'),
(91, 'Los deportes en otro enfoque', 'ESPN International', 'espn.png'),
(92, 'TV con lo mejor del deporte', 'FOX Sports', 'foxes.jpe'),
(93, 'La fórmula 1 a tu alcance', 'Speed Latinoamerica', 'speed.png'),
(94, 'Solo para los expertos', 'Golf Channel', 'golf.png'),
(95, 'Lo mejor del basketball en tu TV', 'NBA', 'nba.png'),
(96, 'Un mejor analisis de los deportes', 'ESPN 2', 'espn2.jpg'),
(97, 'Una TV con mas deporte', 'FOX Sports +', 'foxsports.jpe'),
(98, 'Lo mejor seleccion del basketball', 'NBA Pass1', 'nbapass.jpe'),
(99, 'El deporte es oficial', 'MLB', 'mlb.png'),
(100, 'Tu noticiario oficial', 'Mosaico Noticias', 'noticias.jpe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canalpaquete`
--

CREATE TABLE `canalpaquete` (
  `idPaquete` int(11) NOT NULL,
  `idCanal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `canalpaquete`
--

INSERT INTO `canalpaquete` (`idPaquete`, `idCanal`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 20),
(1, 21),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 30),
(1, 31),
(1, 32),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 57),
(1, 58),
(1, 60),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 77),
(1, 79),
(1, 83),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(2, 1),
(2, 2),
(2, 4),
(2, 6),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 21),
(2, 22),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 52),
(2, 54),
(2, 55),
(2, 57),
(2, 58),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 74),
(2, 76),
(2, 77),
(2, 78),
(2, 79),
(2, 80),
(2, 81),
(2, 82),
(2, 83),
(2, 84),
(2, 86),
(2, 87),
(2, 88),
(2, 89),
(2, 90),
(2, 91),
(2, 92),
(2, 93),
(2, 96),
(2, 97),
(2, 98),
(2, 99),
(2, 100),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(3, 28),
(3, 29),
(3, 30),
(3, 31),
(3, 32),
(3, 33),
(3, 35),
(3, 37),
(3, 38),
(3, 39),
(3, 40),
(3, 41),
(3, 43),
(3, 44),
(3, 45),
(3, 46),
(3, 47),
(3, 48),
(3, 50),
(3, 51),
(3, 52),
(3, 54),
(3, 56),
(3, 57),
(3, 58),
(3, 59),
(3, 60),
(3, 61),
(3, 62),
(3, 63),
(3, 64),
(3, 67),
(3, 68),
(3, 69),
(3, 70),
(3, 73),
(3, 74),
(3, 75),
(3, 76),
(3, 77),
(3, 78),
(3, 79),
(3, 80),
(3, 81),
(3, 82),
(3, 83),
(3, 84),
(3, 85),
(3, 86),
(3, 87),
(3, 88),
(3, 89),
(3, 90),
(3, 91),
(3, 92),
(3, 94),
(3, 95),
(3, 96),
(3, 97),
(3, 98),
(3, 99),
(3, 100),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
(4, 21),
(4, 22),
(4, 23),
(4, 24),
(4, 25),
(4, 26),
(4, 27),
(4, 32),
(4, 33),
(4, 34),
(4, 36),
(4, 37),
(4, 38),
(4, 40),
(4, 42),
(4, 43),
(4, 44),
(4, 45),
(4, 46),
(4, 48),
(4, 49),
(4, 50),
(4, 51),
(4, 52),
(4, 53),
(4, 54),
(4, 55),
(4, 56),
(4, 58),
(4, 59),
(4, 60),
(4, 61),
(4, 62),
(4, 64),
(4, 65),
(4, 66),
(4, 67),
(4, 68),
(4, 69),
(4, 70),
(4, 72),
(4, 73),
(4, 74),
(4, 76),
(4, 77),
(4, 78),
(4, 79),
(4, 80),
(4, 81),
(4, 82),
(4, 83),
(4, 84),
(4, 86),
(4, 87),
(4, 89),
(4, 90),
(4, 91),
(4, 92),
(4, 93),
(4, 94),
(4, 95),
(4, 96),
(4, 97),
(4, 99),
(4, 100),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(5, 12),
(5, 14),
(5, 15),
(5, 16),
(5, 17),
(5, 18),
(5, 19),
(5, 22),
(5, 25),
(5, 27),
(5, 28),
(5, 29),
(5, 30),
(5, 31),
(5, 32),
(5, 33),
(5, 34),
(5, 35),
(5, 36),
(5, 37),
(5, 38),
(5, 39),
(5, 40),
(5, 41),
(5, 42),
(5, 43),
(5, 44),
(5, 45),
(5, 46),
(5, 47),
(5, 49),
(5, 50),
(5, 51),
(5, 52),
(5, 53),
(5, 54),
(5, 56),
(5, 58),
(5, 59),
(5, 60),
(5, 61),
(5, 62),
(5, 63),
(5, 64),
(5, 65),
(5, 66),
(5, 67),
(5, 68),
(5, 69),
(5, 70),
(5, 71),
(5, 72),
(5, 73),
(5, 74),
(5, 75),
(5, 77),
(5, 78),
(5, 79),
(5, 80),
(5, 82),
(5, 83),
(5, 84),
(5, 85),
(5, 86),
(5, 87),
(5, 88),
(5, 90),
(5, 91),
(5, 92),
(5, 93),
(5, 95),
(5, 96),
(5, 97),
(5, 99),
(5, 100),
(6, 1),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 17),
(6, 18),
(6, 19),
(6, 20),
(6, 21),
(6, 22),
(6, 23),
(6, 24),
(6, 25),
(6, 26),
(6, 28),
(6, 29),
(6, 32),
(6, 33),
(6, 34),
(6, 35),
(6, 37),
(6, 38),
(6, 39),
(6, 40),
(6, 41),
(6, 42),
(6, 43),
(6, 44),
(6, 46),
(6, 48),
(6, 49),
(6, 50),
(6, 51),
(6, 52),
(6, 53),
(6, 56),
(6, 57),
(6, 58),
(6, 59),
(6, 60),
(6, 61),
(6, 62),
(6, 63),
(6, 64),
(6, 66),
(6, 67),
(6, 68),
(6, 69),
(6, 70),
(6, 71),
(6, 73),
(6, 74),
(6, 75),
(6, 76),
(6, 77),
(6, 78),
(6, 79),
(6, 80),
(6, 81),
(6, 82),
(6, 83),
(6, 84),
(6, 85),
(6, 86),
(6, 88),
(6, 89),
(6, 90),
(6, 91),
(6, 92),
(6, 93),
(6, 94),
(6, 95),
(6, 96),
(6, 97),
(6, 98),
(6, 100),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),
(7, 11),
(7, 13),
(7, 14),
(7, 15),
(7, 16),
(7, 17),
(7, 18),
(7, 19),
(7, 20),
(7, 21),
(7, 22),
(7, 24),
(7, 25),
(7, 26),
(7, 28),
(7, 29),
(7, 30),
(7, 31),
(7, 33),
(7, 35),
(7, 36),
(7, 38),
(7, 39),
(7, 40),
(7, 41),
(7, 42),
(7, 44),
(7, 45),
(7, 46),
(7, 47),
(7, 49),
(7, 50),
(7, 51),
(7, 52),
(7, 54),
(7, 56),
(7, 58),
(7, 59),
(7, 60),
(7, 61),
(7, 62),
(7, 63),
(7, 64),
(7, 65),
(7, 66),
(7, 67),
(7, 69),
(7, 70),
(7, 72),
(7, 73),
(7, 74),
(7, 75),
(7, 78),
(7, 79),
(7, 80),
(7, 81),
(7, 82),
(7, 84),
(7, 85),
(7, 87),
(7, 88),
(7, 89),
(7, 90),
(7, 91),
(7, 92),
(7, 93),
(7, 94),
(7, 97),
(7, 98),
(7, 99),
(7, 100),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(8, 14),
(8, 15),
(8, 16),
(8, 17),
(8, 18),
(8, 19),
(8, 20),
(8, 21),
(8, 22),
(8, 23),
(8, 24),
(8, 26),
(8, 27),
(8, 28),
(8, 29),
(8, 30),
(8, 31),
(8, 32),
(8, 33),
(8, 34),
(8, 35),
(8, 36),
(8, 37),
(8, 38),
(8, 39),
(8, 40),
(8, 41),
(8, 42),
(8, 44),
(8, 45),
(8, 46),
(8, 47),
(8, 49),
(8, 50),
(8, 51),
(8, 52),
(8, 53),
(8, 55),
(8, 57),
(8, 59),
(8, 60),
(8, 61),
(8, 62),
(8, 63),
(8, 65),
(8, 69),
(8, 71),
(8, 72),
(8, 73),
(8, 74),
(8, 75),
(8, 76),
(8, 78),
(8, 79),
(8, 80),
(8, 81),
(8, 83),
(8, 84),
(8, 85),
(8, 86),
(8, 87),
(8, 88),
(8, 89),
(8, 90),
(8, 91),
(8, 93),
(8, 94),
(8, 96),
(8, 97),
(8, 98),
(8, 99),
(8, 100),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(9, 11),
(9, 12),
(9, 13),
(9, 14),
(9, 15),
(9, 16),
(9, 17),
(9, 18),
(9, 19),
(9, 20),
(9, 21),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(9, 35),
(9, 36),
(9, 37),
(9, 38),
(9, 39),
(9, 40),
(9, 41),
(9, 42),
(9, 43),
(9, 44),
(9, 45),
(9, 46),
(9, 49),
(9, 50),
(9, 51),
(9, 52),
(9, 53),
(9, 54),
(9, 55),
(9, 56),
(9, 57),
(9, 59),
(9, 60),
(9, 61),
(9, 62),
(9, 63),
(9, 64),
(9, 65),
(9, 66),
(9, 67),
(9, 69),
(9, 70),
(9, 71),
(9, 72),
(9, 73),
(9, 74),
(9, 75),
(9, 76),
(9, 77),
(9, 78),
(9, 79),
(9, 80),
(9, 81),
(9, 82),
(9, 83),
(9, 84),
(9, 85),
(9, 86),
(9, 87),
(9, 88),
(9, 89),
(9, 90),
(9, 91),
(9, 92),
(9, 93),
(9, 94),
(9, 95),
(9, 96),
(9, 97),
(9, 98),
(9, 99),
(9, 100),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(10, 7),
(10, 8),
(10, 9),
(10, 10),
(10, 11),
(10, 12),
(10, 14),
(10, 15),
(10, 16),
(10, 17),
(10, 18),
(10, 19),
(10, 21),
(10, 22),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(10, 36),
(10, 37),
(10, 38),
(10, 39),
(10, 40),
(10, 41),
(10, 42),
(10, 43),
(10, 45),
(10, 46),
(10, 47),
(10, 48),
(10, 49),
(10, 50),
(10, 54),
(10, 55),
(10, 56),
(10, 57),
(10, 58),
(10, 59),
(10, 60),
(10, 61),
(10, 62),
(10, 63),
(10, 64),
(10, 65),
(10, 66),
(10, 67),
(10, 69),
(10, 70),
(10, 72),
(10, 73),
(10, 74),
(10, 76),
(10, 79),
(10, 81),
(10, 82),
(10, 83),
(10, 84),
(10, 85),
(10, 86),
(10, 87),
(10, 88),
(10, 89),
(10, 91),
(10, 92),
(10, 93),
(10, 94),
(10, 95),
(10, 96),
(10, 97),
(10, 98),
(10, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `noCuenta` int(11) NOT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Calle` varchar(45) DEFAULT NULL,
  `Colonia` varchar(45) DEFAULT NULL,
  `CP` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `ap` varchar(45) DEFAULT NULL,
  `am` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`noCuenta`, `Telefono`, `Calle`, `Colonia`, `CP`, `fechaNacimiento`, `Nombre`, `ap`, `am`, `password`) VALUES
(1, '5533687309', 'AV CENTRAL', 'FRACC VILLAS DEL SOL I', '55070', '1994-12-08', 'Susana', 'Valencia', 'Rojas', 'Susana'),
(2, '5517626693', 'PARCELA 124', 'EJIDOS DE TEQUISISTLAN', '56020', '1997-04-12', 'Rigoberto', 'Covarrubias', 'Ramirez', 'Rigoberto'),
(3, '5538497112', 'AV BOSQUES ', 'FRACC VILLAS DE ECATEPEC', '55056 ', '1992-06-05', 'Alejandra', 'Nieves', 'Velazquez', 'Alejandra'),
(4, '5528628350', 'TEPIC', 'SANTA MARIA TULPETLAC', '55400', '1987-01-15', 'Martha Marlen', 'Mendarte', 'Angeles', 'Martha'),
(5, '7773799618', 'CALLE DOS', 'MEXICANOS UNIDOS II', '55074', '1996-01-30', 'Zenaida ', 'Mendosa', 'Jimenes', 'Zenaida'),
(6, '5531046400', 'VALLE HUNDIDO', 'REAL DEL VALLE ', '55882', '1972-09-25', 'Mario Alberto', 'Diaz', 'Martinez', 'Mario'),
(7, '5522959463', 'AV LAGO DE PATSCUARO', 'LAGUNA DE CHICONAUTLA', '55070', '1984-02-19', 'Jesus Lizbeth', 'Padron', 'Gonzalez', 'Jesus'),
(8, '46305955', 'MONTE ESTANOBOY', 'FRACC JARDINES DE MORELOS', '55070 ', '1958-03-09', 'Gilberto', 'Oliver', 'Castañeda ', 'Gilberto'),
(9, '57750756', 'HIDALGO', 'SANTA MARIA TULPETLAC', '55400', '1965-04-19', 'Veronica', 'Jimenez ', 'Ortega ', 'Veronica'),
(10, '5524109704', 'RAMON LOPEZ VELARDE ', 'BENITO JUAREZ 3RA SECCION', '55416', '1975-05-06', 'Norma', 'Rodriguez', 'Pintor', 'Norma'),
(11, '5549197079', 'RAMON LOPEZ VELARDE', 'BENITO JUAREZ 2DA SECCION', '55416', '1968-06-17', 'Edgar', 'Montes', 'Muñoz', 'Edgar'),
(12, '7773799618', 'AV DE LAS BOMBAS ', 'MEXICANOS UNIDOS II', '55074', '1955-12-26', 'Zenaida', 'Jimenes', 'Mendosa', 'Zenaida'),
(13, '5524095965', 'PLAYA TABACHINES', 'FRACC JARDINES DE MORELOS', '55070', '1975-05-13', 'Damian', 'Moraga', 'Ortega', 'Damian'),
(14, '5533030840', 'AMAPOLA', 'NUEVA SANTA ROSA', '56300', '2000-12-18', 'Georgina Jacqueline', 'Melendez', 'Olivares', 'Georgina'),
(15, '5524130734', 'HEBERTO CASTILLO', 'LAGUNA DE CHICONAUTLA', '55070', '1966-11-30', 'Maria Del Carmen', 'Hernandez', 'Yañez', 'Maria'),
(16, '5545382971', 'MARGARITA', 'EJIDOS DE TEQUISISTLAN', '56020', '1989-09-15', 'Jose Isaias', 'Perez', 'Galvan', 'Jose'),
(17, '5524480710', 'ABEDUL', 'LA PALMA', '55507', '1997-02-27', 'Alejandro', 'Cortes', 'Rios', 'Alejandro'),
(18, '5521396408', 'PSO VALLE DE LAS FLORES', 'REAL DEL VALLE 2A SECC ', '55883', '1979-10-09', 'Maria Nieves', 'Albino', 'Cortez', 'Nieves'),
(19, '5528628350', 'TEPIC', 'AMPL TULPETLAC', '55400', '1996-12-30', 'Martha Marlen', 'Mendarte', 'Angeles', 'Marlen'),
(20, '5560418015', 'CLAUSTRO SAN ALBERTO', 'MISION SAN AGUSTIN', '55885', '1951-05-11', 'Mayra Alejandra', 'Hernandez', 'Peña', 'Mayra'),
(21, '5514349417', 'TULIPAN', 'NUEVA SANTA ROSA', '56300', '1982-06-20', 'Dario', 'Perez', 'Soria', 'Dario'),
(22, '5544754962', 'CDA IGNACIO MANUEL ALTAMIRANOselect', 'SAN ANTONIO XAHUENTO', '54960', '1960-05-02', 'Jose', 'Rodriguez', 'Resendiz', 'Jose'),
(23, '5520438855', 'HORTENCIA', 'SANTA ROSA', '56300', '1980-08-06', 'Jose Luis', 'Contreras', 'Benitez', 'Luis'),
(24, '5549453886', 'SANTOS DEGOLLADO', 'NUEVA SANTA ROSA GRANJAS EL ARENAL', '56300', '1957-06-17', 'Linda Pamela', 'Perez', 'Trujano', 'Linda'),
(25, '6242293292', 'GUANAJUATO', 'AMPL TULPETLAC', '55418', '1985-12-26', 'Carolina', 'Cruzaley', 'Ramirez', 'Carolina'),
(26, '29345169', 'AV LAGO DE TEXCOCO', 'FRACC GEOVILLAS DE TERRANOVA', '55883', '1995-11-29', 'Ma Asuncion', 'Garcia', 'Garcia', 'Asuncion'),
(27, '5519370977', 'CTO VALLE DE LOMELINA', 'REAL DEL VALLE 2A SECC', '55883', '1965-01-31', 'Aldo', 'Aviles', 'Estrella', 'Aldo'),
(28, '55133212', 'Diamante 130', 'Estrella', '07810', '1988-07-16', 'Salvador', 'Paz', 'Santos', 'Salvador'),
(29, '5572979665', 'CTO LAGO XALTOCAN', 'REAL DEL VALLE', '55883', '1999-11-11', 'Diana Karina', 'Galicia', 'Palacios', 'Diana'),
(30, '5539382322', 'CERRITO', 'SANTA MARIA TULPETLAC', '55400', '1955-05-05', 'Erendira Paola', 'Reymundo', 'Santoyo', 'Erendida'),
(31, '5533184574', 'MARAVILLAS', 'EJIDOS DE TEQUISISTLAN', '56020', '1987-11-08', 'Nadia Suhgey', 'Caballero', 'Avila', 'Nadia'),
(32, '5538853754', 'HUEHUETOCA', 'EL OSTOR', '55089', '1955-12-06', 'Jose Mauricio', 'Cobielles', 'Gaona', 'Mauricio'),
(33, '5544760906', 'AV NACIONAL', 'SANTA MARIA CHICONAUTLA', '55066', '1992-02-20', 'Miriam', 'Jimenez', 'Luna', 'Miriam'),
(34, '5546616639', 'BOSQUE DE VARONA', 'EJIDOS DE TEQUISISTLAN', '56020', '1991-01-01', 'Leticia', 'Durazno', 'Romero', 'Leticia'),
(35, '5544754962', 'CDA IGNACIO MANUEL ALTAMIRANO', 'BARRIO SAN ANTONIO XAHUENTO', '54960', '1984-04-04', 'Jose', 'Rodriguez', 'Resendiz', 'Jose'),
(36, '5523422439', 'ATLACOMULCO', 'ALMARCIGO NTE', '55415', '1988-08-08', 'Arturo', 'Vazquez', 'Jimenez', 'Arturo'),
(37, '2361008076', 'CHAPULTEPEC', 'HIDALGO', '68540', '1991-10-10', 'Josefina', 'Rojas', 'Pereda', 'Josefina'),
(38, '5549132383', 'AV TOLUCA', 'EL OSTOR', '55400', '1952-12-12', 'Jose Alejandro', 'Rubio', 'Reyes', 'Jose'),
(39, '5520675131', 'SANTA FRANCISCA', 'LA PANORAMICA', '55036', '1965-01-13', 'Francisco Arturo', 'Martinez ', 'Alvarado ', 'Francisco'),
(40, '5559542730', 'PROL ACAMBAY', 'AREA NUEVA', '55400', '1970-02-14', 'Giovani', 'Vite', 'Alvarez', 'Giovani'),
(41, '5538488453', 'OCOTE', 'VIVEROS DE TULPETLAC', '55080', '1999-11-16', 'David', 'Ramirez', 'Suarez', 'David'),
(42, '5538276565', '2A PRIV CTO 43', 'HEROES DE TECAMAC SEXTA SECC', '55765', '1956-05-17', 'Gloria', 'Elvira', 'Torres', 'Gloria'),
(43, '4271362641', 'CALLE 4', 'EL TEJOCOTE', '55017', '1968-08-18', 'Laura', 'Salinas', 'Mira', 'Laura'),
(44, '5542646121', 'REFORMA', 'EJIDOS DE TEQUISISTLAN', '56020', '1974-12-19', 'Linda Marlene ', 'Ruiz', 'Alamo', 'Linda'),
(45, '5524471779', 'PERLAS NEGRAS', 'LA JOYA ', '55016', '1973-01-20', 'Jose Antonio', 'Ortiz', 'Alvarado', 'Antonio'),
(46, '5531010315', 'DURAZNO', 'AMPL LOS ANGELES', '55885', '1969-05-21', 'Maria Guadalupe', 'Martinez', 'Gonzalez', 'Guadalupe'),
(47, '5569891387', '1A CDA PIRULES', 'LA JOYA', '55016', '1952-09-22', 'Nallely', 'Pineda', 'Lopez', 'Nallely'),
(48, '51267993', 'PARQ DE LOS VENADOS', 'EL PARQUE', '55414', '1990-06-23', 'Antonio De Jesus', 'Torres', 'Tapia', 'Antonio'),
(49, '5565791567', 'NARDO', 'EJIDOS DE TEQUISISTLAN', '56020', '1994-04-24', 'Jose Manuel ', 'Islas', 'Ruiz', ''),
(50, '5510208792', '3 AMORES', 'CONTITUCION EL SALADO', '56300', '1995-05-25', 'Regina', 'Davalos', 'Garcia', 'Regina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dopaquete`
--

CREATE TABLE `dopaquete` (
  `noCuenta` int(11) NOT NULL,
  `idPaquete` int(11) NOT NULL,
  `idEquipo` int(11) NOT NULL,
  `fechaSubscripcion` date NOT NULL,
  `fechaCancelacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dopaquete`
--

INSERT INTO `dopaquete` (`noCuenta`, `idPaquete`, `idEquipo`, `fechaSubscripcion`, `fechaCancelacion`) VALUES
(1, 4, 44, '2016-04-02', NULL),
(1, 9, 9, '2016-03-14', NULL),
(2, 7, 33, '2016-04-19', NULL),
(2, 7, 100, '2016-05-05', NULL),
(3, 2, 1, '2016-03-27', NULL),
(3, 3, 24, '2016-03-19', NULL),
(3, 7, 59, '2016-05-04', NULL),
(4, 6, 91, '2016-04-08', NULL),
(5, 6, 98, '2016-03-30', NULL),
(5, 9, 89, '2016-03-24', NULL),
(6, 6, 54, '2016-04-29', NULL),
(7, 3, 8, '2016-03-29', NULL),
(8, 1, 15, '2016-03-14', '2016-05-12'),
(9, 2, 62, '2016-04-15', NULL),
(9, 3, 13, '2016-03-21', NULL),
(10, 1, 61, '2016-03-20', NULL),
(10, 3, 80, '2016-03-20', NULL),
(10, 7, 43, '2016-04-08', NULL),
(10, 7, 78, '2016-03-31', NULL),
(10, 9, 12, '2016-04-11', NULL),
(11, 3, 46, '2016-03-28', NULL),
(11, 3, 92, '2016-03-21', NULL),
(11, 5, 48, '2016-03-28', NULL),
(12, 10, 58, '2016-04-30', NULL),
(13, 7, 77, '2016-04-17', NULL),
(14, 2, 5, '2016-03-14', NULL),
(16, 1, 35, '2016-05-08', NULL),
(16, 3, 84, '2016-05-07', NULL),
(16, 6, 22, '2016-05-09', NULL),
(17, 3, 2, '2016-04-16', NULL),
(18, 5, 30, '2016-03-16', NULL),
(18, 7, 66, '2016-04-22', NULL),
(19, 6, 71, '2016-04-06', NULL),
(20, 7, 28, '2016-03-18', '2016-05-12'),
(20, 7, 49, '2016-03-17', '2016-05-12'),
(20, 10, 74, '2016-04-12', '2016-05-12'),
(21, 3, 72, '2016-05-10', NULL),
(21, 7, 3, '2016-05-08', NULL),
(21, 8, 4, '2016-03-30', NULL),
(21, 8, 36, '2016-04-04', NULL),
(22, 2, 97, '2016-04-25', NULL),
(22, 10, 19, '2016-03-31', NULL),
(22, 10, 73, '2016-04-02', NULL),
(24, 2, 17, '2016-04-19', NULL),
(24, 2, 18, '2016-04-20', NULL),
(24, 6, 95, '2016-04-30', NULL),
(24, 8, 96, '2016-04-22', NULL),
(24, 9, 82, '2016-03-21', NULL),
(24, 9, 86, '2016-05-10', NULL),
(25, 4, 26, '2016-04-18', NULL),
(25, 5, 6, '2016-03-21', NULL),
(25, 8, 93, '2016-04-15', NULL),
(27, 1, 81, '2016-04-12', NULL),
(27, 5, 23, '2016-04-02', NULL),
(27, 6, 87, '2016-04-27', NULL),
(28, 2, 14, '2016-03-20', NULL),
(28, 9, 31, '2016-04-02', NULL),
(28, 10, 65, '2016-05-11', NULL),
(28, 10, 88, '2016-05-01', NULL),
(29, 7, 20, '2016-03-27', NULL),
(29, 9, 10, '2016-04-13', NULL),
(30, 4, 55, '2016-03-28', NULL),
(30, 4, 57, '2016-05-08', NULL),
(31, 9, 79, '2016-04-09', NULL),
(32, 4, 38, '2016-03-30', NULL),
(32, 7, 51, '2016-04-09', NULL),
(33, 1, 39, '2016-04-16', NULL),
(33, 3, 67, '2016-05-05', NULL),
(34, 2, 70, '2016-03-28', NULL),
(35, 1, 60, '2016-04-26', NULL),
(35, 2, 63, '2016-04-17', NULL),
(35, 5, 16, '2016-04-19', NULL),
(36, 1, 90, '2016-04-27', NULL),
(38, 3, 75, '2016-03-18', NULL),
(39, 1, 29, '2016-05-05', NULL),
(39, 2, 52, '2016-04-27', NULL),
(39, 3, 83, '2016-03-26', NULL),
(40, 9, 32, '2016-05-04', NULL),
(41, 9, 64, '2016-04-07', '2016-05-12'),
(42, 8, 21, '2016-04-24', NULL),
(42, 10, 42, '2016-04-17', NULL),
(43, 1, 56, '2016-04-11', NULL),
(44, 5, 50, '2016-03-25', NULL),
(44, 7, 25, '2016-04-01', NULL),
(45, 4, 34, '2016-03-23', NULL),
(45, 8, 76, '2016-03-21', NULL),
(46, 2, 41, '2016-05-09', NULL),
(46, 7, 37, '2016-04-25', NULL),
(47, 4, 27, '2016-05-06', NULL),
(48, 3, 11, '2016-04-19', NULL),
(48, 5, 47, '2016-04-11', NULL),
(48, 5, 68, '2016-04-27', NULL),
(48, 10, 53, '2016-05-12', NULL),
(50, 3, 69, '2016-05-09', NULL),
(50, 6, 94, '2016-04-07', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doservicio`
--

CREATE TABLE `doservicio` (
  `idServicio` int(11) NOT NULL,
  `noCuenta` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fechaServicio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `ap` varchar(45) DEFAULT NULL,
  `am` varchar(45) DEFAULT NULL,
  `fechaContratacion` date DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `foto` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `nombre`, `ap`, `am`, `fechaContratacion`, `tipo`, `foto`) VALUES
(1, 'Rogelio', 'Contreras', 'Salazar', '2014-01-23', 'T', 0x312e706e67),
(2, 'Julio Cesar', 'Paredes', 'Carmona', '2014-07-11', 'T', 0x322e706e67),
(3, 'Dar&iacute;o', 'G&oacute;mez', 'Hern&aacute;ndez', '2014-08-05', 'T', 0x332e706e67),
(4, 'Guillermo', '&aacute;lvarez', 'Torres', '2016-03-14', 'T', 0x342e706e67),
(5, 'Kevin Josu&eacute;', 'Romero', 'Ayala', '2015-07-23', 'T', 0x352e706e67),
(6, 'Carolina', 'Guti&eacute;rrez', 'Mora', '2015-09-01', 'T', 0x362e706e67),
(7, 'Marco Antonio', 'Rodr&iacute;guez', 'Molina', '2015-10-09', 'T', 0x372e706e67),
(8, 'Pedro', 'Arellano', 'Zaragoza', '2014-12-10', 'T', 0x382e706e67),
(9, 'Jorge', 'Carmona', 'Arzate', '2016-05-09', 'T', 0x392e706e67),
(10, 'Luis Armando', 'Torres', 'Rico', '2014-11-25', 'T', 0x31302e706e67),
(11, 'Gudalupe', 'Estrada', 'Jimenez', '2015-06-03', 'T', 0x31312e706e67),
(12, 'Rogelio', 'Mora', 'Dom&iacute;nguez', '2015-09-28', 'T', 0x31322e706e67),
(13, 'Hugo', 'Serrano', 'Paredes', '2014-04-01', 'T', 0x31332e706e67),
(14, 'Juli&aacute;n Alfaro', 'Juar&eacute;z', 'Cisneros', '2016-02-10', 'T', 0x31342e706e67),
(15, 'Iv&aacute;n', 'D&iacute;az', 'Delgado', '2014-07-22', 'T', 0x31352e706e67),
(16, 'Johan', 'Pelaez', 'Uribe', '2014-05-29', 'T', 0x31362e706e67),
(17, 'Bryan', 'Garc&iacute;a', 'Bonilla', '2015-03-18', 'T', 0x31372e706e67),
(18, 'Teodolfo Uriel', 'Carrillo', 'S&aacute;nchez', '2015-07-31', 'T', 0x31382e706e67),
(19, 'Christian Yamil', 'Orozco', 'Villar', '2016-04-04', 'T', 0x31392e706e67),
(20, 'Javier', 'Morales', 'Mart&iacute;nez', '2014-12-05', 'T', 0x32302e706e67),
(21, 'Flavio Ces&aacute;r', 'Tellez', 'Rubio', '2015-08-22', 'T', 0x32312e706e67),
(22, 'Carlos', 'Beltr&aacute;n', 'Rojas', '2014-01-14', 'T', 0x32322e706e67),
(23, 'Armando', 'Jimenez', 'Vera', '2016-04-25', 'T', 0x32332e706e67),
(24, 'Rogelio Uriel', 'Romero', 'S&aacute;nchez', '2015-11-19', 'T', 0x32342e706e67),
(25, 'Jos&eacute; Luis', 'Beltr&aacute;n', 'Echeverr&iacute;a', '2015-09-21', 'T', 0x32352e706e67),
(26, 'Andr&eacute;s', 'Lop&eacute;z', 'Contreras', '2015-02-20', 'T', 0x32362e706e67),
(27, 'Ram&oacute;n', 'Arzate', 'Salazar', '2015-12-15', 'T', 0x32372e706e67),
(28, 'Eduardo', 'Costa', 'S&aacute;nchez', '2015-01-09', 'T', 0x32382e706e67),
(29, 'Alan', 'Pascual', 'Ruiz', '2014-07-02', 'T', 0x32392e706e67),
(30, 'Israel', 'G&oacute;mez', 'Guti&eacute;rrez', '2016-04-08', 'T', 0x33302e706e67),
(31, 'Jos&eacute; Ignacio', 'Duarte', 'Iglesias', '2014-10-28', 'T', 0x33312e706e67),
(32, 'Oscar', 'Barrientos', 'Su&aacute;rez', '2014-12-01', 'T', 0x33322e706e67),
(33, 'Juli&aacute;n', 'Cisneros', 'Carmona', '2014-01-17', 'T', 0x33332e706e67),
(34, 'Francisco', 'Rojas', 'Tovias', '2015-02-11', 'T', 0x33342e706e67),
(35, 'Ces&aacute;r', '&aacute;lvarez', 'Torres', '2015-05-11', 'T', 0x33352e706e67),
(36, 'Alfredo', 'Dom&iacute;nguez', 'Garc&iacute;a', '2015-07-06', 'T', 0x33362e706e67),
(37, 'Carlos', 'Molina', 'Gallego', '2016-02-15', 'T', 0x33372e706e67),
(38, 'Javier', 'Barranco', 'D&iacute;az', '2016-04-01', 'T', 0x33382e706e67),
(39, 'Fernando', 'Velez', 'P&eacute;rez', '2015-06-24', 'T', 0x33392e706e67),
(40, 'Ra&uacute;l', 'Casta&ntilde;on', 'D&iacute;az', '2015-10-08', 'T', 0x34302e706e67),
(41, 'Cynthia Aylin', 'Serna', 'V&aacute;zquez', '2014-09-02', 'A', 0x34312e706e67),
(42, 'Carmen', 'Rojas', 'Rodr&iacute;guez', '2015-03-09', 'A', 0x34322e706e67),
(43, 'Julieta', 'Ruiz', 'Estrada', '2014-01-10', 'A', 0x34332e706e67),
(44, 'Helena', 'Romero', 'Villase&ntilde;or', '2014-01-08', 'A', 0x34342e706e67),
(45, 'Johanna', 'Rodr&iacute;guez', 'Castro', '2015-06-03', 'A', 0x34352e706e67),
(46, 'Jennifer', 'Salas', 'Veloz', '2014-08-14', 'A', 0x34362e706e67),
(47, 'Katia', 'Uribe', 'G&oacute;mez', '2014-08-29', 'A', 0x34372e706e67),
(48, 'Genaro', 'Roman', 'Lop&eacute;z', '2015-02-06', 'A', 0x34382e706e67),
(49, 'Lydia', 'Mu&ntilde;oz', 'Duarte', '2015-12-07', 'A', 0x34392e706e67),
(50, 'Marisol', 'D&iacute;az', 'Juar&eacute;z', '2014-06-06', 'A', 0x35302e706e67);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `idEquipo` int(11) NOT NULL,
  `noTarjeta` int(11) DEFAULT NULL,
  `idProveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`idEquipo`, `noTarjeta`, `idProveedor`) VALUES
(1, 446949, 5),
(2, 279014, 6),
(3, 378729, 9),
(4, 184730, 1),
(5, 101323, 9),
(6, 262558, 4),
(8, 394492, 9),
(9, 504957, 6),
(10, 643753, 3),
(11, 486698, 5),
(12, 753499, 5),
(13, 936194, 4),
(14, 206211, 5),
(15, 892265, 1),
(16, 697133, 2),
(17, 715142, 1),
(18, 113518, 1),
(19, 220557, 6),
(20, 468936, 4),
(21, 624778, 9),
(22, 450355, 5),
(23, 233747, 4),
(24, 388006, 6),
(25, 768391, 1),
(26, 307386, 9),
(27, 724824, 9),
(28, 205187, 1),
(29, 975139, 7),
(30, 480960, 2),
(31, 361997, 2),
(32, 749309, 3),
(33, 178901, 7),
(34, 255342, 9),
(35, 541396, 1),
(36, 788454, 7),
(37, 208067, 6),
(38, 457185, 4),
(39, 513923, 4),
(41, 122354, 5),
(42, 975835, 7),
(43, 339680, 5),
(44, 371418, 3),
(46, 653968, 4),
(47, 726948, 6),
(48, 726296, 9),
(49, 957093, 4),
(50, 848119, 2),
(51, 300426, 7),
(52, 775031, 7),
(53, 321753, 2),
(54, 938035, 3),
(55, 526893, 7),
(56, 668659, 4),
(57, 762481, 8),
(58, 369212, 4),
(59, 152710, 2),
(60, 478592, 8),
(61, 518859, 1),
(62, 150997, 1),
(63, 899214, 5),
(64, 426104, 6),
(65, 903044, 7),
(66, 722916, 5),
(67, 208017, 3),
(68, 146080, 5),
(69, 903371, 3),
(70, 549341, 8),
(71, 507132, 9),
(72, 191452, 9),
(73, 873401, 8),
(74, 471550, 7),
(75, 198840, 6),
(76, 434018, 3),
(77, 156781, 7),
(78, 872690, 5),
(79, 770080, 4),
(80, 477314, 2),
(81, 338260, 1),
(82, 331114, 3),
(83, 546836, 8),
(84, 209861, 5),
(86, 162218, 6),
(87, 689586, 6),
(88, 842171, 5),
(89, 794981, 6),
(90, 325111, 8),
(91, 822275, 9),
(92, 997236, 4),
(93, 747004, 6),
(94, 717970, 8),
(95, 618388, 7),
(96, 787656, 8),
(97, 399977, 5),
(98, 510657, 9),
(100, 655500, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idTransaccion` int(11) NOT NULL,
  `Monto` float DEFAULT NULL,
  `concepto` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `idEmpleado` int(11) DEFAULT NULL,
  `noCuenta` int(11) DEFAULT NULL,
  `idProveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idTransaccion`, `Monto`, `concepto`, `fecha`, `idEmpleado`, `noCuenta`, `idProveedor`) VALUES
(1, 914.3, 'cobro renta', '2016-04-18 19:28:44', NULL, 14, NULL),
(2, 155.21, 'cobro renta', '2016-04-26 18:28:44', NULL, 5, NULL),
(3, 730.73, 'cobro renta', '2016-04-26 12:28:44', NULL, 3, NULL),
(4, 268.03, 'cobro renta', '2016-05-04 00:28:44', NULL, 18, NULL),
(5, 712.87, 'cobro renta', '2016-05-09 19:28:44', NULL, 25, NULL),
(6, 793.4, 'cobro renta', '2016-04-30 18:28:45', NULL, 10, NULL),
(7, 224.68, 'cobro renta', '2016-04-20 02:28:45', NULL, 24, NULL),
(8, 553.11, 'cobro renta', '2016-04-13 21:28:46', NULL, 48, NULL),
(9, 182.45, 'cobro renta', '2016-04-14 00:28:46', NULL, 50, NULL),
(10, 662.5, 'cobro renta', '2016-05-10 10:28:47', NULL, 5, NULL),
(11, 73.98, 'cobro renta', '2016-04-22 13:28:47', NULL, 13, NULL),
(12, 30.89, 'cobro renta', '2016-05-06 11:28:47', NULL, 50, NULL),
(13, 474.15, 'cobro renta', '2016-04-12 21:28:47', NULL, 41, NULL),
(14, 98.43, 'cobro renta', '2016-05-02 21:28:47', NULL, 20, NULL),
(15, 72.75, 'cobro renta', '2016-04-18 07:28:47', NULL, 10, NULL),
(16, 162.35, 'cobro renta', '2016-04-20 18:28:47', NULL, 36, NULL),
(17, 24.4, 'cobro renta', '2016-05-10 13:28:47', NULL, 2, NULL),
(18, 568.75, 'cobro renta', '2016-04-29 01:28:47', NULL, 7, NULL),
(19, 841.8, 'cobro renta', '2016-04-13 17:28:47', NULL, 22, NULL),
(20, 987.96, 'cobro renta', '2016-04-28 00:28:47', NULL, 8, NULL),
(21, 308.63, 'cobro renta', '2016-04-25 22:28:47', NULL, 17, NULL),
(22, 15.33, 'cobro renta', '2016-04-14 09:28:47', NULL, 37, NULL),
(23, 893.52, 'cobro renta', '2016-04-15 06:28:47', NULL, 27, NULL),
(24, 68.36, 'cobro renta', '2016-05-08 14:28:47', NULL, 38, NULL),
(25, 343.91, 'cobro renta', '2016-04-20 06:28:47', NULL, 17, NULL),
(26, 667.41, 'cobro renta', '2016-04-22 13:28:47', NULL, 29, NULL),
(27, 107.45, 'cobro renta', '2016-04-14 07:28:47', NULL, 11, NULL),
(28, 576.34, 'cobro renta', '2016-05-09 07:28:47', NULL, 14, NULL),
(29, 206.33, 'cobro renta', '2016-04-13 03:28:47', NULL, 35, NULL),
(30, 945.42, 'cobro renta', '2016-05-04 16:28:47', NULL, 9, NULL),
(31, 63.18, 'cobro renta', '2016-05-04 08:28:47', NULL, 18, NULL),
(32, 528.12, 'cobro renta', '2016-04-27 13:28:47', NULL, 3, NULL),
(33, 544.28, 'cobro renta', '2016-05-01 16:28:47', NULL, 40, NULL),
(34, 283.58, 'cobro renta', '2016-05-04 16:28:47', NULL, 3, NULL),
(35, 990.9, 'cobro renta', '2016-04-13 21:28:47', NULL, 18, NULL),
(36, 615.46, 'cobro renta', '2016-05-10 20:28:47', NULL, 35, NULL),
(37, 482.88, 'cobro renta', '2016-04-27 20:28:47', NULL, 16, NULL),
(38, 13.41, 'cobro renta', '2016-04-29 05:28:47', NULL, 45, NULL),
(39, 35.43, 'cobro renta', '2016-05-11 19:28:47', NULL, 3, NULL),
(40, 472.18, 'cobro renta', '2016-04-21 12:28:47', NULL, 45, NULL),
(41, 817.94, 'cobro renta', '2016-05-06 10:28:47', NULL, 49, NULL),
(42, 686.74, 'cobro renta', '2016-05-08 21:28:47', NULL, 23, NULL),
(43, 854.76, 'cobro renta', '2016-04-12 07:28:47', NULL, 22, NULL),
(44, 839.38, 'cobro renta', '2016-05-08 04:28:47', NULL, 18, NULL),
(45, 72.4, 'cobro renta', '2016-05-08 19:28:47', NULL, 5, NULL),
(46, 129.21, 'cobro renta', '2016-04-18 05:28:47', NULL, 15, NULL),
(47, 382.09, 'cobro renta', '2016-05-03 21:28:47', NULL, 28, NULL),
(48, 79.03, 'cobro renta', '2016-04-15 15:28:47', NULL, 9, NULL),
(49, 6.32, 'cobro renta', '2016-04-22 02:28:48', NULL, 7, NULL),
(50, 372.03, 'cobro renta', '2016-05-10 05:28:48', NULL, 14, NULL),
(101, 292.32, 'cobro instalacion', '2016-05-05 09:30:19', NULL, 38, NULL),
(102, 347.89, 'cobro instalacion', '2016-05-07 12:30:19', NULL, 10, NULL),
(103, 938.79, 'cobro instalacion', '2016-04-21 15:30:19', NULL, 34, NULL),
(104, 710.64, 'cobro instalacion', '2016-04-14 08:30:19', NULL, 28, NULL),
(105, 504.34, 'cobro instalacion', '2016-05-06 18:30:19', NULL, 23, NULL),
(106, 160.42, 'cobro instalacion', '2016-04-17 19:30:19', NULL, 17, NULL),
(107, 216.19, 'cobro instalacion', '2016-04-26 13:30:19', NULL, 27, NULL),
(108, 964.04, 'cobro instalacion', '2016-05-08 02:30:19', NULL, 45, NULL),
(109, 286.08, 'cobro instalacion', '2016-05-04 19:30:19', NULL, 37, NULL),
(110, 857.37, 'cobro instalacion', '2016-05-01 07:30:19', NULL, 16, NULL),
(111, 865.85, 'cobro instalacion', '2016-04-18 12:30:19', NULL, 10, NULL),
(112, 119.35, 'cobro instalacion', '2016-04-20 01:30:19', NULL, 15, NULL),
(113, 170.45, 'cobro instalacion', '2016-05-10 12:30:19', NULL, 14, NULL),
(114, 414.01, 'cobro instalacion', '2016-04-13 13:30:19', NULL, 36, NULL),
(115, 518.56, 'cobro instalacion', '2016-05-06 06:30:19', NULL, 24, NULL),
(116, 307.2, 'cobro instalacion', '2016-04-29 07:30:19', NULL, 19, NULL),
(117, 575.27, 'cobro instalacion', '2016-04-30 10:30:19', NULL, 9, NULL),
(118, 727.31, 'cobro instalacion', '2016-05-08 08:30:19', NULL, 9, NULL),
(119, 652.8, 'cobro instalacion', '2016-05-09 22:30:19', NULL, 21, NULL),
(120, 587.11, 'cobro instalacion', '2016-04-15 17:30:19', NULL, 18, NULL),
(121, 343.63, 'cobro instalacion', '2016-04-13 11:30:19', NULL, 30, NULL),
(122, 638.72, 'cobro instalacion', '2016-05-08 13:30:19', NULL, 35, NULL),
(123, 820.17, 'cobro instalacion', '2016-05-05 11:30:19', NULL, 32, NULL),
(124, 368.25, 'cobro instalacion', '2016-05-10 16:30:19', NULL, 31, NULL),
(125, 315.76, 'cobro instalacion', '2016-05-02 05:30:19', NULL, 5, NULL),
(126, 318.37, 'cobro instalacion', '2016-04-23 02:30:19', NULL, 33, NULL),
(127, 943.97, 'cobro instalacion', '2016-05-04 21:30:19', NULL, 9, NULL),
(128, 921.64, 'cobro instalacion', '2016-04-22 15:30:19', NULL, 17, NULL),
(129, 244.28, 'cobro instalacion', '2016-04-14 02:30:19', NULL, 22, NULL),
(130, 658.76, 'cobro instalacion', '2016-04-22 18:30:19', NULL, 45, NULL),
(131, 105.71, 'cobro instalacion', '2016-04-14 05:30:19', NULL, 11, NULL),
(132, 670.47, 'cobro instalacion', '2016-04-27 01:30:19', NULL, 15, NULL),
(133, 783.41, 'cobro instalacion', '2016-04-25 00:30:19', NULL, 23, NULL),
(134, 570.09, 'cobro instalacion', '2016-04-26 19:30:19', NULL, 23, NULL),
(135, 455.14, 'cobro instalacion', '2016-04-14 18:30:19', NULL, 40, NULL),
(136, 19.43, 'cobro instalacion', '2016-04-21 23:30:19', NULL, 8, NULL),
(137, 265.5, 'cobro instalacion', '2016-04-24 12:30:19', NULL, 13, NULL),
(138, 715.5, 'cobro instalacion', '2016-05-02 13:30:19', NULL, 5, NULL),
(139, 71.62, 'cobro instalacion', '2016-05-07 01:30:19', NULL, 20, NULL),
(140, 411.77, 'cobro instalacion', '2016-05-02 00:30:19', NULL, 29, NULL),
(141, 8, 'cobro instalacion', '2016-04-16 09:30:19', NULL, 20, NULL),
(142, 522.24, 'cobro instalacion', '2016-04-12 15:30:19', NULL, 11, NULL),
(143, 563.15, 'cobro instalacion', '2016-04-14 00:30:19', NULL, 15, NULL),
(144, 952.14, 'cobro instalacion', '2016-04-14 05:30:19', NULL, 48, NULL),
(145, 966.19, 'cobro instalacion', '2016-04-23 23:30:19', NULL, 38, NULL),
(146, 587.41, 'cobro instalacion', '2016-04-20 09:30:19', NULL, 4, NULL),
(147, 905.77, 'cobro instalacion', '2016-05-08 20:30:19', NULL, 41, NULL),
(148, 601.69, 'cobro instalacion', '2016-04-21 18:30:19', NULL, 40, NULL),
(149, 679.88, 'cobro instalacion', '2016-04-18 04:30:19', NULL, 27, NULL),
(150, 144.73, 'cobro instalacion', '2016-05-11 07:30:19', NULL, 46, NULL),
(151, 221.67, 'cobro instalacion', '2016-05-07 12:30:19', NULL, 33, NULL),
(152, 826.58, 'cobro instalacion', '2016-04-12 11:30:19', NULL, 3, NULL),
(153, 141.56, 'cobro instalacion', '2016-04-28 00:30:19', NULL, 21, NULL),
(154, 7.19, 'cobro instalacion', '2016-04-29 17:30:19', NULL, 44, NULL),
(155, 753.46, 'cobro instalacion', '2016-04-18 03:30:19', NULL, 50, NULL),
(156, 83.08, 'cobro instalacion', '2016-05-01 12:30:19', NULL, 35, NULL),
(157, 303.42, 'cobro instalacion', '2016-05-08 07:30:19', NULL, 24, NULL),
(158, 30.61, 'cobro instalacion', '2016-05-08 03:30:19', NULL, 34, NULL),
(159, 256.46, 'cobro instalacion', '2016-04-20 15:30:19', NULL, 27, NULL),
(160, 691.04, 'cobro instalacion', '2016-05-06 18:30:19', NULL, 39, NULL),
(161, 359.18, 'cobro instalacion', '2016-04-27 13:30:19', NULL, 39, NULL),
(162, 76.43, 'cobro instalacion', '2016-04-27 10:30:19', NULL, 16, NULL),
(163, 416.79, 'cobro instalacion', '2016-04-24 17:30:19', NULL, 9, NULL),
(164, 279.9, 'cobro instalacion', '2016-04-23 15:30:19', NULL, 30, NULL),
(165, 138.91, 'cobro instalacion', '2016-05-08 05:30:19', NULL, 10, NULL),
(166, 555.93, 'cobro instalacion', '2016-05-04 22:30:19', NULL, 10, NULL),
(167, 723.73, 'cobro instalacion', '2016-05-06 17:30:19', NULL, 25, NULL),
(168, 888.47, 'cobro instalacion', '2016-04-29 17:30:19', NULL, 34, NULL),
(169, 536.98, 'cobro instalacion', '2016-04-22 17:30:19', NULL, 18, NULL),
(170, 969.65, 'cobro instalacion', '2016-05-08 06:30:19', NULL, 29, NULL),
(171, 74.18, 'cobro instalacion', '2016-05-02 11:30:19', NULL, 35, NULL),
(172, 754.3, 'cobro instalacion', '2016-04-19 02:30:19', NULL, 17, NULL),
(173, 341.54, 'cobro instalacion', '2016-05-07 15:30:19', NULL, 27, NULL),
(174, 957.62, 'cobro instalacion', '2016-04-18 23:30:19', NULL, 34, NULL),
(175, 388.46, 'cobro instalacion', '2016-05-07 16:30:19', NULL, 47, NULL),
(176, 220.92, 'cobro instalacion', '2016-04-26 03:30:19', NULL, 27, NULL),
(177, 185.29, 'cobro instalacion', '2016-05-09 14:30:19', NULL, 48, NULL),
(178, 858.67, 'cobro instalacion', '2016-04-16 12:30:19', NULL, 41, NULL),
(179, 690.77, 'pago equipos', '2016-04-26 05:30:41', NULL, NULL, 7),
(180, 77.81, 'pago equipos', '2016-04-17 15:30:41', NULL, NULL, 6),
(181, 574.19, 'pago equipos', '2016-04-27 14:30:41', NULL, NULL, 8),
(182, 834.66, 'pago equipos', '2016-05-05 07:30:41', NULL, NULL, 7),
(183, 269.68, 'pago equipos', '2016-04-23 23:30:41', NULL, NULL, 6),
(184, 38.86, 'pago equipos', '2016-04-20 19:30:41', NULL, NULL, 2),
(185, 828.06, 'pago equipos', '2016-04-12 08:30:41', NULL, NULL, 4),
(186, 195.93, 'pago equipos', '2016-04-21 00:30:41', NULL, NULL, 5),
(187, 317.13, 'pago equipos', '2016-04-13 10:30:41', NULL, NULL, 9),
(188, 80.15, 'pago equipos', '2016-05-10 09:30:41', NULL, NULL, 8),
(190, 844.34, 'pago equipos', '2016-05-10 02:30:41', NULL, NULL, 8),
(191, 594.52, 'pago equipos', '2016-04-20 10:30:41', NULL, NULL, 8),
(192, 764.56, 'pago equipos', '2016-04-27 09:30:41', NULL, NULL, 8),
(193, 113.13, 'pago equipos', '2016-05-04 20:30:41', NULL, NULL, 2),
(194, 407.38, 'pago equipos', '2016-04-24 14:30:41', NULL, NULL, 9),
(195, 536.12, 'pago equipos', '2016-04-20 02:30:41', NULL, NULL, 7),
(196, 891.02, 'pago equipos', '2016-04-29 07:30:41', NULL, NULL, 1),
(197, 806.46, 'pago equipos', '2016-04-17 21:30:41', NULL, NULL, 5),
(198, 459.6, 'pago equipos', '2016-04-24 06:30:41', NULL, NULL, 6),
(199, 993.61, 'cobro reparacion', '2016-05-02 07:35:15', NULL, 28, NULL),
(200, 79.96, 'cobro reparacion', '2016-04-24 10:35:16', NULL, 31, NULL),
(201, 569.71, 'cobro reparacion', '2016-04-15 23:35:16', NULL, 34, NULL),
(202, 418.32, 'cobro reparacion', '2016-05-03 03:35:16', NULL, 31, NULL),
(203, 83.98, 'cobro reparacion', '2016-04-16 08:35:16', NULL, 10, NULL),
(204, 424, 'cobro reparacion', '2016-05-07 17:35:16', NULL, 50, NULL),
(205, 652.5, 'cobro reparacion', '2016-05-11 02:35:16', NULL, 21, NULL),
(206, 752.09, 'cobro reparacion', '2016-05-03 21:35:16', NULL, 9, NULL),
(207, 549.88, 'cobro reparacion', '2016-04-25 13:35:16', NULL, 4, NULL),
(208, 684.32, 'cobro reparacion', '2016-05-04 18:35:16', NULL, 4, NULL),
(209, 899.05, 'cobro reparacion', '2016-05-07 19:35:16', NULL, 7, NULL),
(210, 447.53, 'cobro reparacion', '2016-05-01 23:35:16', NULL, 49, NULL),
(211, 528.06, 'cobro reparacion', '2016-04-19 21:35:16', NULL, 16, NULL),
(212, 161.79, 'cobro reparacion', '2016-04-23 22:35:16', NULL, 4, NULL),
(213, 686.23, 'cobro reparacion', '2016-04-13 10:35:16', NULL, 25, NULL),
(214, 529.82, 'cobro reparacion', '2016-04-23 00:35:16', NULL, 34, NULL),
(215, 857.55, 'cobro reparacion', '2016-04-22 12:35:16', NULL, 28, NULL),
(216, 299.29, 'cobro reparacion', '2016-04-25 02:35:16', NULL, 33, NULL),
(217, 789.43, 'cobro reparacion', '2016-05-03 18:35:16', NULL, 45, NULL),
(218, 74.2, 'cobro reparacion', '2016-04-28 13:35:16', NULL, 49, NULL),
(219, 621.59, 'cobro reparacion', '2016-05-07 16:35:16', NULL, 50, NULL),
(220, 724.3, 'cobro reparacion', '2016-05-07 16:35:16', NULL, 42, NULL),
(221, 161.01, 'cobro reparacion', '2016-05-04 00:35:16', NULL, 26, NULL),
(222, 324.73, 'cobro reparacion', '2016-05-07 01:35:16', NULL, 42, NULL),
(223, 631.58, 'cobro reparacion', '2016-04-21 01:35:16', NULL, 42, NULL),
(224, 758.93, 'cobro reparacion', '2016-05-09 01:35:16', NULL, 29, NULL),
(225, 662.14, 'cobro reparacion', '2016-04-19 10:35:16', NULL, 10, NULL),
(226, 480.57, 'cobro reparacion', '2016-05-06 16:35:16', NULL, 38, NULL),
(227, 567.72, 'cobro reparacion', '2016-04-24 03:35:16', NULL, 21, NULL),
(228, 442.75, 'cobro reparacion', '2016-04-27 04:35:16', NULL, 13, NULL),
(229, 91.92, 'cobro reparacion', '2016-05-08 01:35:16', NULL, 6, NULL),
(230, 399.39, 'cobro reparacion', '2016-04-13 22:35:16', NULL, 18, NULL),
(231, 469.42, 'cobro reparacion', '2016-04-12 02:35:16', NULL, 23, NULL),
(232, 770.09, 'cobro reparacion', '2016-05-05 17:35:16', NULL, 28, NULL),
(233, 933.6, 'cobro reparacion', '2016-04-25 14:35:16', NULL, 36, NULL),
(234, 895.45, 'cobro reparacion', '2016-04-18 20:35:16', NULL, 46, NULL),
(235, 429.37, 'cobro reparacion', '2016-04-20 13:35:16', NULL, 8, NULL),
(236, 172.84, 'cobro reparacion', '2016-05-09 08:35:16', NULL, 14, NULL),
(237, 234.32, 'cobro reparacion', '2016-04-27 09:35:17', NULL, 45, NULL),
(238, 79.42, 'cobro reparacion', '2016-05-03 08:35:17', NULL, 36, NULL),
(239, 26.8, 'cobro reparacion', '2016-04-23 13:35:17', NULL, 9, NULL),
(240, 999.98, 'cobro reparacion', '2016-05-08 17:35:17', NULL, 49, NULL),
(241, 274.83, 'cobro reparacion', '2016-04-17 03:35:17', NULL, 26, NULL),
(242, 986.91, 'cobro reparacion', '2016-05-10 00:35:17', NULL, 15, NULL),
(243, 532.4, 'cobro reparacion', '2016-04-22 20:35:17', NULL, 18, NULL),
(244, 945.89, 'cobro reparacion', '2016-05-11 04:35:17', NULL, 29, NULL),
(245, 296.46, 'cobro reparacion', '2016-04-21 21:35:17', NULL, 14, NULL),
(246, 178.47, 'cobro reparacion', '2016-04-24 04:35:17', NULL, 22, NULL),
(247, 273.66, 'cobro reparacion', '2016-05-07 11:35:17', NULL, 21, NULL),
(248, 74.04, 'cobro reparacion', '2016-04-21 20:35:17', NULL, 46, NULL),
(249, 534.36, 'cobro reparacion', '2016-05-01 05:35:17', NULL, 6, NULL),
(250, 750.24, 'cobro reparacion', '2016-05-03 20:35:17', NULL, 9, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `idPaquete` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Renta` float DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`idPaquete`, `Nombre`, `Renta`, `descripcion`) VALUES
(1, 'Paquete B&aacute;sico', 290.5, 'La mejor selecci&oacute;n para tu familia'),
(2, 'Paquete B&aacute;sico+', 350, 'Canales adicionales a menor costo'),
(3, 'Paquete Fun', 429.5, 'Podr&aacute;s sumar a tu diversi&oacute;n programaci&oacute;n exclusiva'),
(4, 'Paquete FOX+', 589.5, 'Adem&aacute;s del  paquete FUN, con el paquete FOX+'),
(5, 'Paquete HBO/MAX', 599, 'Para que los que les gusta estar a la vanguardia del entretenimiento'),
(6, 'Paquete Universe', 799, 'Para el que le gusta tener todo, contrata paquete Universe'),
(7, 'Paquete Universe+', 999, 'Canales exclusivos para ti'),
(8, ' Selecci&oacute;n Jovenes y ni&ntilde;os', 400, 'Canales exclusivos para ellos '),
(9, 'Paquete Deportes', 255.5, 'Los mejores canales de deportes para ti'),
(10, 'Paquete Selecci&oacute;n Noticias', 647.5, 'La mejor selecci&oacute;n para estar informado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `direccion`, `telefono`, `nombre`) VALUES
(1, 'Calle Morelos No. 191, Col. La pradera, Pachuca', '55-59-57-56', 'Cortes Lopez Roberto'),
(2, 'Avenida Poniente No. 123, Col. Nuevo México, Guadalajara', '54-34-23-23', 'Buendía Gómez Eduardo'),
(3, 'Avenida Del Chamizal No. 239, Col. Correos, Tlaxcala', '55-00-00-99', 'López Benítez Alicia María'),
(4, 'Avenida 16 de Septiembre No. 100, Col. Vista Hermosa, Coahuila', '54-78-23-00', 'Martínez López Juan Carlos'),
(5, 'Calle Pedregal No. 19, Col. Buena Vista, Puebla', '55-59-57-56', 'Cortes Lopez Roberto'),
(6, 'Avenida De las Fuentes No. 334, Col. Prados, Baja California', '23-34-56-78', 'Ruíz Jiménez Laura Fabiola'),
(7, 'Calle Cocodrilos No. 544, Col. El Dorado, Monterrey', '21-34-56-78', 'Ortega Palacios Adela'),
(8, 'Calle Cascada No. 2, Col. Selva, Guanajuato', '55-34-34-32', 'Estrada Campos Luis Alberto'),
(9, 'Avenida Las Torres No. 2345, Col. Lomas de Chapultepec, Ciudad de México', '55-12-54-76', 'Galicia Serna César Alejandro'),
(31, 'Avenida De Los Reptiles No. 234, Col. San Juan, Ciudad de México', '56-45-36-37', 'Cortés Díaz Javier');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  `Costo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicio`, `Nombre`, `Descripcion`, `Costo`) VALUES
(1, 'Cancelaci&oacute;n', 'Cancelar un paquete o el servicio de SKY', 150),
(2, 'Crecimiento', 'Adquirir un nuevo paquete o canal a tu servicio SKY', 150),
(3, 'Internet', 'Contrata el servicio de Interner que te ofrece SKY', 599),
(4, 'Pago por evento', 'Paga para ver y disfrutar en vivo y en directo alg&uacute;n evento musical, deportivo o art&iacute;stico privado', 200),
(5, 'Instalaci&oacute;n', 'Informaci&oacute;n sobre la instalaci&oacute;n de nuestros servicios', 200),
(6, 'Reparaci&oacute;n', 'Visita de t&eacute;cnico certificado para reparaci&oacute;n de tu equipo o instalaci&oacute;n', 150),
(7, 'Cambio de Antena', 'Cambiar la antena receptora de se&ntilde;al para obtener otra y disfrutar de tus canales favoritos en HD', 300),
(8, 'Controles Remotos', 'Comprar un nuevo control remoto para tu equipo SKY', 100),
(9, 'Skyview', 'Comprar la revista mensual de SKY', 24),
(10, 'Servicios en l&iacute;nea', 'Portal en el que podr&aacute;s navegar en cualquier lugar para disfrutar desde tu PC, MAC o Smartphone nuestros servicios', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `idEmpleado` int(11) NOT NULL,
  `Area` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `canal`
--
ALTER TABLE `canal`
  ADD PRIMARY KEY (`idCanal`);

--
-- Indices de la tabla `canalpaquete`
--
ALTER TABLE `canalpaquete`
  ADD PRIMARY KEY (`idPaquete`,`idCanal`),
  ADD KEY `idCanal_idx` (`idCanal`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`noCuenta`);

--
-- Indices de la tabla `dopaquete`
--
ALTER TABLE `dopaquete`
  ADD PRIMARY KEY (`noCuenta`,`idPaquete`,`idEquipo`,`fechaSubscripcion`),
  ADD KEY `idPaquete_idx` (`idPaquete`),
  ADD KEY `idEquipo_idx` (`idEquipo`);

--
-- Indices de la tabla `doservicio`
--
ALTER TABLE `doservicio`
  ADD PRIMARY KEY (`noCuenta`,`idEmpleado`,`fechaServicio`,`idServicio`),
  ADD KEY `noCuenta_idx` (`noCuenta`),
  ADD KEY `idEmpleado_idx` (`idEmpleado`),
  ADD KEY `idServicio` (`idServicio`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`idEquipo`),
  ADD KEY `idProveedor_idx` (`idProveedor`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idTransaccion`),
  ADD KEY `idEmpleado_idx` (`idEmpleado`),
  ADD KEY `noCuenta_idx` (`noCuenta`),
  ADD KEY `idProveedor_idx` (`idProveedor`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`idPaquete`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `canal`
--
ALTER TABLE `canal`
  MODIFY `idCanal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `noCuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `idEquipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idTransaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;
--
-- AUTO_INCREMENT de la tabla `paquete`
--
ALTER TABLE `paquete`
  MODIFY `idPaquete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD CONSTRAINT `administrativo_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `canalpaquete`
--
ALTER TABLE `canalpaquete`
  ADD CONSTRAINT `canalpaquete_ibfk_1` FOREIGN KEY (`idPaquete`) REFERENCES `paquete` (`idPaquete`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `canalpaquete_ibfk_2` FOREIGN KEY (`idCanal`) REFERENCES `canal` (`idCanal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `dopaquete`
--
ALTER TABLE `dopaquete`
  ADD CONSTRAINT `dopaquete_ibfk_1` FOREIGN KEY (`noCuenta`) REFERENCES `cliente` (`noCuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dopaquete_ibfk_2` FOREIGN KEY (`idPaquete`) REFERENCES `paquete` (`idPaquete`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dopaquete_ibfk_3` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `doservicio`
--
ALTER TABLE `doservicio`
  ADD CONSTRAINT `doservicio_ibfk_1` FOREIGN KEY (`noCuenta`) REFERENCES `cliente` (`noCuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doservicio_ibfk_2` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`idServicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doservicio_ibfk_3` FOREIGN KEY (`idEmpleado`) REFERENCES `tecnico` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`noCuenta`) REFERENCES `cliente` (`noCuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pago_ibfk_3` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD CONSTRAINT `tecnico_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
