#let accent = rgb("#2c3e50")

#set page(
    paper: "us-letter",
    margin: (x: 0.6in, y: 0.5in),
)
#set text(
    font: "Atkinson Hyperlegible",
    size: 10pt,
    lang: "en",
)
#set par(justify: true, leading: 0.65em, spacing: 0.4em)

#show heading.where(level: 1): it => {
    set text(size: 11pt, weight: "bold", fill: accent)
    v(0.5em)
    block(it.body)
    v(0.1em)
    line(length: 100%, stroke: 0.5pt + accent.lighten(50%))
    v(0.2em)
}

#show heading.where(level: 2): it => {
    v(0.3em)
    block(it.body)
}

#let job(company, title, dates, location, body) = {
    v(0.2em)
    grid(
        columns: (1fr, auto),
        column-gutter: 1em,
        [#text(weight: "bold", size: 10.5pt, company) \
          #text(style: "italic", size: 9.5pt, title)],
        [#text(size: 9pt, fill: gray, dates) \
          #text(size: 9pt, fill: gray, location)],
    )
    v(0.1em)
    body
}

= Jay Looney

#grid(
    columns: (1fr, auto),
    align: (left, right),
    [#text(size: 9pt, [#link("mailto:jay@jaylooney.dev")[jay\@jaylooney.dev] #h(0.5em) #link("https://www.jaylooney.dev")[www.jaylooney.dev]])],
    [#text(size: 9pt, [+1 516-847-5923 #h(0.5em) #link("https://github.com/zenware")[github.com/zenware] / #link("https://linkedin.com/in/jaylooney")[linkedin.com/in/jaylooney]])],
)

#v(0.3em)

Software engineer building reliable systems at scale -- data engineering, infrastructure, and security. 5 years in ICS/OT cybersecurity building platforms and tooling that defend critical infrastructure. Open to senior/staff engineering roles (data, platform/SRE, backend, security), consulting, and advisory. Remote-friendly, Madison, WI.

= Skills

#grid(
    columns: (1fr, 1fr),
    column-gutter: 1.5em,
    row-gutter: 0.3em,
    [*Data / Infra:* Python, PostgreSQL, Elasticsearch/ELK, SQL, ETL, CI/CD, Docker, Nix, Ansible, Git],
    [*ICS/OT Security:* Protocol RE, agentless inventory, Siemens, SEL, Emerson, Allen-Bradley, NERC-CIP],
    [*Backend:* REST APIs, distributed systems, message queues],
    [*Systems:* Release engineering, disaster recovery, networking, load balancing, Vagrant],
)

= Experience

#job("Dragos, Inc.", "Senior Software Engineer", "2021 -- 2024", "Fulton, MD (remote)")[

Founding hire twice: *Knowledge Pack* (release engineering) then founding *Data* team.

+ Rebuilt platform release into CI/CD producing online/offline ISO gold images on demand; designed separate content-only vs code-only release tracks for NERC-CIP compliance.
+ Built custom Elasticsearch index-management service for lifecycle, shard optimization, and cross-cluster operations at scale.
+ Consolidated scattered SQL and MongoDB onto a single PostgreSQL, reducing operational surface area.
+ Designed lightweight backup/restore system for DR and environment promotion (QA to Prod, Prod-to-Prod replication across plants).
]

#job("Verve Industrial Protection", "Senior Software Engineer", "2019 -- 2021", "Peoria, IL")[

+ Reverse-engineered industrial protocols (Siemens, SEL, Emerson, Allen-Bradley, Cisco IOS/ASA) for agentless device discovery and fingerprinting.
+ Maintained ICS-aware fork of Ansible core and AWX for industrial device orchestration.
+ Built physical hardware lab from scratch -- DIN-rail benches, sourcing and unlocking industrial gear for testing.
]

#job("TDS Telecom", "Linux Engineer & Python Developer", "2017 -- 2019", "Madison, WI (remote)")[

+ Automated networking hardware: F5 Load Balancers, Sandvine SDEs across ISP footprint.
+ Decommissioned legacy CMDB during acquisition, migrating customer data to new platform.
+ Built CLI and web GUI for managing auth providers on Ping Identity.
]

#job("Independent Contractor", "Various -- Notionovus, Scicada, Odessian, FoxyTronics, PriceWombat", "2014 -- 2017", "Central IL")[

+ *Notionovus:* C/C++ SDK with SWIG, React/Django full-stack, patent filings, Brave Launch accelerator.
+ *Odessian:* Migrated VB6 app to HIPAA-compliant Django; 10k+ patient records from Access to PostgreSQL.
+ *PriceWombat:* PHP scraping framework, 70+ retailer scrapers, 800k+ records/min.
]

= Education & Certifications

#grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [*AS, Computer Programming & Database Development* -- Illinois Central College (3.5 GPA)],
    [RHCSA (2018) -- #link("https://www.redhat.com/rhtapps/services/verify/?certId=180-275-752")[Verify]],
)

= Community

FIRST Robotics Mentor (2015-17) -- taught Java/robotics; team won Highest Rookie Seed. FreeCodeCamp Coordinator, Central IL (2015-17). Junior Achievement volunteer (2015).
