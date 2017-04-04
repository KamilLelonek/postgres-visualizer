# database-visualizer

## Dependencies

Make sure you have `graphviz`, `libtool` installed.

### OS X

To do that you can use `homebrew`:

    brew install graphviz libtool

### Ubuntu

    sudo apt install graphviz libtool openjdk-8-jre-headless

---

You will need [JRE 8](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html) installed as well.

## Usage

You can use this to generate a visual representation of your local database.

It has the following assumptions:

- your database is `PostgreSQL`
- you have a `postgres` user with no password set there
- the database runs on port `5432` at `localhost`
- it has a default schema called `public`

If you want to modify any of the above setting, you can change `visualize.sh` file.

## GUI

To generate a GUI for your database you can use:

	./visualize.sh DATABASE_NAME [OUTPUT_DIRECTORY]
	
Keep in mind that `OUTPUT_DIRECTORY` is optional and its default is the same as `DATABASE_NAME `.

---

There are some convenient scripts predefined for already existing projects which have database name and output directory provided.

### Results

The entry point to generated results is `OUTPUT_DIRECTORY/index.html`. It looks as follows:

#### Tables

![Tables](https://monosnap.com/file/vrK0lojUzFVNcdd6GpTHHHsnv2tRoj.png)

which lists all of the tables involved in relationships.

#### Constraints

![Constraints](https://monosnap.com/file/Q7rj4Q8UIQNfwUrEUFiO8UtJnpILlU.png)

which includes:

- foreign keys
- child/parent tables
- deletion rules

#### Relationships

![Relationships](https://monosnap.com/file/ku81U3r1laE5EvrNONp1dU2WLn1Frt.png)

which represents relations themselves (with optional columns to see).

#### Utility tables

Which are basically all tables that are not connected with antyhing else. They are not involved in the relations above.

## CSV

`Lucidchart` has an awesome feature of [importing CSV generated schemas](https://lucidchart.zendesk.com/entries/21606135-Entity-relationship-diagrams) and generating tables that are ready to be placed on the canvas.

To get an appropriate CSV file you can execute

    ./generate_csv_schema.sh DATABASE_NAME [OUTPUT_FILE]

### Prepare a document

1. Create a new Lucidchart document
2. Press *more shapes* button in the bottom left corner
3. Tick *Entity Relationship* checkbox
4. Click *Save*
5. In the left pane in *Entity Relationship* section select *import*.
6. Click *Choose file* button and point to the generated CSV file.
7. Click *OK*

### Drawing a schema

1. Once imported, all tables should be visible in left pane under `PROJECT_NAME` section
2. You can drag and drop them to a canvas
3. After you have all tables in your documents, you can organize them as you wish

--

### Results

The result is a `.csv` file that can be imported and used in `Lucidchart` directly.

![Lucidchart](https://monosnap.com/file/VyYthjCXBphHKHUMrtktjgnwwPUJE0.png)


After running a script you will find it as:

    ./OUTPUT_FILE.csv

## Contribution

Feel free to add new scripts for any other project you need.
