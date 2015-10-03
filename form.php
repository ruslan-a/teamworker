<!DOCTYPE HTML>
<html>
<head>

    <!-- TEAMWORKER 1.0 -->

    <!-- TODO: meta -->
    <title>TeamWorker</title>

    <?php include "stylesheets.inc"; ?>

</head>
<body>

    <main class="user-details">
        <?php include "header.inc"; ?>
        <div class="content">
            <h1>Form Styles</h1>
            <form>
                <label for="textbox">Textbox</label><input type="text" name="textbox">

                    <!--
                    For checkbox fields, create an initial label followed by an enclosing div.
                    Each check box must have one empty label for checkbox styling and one filled label for communication with class="check".
                    ID and "FOR" on checkbox->label elements must correspond correctly.
                    -->
                    <label>Checkbox</label>
                    <div class="checkbox-section">
                        <input type ="checkbox" id="check-1">
                        <label for="check-1"></label>
                        <label class="check" for="check-1">Check #1</label>

                        <input type="checkbox" id="check-2">
                        <label for="check-2"></label>
                        <label for="check-2" class="check">Check #2</label>

                        <input type="checkbox" id="check-3">
                        <label for="check-3"></label>
                        <label for="check-3" class="check">Check #3 for a really long label that might go over two lines hopefully</label>
                </div>
                <div class="half-dropdown">
                    <label for="select-1">Half-Width Dropdown #1</label><select name="select-1">
                        <option>Option 1</option>
                        <option>Option 2</option>
                    </select>
                </div>
                <div class="half-dropdown">
                    <label for="select-2">Half-Width Dropdown #2</label><select name="select-2">
                        <option>Option 1</option>
                        <option>Option 2</option>
                    </select>
                </div>
                <label for="select-3">Full-Width Dropdown</label><select name="select-3">
                    <option>Option 1</option>
                    <option>Option 2</option>
                </select>
            </form>
        </div>
    </main>

</body>
</html>
