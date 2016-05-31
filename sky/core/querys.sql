CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER 
VIEW `item_search` AS 
select `item`.`ID` AS `ID`,
concat(`types`.`type`,' ',`item`.`desc`) AS `name`,
`types`.`type` AS `type`,
`item`.`desc` AS `desc`,
`item`.`units` AS `units`,
`item`.`size` AS `size`,
`item`.`price` AS `price`,
`item`.`img` AS `img`,
group_concat(`school`.`name` order by `school`.`ID` ASC separator ', ') AS `schools`,
group_concat(cast(`school_idx`.`schoolID` as char charset utf8) order by `school`.`ID` ASC separator ',') AS `schoolsID`,
`item`.`typeID` AS `typeID` 
from (((`item` 
left join `types` on((`item`.`typeID` = `types`.`ID`))) 
left join `school_idx` on((`school_idx`.`itemID` = `item`.`ID`)))
left join `school` on((`school`.`ID` = `school_idx`.`schoolID`))) 
group by `item`.`ID`;

create view paqcanal as
select paquete.*, group_concat( cast(canalpaquete.idcanal as char charset utf8) order by canalpaquete.idcanal ASC separator ',') as canalid
from paquete
left join canalpaquete on paquete.idpaquete=canalpaquete.idpaquete
group by paquete.idPaquete

