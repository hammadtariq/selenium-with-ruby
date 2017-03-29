require 'json'

module Utils

    def Utils.readJsonFile(filePath)
        path = File.expand_path(filePath, __FILE__)
        return data_hash = JSON.parse(File.read(path))
    end

    def Utils.switchWindow(index,browser)
        window = browser.window_handles
        browser.switch_to.window(window[index])
    end
 
    def fill_in_editor_field(text)
        within ".CodeMirror" do
            # Click makes CodeMirror element active:
            current_scope.click

            # Find the hidden textarea:
            field = current_scope.find("textarea", visible: false)
            puts "wow => #{field}"

            # Mimic user typing the text:
            field.send_keys text
        end
    end

    def have_editor_display(options)
        editor_display_locator = ".CodeMirror-code"
        have_css(editor_display_locator, options)
    end

end
