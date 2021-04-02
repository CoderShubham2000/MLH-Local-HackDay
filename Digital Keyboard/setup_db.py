import sqlite3

create_table_mappings = '''
CREATE TABLE IF NOT EXISTS mappings (
    mname VARCHAR(255) NOT NULL,
    key INTEGER NOT NULL,
    note INTEGER NOT NULL,
    CONSTRAINT no_duplicates UNIQUE (mname, key, note)
)
'''

heartandsoul = [
    ('heartandsoul', 39, 12),
    ('heartandsoul', 39, 16),
    ('heartandsoul', 39, 19),
    ('heartandsoul', 46, 5),
    ('heartandsoul', 46, 9),
    ('heartandsoul', 46, 12),
    ('heartandsoul', 47, 7),
    ('heartandsoul', 47, 11),
    ('heartandsoul', 47, 14),
    ('heartandsoul', 59, 9),
    ('heartandsoul', 59, 12),
    ('heartandsoul', 59, 16)
]

default_mapping_insert_query = '''
INSERT OR IGNORE INTO mappings VALUES(?, ?, ?)
'''

class Mapping(object):
    conn = sqlite3.connect('mappings.db')
    c = conn.cursor()
    c.execute(create_table_mappings)
    c.executemany(default_mapping_insert_query, heartandsoul)
    conn.commit()
    conn.close()
