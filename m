Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D9E3EB66A
	for <lists+linux-mips@lfdr.de>; Fri, 13 Aug 2021 15:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbhHMOAU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Aug 2021 10:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbhHMOAT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Aug 2021 10:00:19 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009F9C061756;
        Fri, 13 Aug 2021 06:59:53 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id oa17so15387490pjb.1;
        Fri, 13 Aug 2021 06:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LSu8sFAFrhC/odFtHfJqDJdYJpzj9L5nziSDMXR8vEM=;
        b=TGPQkbTs2i8gpw+d00MDmoYy23labhuVlc9grBKN7y7s+IXbxe31PZ9JEbzgL7HzEz
         tPEJz0ch5WB3x/Tz9RqOU4uJ4fkgLRguXjyPaLM7lFD+ANJCIpA/XgtJot2H8/acXx+p
         CYxiUkwJIsKAxsB15IcU7Q9jCgzZ2Djbl24Ea8UvKxQJXPN5rQkGMwIwo4I0jQOjYmRq
         t6WK9ltK2ROdWHJCFIr/qL5iednM+RuTsMIMET9i1uT1RNaZECZKuwqTfGj6lSuPu4r3
         LMS9CV64svF2Kt4rdtIDT/mL78QXVMc1F2CaZho6cOKo9HpZdmaGNssTn8S1w0RVkE/c
         1fUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LSu8sFAFrhC/odFtHfJqDJdYJpzj9L5nziSDMXR8vEM=;
        b=Jssf8q6A6croBuqo4bZew1sx7bUyQs1HJrIRDylvS0deBreJME0V58dSWvOKP9tOax
         OHrlnjtnbQ2WRzLiIZX+wlY870pnHeIRqLiuY+1zPbeVJr/yzr/PGqJWdf1uBUOgmWdI
         LesnJXLa3IuoJg9cYheGFSJgmYoqpjx4QmeFjm3TEQbNZpApK6/MzS74M7vwKX+K5eO0
         52uyLEQDF7bQqzoW/3p/7gT7plY+6s+S9Ru9QK+iCR+aAd3X6obflLJtgoCPe+pu780O
         KPB/rVqUdHTdJMd8wtDS/bJRsUBzeJ8CjCZh3mauqoZP9oc6cwnDwuzR6T+AMbZmiV+J
         PEug==
X-Gm-Message-State: AOAM530k7T2ikqS/5O27dACwpREAHuBGgSsdjy29LUlKyvIdPszdK3zW
        i2vs/EwvucN/DHcgO5+MZ0+oK+YdRGhY4Nfj9+Y=
X-Google-Smtp-Source: ABdhPJzQbeYqFgjmUZ7qRC5aFHx8LQJMXfquo7iK9Xh0oX2OxNFjiTy5sHnPApz+D8JrixNPFriP2nkZUsivzsv59Rk=
X-Received: by 2002:a17:90a:cf18:: with SMTP id h24mr2737483pju.228.1628863192516;
 Fri, 13 Aug 2021 06:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210811095759.1281480-1-geert@linux-m68k.org>
 <20210811095759.1281480-20-geert@linux-m68k.org> <20210811124755.37b0a0a9@thinkpad>
 <CAMuHMdUFPvJBuFByiN6pb539REYtcsNJMKML+M2NQw=GJxTYJg@mail.gmail.com>
 <CAHp75VeNyHUmcU7GPnP8woRcDErDNQ5M3FHQGpLnhUoL5qTnLQ@mail.gmail.com> <CAMuHMdVFOu6EXKqkiLgBp3n8Oujm+uSpFn-ximtp+37TOZSp9A@mail.gmail.com>
In-Reply-To: <CAMuHMdVFOu6EXKqkiLgBp3n8Oujm+uSpFn-ximtp+37TOZSp9A@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 13 Aug 2021 16:59:13 +0300
Message-ID: <CAHp75VfsOFdgQP3-XStFieBQ9o4P=FVY43N4WXg6yOe+2O0bwg@mail.gmail.com>
Subject: Re: [PATCH v5 19/19] auxdisplay: ht16k33: Add LED support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 13, 2021 at 3:53 PM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
> On Thu, Aug 12, 2021 at 2:33 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wednesday, August 11, 2021, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> >> On Wed, Aug 11, 2021 at 12:48 PM Marek Beh=C3=BAn <kabel@kernel.org> w=
rote:
> >> > On Wed, 11 Aug 2021 11:57:59 +0200

...

> >> Sure, that can be done later, when an ACPI user appears?
> >
> > Actually with PRP0001 approach any of compatible driver may be used onA=
CPI platform. So, what you are saying can be interpreted the way =E2=80=9Cw=
e don=E2=80=99t care about users on ACPI based platforms=E2=80=9D. If it is=
 the case, then it should be told explicitly.
>
> I think you're interpreting too much ;-)
> My point is simply:
>
> >> The dependency on OF was pre-existing, and this series is already
> >> at v5.

Okay, but we can get rid of it. Why not make it more generic at the
same time? Does it make sense?
(I believe this is what Marek is asking initially)

> If any OF compatible driver can now be used on ACPI platforms, perhaps
> this should be handled at the API level? I.e. the distinction between
> OF and device properties should be dropped completely,

And this is done by device_*() / fwnode_*() APIs. And that's what can
be easily done here.

>  and all drivers
> be converted mechanically in one shot, instead of a gradual ad-hoc
> conversion being sneaked in through other series like this one?

Do you realize that you are asking for something impossible?

Moreover, an ad-hoc approach is what we do for plenty of things in the
kernel (WRT new APIs, that don't replace old ones immediately).

--=20
With Best Regards,
Andy Shevchenko
