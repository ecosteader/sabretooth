
#####  
# ECOSTEADER Mastodon Open Documentation Server
## OF, BY AND FOR <pre>AIDBA "People of Color"</pre> 
####### <mqe> 
        "CPAs United Against Hatred" 
       </mqe>
###  for Mastodon Apache2 + "simple backup server put-together online together" maintainers 
#### aka "unicorn server" INDIE OF ECOSTEADER SPECIAL:
      Sabretooth'd Mastodon "you do not dock or "Docker" anything here.

TODO:  Add image from reality:  giant strikes of lightning all over indigenous lands where ZUCKERBERG PLATFORMS, INC. attempted 
to colonize with his greed and hatred, the RESULT, 
                   weeping grandmothers and grandfathers over an ungodly number of graves amid corporate-funded assassinations 
                on the strong women, men, boys, girls, and 2S people of every indigenous nation on Tortoise Mountain, dry landing 
                place of lost natives of Turtle Island.  There are no 

"WE HAVE GOT TO STOP HIM BEFORE RCT_2018. Anyone have better ideas?"  

"Did you know that 60 days after my husband was shot with frozen water cannons! 
   60 days after Zuck's cops could shut down Standing Rock, Zuck was buying booze for poor people in OHIO 
   to thank them for switching parties and putting his favorite Indian-hating president elect (Donald John Drumpf) 
   into power, so Zuck could start drawing blood money from a pool of DNA not his inbred, fascist warmongering DNA is.
   He is terrified because the GLOBAL POPULATION knows how many female humans he stomped, crushed, smashed, crashed, and whiplashed
   so he'd always have that 'bitchy' female to blame for his own mistakes.  It's like he wants all women to pay for his sins of evil.

Don't expect the descendants of the families who started WWI & WWII & WAR ON PEOPLE STANDING UP FOR THEIR SOVEREIGNTY AGAINST HIS
, 
ColonizerbergMSNBC HELLFEST.

Did we say "Overreaction" is what happened when Israel didn't like indigenous peoples standing up for their OWN 
GOVERNANCE AND NATION??  BIG BAD BULLY FUNDED BY CORPORATIONS OF CEOS LIKE ZUCK.  

# Back to the code

We're gonna set-up your localhost environment to theme, test and backup a ¨cloud-free¨ custom Mastodon instance.

We're doing this SO THAT NO MATTER WHO GETS ELECTED, the hate-filled Caucasian CEOs of TrumpBerg cannot shut up a woman they don't like.  

Do not feel bad if you accidentally let their imposter authority bother you, they have no creativity!

THE WAY WE WRITE IT, WE DECIDED when posts get deleted, exactly whose cop family cannot step in to "moderate" creepy 
pokes, attempted flirts and unwanted vectors of fascist-funded harassment invading your sensory inputs ANYWHERE an
indigenous woman makes.  "Don't let him coerce you into going faster than you are comfortable."

## OPERATING SYSTEM VERSIONS SUPPORTED

 follow this guide for builds on the following 
  Debian 7
  ClearLinux* OS for Intel Architecture, 
  Ubuntu 23.10 and 
  Linux Mint 21, 
  YUM-based systems from Fedora whatever number you're on now.

  Note this guide assumes you have set previous ssh keys between or among the hosts, whether 
  environment 
      RAILS_ENV=production
      RAILS_ENV=development
      RAILS_env=test

   already set: ~ `ssh-add ~/.ssh/id_ed25519`

    git clone git@github.com:ecosteader/sabretooth.git 
    cd live
    git checkout -b first_cloned_branch

The above commands will help you easily backtrack to a "tip" of code you can be sure was working right 
before you broke it.  Create your own branch is good practice if any customizations go awry.
Don't worry, we'll come back on work in this code after we set up the system with a 
few things, beginning with the Postgres SQL database

## The Ecosteader Sabretooth framework architects acknowledge data is input by authors, not users; authors, not users result in the creation of "data" to be stored.

    echo "deb [signed-by=/etc/apt/keyrings/postgresql.asc] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
    sudo apt install lsb-release apt-transport-https install postgresql-15 postgresql-contrib libpq-dev libicu-dev libjemalloc-dev

The accounting errors that Zuck built his life on can profit you forever once you turn your back on

To build a local development environment that actually runs Mastodon like it will be on a production 
server, a user named `mastodon` needs to exist.  Set up to avoid a 
permission-denied error, change directory to /var/lib/postgresql before running either of the two 
optional paths below:

