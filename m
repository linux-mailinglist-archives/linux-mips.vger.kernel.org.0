Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCED4E4BBC
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2019 15:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409276AbfJYNFK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Oct 2019 09:05:10 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34529 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbfJYNFK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Oct 2019 09:05:10 -0400
Received: by mail-lj1-f193.google.com with SMTP id 139so2449481ljf.1
        for <linux-mips@vger.kernel.org>; Fri, 25 Oct 2019 06:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7d33r5OBPFfR8pe1Wvk+Hzhyhx+VermDnjg0G2EiOcQ=;
        b=Cbh8v5Blr6DxzOHv92mKd41dPD/0gXcCZMZFgVpNUzdKN8UXKPkN5Vq7XIyLzsiOso
         TDyxYbiqJL9AhnuOUx4dG+c0fXMC9e2+P3WHqWPelWrnnWRppkahGsqf+tPmHkiufoRx
         zgJAjNhpK5v/UYpnzrzic72Iu6khNoCzszl2jI393FAZTpHvCY37pUHU4ZxOcuDjO1M9
         AkrQh6q6lbYCAKSHsIrw7qsttCZ85zuGiMRtaFwQVxvGoCLy8iZjtxonrGotrxw66Iaw
         0ycmHi4dwiltvuqNC50HOQjNOhQuPeXmngmzuVPGedeUSvkCT7/KUeDmyRcch+U0cAgN
         NTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7d33r5OBPFfR8pe1Wvk+Hzhyhx+VermDnjg0G2EiOcQ=;
        b=Zgc/orMnDePT4lBNql4hpi+6Qqt97huip+3vn0Xnydpz39kXnObz54s/Aw2VqjILE1
         QKGqBR6kmCTAxg/g2mvkwczEyWDxbFQN6sq5jKf2K95cuIFJZJUimjkAIYknYWEOxKsY
         ix4YxirMHSP6pNFVRRBPoQcUve8a4E5kGowp0M2U/V4m/WZKNDFLtX+wONGLVjJfTC3z
         qbSVY1JuUP1xVpEYp0ks6hO7P2mcwR+1jqWvNk7sdhRqTWMXMWyu9211o2oeSRhSw237
         UQmw716fNce7/CJRCcnhf2dJrH7YRqOnNX6tTT2Lu5/8Bnrk+KhLHy3c4PRpsmrXPdJD
         KvrQ==
X-Gm-Message-State: APjAAAV9dlEcU56m+/jCh8nWq2eci0vnS/rbXjY3tGBBRKSEKRWcTz92
        riN0VxPEU9CiOcGnp8kCQADPMvAaiKqEr77c5ajB8pu+Nv4=
X-Google-Smtp-Source: APXvYqx1ZUA/YSF1tbSNNnuTF3Q7R4FCxwU+OCdjexJ/fk2sQp5zwo/KQ6ckgYZs67k0hyENYIOptCgVV822AknROTA=
X-Received: by 2002:a2e:9449:: with SMTP id o9mr2400366ljh.110.1572008707151;
 Fri, 25 Oct 2019 06:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4NT5MBzErPT5S49aswxH4bUi2KKCWEWppPpFgJ-ru3L=g@mail.gmail.com>
 <40376b35-2220-67b6-7d9b-9a2c2a3874ef@arm.com> <CADkTA4N1UzrHRZi4j6MUxxT4yWsv1BSHDb11SaKqtbW_gihZ-g@mail.gmail.com>
 <f3257a1c-9946-c9a0-da1c-ff1b218b2e90@arm.com>
