Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1C94F1CB7
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2019 18:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727286AbfKFRqE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Nov 2019 12:46:04 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36255 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728539AbfKFRqE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Nov 2019 12:46:04 -0500
Received: by mail-ed1-f66.google.com with SMTP id f7so16986155edq.3
        for <linux-mips@vger.kernel.org>; Wed, 06 Nov 2019 09:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bjeaHyLUx71a93sLsMYpJPitKWJ0Fy6cIBQAOLyJ+j4=;
        b=tnTiDj0HSBo3xx3sRGxkWLo2Rx6/KZ0TCvWzV6AxGjDY4lf2cFfdHugHhyjWrNlW+K
         SNUv+HuN/dzcLUD6KKWKCeptA3n6Q3CEBor41mWtmxGb2JbLlb/rcd+z+2AZ+SpHsqNU
         nY57NmUkQ3AQLlKbJlDJXSP74GPt2YNGp1UP3AM1O661uSrQnadAY28Gw83f+1IM9eV6
         kMhjtXjjjNqoptyb9xy0owIBxWbn7H2T71rjTglHTKUEU0RUt4Sfdw62UhcmmHcmoUGT
         fqYV7vWRzJW2dSu5U4XIS3v4R1L6UXJpbTNu71nglXdmfztH4ogslhfUm2otMUnR1zy8
         JYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bjeaHyLUx71a93sLsMYpJPitKWJ0Fy6cIBQAOLyJ+j4=;
        b=EAEoyd1hdB8FlraLslLvjN/yxb4MR0X4bz2dhA8p3npUvCg9Xg8jNHPxikzSuBD7Ej
         EWvjZvtyT+h1VdoChIF/oISMB1zO4x9vH77SLO//qmn3ZlZo5N91rMtoNHlQoZ5alWoA
         EAUpgvQd67cQRZwQEqraRpxRjK+6mgEtx2dHsHLy3TTYrqbIvjzxMrae4NSkgVvh+N0N
         /aikwFXfpDBSENAo7e1bwZg8jOBXH5HIXnnkPlUP3rFDdwevjqS5AYPeRki5inY+drFl
         rBTkAuM9PUD6numNPA1oeYzUIrUQ/GpgMcyiGRLcWv6E+UwymCZdH+C9+K8tXoUJPGLf
         FCjA==
X-Gm-Message-State: APjAAAXUszT6UZ19XPw1hM3+iIb8b4Ztcg+BnMeGDKJi9OhrxnytbnrH
        3cC1YHFrLaQT97r3ytDqd1unS003rHAKHivH9pkgRuOPu8X9jA==
X-Google-Smtp-Source: APXvYqyDBwhivdm2bi4skfE4xzGu2MrLcWqhX+BNTuhJZL0/JsYhz0YXa6th42NsjeHpd9Zbf6uC4YmJudTZS5grKeA=
X-Received: by 2002:a17:906:a457:: with SMTP id cb23mr22742042ejb.191.1573062360341;
 Wed, 06 Nov 2019 09:46:00 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4NT5MBzErPT5S49aswxH4bUi2KKCWEWppPpFgJ-ru3L=g@mail.gmail.com>
 <40376b35-2220-67b6-7d9b-9a2c2a3874ef@arm.com> <CADkTA4N1UzrHRZi4j6MUxxT4yWsv1BSHDb11SaKqtbW_gihZ-g@mail.gmail.com>
 <f3257a1c-9946-c9a0-da1c-ff1b218b2e90@arm.com> <CADkTA4OYGhR-5wP7Q9Z_L=7nR-vwog129AKZOqJXdU09BNxkSQ@mail.gmail.com>
