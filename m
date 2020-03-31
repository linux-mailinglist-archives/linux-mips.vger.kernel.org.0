Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 858D3199B54
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 18:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgCaQWx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 12:22:53 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36037 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730149AbgCaQWx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 31 Mar 2020 12:22:53 -0400
Received: by mail-lj1-f195.google.com with SMTP id b1so2075690ljp.3
        for <linux-mips@vger.kernel.org>; Tue, 31 Mar 2020 09:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H0krxhczgA496JeTGfWjPTKYIgHf9GcW9MVmaaVn2GY=;
        b=PZypqVAapY01bjsOjN2q6EITWh5onkx6m6fo+GxMpFeF0I2LpJsrttwKpFnc3LNNpF
         Z7cVt2tso8YtHq2cdzfIN1dqfk9kwXhDrdPuiPurGi7aarOS9FqdvqSAOYvfmqO4qLPW
         3t9xxwV4L0CiXkuJQnpt5bW/75tf/vMt5o4uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H0krxhczgA496JeTGfWjPTKYIgHf9GcW9MVmaaVn2GY=;
        b=jNqIziQP/zqcquTv30YUamgcTgQnsTBYDu4TJgDKvgMqIsYHvGLsozbw4n0ujmIVeO
         WwKTiih0ddARp55ANVqkyE+OI1zfw0/Xa5fxsLDmEYU+iH9Yyl2QFW4wXdFjnHW89Ur7
         uphiUUGZ53cTKES9NxF5HxbQMGuS/4ttq4LgMFF4Kg2ltHAoBhmZ5NynBsv06x1GRNB2
         waSwF8zP6UtvT5v4anUQSWxHuQYALOARPubHamZt4w1Dn5LWYCwqsdad3jlmTzlh0pr2
         5hUtOWnXTuzbY+ybn7QG8+QdrCnAfUCL0z6hNuUfQF8bwmpPs/XhyiCU3O8URm9gmrWl
         +BOQ==
X-Gm-Message-State: AGi0PuZMm2yjceN6qhnvp44DMsIFD9eCAvDPbxuZZgOHxv6P0QyV+tgR
        Drib77MVOlKDvE0iiRXa3+detAxsv7g=
X-Google-Smtp-Source: APiQypITVceFtyxre9ouIIdiuV8o4omwWHl9Z2bRLwRVOcdEyuLQakdKzds8iBWybqU+jc8ZzJIUWQ==
X-Received: by 2002:a2e:7a18:: with SMTP id v24mr6366059ljc.34.1585671768261;
        Tue, 31 Mar 2020 09:22:48 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 15sm10187782lfb.56.2020.03.31.09.22.47
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 09:22:47 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id u15so8730099lfi.3
        for <linux-mips@vger.kernel.org>; Tue, 31 Mar 2020 09:22:47 -0700 (PDT)
X-Received: by 2002:ac2:46d3:: with SMTP id p19mr6164735lfo.125.1585671766812;
 Tue, 31 Mar 2020 09:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200330120315.GA10196@alpha.franken.de>
In-Reply-To: <20200330120315.GA10196@alpha.franken.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 31 Mar 2020 09:22:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg3wXH2JNxkQi+eLZkpuxqV+wPiHhw_Jf7ViH33Sw7PHA@mail.gmail.com>
Message-ID: <CAHk-=wg3wXH2JNxkQi+eLZkpuxqV+wPiHhw_Jf7ViH33Sw7PHA@mail.gmail.com>
Subject: Re: [GIT PULL] MIPS changes for v5.7-rc1
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 30, 2020 at 5:03 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> I probably messed up my tree, when merging mips_fixes_5_6_1. My way
> to solve this was to merge v5.6 into mips-next to get a pull request with
> just the changes from mips-next. I hope this is still ok for you.

Please don't do this.

If you need to do a merge in order to get the right diffstat, do it as
a local _test_ merge, and get the diffstat from that.

So what  happened is that you merged in mips_fixes-5.6-1 into the
branch, and that part is fine. That merge makes sense in the context
of mips development, and the merge even has a proper commit message,
not just the "Merge xyz" messages that I hate.