In-Reply-To: <f3257a1c-9946-c9a0-da1c-ff1b218b2e90@arm.com>
From:   Bruce Ashfield <bruce.ashfield@gmail.com>
Date:   Fri, 25 Oct 2019 09:04:56 -0400
Message-ID: <CADkTA4OYGhR-5wP7Q9Z_L=7nR-vwog129AKZOqJXdU09BNxkSQ@mail.gmail.com>
Subject: Re: v5.4-rcX: qemu-system-mips64 userspace segfault
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc:     linux-mips@vger.kernel.org, paul.burton@mips.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 25, 2019 at 5:06 AM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:
>
> Hi Bruce,
>
> On 10/24/19 5:37 PM, Bruce Ashfield wrote:
> > On Thu, Oct 24, 2019 at 9:29 AM Vincenzo Frascino
> > <vincenzo.frascino@arm.com> wrote:
> >>
> >> Hi Bruce,
> >>
> >> On 10/24/19 2:12 PM, Bruce Ashfield wrote:
> >>> Hi all,
> >>>
> >>> I'm not sure if anyone else is running qemu-system-mips64 regularly,
> >>> but for the past 4 (or more) years, it has been the primary way that
> >>> we run QA on the mips64 Yocto Project reference kernel(s). I take care
> >>> of the kernel for the project, so I always have the fun of running
> >>> into issues first :D
> >>>
> >>> That's enough preamble ...
> >>>
> >>> I wanted to see if anyone recognized the issue that I'm seeing when I
> >>> bumped the linux-yocto dev kernel to the v5.4-rc series.
> >>>
> >>> The one line summary is that I'm seeing a segfault as soon as  the
> >>> kernel hands off to userspace during boot. It doesn't matter if it is
> >>> systemd, sysvinit, or init=/bin/sh .. I always get a segfault.
> >> [...]
> >>
> >> Could you please share the .config you are using?
> >
> > attached (hopefully this won't cause my reply to bounce).
> >
>
> It seems that the .config you shared was generated for a version of the kernel
> that is older then the one in which we introduced the unified vDSO hence, since
> the options to enable correctly the generic vdso library are selected by the
> architecture, this result in a mis-configuration of the vDSO library which leads
> to the issues you are seeing.

Parts of that .config have been around for years, and others would have been
from my v5.3-dev kernel work. So most definitely there are older
elements floating
around.

>
> My advise is to start from a fresh defconfig and then enable the options you
> need one by one. I did it with buildroot and it seems working.

We don't use defconfigs (at least not in a typical config flow), but absolutely,
I can start stepping through the options again. I've been maintaining this
platform and moving through kernel versions for a few years now, so there
could be something funky with the way the option was introduced and how
it interacts with my uprev workflow. I should have gotten a warning about
it in my config sanity step ... but I'll have a closer look at that  (obviously
my issue) once I'm up and booting.

It's also possible I grabbed the bad .config from the middle of my bisect,
which as I mentioned was toggling the VDSO options (and having some
build issues) due to changing dependencies. I'll compare a clean .config to
the one I sent and follow up if there's something obvious.

>
> Another thing I noticed and this seems confirmed by the patch series you had to
> revert is that you are missing a fix that I submitted last week:
>
> 8a1bef4193e81c8afae4d2f107f1c09c8ce89470
> ("mips: vdso: Fix __arch_get_hw_counter()")

Right, if it isn't already in -rcX, I don't have it yet, since I'm
uprev'ing the -dev
kernel and sanity testing the rc releases. Only if I have issues like this do I
start digging around for patches to apply.

I can definitely do that. It seems like gmail only decided to deliver 3 messages
on the 16 of October, so I don't have a copy of that patch locally, but I was
able to find the archive and will track down the patch later today.


>
> Could you please apply it before regenerating the .config? Seems the qemu falls
> back on VDSO_CLOCK_NONE at least in the case I reproduced.
>
> > When debugging (and bisecting), as expected, the VDSO configs bounced
> > around a bit with the move to generic VDSO, etc.  So there very well
> > may be something that with 5.4 I need to enable now and missed in my
> > debug.
> >
> > I don't have GENERIC_COMPAT_VDSO enabled, but can easily do a boot
> > test with it on, similarly with the different vdso boot option. I know
> > I had tried a lot of different combos, but would have to redo the
> > tests now.
> >
>
> This seems confirming my suspect of the wrong .config.

It was on in some of my testing, it just wasn't on for some of the
bisect runs. I may have grabbed the bad config in my haste. When I
dive back into this, I'll see what I managed to mess up.

Cheers,

Bruce

>
> >
> >>
> >> Do you know by any change which vdso clock_mode is set in this scenario?
> >
> > Unfortunately not, it isn't something that we've explicitly set in the
> > past, so I haven't looked into it. But can do more digging.
> >
> > Bruce
> >
> >>
> >> --
> >> Regards,
> >> Vincenzo
> >
> >
> >
>
> Please let us know how your investigation proceeds.

I definitely will, thanks for the time spent and the confirmation that you
aren't seeing the same thing.

Bruce

>
> --
> Regards,
> Vincenzo


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