In-Reply-To: <CADkTA4OYGhR-5wP7Q9Z_L=7nR-vwog129AKZOqJXdU09BNxkSQ@mail.gmail.com>
From:   Bruce Ashfield <bruce.ashfield@gmail.com>
Date:   Wed, 6 Nov 2019 12:45:49 -0500
Message-ID: <CADkTA4M2K3WOTDVRvLNVNQ0f-rcQvmK-5L-iNoFxjYwHeaHkLQ@mail.gmail.com>
Subject: Re: v5.4-rcX: qemu-system-mips64 userspace segfault
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc:     linux-mips@vger.kernel.org, paul.burton@mips.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 25, 2019 at 9:04 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, Oct 25, 2019 at 5:06 AM Vincenzo Frascino
> <vincenzo.frascino@arm.com> wrote:
> >
> > Hi Bruce,
> >
> > On 10/24/19 5:37 PM, Bruce Ashfield wrote:
> > > On Thu, Oct 24, 2019 at 9:29 AM Vincenzo Frascino
> > > <vincenzo.frascino@arm.com> wrote:
> > >>
> > >> Hi Bruce,
> > >>
> > >> On 10/24/19 2:12 PM, Bruce Ashfield wrote:
> > >>> Hi all,
> > >>>
> > >>> I'm not sure if anyone else is running qemu-system-mips64 regularly,
> > >>> but for the past 4 (or more) years, it has been the primary way that
> > >>> we run QA on the mips64 Yocto Project reference kernel(s). I take care
> > >>> of the kernel for the project, so I always have the fun of running
> > >>> into issues first :D
> > >>>
> > >>> That's enough preamble ...
> > >>>
> > >>> I wanted to see if anyone recognized the issue that I'm seeing when I
> > >>> bumped the linux-yocto dev kernel to the v5.4-rc series.
> > >>>
> > >>> The one line summary is that I'm seeing a segfault as soon as  the
> > >>> kernel hands off to userspace during boot. It doesn't matter if it is
> > >>> systemd, sysvinit, or init=/bin/sh .. I always get a segfault.
> > >> [...]
> > >>
> > >> Could you please share the .config you are using?
> > >
> > > attached (hopefully this won't cause my reply to bounce).
> > >
> >
> > It seems that the .config you shared was generated for a version of the kernel
> > that is older then the one in which we introduced the unified vDSO hence, since
> > the options to enable correctly the generic vdso library are selected by the
> > architecture, this result in a mis-configuration of the vDSO library which leads
> > to the issues you are seeing.
>
> Parts of that .config have been around for years, and others would have been
> from my v5.3-dev kernel work. So most definitely there are older
> elements floating
> around.
>
> >
> > My advise is to start from a fresh defconfig and then enable the options you
> > need one by one. I did it with buildroot and it seems working.
>
> We don't use defconfigs (at least not in a typical config flow), but absolutely,
> I can start stepping through the options again. I've been maintaining this
> platform and moving through kernel versions for a few years now, so there
> could be something funky with the way the option was introduced and how
> it interacts with my uprev workflow. I should have gotten a warning about
> it in my config sanity step ... but I'll have a closer look at that  (obviously
> my issue) once I'm up and booting.
>
> It's also possible I grabbed the bad .config from the middle of my bisect,
> which as I mentioned was toggling the VDSO options (and having some
> build issues) due to changing dependencies. I'll compare a clean .config to
> the one I sent and follow up if there's something obvious.
>
> >
> > Another thing I noticed and this seems confirmed by the patch series you had to
> > revert is that you are missing a fix that I submitted last week:
> >
> > 8a1bef4193e81c8afae4d2f107f1c09c8ce89470
> > ("mips: vdso: Fix __arch_get_hw_counter()")
>
> Right, if it isn't already in -rcX, I don't have it yet, since I'm
> uprev'ing the -dev
> kernel and sanity testing the rc releases. Only if I have issues like this do I
> start digging around for patches to apply.
>
> I can definitely do that. It seems like gmail only decided to deliver 3 messages
> on the 16 of October, so I don't have a copy of that patch locally, but I was
> able to find the archive and will track down the patch later today.
>
>
> >
> > Could you please apply it before regenerating the .config? Seems the qemu falls
> > back on VDSO_CLOCK_NONE at least in the case I reproduced.
> >
> > > When debugging (and bisecting), as expected, the VDSO configs bounced
> > > around a bit with the move to generic VDSO, etc.  So there very well
> > > may be something that with 5.4 I need to enable now and missed in my
> > > debug.
> > >
> > > I don't have GENERIC_COMPAT_VDSO enabled, but can easily do a boot
> > > test with it on, similarly with the different vdso boot option. I know
> > > I had tried a lot of different combos, but would have to redo the
> > > tests now.
> > >
> >
> > This seems confirming my suspect of the wrong .config.
>
> It was on in some of my testing, it just wasn't on for some of the
> bisect runs. I may have grabbed the bad config in my haste. When I
> dive back into this, I'll see what I managed to mess up.

Hi again, and sorry for 13 days in between replies!

I was traveling for the past week and a half and didn't get a chance
to do more boot testing.

I haven't updated to the latest v5.4-rc (but will later today), but I
did cherry pick the  ("mips: vdso: Fix __arch_get_hw_counter()") fix
you mentioned. I can report that my boot still segfaulted in the same
place where it pulled in.

I also attempted to manually set GENERIC_COMPAT_VDSO in my .config,
but as we know, without a prompt it has to be selected by another
Kconfig, and in the platform that I'm building it isn't selected. So I
did a quick one-liner to select it, and even with it on, I'm still
seeing the segfault.

I'm trying with a defconfig base at the moment, but running into some
compilation issues, while I sort those out, I was wondering if I could
get a copy of a working .config from you ? So I can compare and debug
from there. (I'm booting a 64bit malta configuration in qemu).

I'm also looking into the vdso clock_mode you mentioned earlier ... I
see it in clocksource.h, but I've not yet figured out how to influence
what mode my qemu boot is using (some clocksource driver config .. I
do have CLKSRC_MIPS_GIC set in my .config, so that should at least be
present). Booting with vdso=0 didn't change anything either.

Summary: there's definitely something up with my .config that didn't
like the transition to generic VDSO, and hopefully a working .config
will point me in the right direction and limit my flailing :D

Cheers,

Bruce

>
> Cheers,
>
> Bruce
>
> >
> > >
> > >>
> > >> Do you know by any change which vdso clock_mode is set in this scenario?
> > >
> > > Unfortunately not, it isn't something that we've explicitly set in the
> > > past, so I haven't looked into it. But can do more digging.
> > >
> > > Bruce
> > >
> > >>
> > >> --
> > >> Regards,
> > >> Vincenzo
> > >
> > >
> > >
> >
> > Please let us know how your investigation proceeds.
>
> I definitely will, thanks for the time spent and the confirmation that you
> aren't seeing the same thing.
>
> Bruce
>
> >
> > --
> > Regards,
> > Vincenzo
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
