# The Missing Semester of Your CS Education

[Missing Semester of Your CS Education - MIT](https://missing.csail.mit.edu/2020/)

Classes teach you all about advanced topics within CS, from operating systems to machine learning, but there’s one critical subject that’s rarely covered, and is instead left to students to figure out on their own: proficiency with their tools. We’ll teach you how to master the command-line, use a powerful text editor, use fancy features of version control systems, and much more!

Students spend hundreds of hours using these tools over the course of their education (and thousands over their career), so it makes sense to make the experience as fluid and frictionless as possible. Mastering these tools not only enables you to spend less time on figuring out how to bend your tools to your will, but it also lets you solve problems that would previously seem impossibly complex.

Read about the [motivation behind this class](https://missing.csail.mit.edu/about/).

---

* Send your SSH public key to remote server in one line:
```bash
cat ~/.ssh/id_rsa.pub | ssh foobar@remote 'cat >> ~/.ssh/authorized_keys'
```
