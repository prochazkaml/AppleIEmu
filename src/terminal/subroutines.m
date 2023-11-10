function label = CreateTermLabel(figure, row, text)
    global config;

    label = uilabel(figure);
    label.FontName = "monospace";
    label.FontSize = config.FontSize;
    label.Text = text;
    label.FontColor = [0, 1, 0];
    label.Position = [0, (row - 1) * config.RowSpacing, config.RowSpacing * 42, 30];
end

function CursorBlink(tmr, ~)
    global cursor;
    global running;

    if isvalid(cursor) == false
        stop(tmr);
        disp("UI figure closed, quitting.");
        running = 0;
    elseif mod(tmr.TasksExecuted, 2) == 0
        set(cursor, 'Visible', 1);
    else
        set(cursor, 'Visible', 0);
    end
end

function KeyPress(~, EventData)
    global kbdmap;
    global keybuf;

    disp(EventData);

    chrid = uint8(EventData.Character);
    
    if (size(chrid, 1) == 1) && (chrid < size(kbdmap, 2)) && (kbdmap(chrid + 1) ~= 0x00)
        keybuf = kbdmap(chrid + 1) + 0x80;
        %WriteTerminal(kbdmap(chrid + 1) + 0x80);
    end
end

function WriteTerminal(c)
    % Possible values:
    % 0x8D = Newline
    % 0xC0-0xFF = Characters (mapped to ASCII 0x40-0x5F and 0x20-0x3F)

    global lbl;
    global cursor;

    chrid = bitand(uint8(c), 0x7F);

%    fprintf("%d\n", chrid);

    % Check if the input value is a CR character

    if chrid == 0x0D
        % Force a scroll

        cursor.Text = "                                             ";
    elseif (chrid >= 0x20) && (chrid <= 0x7E)
        % Write the value
    
        lbl{1}.Text(size(cursor.Text, 2)) = char(chrid);

        % Increment the cursor
    
        cursor.Text = " " + cursor.Text;
    end

    if size(cursor.Text, 2) >= 42
        % Cursor overflow, reset to the start of the line and scroll the
        % terminal window up

        cursor.Text = " @";

        for i = 24:-1:2
            lbl{i}.Text = lbl{i - 1}.Text;
        end

        lbl{1}.Text = "|                                        |";
    end
end
