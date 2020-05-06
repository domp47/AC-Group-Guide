/** Seeding User Roles  **/
INSERT INTO "ac_roles" ("id", "label")
    VALUES (1, 'User');

INSERT INTO "ac_roles" ("id", "label")
    VALUES (2, 'Admin');


/** Seeding Collectable Types  **/
INSERT INTO "collectable_types" ("id", "type")
    VALUES (1, 'Art');

INSERT INTO "collectable_types" ("id", "type")
    VALUES (2, 'Bug');

INSERT INTO "collectable_types" ("id", "type")
    VALUES (3, 'Fish');

INSERT INTO "collectable_types" ("id", "type")
    VALUES (4, 'Fossil');


/** Seeding Artwork  **/
INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Academic Painting', 'Images/Artwork/Academic Painting.jpg', 1, 4980, 'Vitruvian Man', 'Leonardo da Vinci', 'Images/Artwork/Academic Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Amazing Painting', 'Images/Artwork/Amazing Painting.jpg', 1, 4980, 'Night Watch', 'Rembrandt van Rijn', 'Images/Artwork/Amazing Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Basic Painting', 'Images/Artwork/Basic Painting.jpg', 1, 4980, 'The Blue Boy', 'Thomas Gainsborough', 'Images/Artwork/Basic Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Calm Painting', 'Images/Artwork/Calm Painting.jpg', 1, 4980, 'A Sunday Afternoon on the Island of La Grande Jette', 'Georges Seurat', 'Images/Artwork/Calm Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Common Painting', 'Images/Artwork/Common Painting.jpg', 1, 4980, 'The Gleaners', 'Jean-Francois Millet', 'Images/Artwork/Common Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Detailed Painting', 'Images/Artwork/Detailed Painting.jpg', 1, 4980, 'Ajisai Sokeizu', 'Ito Jakuchu', 'Images/Artwork/Detailed Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Dynamic Painting', 'Images/Artwork/Dynamic Painting.jpg', 1, 4980, 'Thirty-Six Views of Mount FujiThe Great Wave off Kanagawa', 'Katsushika Hokusai', 'Images/Artwork/Dynamic Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Famous Painting', 'Images/Artwork/Famous Painting.jpg', 1, 4980, 'Mona Lisa', 'Leonardo da Vinci', 'Images/Artwork/Famous Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Flowery Painting', 'Images/Artwork/Flowery Painting.jpg', 1, 4980, 'Sunflowers', 'Vincent Van Gogh', 'Images/Artwork/Flowery Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Glowing Painting', 'Images/Artwork/Glowing Painting.jpg', 1, 4980, 'The Fighting Temeraire', 'Joseph Mallord William Turner', 'Images/Artwork/Glowing Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Graceful Painting', 'Images/Artwork/Graceful Painting.jpg', 1, 4980, 'Beauty Looking Back', 'Hishikawa Moronobu', 'Images/Artwork/Graceful Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Jolly Painting', 'Images/Artwork/Jolly Painting.jpg', 1, 4980, 'Summer', 'Giuseppe Arcimboldo', 'Images/Artwork/Jolly Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Moody Painting', 'Images/Artwork/Moody Painting.jpg', 1, 4980, 'The Sower', 'Jean-Francois Millet', 'Images/Artwork/Moody Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Moving Painting', 'Images/Artwork/Moving Painting.jpg', 1, 4980, 'The Birth of Venus', 'Sandro Botticelli', 'Images/Artwork/Moving Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Mysterious Painting', 'Images/Artwork/Mysterious Painting.jpg', 1, 4980, 'Isle of the Dead', 'Arnold Bocklin', 'Images/Artwork/Mysterious Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Nice Painting', 'Images/Artwork/Nice Painting.jpg', 1, 4980, 'The Fifer', 'Edouard Manet', 'Images/Artwork/Nice Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Perfect Painting', 'Images/Artwork/Perfect Painting.jpg', 1, 4980, 'Apples and Oranges', 'Paul Cézanne', 'Images/Artwork/Perfect Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Proper Painting', 'Images/Artwork/Proper Painting.jpg', 1, 4980, 'A Bar at the Folies-Bergere', 'Édouard Manet', 'Images/Artwork/Proper Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Quaint Painting', 'Images/Artwork/Quaint Painting.jpg', 1, 4980, 'The Kitchen Maid', 'Johannes Vermeer', 'Images/Artwork/Quaint Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Scary Painting', 'Images/Artwork/Scary Painting.jpg', 1, 4980, 'Otani Oniji the 3rd as the Yakko Edobei', 'Toshusai Sharaku', 'Images/Artwork/Scary Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Scenic Painting', 'Images/Artwork/Scenic Painting.jpg', 1, 4980, 'The Hunters in the Snow', 'Pieter Bruegel the Elder', 'Images/Artwork/Scenic Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Serene Painting', 'Images/Artwork/Serene Painting.jpg', 1, 4980, 'Lady with an Ermine', 'Leonardo da Vinci', 'Images/Artwork/Serene Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Sinking Painting', 'Images/Artwork/Sinking Painting.jpg', 1, 4980, 'Ophelia', 'John Everett Millais', 'Images/Artwork/Sinking Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Solemn Painting', 'Images/Artwork/Solemn Painting.jpg', 1, 4980, 'Las Meninas', 'Diego Velazquez', 'Images/Artwork/Solemn Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Twinkling Painting', 'Images/Artwork/Twinkling Painting.jpg', 1, 4980, 'The Starry Night', 'Vincent van Gogh', 'Images/Artwork/Twinkling Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Warm Painting', 'Images/Artwork/Warm Painting.jpg', 1, 4980, 'The Clothed Maja', 'Francisco de Goya', 'Images/Artwork/Warm Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Wild Painting Left Half', 'Images/Artwork/Wild Painting Left Half.jpg', 1, 4980, 'Folding Screen of Fujin and Raijin (L)', 'Tawaraya Sotatsu', 'Images/Artwork/Wild Painting Left Half.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Wild Painting Right Half', 'Images/Artwork/Wild Painting Right Half.jpg', 1, 4980, 'Folding Screen of Fujin and Raijin (R)', 'Tawaraya Sotatsu', 'Images/Artwork/Wild Painting Right Half.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Wistful Painting', 'Images/Artwork/Wistful Painting.jpg', 1, 4980, 'Girl with a Pearl Earring', 'Johannes Vermeer', 'Images/Artwork/Wistful Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist", "img_location_alt")
    VALUES ('Worthy Painting', 'Images/Artwork/Worthy Painting.jpg', 1, 4980, 'Liberty Leading the People', 'Eugène Delacroix', 'Images/Artwork/Worthy Painting.fullsize.jpg');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist")
    VALUES ('Ancient Statue', 'Images/Artwork/Ancient Statue.png', 1, 0, 'Jomon Period "Dogū" Figurine Shakoki-dogū', 'Unknown');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist")
    VALUES ('Beautiful Statue', 'Images/Artwork/Beautiful Statue.png', 1, 0, 'Venus de Milo', 'Unknown');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist")
    VALUES ('Familiar Statue', 'Images/Artwork/Familiar Statue.png', 1, 0, 'The Thinker', 'Auguste Rodin');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist")
    VALUES ('Gallant Statue', 'Images/Artwork/Gallant Statue.png', 1, 0, 'David', 'Michelangelo');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist")
    VALUES ('Great Statue', 'Images/Artwork/Great Statue.png', 1, 0, 'King Kamehameha I', 'Thomas Ridgeway Gould');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist")
    VALUES ('Informative Statue', 'Images/Artwork/Informative Statue.png', 1, 0, 'Rosetta Stone', 'Unknown');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist")
    VALUES ('Motherly Statue', 'Images/Artwork/Motherly Statue.png', 1, 0, 'Capitoline Wolf', 'Unknown');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist")
    VALUES ('Mystic Statue', 'Images/Artwork/Mystic Statue.png', 1, 0, 'Bust of Nefertiti', 'Thutmose');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist")
    VALUES ('Robust Statue', 'Images/Artwork/Robust Statue.png', 1, 0, 'Discobolus', 'Unknown');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist")
    VALUES ('Rock-head Statue', 'Images/Artwork/Rock-head Statue.png', 1, 0, 'Olmec Colossal Head', 'Unknown');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist")
    VALUES ('Tremendous Statue', 'Images/Artwork/Tremendous Statue.png', 1, 0, 'Houmuwu Ding', 'Unknown');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist")
    VALUES ('Valiant Statue', 'Images/Artwork/Valiant Statue.png', 1, 4980, 'Nike of Samothrace', 'Unknown');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "original", "artist")
    VALUES ('Warrior Statue', 'Images/Artwork/Warrior Statue.png', 1, 4980, 'Terracotta Army', 'Unknown');


