module ApplicationHelper

    # Method for showing error messages for form fields
    def error_messages_for(object)
        render(partial: 'application/error_messages', locals: { object: object })
    end

    # Method for showing in our admin layout if categories or books are visible.
    # Instead of true false, it will add span tags for us, and we just need to style it with css
    def status_tag(boolean, options = {})
        options[:true_text] ||= ''
        options[:false_text] ||= ''

        if boolean
            content_tag(:span, options[:true_text], class: 'status true')
        else
            content_tag(:span, options[:false_text], class: 'status false')

        end
    end
end