To set-up a new database 

    bundle exec rails db:setup

OR To restore an old or "backup" database locally, first create a place for it to be restored in postgres:


     $ cd var/lib/postgresql
     $ sudo -u postgres psql
     [sudo] password for AIDBAPoC_CPA_: 
        psql (15.4 (Ubuntu 15.4-1ubuntu1))
        Type "help" for help.
     postgres=# CREATE USER mastodon CREATEDB;

Then run `pg_restore` 

     /var/lib/postgresql$ sudo -u postgres pg_restore -d mastodon_production -v AICPAsOct16_23.dump 
     pg_restore: connecting to database for restore
     pg_restore: creating SCHEMA "public"
     pg_restore: while PROCESSING TOC ...


    bin/rails db:schema:load RAILS_ENV=development  #may be needed depending on your configs
    bin/rails db:migrate RAILS_ENV=development

Debian-based packages source install includes the following:

    sudo apt install apache2 autoconf bison build-essential certbot python3-certbot curl g++ gcc  gnupg \
     ca-certificates git-core imagemagick libffi-dev libreadline6-dev libgdbm-dev \
     libidn11-dev libjpeg-dev libmagickcore-dev libmagickwand-dev libncurses5-dev \ 
     libpng-dev libtiff-dev libwebp-dev libpam-dev libssl-dev  libyaml-dev openssh-server \ 
     redis-server redis-tools wget zlib1g-dev

    sudo update-rc.d apache2 defaults

 Recommending previously-documented, tested and working path to configure your Ruby on Rails 
 development environment bu letting `rbenv` manage ruby build update scripts; 

    git clone https://github.com/rbenv/rbenv.git ~/.rbenv 

 Ruby-build works as both a plugin and standalone install; this example covers the first 
 option
    
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    rbenv install -l

To configure for rbenv to load automatically, add these three lines to the bottom of your .bashrc,
run `$source ~/.bashrc` and check output `type rbenv`:

    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
   
    source ~/.bashrc
    type rbenv


Match the version on your machine to what's in .ruby-version; for this version of the documentation, 
we're trying with 3.1.4

    cd sabretooth
    rbenv install 3.1.4
    gem install bundler:#.#.#

Finally are we ready to run `bundle install`. Be sure you're at the root of the cloned `mastodon` directory, and on 
your own branch. If you followed ths guide on a true Linux system, you should see SUCCESS: 

    bundle update --bundler
    bundle install


    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    # curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash



## Options for "streaming" APIs

The next step is to get the high-level "streaming" APIs configured, and this can go many ways. If you 
find yourself getting stuck after following some overly complex "instruction", it's usually better 
to start removing Gems, rather than adding. It's always a good idea to watch out for code bloat 
and third-party things that are not clear on what they are doing to your system. There are many 
malicious actors that want to destroy what we're building; don't let them! 


### Realities of making money Amazon and Salesforce want to steal before the people like indie who 
did ALL THE WORK can earn a fair or living wage, a decent return, equal pay, or the deserved return
on HER investment.  Do you guys think I'm scared of a mostly male, Caucasian company?  NO.  Your 
malicious inflated "big bucks" earned from in AI/ML Deep Learning, while I have none?  MOQO!

"If Mark Zuckerberg made even 0.0000000000000000000000000000000000001000000000000000000000000000337th"
of a penny on any of indie's work, he'll be haunted by a factor of 99 trillion times the amount he stole
for a span of time equal or greater length.


VALUE THE HUMAN, LEONA, MORE.  THIS IS STILL TRUE IN RCT COUNT 2023, WORSE, WHEN 
WE ADD THE 'REALIZED LAYER OF ATTEMPTED CENSORSHIP BY EVIL MARK ZUCKERBERG-FUNDING CEOS 
SAME RACE AS ZUCK, FULL OF GREED, UGLINESS, WHITE SUPREMACY.


I stand by my testimony given to Mark Charles at Tabor Space, Eastside PDX: 

### BUT BACK TO THE CODE