/** Seeding Bugs  **/
INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Common butterfly', 'Images/Bugs/Common butterfly.png', 2, 160, 'Flying', '4 AM - 7 PM', 1048560, 4047, 1023, 'Sept - June', 'Mar - Dec');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Yellow butterfly', 'Images/Bugs/Yellow butterfly.png', 2, 160, 'Flying', '4 AM - 7 PM', 1048560, 972, 783, 'Mar - June & Sept - Oct', 'Mar - Apr & Sept - Dec');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Tiger butterfly', 'Images/Bugs/Tiger butterfly.png', 2, 240, 'Flying', '4 AM - 7 PM', 1048560, 1016, 3599, 'Mar - Sept', 'Sept - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Peacock butterfly', 'Images/Bugs/Peacock butterfly.png', 2, 2500, 'Flying by Hybrid Flowers', '4 AM - 7 PM', 1048560, 960, 15, 'Mar - June', 'Sept - Dec');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Common bluebottle', 'Images/Bugs/Common bluebottle.png', 2, 300, 'Flying', '4 AM - 7 PM', 1048560, 496, 3079, 'Apr - Aug', 'Oct - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Paper kite butterfly', 'Images/Bugs/Paper kite butterfly.png', 2, 1000, 'Flying', '8 AM - 7 PM', 65520, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Great purple emperor', 'Images/Bugs/Great purple emperor.png', 2, 3000, 'Flying', '4 AM - 7 PM', 1048560, 240, 3075, 'May - Aug', 'Nov - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Monarch butterfly', 'Images/Bugs/Monarch butterfly.png', 2, 140, 'Flying', '4 AM - 5 PM', 1048512, 14, 896, 'Sept - Nov', 'Mar - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Emperor butterfly', 'Images/Bugs/Emperor butterfly.png', 2, 4000, 'Flying', '5 PM - 8 AM', 16744575, 3705, 3705, 'June - Sept & Dec - Mar', 'June - Sept & Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Agrias butterfly', 'Images/Bugs/Agrias butterfly.png', 2, 3000, 'Flying', '8 AM - 5 PM', 65472, 504, 3591, 'Apr - Sept', 'Oct - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Rajah Brooke''s birdwing', 'Images/Bugs/Rajah Brooke''s birdwing.png', 2, 2500, 'Flying', '8 AM - 5 PM', 65472, 3577, 3703, 'Apr - Sept & Dec - Feb', 'June - Aug & Oct - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Queen Alexandra''s birdwing', 'Images/Bugs/Queen Alexandra''s birdwing.png', 2, 4000, 'Flying', '8 AM - 4 PM', 65408, 248, 3587, 'May - Sept', 'Nov - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Moth', 'Images/Bugs/Moth.png', 2, 130, 'Flying by Light', '7 PM - 4 AM', 16252959, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Atlas moth', 'Images/Bugs/Atlas moth.png', 2, 3000, 'On Trees', '7 PM - 4 AM', 16252959, 504, 3591, 'Apr - Sept', 'Oct - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Madagascan sunset moth', 'Images/Bugs/Madagascan sunset moth.png', 2, 2500, 'Flying', '8 AM - 4 PM', 65408, 504, 3591, 'Apr - Sept', 'Oct - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Long locust', 'Images/Bugs/Long locust.png', 2, 200, 'On the Ground', '8 AM - 7 PM', 65520, 510, 3975, 'Apr - Nov', 'Oct - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Migratory locust', 'Images/Bugs/Migratory locust.png', 2, 600, 'On the Ground', '8 AM - 7 PM', 65520, 30, 1920, 'Aug - Nov', 'Feb - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Rice grasshopper', 'Images/Bugs/Rice grasshopper.png', 2, 160, 'On the Ground', '8 AM - 7 PM', 65520, 30, 1920, 'Aug - Nov', 'Feb - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Grasshopper', 'Images/Bugs/Grasshopper.png', 2, 160, 'On the Ground', '8 AM - 5 PM', 65472, 56, 3584, 'July - Sept', 'Jan - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Cricket', 'Images/Bugs/Cricket.png', 2, 130, 'On the Ground', '5 PM - 8 AM', 16744575, 14, 896, 'Sept - Nov', 'Mar - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Bell cricket', 'Images/Bugs/Bell cricket.png', 2, 430, 'On the Ground', '5 PM - 8 AM', 16744575, 12, 768, 'Sept - Oct', 'Mar - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Mantis', 'Images/Bugs/Mantis.png', 2, 430, 'On Flowers', '8 AM - 5 PM', 65472, 1022, 3983, 'Mar - Nov', 'Sept - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Orchid mantis', 'Images/Bugs/Orchid mantis.png', 2, 2400, 'On Flowers (White)', '8 AM - 5 PM', 65472, 1022, 3983, 'Mar - Nov', 'Sept - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Honeybee', 'Images/Bugs/Honeybee.png', 2, 200, 'Flying', '8 AM - 5 PM', 65472, 992, 2063, 'Mar - July', 'Sept - Jan');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Wasp', 'Images/Bugs/Wasp.png', 2, 2500, 'Shaking Trees', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Brown cicada', 'Images/Bugs/Brown cicada.png', 2, 250, 'On Trees', '8 AM - 5 PM', 65472, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Robust cicada', 'Images/Bugs/Robust cicada.png', 2, 300, 'On Trees', '8 AM - 5 PM', 65472, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Giant cicada', 'Images/Bugs/Giant cicada.png', 2, 500, 'On Trees', '8 AM - 5 PM', 65472, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Walker cicada', 'Images/Bugs/Walker cicada.png', 2, 400, 'On Trees', '8 AM - 5 PM', 65472, 24, 1536, 'Aug - Sept', 'Feb - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Evening cicada', 'Images/Bugs/Evening cicada.png', 2, 550, 'On Trees', '4 AM - 8 AM & 4 PM - 7 PM', 1016048, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Cicada shell', 'Images/Bugs/Cicada shell.png', 2, 10, 'On Trees', 'All day', 16777215, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Red dragonfly', 'Images/Bugs/Red dragonfly.png', 2, 180, 'Flying', '8 AM - 7 PM', 65520, 12, 768, 'Sept - Oct', 'Mar - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Darner dragonfly', 'Images/Bugs/Darner dragonfly.png', 2, 230, 'Flying', '8 AM - 5 PM', 65472, 508, 3847, 'Apr - Oct', 'Oct - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Banded dragonfly', 'Images/Bugs/Banded dragonfly.png', 2, 4500, 'Flying', '8 AM - 5 PM', 65472, 252, 3843, 'May - Oct', 'Nov - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Damselfly', 'Images/Bugs/Damselfly.png', 2, 500, 'Flying', 'All day', 16777215, 3075, 240, 'Nov - Feb', 'May - Aug');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Firefly', 'Images/Bugs/Firefly.png', 2, 300, 'Flying', '7 PM - 4 AM', 16252959, 64, 1, 'June', 'Dec');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Mole cricket', 'Images/Bugs/Mole cricket.png', 2, 500, 'Underground', 'All day', 16777215, 3971, 254, 'Nov - May', 'May - Nov');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Pondskater', 'Images/Bugs/Pondskater.png', 2, 130, 'On Ponds and Rivers', '8 AM - 7 PM', 65520, 248, 3587, 'May - Sept', 'Nov - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Diving beetle', 'Images/Bugs/Diving beetle.png', 2, 800, 'On Ponds and Rivers', '8 AM - 7 PM', 65520, 248, 3587, 'May - Sept', 'Nov - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Giant water bug', 'Images/Bugs/Giant water bug.png', 2, 2000, 'On Ponds and Rivers', '7 PM - 8 AM', 16744479, 504, 3591, 'Apr - Sept', 'Oct - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Stinkbug', 'Images/Bugs/Stinkbug.png', 2, 120, 'On Flowers', 'All day', 16777215, 1020, 3855, 'Mar - Oct', 'Sept - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Man-faced stink bug', 'Images/Bugs/Man-faced stink bug.png', 2, 1000, 'On Flowers', '7 PM - 8 AM', 16744479, 1020, 3855, 'Mar - Oct', 'Sept - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Ladybug', 'Images/Bugs/Ladybug.png', 2, 200, 'On Flowers', '8 AM - 5 PM', 65472, 964, 271, 'Mar - June & Oct', 'Apr & Sept - Dec');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Tiger beetle', 'Images/Bugs/Tiger beetle.png', 2, 1500, 'On the Ground', 'All day', 16777215, 2044, 3871, 'Feb - Oct', 'Aug - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Jewel beetle', 'Images/Bugs/Jewel beetle.png', 2, 2400, 'On Tree Stumps', 'All day', 16777215, 496, 3079, 'Apr - Aug', 'Oct - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Violin beetle', 'Images/Bugs/Violin beetle.png', 2, 450, 'On Tree Stumps', 'All day', 16777215, 206, 899, 'May - June & Sept - Nov', 'Mar - May & Nov - Dec');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Citrus long-horned beetle', 'Images/Bugs/Citrus long-horned beetle.png', 2, 350, 'On Tree Stumps', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Rosalia batesi beetle', 'Images/Bugs/Rosalia batesi beetle.png', 2, 3000, 'On Tree Stumps', 'All day', 16777215, 248, 3587, 'May - Sept', 'Nov - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Blue weevil beetle', 'Images/Bugs/Blue weevil beetle.png', 2, 800, 'On Trees (Coconut?)', 'All day', 16777215, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Dung beetle', 'Images/Bugs/Dung beetle.png', 2, 3000, 'On the Ground (rolling snowballs)', 'All day', 16777215, 3073, 112, 'Dec - Feb', 'June - Aug');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Earth-boring dung beetle', 'Images/Bugs/Earth-boring dung beetle.png', 2, 300, 'On the Ground', 'All day', 16777215, 56, 3584, 'July - Sept', 'Jan - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Scarab beetle', 'Images/Bugs/Scarab beetle.png', 2, 10000, 'On Trees', '11 PM - 8 AM', 16744449, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Drone beetle', 'Images/Bugs/Drone beetle.png', 2, 200, 'On Trees', 'All day', 16777215, 112, 3073, 'June - Aug', 'Dec - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Goliath beetle', 'Images/Bugs/Goliath beetle.png', 2, 8000, 'On Trees (Coconut)', '5 PM - 8 AM', 16744575, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Saw stag', 'Images/Bugs/Saw stag.png', 2, 2000, 'On Trees', 'All day', 16777215, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Miyama stag', 'Images/Bugs/Miyama stag.png', 2, 1000, 'On Trees', 'All day', 16777215, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Giant stag', 'Images/Bugs/Giant stag.png', 2, 10000, 'On Trees', '11 PM - 8 AM', 16744449, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Rainbow stag', 'Images/Bugs/Rainbow stag.png', 2, 6000, 'On Trees', '7 PM - 8 AM', 16744479, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Cyclommatus stag', 'Images/Bugs/Cyclommatus stag.png', 2, 8000, 'On Trees (Coconut)', '5 PM - 8 AM', 16744575, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Golden stag', 'Images/Bugs/Golden stag.png', 2, 12000, 'On Trees (Coconut)', '5 PM - 8 AM', 16744575, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Giraffe stag', 'Images/Bugs/Giraffe stag.png', 2, 12000, 'On Trees (Coconut?)', '5 PM - 8 AM', 16744575, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Horned dynastid', 'Images/Bugs/Horned dynastid.png', 2, 1350, 'On Trees', '5 PM - 8 AM', 16744575, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Horned atlas', 'Images/Bugs/Horned atlas.png', 2, 8000, 'On Trees (Coconut)', '5 PM - 8 AM', 16744575, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Horned elephant', 'Images/Bugs/Horned elephant.png', 2, 8000, 'On Trees (Coconut)', '5 PM - 8 AM', 16744575, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Horned hercules', 'Images/Bugs/Horned hercules.png', 2, 12000, 'On Trees (Coconut)', '5 PM - 8 AM', 16744575, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Walking stick', 'Images/Bugs/Walking stick.png', 2, 600, 'On Trees', '4 AM - 8 AM & 5 PM - 7 PM', 1015920, 62, 3968, 'July - Nov', 'Jan - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Walking leaf', 'Images/Bugs/Walking leaf.png', 2, 600, 'Under Trees Disguised as Leafs', 'All day', 16777215, 56, 3584, 'July - Sept', 'Jan - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Bagworm', 'Images/Bugs/Bagworm.png', 2, 600, 'Shaking Trees', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Ant', 'Images/Bugs/Ant.png', 2, 80, 'On rotten food', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Hermit crab', 'Images/Bugs/Hermit crab.png', 2, 1000, 'Beach disguised as Shells', '7 PM - 8 AM', 16744479, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Wharf roach', 'Images/Bugs/Wharf roach.png', 2, 200, 'On Beach Rocks', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Fly', 'Images/Bugs/Fly.png', 2, 60, 'On Trash Items', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Mosquito', 'Images/Bugs/Mosquito.png', 2, 130, 'Flying', '5 PM - 4 AM', 16253055, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Flea', 'Images/Bugs/Flea.png', 2, 70, 'Villager''s Heads', 'All day', 16777215, 510, 3975, 'Apr - Nov', 'Oct - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Snail', 'Images/Bugs/Snail.png', 2, 250, 'On Rocks and Bushes (Rain)', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Pill bug', 'Images/Bugs/Pill bug.png', 2, 250, 'Hitting Rocks', '11 PM - 4 PM', 16777089, 4047, 1023, 'Sept - June', 'Mar - Dec');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Centipede', 'Images/Bugs/Centipede.png', 2, 300, 'Hitting Rocks', '4 PM - 11 PM', 255, 4047, 1023, 'Sept - June', 'Mar - Dec');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Spider', 'Images/Bugs/Spider.png', 2, 600, 'Shaking Trees', '7 PM - 8 AM', 16744479, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Tarantula', 'Images/Bugs/Tarantula.png', 2, 8000, 'On the Ground', '7 PM - 4 AM', 16252959, 3843, 252, 'Nov - Apr', 'May - Oct');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Scorpion', 'Images/Bugs/Scorpion.png', 2, 8000, 'On the Ground', '7 PM - 4 AM', 16252959, 252, 3843, 'May - Oct', 'Nov - Apr');


