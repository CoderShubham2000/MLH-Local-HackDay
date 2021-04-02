import sqlite3

drop_table_mappings = 'DROP TABLE mappings'

class Mapping(object):
    conn = sqlite3.connect('mappings.db')
    c = conn.cursor()
    c.execute(drop_table_mappings)
    conn.close()
