import org.grails.taggable.*

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = User.findByUsername('admin') ?: new User(
                username: 'admin',
                password: springSecurityService.encodePassword('admin'),
                enabled: true).save(failOnError: true)
        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create adminUser, adminRole
        }

        def codeTag = Tag.findByName("code") ?: new Tag(name: "code").save(failOnError: true)
        def designTag = Tag.findByName("design") ?: new Tag(name: "design").save(failOnError: true)
        def docTag = Tag.findByName("doc") ?: new Tag(name: "doc").save(failOnError: true)
        def internalTag = Tag.findByName("internal") ?: new Tag(name: "internal").save(failOnError: true)
        def learnTag = Tag.findByName("learn") ?: new Tag(name: "learn").save(failOnError: true)
        def supportTag = Tag.findByName("support") ?: new Tag(name: "support").save(failOnError: true)
        def testingTag = Tag.findByName("testing") ?: new Tag(name: "testing").save(failOnError: true)
        def vacationTag = Tag.findByName("vacation") ?: new Tag(name: "test").save(failOnError: true)

    }
    def destroy = {
    }
}