So far so good.

HOWEVER.

Now, _because_ you merged that other branch, your MIPS development
branch has two different base commits - the base for the original
development, and the base for the mips fixes.

And again, this is all fine. There's absolutely nothing wrong with
having multiple bases. It happens normally any time you don't have
entirely linear development. No problem.

But the one thing that having multiple base points of development
means is that now you can't trivially do a diff for what has changed.
A diff is by definition an operation that takes a beginning point and
an end point, and shows the difference between those _two_ points.

But with two bases for development thanks to that fixes branch merge,
you don't have two points. You have _three_ points - you have your two
beginning points, and the end point of your branch, and as a result,
you can't trivially generate a diff of "this is what my branch has
done.

Your solution for this is technically correct: the way to get a "what
have I changed" is to do a merge, in order to get the required two
points: after doing a merge, you can now basically just say "ok, now I
can diff the state before merging my work, and after merging my work,
and I now have the two required points to do a diff with".

BUT!

By all means do the merge, but don't _send_ me the merge. Do it as a
temporary branch in your own repository that you then just throw away.
The only reason for the merge was to generate the diff, there's no
reason to then expose it in the git history.

See what I'm saying? The merge is the correct thing to do, but it
doesn't make sense to anybody else than you as that "this is what I've
done" final thing, so you shouldn't then ask me to pull the merge.

Now, why do I hate these kinds of merges?

 (a) a lot of people end up merging my tip-of-tree during the merge
window, which is absolutely horrible and causes actual technical
problems (in that they now get whatever buggy state my tree may be in
during that unstable time).

You did *not* make that mistake. You merged v5.6, which is good.
That's the supposedly stable state (ok, we have a nasty wireless
driver bug in it, but that's not your fault, and you did the best
thing you could do if you have to do a merge in the first place).

 (b) the back-merges inevitably have completely sucky merge messages

This is fundamental. They have sucky merge messages, because they have
no actual real reason, so you _cannot_ document the reason. The best
you can do is "to get a clean diff" (which is _not_ a development
reason) or "to fix up conflicts" (which is a *negative* reason, since
I want to see them).

So your merge message has "Merge tag 'v5.6' into mips-next"

That's not useful. And as mentioned, it _cannot_ be useful. It's about
as good as it ever gets in these situations. But it's not great, and
it's not great for the reason I already mentioned: there simply
_isn't_ a good reason for the merge. It only makes sense in your local
context, not in the context of development activity.

 (c) it makes it harder to figure out the development line.

This is to me the big reason not to do back-merges. It makes the
commit graph ugly and harder to follow. It very much shows up in
"gitk" when you start looking visually at development, and it makes
our development history even harder to visualize than it should
normally be. It can also make for nastier bisection because now your
development is more intertwined with upstream development, but
_usually_ that ends up not being a huge deal.

Anyway, because you merged a real tagged release, many of the
fundamental problems with back-merges are much less of an issue.
Merging a tagged release makes all of (a)-(c) better. So this isn't a
disaster by any means, but this is still a "please don't do this".

Now, I have two choices:

 - I can merge your merge

 - I can just merge your commit _before_ you did the merge (because
you didn't do anything else after doing the merge).

In this case, I've taken your merge. It's not the worst kind of merge
because it took that tagged release, and by taking your merge I also
end up getting your tag (and thus your signature) in my merge commit.
So in this case, I have two non-optimal choices, and I'll just take
the one with your signature.

But I would have been much happier, and not have had to write this
message (for the n'th time) if you simply hadn't done this.

Yes, by all means do the merge locally into a "test-merge" branch. If
you do it into a test branch, you can just merge my random state of
the day (because it doesn't _matter_ - it's just for your own
testing), and that way you can also see if there are conflicts and
report them as part of the pull request. And you get the diff I would
get, and see the whole "this is what my branch really ends up
changing".

But then throw that test branch away, and tag and send me the
pre-merge state - your real development.

So for next time, please keep this in mind.

                     Linus
