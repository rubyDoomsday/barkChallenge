# barkChallenge

This is a code challenge for the Bark Senior Product Engineer role. The purpose of this project is to demo some best practices while
answering a simple scenario of Password validation. This project is expected to take 2-3 hours at most. The 7 day time limit is to
make sure you can fit it into your schedule. But also super flexible and can adjust if needed.

## Requirements

### Provided

- After providing their email, customers will be asked to create a password. Let's build a form that helps them choose a good one providing real-time feedback.
  - The user account will already exist. It could be from an OAuth grant, third-party bulk import, password reset, etc.
- Identify additional requirements and justify choices
  - Would love to see what you come up with in this regard.
- The solution will go to production, make sure you cover all your bases
- Perform validation on the back end
- Use whatever technology or framework you're most comfortable with
- Use any packages you'd like for support but the core interactions should be your own
- Requirements change, be prepared

### Additional

- Password complexity: This is a [misunderstood security
  measure[(https://www.starlab.io/blog/why-enforced-password-complexity-is-worse-for-security-and-what-to-do-about-it)], complex passwords are hard to remember and require use of password managers, best
  practices indicate that we should be using 2factor authentication and/or magic link authentication vs strictly relying on password
  complexity. Assuming we would implement 2fa in a future iteration, for simplicity of the task our password requirements are the inclusion of: `min length`, `caps`, `number`
- Email Uniqueness Constraint: Allowing users to enter the same email for multiple accounts is problematic. It prohibits easy integration
  with other systems and introduces ambiguity to the underlying data. Therefore we will limit 1 email per user

## TL;DR

To run the project execute

```
  docker-compose build && docker-compose up
```

## What Would I change / do next

- As indicated by my Sequence Diagram I intended to have some client side validations take place prior to submitting the form but I did not
  manage to get that in place within the allotted time
- build CSS styles to make the views more pretty, possibly shortcut the design using a bootstrap template
- Introduce Oauth and/or 2fa in addition to the simple act of password creation
- Lock down user manipulation behind RBAC and password authentication and/or only allow a user to edit themselves
- Likely leverage Devise authentication instead of a custom built password validation however in the spirit of conversation I chose to bypass
  this industry standard library.

## Documentation

### View Code Documentation

This project conforms to [yard](https://github.com/lsegal/yard) for code documentation. To view code
docs run:

```

script/docs

```

### Project Design Documentation

For high level design, ADRs, and additional documentation, browse the [wiki](./wiki).

## Dependencies

| Type     | Dependency                |
| -------- | ------------------------- |
| database | sql lite (for simplicity) |

### Environment Variables

This project uses dotenv for environment variables. See env.sample for details

## Installing

This project makes a best effort to conform to the
[scripts-to-rule-them-all](https://github.com/github/scripts-to-rule-them-all) best practices.
The following command should get your development environment up and running in no time.

### Mac OS

```

script/bootstrap # get dependencies
script/setup # creates a "clean slate" state

```

## Running

### Locally

```

script/server

```

## Testing

### Locally

This project leverages the [parallelel_tests](https://github.com/grosser/parallel_tests) gem to
expedite local test suite execution. Tests may be run from the command line using the provided
script.

```

script/test

```

This project leverages simplecov for code coverage reporting and strives to achieve 90% test coverage as a baseline. To run tests and see a
coverage report run

```

COVER=true script/test

```

## Contributing

## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons
License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br
/><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text"
property="dct:title" rel="dct:type">Turlista</span> by <a xmlns:cc="http://creativecommons.org/ns#"
href="https://github.com/rubyDoomsday/turlista-be" property="cc:attributionName"
rel="cc:attributionURL">Rebcca Chapin</a> is licensed under a <a rel="license"
href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0
International License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/"
href="https://github.com/rubyDoomsday/turlista-be"
rel="dct:source">https://github.com/rubyDoomsday/turlista-be</a>

```

```
