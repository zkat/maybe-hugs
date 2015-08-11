use ExtUtils::MakeMaker;
WriteMakefile(
    NAME              => 'Maybe::Hug',
    VERSION_FROM      => 'lib/Maybe/Hug.pm',
    PREREQ_PM         => {'Moops'=>0.034, 'Kavorka'=>0.036},
    AUTHOR            => 'Rebecca Turner <me@re-becca.org>',
    LICENSE           => 'mit',
);
