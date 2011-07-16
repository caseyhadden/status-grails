import org.grails.taggable.*

class Task implements Taggable
{

    User user
    String description
    Date entry = new Date()
    Date modified = new Date()
    Date completion

    static constraints = {
        description(blank: false)
	entry(blank: false)
	modified(blank: false)
        completion(nullable: true)
    }
}
