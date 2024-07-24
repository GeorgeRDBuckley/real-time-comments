# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RealTimeComments.Repo.insert!(%RealTimeComments.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Post 1
{:ok, post} = RealTimeComments.Posts.create_post(%{title: "The Rise of Remote Work: How to Stay Productive at Home", body: "Remote work has become a defining trend of the modern workplace, accelerated by recent global events. As more companies embrace the flexibility of remote setups, it's crucial to develop strategies for maintaining productivity outside a traditional office environment. One of the key factors to successful remote work is creating a dedicated workspace. This doesn't necessarily mean a separate room, but rather a specific area in your home that's set up for work, free from distractions. Time management is another essential aspect. Setting clear boundaries for work hours and breaks helps maintain a healthy work-life balance. Tools like time trackers and calendar apps can assist in organizing your day and keeping track of tasks. Additionally, staying connected with colleagues through regular virtual meetings and updates fosters collaboration and keeps the team spirit alive. Finally, don't overlook the importance of self-care. Working from home can blur the lines between personal and professional life, so it's important to take breaks, exercise, and maintain social interactions, even if they're virtual. By implementing these strategies, remote work can be as productive and fulfilling as working in an office, if not more so."})
RealTimeComments.Comments.create_comment(post, %{
  name: "RemoteGuru87",
  body: "This article really resonates with my experience. Creating a dedicated workspace was a game-changer for me! I used to work from my couch, but once I set up a proper desk and chair, my productivity skyrocketed. Also, scheduling regular breaks has helped me avoid burnout. Great tips!"
})
RealTimeComments.Comments.create_comment(post, %{
  name: "JaneDoe123",
  body: "Thanks for sharing these insights! I’ve been struggling with setting boundaries between work and personal life while working from home. The suggestion to use time trackers is something I’ll definitely try. Any recommendations for good tools?"
})
RealTimeComments.Comments.create_comment(post, %{
  name: "MarkTheShark",
  body: "I totally agree with the importance of staying connected with colleagues. It’s easy to feel isolated when working remotely. My team started using virtual coffee breaks, and it’s been a great way to stay in touch and share ideas informally. It’s the little things that make a big difference!"
})
RealTimeComments.Comments.create_comment(post, %{
  name: "SarahTechie",
  body: "Great article! One thing that has helped me stay productive is starting my day with a clear to-do list. It keeps me focused and gives me a sense of accomplishment as I tick off tasks. Also, your point about self-care is so important. I make sure to get some exercise and fresh air every day. It really helps to clear my mind and boost my energy levels."
})
RealTimeComments.Comments.create_comment(post, %{
  name: "WorkFromHomeWarrior",
  body: "Excellent tips! I’ve been working remotely for a few years now, and I can say that having a routine is crucial. I stick to a morning ritual that includes meditation and planning my day. Also, investing in a good quality webcam and microphone has made a huge difference in virtual meetings. It’s all about making the most of the resources you have!"
})

# Post 2
{:ok, post} = RealTimeComments.Posts.create_post(%{title: "Exploring Minimalism in Design: Less Is More", body: "Minimalism in design is more than just a trend; it's a philosophy that emphasizes simplicity and functionality. At its core, minimalism seeks to eliminate unnecessary elements, allowing the essential aspects of a design to shine. This approach can be seen across various fields, from architecture to graphic design, and it's particularly impactful in the digital space. In web design, minimalism manifests through clean layouts, ample white space, and a focus on typography. By stripping away distractions, minimalist websites offer a more intuitive and engaging user experience. This not only helps in directing the user's attention to key content but also enhances readability and usability. Moreover, minimalist design isn't just about aesthetics; it's also about performance. Simpler designs typically lead to faster load times and better mobile experiences, which are critical in today's fast-paced, mobile-first world. As the saying goes, \"less is more,\" and in design, this principle can lead to more effective and memorable outcomes."})
RealTimeComments.Comments.create_comment(post, %{
  name: "DesignLover",
  body: "Minimalism has completely changed the way I approach design. It's amazing how much impact a simple, clean layout can have. The focus on essential elements not only improves usability but also creates a more engaging experience for users. Great article!"
})

RealTimeComments.Comments.create_comment(post, %{
  name: "CleanSlate",
  body: "I found this post really enlightening! The idea of using white space effectively is something I've been experimenting with in my projects. It's challenging to strike the right balance between simplicity and functionality, but when done right, the results are stunning."
})

RealTimeComments.Comments.create_comment(post, %{
  name: "Modernist101",
  body: "As someone who loves modern design, I can't agree more with the points made here. Minimalism is not just a trend; it's a timeless approach that makes content more accessible and aesthetically pleasing. I especially appreciate the mention of performance benefits—less clutter means faster load times!"
})

RealTimeComments.Comments.create_comment(post, %{
  name: "SarahB",
  body: "This was a great read! I've always been a fan of minimalist design, but I sometimes struggle with making my work stand out. The emphasis on typography and spacing is a great reminder of how powerful these elements can be. Thanks for the inspiration!"
})

RealTimeComments.Comments.create_comment(post, %{
  name: "TechieDesigner",
  body: "Excellent insights on minimalism in design! The balance between form and function is key, and minimalism often gets it just right. The point about reducing distractions to enhance user experience really hit home. I've seen firsthand how a clean, simple interface can make all the difference."
})
