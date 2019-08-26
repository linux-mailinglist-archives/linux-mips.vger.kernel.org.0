Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA6C9D4F0
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2019 19:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbfHZRbW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Aug 2019 13:31:22 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39922 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728007AbfHZRbW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Aug 2019 13:31:22 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so11003159pgi.6
        for <linux-mips@vger.kernel.org>; Mon, 26 Aug 2019 10:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q3xiFZ2HkA5ScIJ98h57XT9QNlYTEuEKJ22ZvSjaM40=;
        b=W1ThBxZ2ULnw8wV8rQg1L3El9s0wK00VOmaEsGsImpIPXIn1KF9TIXouDdGAS2494U
         Ln5MsCmf2BCNQBcec2cm0FE4g1R00CGWTiOtLL0C0guajRLNy+eQMRUsPPsYGktFx+4D
         Yi2HGK7OSwFlwQm2QgQgkWFuW/YkbY7FAEScriQ1rUoziDQLATISbN/yFTOEHO/56cgr
         AjQoOboGivycl+rixm0sW0HJ4JCqplkDYsx2rs+D99X/qO9K0Ck9PVGglRw4XGNyyxAx
         zhzYaGIUCbm0qV19s7h/T3wdg10yB5I2p8Dh+6VXBUOQS/AzUhZovRKOHBAV5k9UjPAk
         aydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q3xiFZ2HkA5ScIJ98h57XT9QNlYTEuEKJ22ZvSjaM40=;
        b=fDs/SAxeHUjiUJyfMu0VCaI5/Oj1u0fHM+HDZWz/M97HXnz3mQ+slptIyUvc7ie9uq
         CDywfPmNXmh1fD6mywPmaJWtli+58hDp8pRcjusRDB4SrW2GbWn/QYTwWcz2Z16cuaCW
         J0BIzfFfDbdwSnERyGaYxeZZ2GjKXrH6yazt9MOlUDeMn1XKpwfrMz7RjGugsAZ0L4Vx
         MP3len9GBa4nHTjyXcqEarsSRJGJv4+qtoUQH32anhQ+DY/U/5XCh+FYw2LlTdUkBSbN
         Zgnw5rOQSlPsplc2tiYNA7svTLGB2tl9Mk+wC9uMzV30VO9QvSdwMZAsY8GRHmCSU3r8
         cT4A==
X-Gm-Message-State: APjAAAVdc8mtLdse3kxUNvpDaXduSZPZy+2ocii7nOHjGTcKLRansD37
        2jU3C5Rpca1bLumrI/vOl9KhCEfzQqZ1FSqEDrwFDA==
X-Google-Smtp-Source: APXvYqwVHgxJShCK/u78N3hHrJbEGajACMI2eyaTo9bILVYml2dMPRUPYBd4Hp9yNcVXJCNqVnOQd2UZpp0sc0R6gpk=
X-Received: by 2002:a63:60a:: with SMTP id 10mr17262703pgg.381.1566840680814;
 Mon, 26 Aug 2019 10:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190729211014.39333-1-ndesaulniers@google.com>
 <alpine.LFD.2.21.1907292302451.16059@eddie.linux-mips.org>
 <CAKwvOd==SCBrj=cZ7Ax5F87+-bPMS9AtGSxp+NWp_+yDCg4R-A@mail.gmail.com>
 <CAKwvOdkXLhEuLiQ_ukE75zEg=Sw5-4BLHHCFqcZ0oyTEX3pWTQ@mail.gmail.com>
 <CAKwvOdmGax-WgXeKEnTq8+Xe0+Z5d2k4_Ad1vw0uOiO2NJ0bkg@mail.gmail.com> <20190824141213.svzmdr3pxdaqssuj@pburton-laptop>
In-Reply-To: <20190824141213.svzmdr3pxdaqssuj@pburton-laptop>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 26 Aug 2019 10:31:09 -0700
Message-ID: <CAKwvOdmWS0_5haTdS67Sh0YjrUwfVOhLCwEXCO7vj6X1gXmCqQ@mail.gmail.com>
Subject: Re: [PATCH] mips: avoid explicit UB in assignment of mips_io_port_base
To:     Paul Burton <paul.burton@mips.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        Hassan Naveed <hnaveed@wavecomp.com>,
        Stephen Kitt <steve@sk2.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "regehr@cs.utah.edu" <regehr@cs.utah.edu>,
        Philip Reames <listmail@philipreames.com>,
        Alexander Potapenko <glider@google.com>,
        Alistair Delva <adelva@google.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Aug 24, 2019 at 7:12 AM Paul Burton <paul.burton@mips.com> wrote:
>
> Hi Nick,
>
> On Fri, Aug 23, 2019 at 10:16:04AM -0700, Nick Desaulniers wrote:
> > On Tue, Aug 20, 2019 at 10:15 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > > Hi Paul,
> > > Bumping this thread; we'd really like to be able to boot test another
> > > ISA in our CI.  This lone patch is affecting our ability to boot.  Can
> > > you please pick it up?
> > > https://lore.kernel.org/lkml/20190729211014.39333-1-ndesaulniers@google.com/
> >
> > Hi Paul,
> > Following up with this link that explains the undefined behavior issue more:
> > https://wiki.sei.cmu.edu/confluence/display/c/EXP05-C.+Do+not+cast+away+a+const+qualification
> > Please reconsider accepting this patch.
>
> Sorry, it's been a crazy few months & I'm currently away awaiting my
> father's funeral so I'm working through a backlog & catching up on
> things.

That's an extremely tough hand to be dealt.  Got it myself a week
before I turned 20.  Technically, (spoiler) everyone is eventually
dealt it; not that that or really anything else can ever truly provide
solace despite the common refrain "time heals all wounds" (Narrator:
it doesn't).  Depending on where you are in life it can really really
destabilize things.  I wrote this blog post
(https://nickdesaulniers.github.io/blog/2013/04/29/the-persistence-of-memory/)
that I'm not too proud of at a time I now realize that I was still
kind of a state of shock (even years later).  I also found it very
difficult to accept advice from others who didn't share the experience
of losing a parent.

No one would fault you for asking your co-maintainers to handle more
maintainer responsibilities for a while.  I hope you can find a friend
to commiserate with over beers.  I owe you one.

>
> It will be a shame to lose the optimization opportunities const offers
> us, but it is an ugly hack & so I'm OK with applying this. It's likely
> to affect older machines more than newer ones (which tend to use less or
> no I/O port access) so I'm not too worried about the impact, but if we
> find it matters we can always try the fixmap approach I suggested
> previously.
>
> Thanks,
>     Paul



-- 
Thanks,
~Nick Desaulniers
