title=Why we contribute to open source
date=2026-06-09
type=post
status=published
kicker=Essay
description=Open source is not charity and it is not free. It is a commons we build on but did not build, and the rent is contribution.
~~~~~~

Every line of Eliya runs on code we did not write. The JVM, the standard library, the build tools, the cryptography, the logging: all of it is open source, maintained by people we have mostly never met. That is not a disclaimer. It is the working condition of anyone who ships on the JVM, and it is worth being honest about what it means.

It helps to be precise about what open source is. Eric Raymond, in [The Cathedral and the Bazaar](https://firstmonday.org/ojs/index.php/fm/article/view/578), described the mechanism: many contributors, frequent releases, and "given enough eyeballs, all bugs are shallow." Yochai Benkler named the economics in [Coase's Penguin](https://www.benkler.org/CoasesPenguin.PDF): commons-based peer production, a third way to make things that is neither the firm nor the market. This is not idealism. For infrastructure, it is a production model that routinely beats the proprietary alternative.

What it is not is free. A commons is a resource that has to be tended. Elinor Ostrom won a Nobel for showing that commons can be governed sustainably, but only with real institutions behind them, and Nadia Eghbal's [Roads and Bridges](https://www.fordfoundation.org/learning/library/research-reports/roads-and-bridges-the-unseen-labor-behind-our-digital-infrastructure/) made the uncomfortable version of the point: most of this infrastructure is held up by unpaid volunteers, and treating it as weather rather than labour is how it fails.

The Java world keeps relearning this the hard way. In December 2021, [Log4Shell](https://www.technologyreview.com/2021/12/17/1042692/log4j-internet-open-source-hacking/) turned a logging library maintained by a handful of volunteers into the vulnerability of the year. In 2024 the [xz-utils backdoor](https://www.cisa.gov/news-events/news/lessons-xz-utils-achieving-more-sustainable-open-source-ecosystem) went further: attackers spent three years earning the trust of a single, burned-out maintainer, and the backdoor was caught by luck. Both times the lesson was the same. Critical software was resting on people the industry had never paid attention to.

So our position is plain, and self-interested in exactly the way [Lerner and Tirole](https://onlinelibrary.wiley.com/doi/10.1111/1467-6451.00174) described twenty years ago: people and firms contribute for reputation and the careers it builds, and to keep alive the thing their own work depends on. We build on a commons, so we pay rent on it. Our founder has spent fifteen years doing that, in Spring Cloud Netflix, Spring Boot, Jasypt Spring Boot, and Debezium, public on [his GitHub](https://github.com/fahimfarookme). Eliya keeps its changes to OpenJDK minimal and upstreamable, under the same GPLv2 with Classpath Exception the JDK itself uses, because the thinner our private patch, the more of our reliability comes from a foundation anyone can inspect.

Open source is not a marketing posture for us. It is the ground we stand on, and the only honest way to stand on it is to help hold it up.

<a href="https://github.com/asymmsystems" target="_blank" rel="noopener" class="org-link org-link--inline org-link--external">Follow our GitHub</a>