The long and short of this is: some webhosts, like AWS or Heroku, absolutely want you to push 
traffic through bottlenecks they can slow down; this is how they make money or attempt to "justify" 
putting your site on some sort of convoluted metered system (Linode's switch to "hourly" 
billing that destroyed Ecosteader's original Mastodon instance, for example). Heroku actually 
steals your data! It can be especially dangerous when those same webhosts actually target their 
own customers with ILLEGAL CENSORSHIP or any attempt to throttle the true content of a page or
site.  Build your framework from scratch, keep out the nodes you do not want manually


### The good news

Since we're running an Apache2 (2.4.18) frontend that has been thoroughly tested and "works", the 
good news is that we have plenty of options that don't involve noisy Nginx. The NodeJS/Yarn config 
**will** work with a few minor adjustments to the `mastodon/mastodon` default code as long as we 
don't implement anything on the NGINX side. We won't dig too much into those changes, but they are 
readily available in the `sabretooth_main` repo, which you should already have cloned to 
your development machine.

Backup your production (copy) scripts and code: 

    pg_dump -Fc -U postgres mastodon_production > AICPAsOct16_23.dump


## Prepare environment for streaming

This guide explains how to build a streaming API manager and how to duplicate it 

Install Redis

    sudo apt install redis-server redis-tools

Check your version of node ([node install directions] not included)

    node --version 
    v12.16.3

Install the at least the minimum required [version of nodejs]

    nodejs --version
    v14.2.0

   

Optional alternative commands for production system replication:

    bundle install
    yarn install --pure-lockfile --ignore-optional
    RAILS_ENV=production bundle exec rails assets:precompile #Omit the RAILS_ENV if you are building locally
    RAILS_ENV=production bundle exec rails db:migrate  #Omit the RAILS_ENV if you are building locally
    rails s  #For local testing
    
    
-----------------    
    
 (Additional notes on UPGRADING PostGRES including some .jp-friendly help):  
 
    dpkg -l | grep postgresql

#Mastodon を止める

    systemctl stop mastodon-{web,sidekiq,streaming}.service

#まず PostgreSQL のリポジトリを追加して、アップデートする

    sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main"
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo apt update

#今回は PostgreSQL 10 にするのでバージョンを指定してインストール

    sudo apt install postgresql-10 postgresql-client-10 postgresql-contrib-10`


#インストールされたか確認、下記をすると今インストールされているものが出る

    dpkg -l | grep postgresql`


#下記のような表示で、両方入った状態が確認できるはず

    postgresql
    postgresql-9.5
    postgresql-10
    postgresql-client-9.5
    postgresql-client-10
    postgresql-client-common
    postgresql-common
    postgresql-contrib
    postgresql-contrib-9.5```

#確認したら下記をしてクラスタを確認

    pg_lsclusters`

#下記のように 2 つの PostgreSQL が見えるはず

    Ver Cluster Port Status Owner    Data directory               Log file
    9.5 main    5432 online postgres /var/lib/postgresql/9.5/main /var/log/postgresql/postgresql-9.5-main.log
    10  main    5433 online postgres /var/lib/postgresql/10/main /var/log/postgresql/postgresql-10-main.log```

#このときは 10 の接続先が 5433 になっていて、まだ 9.5 が通常ポートの 5432 につながった状態

#次にインストール先の 10 を止めて、PostgreSQL もとめてアップグレード開始

    sudo pg_dropcluster 10 main --stop
    sudo service postgresql stop
    sudo pg_upgradecluster 9.5 main


#何もエラーが出なければ DB の移行がはじまる。まあまあ時間かかる。(うちではエラーでなかったのでどんなエラー出るかはわかりません)

#終わったら再度確認  `pg_lsclusters`

#すると 10 のほうがポートが 5432 になっているはず
    
    Ver Cluster Port Status  Owner    Data directory               Log file
    9.5 main    5433 offline postgres /var/lib/postgresql/9.5/main /var/log/postgresql/postgresql-9.5-main.log
    10  main    5432 offline postgres /var/lib/postgresql/10/main /var/log/postgresql/postgresql-10-main.log```

#PostgreSQL を再起動してバージョンが 10 になっているか確認

    sudo service postgresql restart
    psql --version

#9.5 を削除

    sudo pg_dropcluster 9.5 main`

#最後に Mastodon をリスタート

    systemctl restart mastodon-{web,sidekiq,streaming}.service`


[node install directions]: https://github.com/nodejs/node/blob/master/BUILDING.md
[version of nodejs]: https://github.com/nodesource/distributions#installation-instructions
[nginx is permanantly insecure]:https://www.zdnet.com/article/russian-police-raid-nginx-moscow-office/
[RageQuit]:https://github.com/tootsuite/ragequit