/** Seeding Fish  **/
INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Bitterling', 'Images/Fishes/Bitterling.png', 3, 900, '1', 'River', 'All day', 16777215, 3587, 248, 'Nov - Mar', 'May - Sept');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Pale chub', 'Images/Fishes/Pale chub.png', 3, 200, '1', 'River', '9 AM - 4 PM', 32640, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Crucian carp', 'Images/Fishes/Crucian carp.png', 3, 160, '2', 'River', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Dace', 'Images/Fishes/Dace.png', 3, 240, '3', 'River', '4 PM - 9 AM', 16761087, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Carp', 'Images/Fishes/Carp.png', 3, 300, '4', 'Pond', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Koi', 'Images/Fishes/Koi.png', 3, 4000, '4', 'Pond', '4 PM - 9 AM', 16761087, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Goldfish', 'Images/Fishes/Goldfish.png', 3, 1300, '1', 'Pond', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Pop-eyed goldfish', 'Images/Fishes/Pop-eyed goldfish.png', 3, 1300, '1', 'Pond', '9 AM - 4 PM', 32640, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Ranchu goldfish', 'Images/Fishes/Ranchu goldfish.png', 3, 4500, '2', 'Pond', '9 AM - 4 PM', 32640, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Killifish', 'Images/Fishes/Killifish.png', 3, 300, '1', 'Pond', 'All day', 16777215, 496, 3079, 'Apr - Aug', 'Oct - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Crawfish', 'Images/Fishes/Crawfish.png', 3, 200, '2', 'Pond', 'All day', 16777215, 504, 3591, 'Apr - Sept', 'Oct - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Soft-shelled turtle', 'Images/Fishes/Soft-shelled turtle.png', 3, 3750, '4', 'River', '4 PM - 9 AM', 16761087, 24, 1536, 'Aug - Sept', 'Feb - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Snapping Turtle', 'Images/Fishes/Snapping Turtle.png', 3, 5000, '5', 'River', '9 PM - 4 AM', 16252935, 508, 3847, 'Apr - Oct', 'Oct - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Tadpole', 'Images/Fishes/Tadpole.png', 3, 100, '1', 'Pond', 'All day', 16777215, 992, 2063, 'Mar - July', 'Sept - Jan');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Frog', 'Images/Fishes/Frog.png', 3, 120, '2', 'Pond', 'All day', 16777215, 240, 3075, 'May - Aug', 'Nov - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Freshwater goby', 'Images/Fishes/Freshwater goby.png', 3, 400, '2', 'River', '4 PM - 9 AM', 16761087, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Loach', 'Images/Fishes/Loach.png', 3, 400, '2', 'River', 'All day', 16777215, 896, 14, 'Mar - May', 'Sept - Nov');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Catfish', 'Images/Fishes/Catfish.png', 3, 800, '4', 'Pond', '4 PM - 9 AM', 16761087, 252, 3843, 'May - Oct', 'Nov - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Giant snakehead', 'Images/Fishes/Giant snakehead.png', 3, 5500, '5', 'Pond', '9 AM - 4 PM', 32640, 112, 3073, 'June - Aug', 'Dec - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Bluegill', 'Images/Fishes/Bluegill.png', 3, 180, '2', 'River', '9 AM - 4 PM', 32640, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Yellow perch', 'Images/Fishes/Yellow perch.png', 3, 300, '3', 'River', 'All day', 16777215, 3591, 504, 'Oct - Mar', 'Apr - Sept');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Black bass', 'Images/Fishes/Black bass.png', 3, 400, '4', 'River', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Tilapia', 'Images/Fishes/Tilapia.png', 3, 800, '3', 'River', 'All day', 16777215, 124, 3841, 'June - Oct', 'Dec - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Pike', 'Images/Fishes/Pike.png', 3, 1800, '5', 'River', 'All day', 16777215, 15, 960, 'Sept - Dec', 'Mar - June');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Pond smelt', 'Images/Fishes/Pond smelt.png', 3, 500, '2', 'River', 'All day', 16777215, 3073, 112, 'Dec - Feb', 'June - Aug');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Sweetfish', 'Images/Fishes/Sweetfish.png', 3, 900, '3', 'River', 'All day', 16777215, 56, 3584, 'July - Sept', 'Jan - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Cherry salmon', 'Images/Fishes/Cherry salmon.png', 3, 800, '3', 'River (Clifftop)', '4 PM - 9 AM', 16761087, 974, 911, 'Mar - June & Sept - Nov', 'Mar - May & Sept - Dec');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Char', 'Images/Fishes/Char.png', 3, 3800, '3', 'River (Clifftop)  Pond', '4 PM - 9 AM', 16761087, 974, 911, 'Mar - June & Sept - Nov', 'Mar - May & Sept - Dec');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Golden trout', 'Images/Fishes/Golden trout.png', 3, 15000, '3', 'River (Clifftop)', '4 PM - 9 AM', 16761087, 910, 910, 'Mar - May & Sept - Nov', 'Mar - May & Sept - Nov');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Stringfish', 'Images/Fishes/Stringfish.png', 3, 15000, '5', 'River (Clifftop)', '4 PM - 9 AM', 16761087, 3585, 120, 'Dec - Mar', 'June - Sept');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Salmon', 'Images/Fishes/Salmon.png', 3, 700, '4', 'River (Mouth)', 'All day', 16777215, 8, 512, 'Sept', 'Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('King salmon', 'Images/Fishes/King salmon.png', 3, 1800, '6', 'River (Mouth)', 'All day', 16777215, 8, 512, 'Sept', 'Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Mitten crab', 'Images/Fishes/Mitten crab.png', 3, 2000, '2', 'River', '4 PM - 9 AM', 16761087, 14, 896, 'Sept - Nov', 'Mar - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Guppy', 'Images/Fishes/Guppy.png', 3, 1300, '1', 'River', '9 AM - 4 PM', 32640, 510, 3975, 'Apr - Nov', 'Oct - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Nibble fish', 'Images/Fishes/Nibble fish.png', 3, 1500, '1', 'River', '9 AM - 4 PM', 32640, 248, 3587, 'May - Sept', 'Nov - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Angelfish', 'Images/Fishes/Angelfish.png', 3, 3000, '2', 'River', '4 PM - 9 AM', 16761087, 252, 3843, 'May - Oct', 'Nov - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Betta', 'Images/Fishes/Betta.png', 3, 2500, '2', 'River', '9 AM - 4 PM', 32640, 252, 3843, 'May - Oct', 'Nov - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Neon tetra', 'Images/Fishes/Neon tetra.png', 3, 500, '1', 'River', '9 AM - 4 PM', 32640, 510, 3975, 'Apr - Nov', 'Oct - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Rainbowfish', 'Images/Fishes/Rainbowfish.png', 3, 800, '1', 'River', '9 AM - 4 PM', 32640, 252, 3843, 'May - Oct', 'Nov - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Piranha', 'Images/Fishes/Piranha.png', 3, 2500, '2', 'River', '9 AM - 4 PM & 9 PM - 4 AM', 16285575, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Arowana', 'Images/Fishes/Arowana.png', 3, 10000, '4', 'River', '4 PM - 9 AM', 16761087, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Dorado', 'Images/Fishes/Dorado.png', 3, 15000, '5', 'River', '4 AM - 9 PM', 1048572, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Gar', 'Images/Fishes/Gar.png', 3, 6000, '6', 'Pond', '4 PM - 9 AM', 16761087, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Arapaima', 'Images/Fishes/Arapaima.png', 3, 10000, '6', 'River', '4 PM - 9 AM', 16761087, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Saddled bichir', 'Images/Fishes/Saddled bichir.png', 3, 4000, '4', 'River', '9 PM - 4 AM', 16252935, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Sturgeon', 'Images/Fishes/Sturgeon.png', 3, 10000, '6', 'River (Mouth)', 'All day', 16777215, 3599, 1016, 'Sept - Mar', 'Mar - Sept');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Sea butterfly', 'Images/Fishes/Sea butterfly.png', 3, 1000, '1', 'Sea', 'All day', 16777215, 3585, 120, 'Dec - Mar', 'June - Sept');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Sea horse', 'Images/Fishes/Sea horse.png', 3, 1100, '1', 'Sea', 'All day', 16777215, 510, 3975, 'Apr - Nov', 'Oct - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Clown fish', 'Images/Fishes/Clown fish.png', 3, 650, '1', 'Sea', 'All day', 16777215, 504, 3591, 'Apr - Sept', 'Oct - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Surgeonfish', 'Images/Fishes/Surgeonfish.png', 3, 1000, '2', 'Sea', 'All day', 16777215, 504, 3591, 'Apr - Sept', 'Oct - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Butterfly fish', 'Images/Fishes/Butterfly fish.png', 3, 1000, '2', 'Sea', 'All day', 16777215, 504, 3591, 'Apr - Sept', 'Oct - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Napoleonfish', 'Images/Fishes/Napoleonfish.png', 3, 10000, '6', 'Sea', '4 AM - 9 PM', 1048572, 48, 3072, 'July - Aug', 'Jan - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Zebra turkeyfish', 'Images/Fishes/Zebra turkeyfish.png', 3, 500, '3', 'Sea', 'All day', 16777215, 510, 3975, 'Apr - Nov', 'Oct - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Blowfish', 'Images/Fishes/Blowfish.png', 3, 5000, '3', 'Sea', '9 PM - 4 AM', 16252935, 3075, 240, 'Nov - Feb', 'May - Aug');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Puffer fish', 'Images/Fishes/Puffer fish.png', 3, 250, '3', 'Sea', 'All day', 16777215, 56, 3584, 'July - Sept', 'Jan - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Anchovy', 'Images/Fishes/Anchovy.png', 3, 200, '2', 'Sea', '4 AM - 9 PM', 1048572, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Horse mackerel', 'Images/Fishes/Horse mackerel.png', 3, 150, '2', 'Sea', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Barred knifejaw', 'Images/Fishes/Barred knifejaw.png', 3, 5000, '3', 'Sea', 'All day', 16777215, 1022, 3983, 'Mar - Nov', 'Sept - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Sea bass', 'Images/Fishes/Sea bass.png', 3, 400, '5', 'Sea', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Red snapper', 'Images/Fishes/Red snapper.png', 3, 3000, '4', 'Sea', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Dab', 'Images/Fishes/Dab.png', 3, 300, '3', 'Sea', 'All day', 16777215, 3847, 508, 'Oct - Apr', 'Apr - Oct');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Olive flounder', 'Images/Fishes/Olive flounder.png', 3, 800, '5', 'Sea', 'All day', 16777215, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Squid', 'Images/Fishes/Squid.png', 3, 500, '3', 'Sea', 'All day', 16777215, 4081, 3199, 'Dec - Aug', 'June - Feb');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Moray eel', 'Images/Fishes/Moray eel.png', 3, 2000, 'Narrow', 'Sea', 'All day', 16777215, 28, 1792, 'Aug - Oct', 'Feb - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Ribbon eel', 'Images/Fishes/Ribbon eel.png', 3, 600, 'Narrow', 'Sea', 'All day', 16777215, 124, 3841, 'June - Oct', 'Dec - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Tuna', 'Images/Fishes/Tuna.png', 3, 7000, '6', 'Pier', 'All day', 16777215, 3843, 252, 'Nov - Apr', 'May - Oct');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Blue marlin', 'Images/Fishes/Blue marlin.png', 3, 10000, '6', 'Pier', 'All day', 16777215, 3899, 3836, 'July - Sept & Nov - Apr', 'May - Oct & Jan - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Giant trevally', 'Images/Fishes/Giant trevally.png', 3, 4500, '5', 'Pier', 'All day', 16777215, 252, 3843, 'May - Oct', 'Nov - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Mahi-mahi', 'Images/Fishes/Mahi-mahi.png', 3, 6000, '5', 'Pier', 'All day', 16777215, 252, 3843, 'May - Oct', 'Nov - Apr');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Ocean sunfish', 'Images/Fishes/Ocean sunfish.png', 3, 4000, '6 (Fin)', 'Sea', '4 AM - 9 PM', 1048572, 56, 3584, 'July - Sept', 'Jan - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Ray', 'Images/Fishes/Ray.png', 3, 3000, '5', 'Sea', '4 AM - 9 PM', 1048572, 30, 1920, 'Aug - Nov', 'Feb - May');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Saw shark', 'Images/Fishes/Saw shark.png', 3, 12000, '6 (Fin)', 'Sea', '4 PM - 9 AM', 16761087, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Hammerhead shark', 'Images/Fishes/Hammerhead shark.png', 3, 8000, '6 (Fin)', 'Sea', '4 PM - 9 AM', 16761087, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Great white shark', 'Images/Fishes/Great white shark.png', 3, 15000, '6 (Fin)', 'Sea', '4 PM - 9 AM', 16761087, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Whale shark', 'Images/Fishes/Whale shark.png', 3, 13000, '6 (Fin)', 'Sea', 'All day', 16777215, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Suckerfish', 'Images/Fishes/Suckerfish.png', 3, 1500, '4 (Fin)', 'Sea', 'All day', 16777215, 120, 3585, 'June - Sept', 'Dec - Mar');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Football fish', 'Images/Fishes/Football fish.png', 3, 2500, '4', 'Sea', '4 PM - 9 AM', 16761087, 3587, 248, 'Nov - Mar', 'May - Sept');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Oarfish', 'Images/Fishes/Oarfish.png', 3, 9000, '6', 'Sea', 'All day', 16777215, 3969, 126, 'Dec - May', 'June - Nov');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Barreleye', 'Images/Fishes/Barreleye.png', 3, 15000, '2', 'Sea', '9 PM - 4 AM', 16252935, 4095, 4095, 'All year', 'All year');

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price", "shadow_size", "spawn_location", "time_label", "time_mask", "north_mask", "south_mask", "north_label", "south_label")
    VALUES ('Coelacanth', 'Images/Fishes/Coelacanth.png', 3, 15000, '6', 'Sea (Raining)', 'All day', 16777215, 4095, 4095, 'All year', 'All year');


