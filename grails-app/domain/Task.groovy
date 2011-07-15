import org.grails.taggable.*

class Task implements Taggable
{

    User user
    String description
    Date entry
    Date completion

    static constraints = {
        description(blank: false)
        entry(blank: false)
    }
}
