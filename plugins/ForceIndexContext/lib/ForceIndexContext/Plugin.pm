package ForceIndexContext::Plugin;

use strict;
use MT;
use MT::Template::Context;

sub force_index_context {
    my ($ctx, $args, $cond) = @_;

#$DB::signal = 1;

    my $tokens = $ctx->stash('tokens');
    my $builder = $ctx->stash('builder');

    local $ctx->{__stash}{entries} = undef;
    local $ctx->{__stash}{entry} = undef;
    local $ctx->{current_timestamp} = undef;
    local $ctx->{current_timestamp_end} = undef;
    local $ctx->{current_archive_type} = undef;
    local $ctx->{archive_type} = undef;
    local $ctx->{__stash}{category} = undef;
    local $ctx->{__stash}{archive_category} = undef;

    my $out = $builder->build($ctx, $tokens, $cond)
        or return $ctx->error($builder->errstr);
    return $out;
}

1;
