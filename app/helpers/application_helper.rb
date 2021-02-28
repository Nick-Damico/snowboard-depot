module ApplicationHelper
    def btn_text(record)
        class_name = record.class.name
        record.persisted? ? "Update #{class_name}" : "Create #{class_name}"
    end
end