/** Seeding Fossils  **/
INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Acanthostega', 'Images/Fossils/Acanthostega.png', 4, 2000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Amber', 'Images/Fossils/Amber.png', 4, 1200);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Ammonite', 'Images/Fossils/Ammonite.png', 4, 1100);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Anomalocaris', 'Images/Fossils/Anomalocaris.png', 4, 2000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Archaeopteryx', 'Images/Fossils/Archaeopteryx.png', 4, 1300);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Australopith', 'Images/Fossils/Australopith.png', 4, 1100);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Coprolite', 'Images/Fossils/Coprolite.png', 4, 1100);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Dinosaur track', 'Images/Fossils/Dinosaur track.png', 4, 1000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Dunkleosteus', 'Images/Fossils/Dunkleosteus.png', 4, 3500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Eusthenopteron', 'Images/Fossils/Eusthenopteron.png', 4, 2000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Juramaia', 'Images/Fossils/Juramaia.png', 4, 1000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Myllokunmingia', 'Images/Fossils/Myllokunmingia.png', 4, 1500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Shark-tooth pattern', 'Images/Fossils/Shark-tooth pattern.png', 4, 1000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Trilobite', 'Images/Fossils/Trilobite.png', 4, 1300);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Ankylo skull', 'Images/Fossils/Ankylo skull.png', 4, 5000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Ankylo torso', 'Images/Fossils/Ankylo torso.png', 4, 3000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Ankylo tail', 'Images/Fossils/Ankylo tail.png', 4, 2500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Archelon skull', 'Images/Fossils/Archelon skull.png', 4, 4000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Archelon tail', 'Images/Fossils/Archelon tail.png', 4, 3500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Brachio skull', 'Images/Fossils/Brachio skull.png', 4, 6000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Brachio chest', 'Images/Fossils/Brachio chest.png', 4, 5500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Brachio pelvis', 'Images/Fossils/Brachio pelvis.png', 4, 5000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Brachio tail', 'Images/Fossils/Brachio tail.png', 4, 5500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Deinony torso', 'Images/Fossils/Deinony torso.png', 4, 3000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Deinony tail', 'Images/Fossils/Deinony tail.png', 4, 2500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Dimetrodon skull', 'Images/Fossils/Dimetrodon skull.png', 4, 5500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Dimetrodon torso', 'Images/Fossils/Dimetrodon torso.png', 4, 5000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Diplo skull', 'Images/Fossils/Diplo skull.png', 4, 5000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Diplo neck', 'Images/Fossils/Diplo neck.png', 4, 4500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Diplo chest', 'Images/Fossils/Diplo chest.png', 4, 4000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Diplo pelvis', 'Images/Fossils/Diplo pelvis.png', 4, 4500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Diplo tail', 'Images/Fossils/Diplo tail.png', 4, 5000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Diplo tail tip', 'Images/Fossils/Diplo tail tip.png', 4, 4000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Iguanodon skull', 'Images/Fossils/Iguanodon skull.png', 4, 4000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Iguanodon torso', 'Images/Fossils/Iguanodon torso.png', 4, 3500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Iguanodon tail', 'Images/Fossils/Iguanodon tail.png', 4, 3000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Mammoth skull', 'Images/Fossils/Mammoth skull.png', 4, 3000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Mammoth torso', 'Images/Fossils/Mammoth torso.png', 4, 2500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Megacero skull', 'Images/Fossils/Megacero skull.png', 4, 4500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Megacero torso', 'Images/Fossils/Megacero torso.png', 4, 3500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Megacero tail', 'Images/Fossils/Megacero tail.png', 4, 3000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Left megalo side', 'Images/Fossils/Left megalo side.png', 4, 4000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Right megalo side', 'Images/Fossils/Right megalo side.png', 4, 5500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Ophthalmo skull', 'Images/Fossils/Ophthalmo skull.png', 4, 2500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Ophthalmo torso', 'Images/Fossils/Ophthalmo torso.png', 4, 2000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Pachysaurus skull', 'Images/Fossils/Pachysaurus skull.png', 4, 4000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Pachysaurus tail', 'Images/Fossils/Pachysaurus tail.png', 4, 3500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Parasaur skull', 'Images/Fossils/Parasaur skull.png', 4, 3500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Parasaur torso', 'Images/Fossils/Parasaur torso.png', 4, 3000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Parasaur tail', 'Images/Fossils/Parasaur tail.png', 4, 2500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Plesio skull', 'Images/Fossils/Plesio skull.png', 4, 4000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Plesio tail', 'Images/Fossils/Plesio tail.png', 4, 4500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Plesio body', 'Images/Fossils/Plesio body.png', 4, 4500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Right ptera wing', 'Images/Fossils/Right ptera wing.png', 4, 4500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Ptera body', 'Images/Fossils/Ptera body.png', 4, 4000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Left ptera wing', 'Images/Fossils/Left ptera wing.png', 4, 4500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Right quetzal wing', 'Images/Fossils/Right quetzal wing.png', 4, 5000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Quetzal torso', 'Images/Fossils/Quetzal torso.png', 4, 4500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Left quetzal wing', 'Images/Fossils/Left quetzal wing.png', 4, 5000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Sabertooth skull', 'Images/Fossils/Sabertooth skull.png', 4, 2500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Sabertooth tail', 'Images/Fossils/Sabertooth tail.png', 4, 2000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Spino skull', 'Images/Fossils/Spino skull.png', 4, 4000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Spino torso', 'Images/Fossils/Spino torso.png', 4, 5000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Spino tail', 'Images/Fossils/Spino tail.png', 4, 2500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Stego skull', 'Images/Fossils/Stego skull.png', 4, 5000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Stego torso', 'Images/Fossils/Stego torso.png', 4, 4500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Stego tail', 'Images/Fossils/Stego tail.png', 4, 4000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Tricera skull', 'Images/Fossils/Tricera skull.png', 4, 5500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Tricera torso', 'Images/Fossils/Tricera torso.png', 4, 5000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('Tricera tail', 'Images/Fossils/Tricera tail.png', 4, 4500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('T. rex skull', 'Images/Fossils/T. rex skull.png', 4, 6000);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('T. rex torso', 'Images/Fossils/T. rex torso.png', 4, 5500);

INSERT INTO "collectables" ("display_name", "img_location", "type_id", "price")
    VALUES ('T. rex tail', 'Images/Fossils/T. rex tail.png', 4, 5000);

