Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 857651965B9
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2020 12:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgC1LZz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Mar 2020 07:25:55 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42592 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgC1LZz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 28 Mar 2020 07:25:55 -0400
Received: by mail-oi1-f193.google.com with SMTP id e4so11202194oig.9
        for <linux-mips@vger.kernel.org>; Sat, 28 Mar 2020 04:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GAb4pdeuBQ1NXDUBGlIE/hc5UXd2DtskrEwEQ0LmStY=;
        b=UlhLI1DPbiB3FLh0DRubJExN5vQoSwaJOWAWj3CT4qFJhJZElbpiCSAZZdsfdKkIju
         hSdXVUWY5FHNErbRGpX28E4BxOFRFUegZAlJzue41N+Cey8o9Jm0OZeTfLU0PosqylV2
         Fm00nYBadXSuibrnVfsh5S/503cAye6CABT9L6/rkKpON2XBehajarTTC5qHnaQi5xIN
         24i3lPMqRJl+eygVgCpvvFGO+6XLJdi6oWEm1XxCAUgT8JGCbXtWUjuinBlU3sYJFiO1
         DuAZ+3AQU/F8bYIrROxfAeUYFMQpncuY//yZvHjC7iRA15nO4kTYx/OjlbcF/g1meHWX
         3w5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GAb4pdeuBQ1NXDUBGlIE/hc5UXd2DtskrEwEQ0LmStY=;
        b=AJZ7lwKazbR20omqrvQHKZfmCxLZNcDLElnf4Oq+tABIS2+GZpA0wGhipl5htl/Zgo
         5UKQUl7C71PsEPYCnmxAMk2cirRZckPLEFWXQWCDw9bysHDO1Jg692TK6t4kbQCrLS0I
         f0kXzrCiF7jzh2BJVdhytq6b9D9+9b1jqrVArcqSuMftm6G6OCkmahffDLpD/KVYUwDd
         278b7U6eZnJFrMQOi6FVOyEPdEuqueUnML8GIKxre6sJl+eiRMctiNGRy4qQHGzVxi8k
         YLJ6lQIwUA30/2k6OBK6mCO7iQRp64rffIGgYSU1dZzYePXTHIWmYYvcHuoeAIQ/goa/
         gOtg==
X-Gm-Message-State: ANhLgQ1KNbEDQZ0rdLw0VC8xhxLsb2BXy/PatjcBAbReuSMdcKKJDH4D
        yDgbN052DUEOSChK7qgPkvi2Z34v8aKIR7rEbWo=
X-Google-Smtp-Source: ADFU+vuyPrk1KdbxGCaj4jK3WPjMBec6tv19iWlr4xSR3L3OyeGFjBP2W+5khUvk7BR09NukHjfd6GVTYzHgF+FRf5Y=
X-Received: by 2002:aca:4a86:: with SMTP id x128mr2138419oia.29.1585394754238;
 Sat, 28 Mar 2020 04:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200327152624.Horde.4Z2ZjKkOtsKUryuWp4S7pe-@www.vdorst.com>
 <CAMhs-H9BPx=v=BfnCaCOWtQ9-isGerY=vVNwA-OcBRxo3ie6gg@mail.gmail.com> <20200328103012.GA4603@alpha.franken.de>
In-Reply-To: <20200328103012.GA4603@alpha.franken.de>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 28 Mar 2020 12:25:43 +0100
Message-ID: <CAMhs-H8hmDREM5hO+GJzOrRAfs1Qbc0uDYPYngvk_R8XO_yFHw@mail.gmail.com>
Subject: Re: MIPS: ralink: mt7621: introduce 'soc_device' initialization,
 compile issue
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Sat, Mar 28, 2020 at 11:30 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Sat, Mar 28, 2020 at 07:49:25AM +0100, Sergio Paracuellos wrote:
> > No it compiles clean for me with the last linux-next. The function
> > 'soc_device_register' is implemented in drivers/base/soc.c which is
> > included for compilation with
> > CONFIG_SOC_BUS. Looks like kernel is not compiling soc.c for any reason.
>
> tom me it looks like you never tested, that your patch works.
> With SMP selected the new code doesn't even get compiled in.
> With a UP config, Rene's link error shows up.
>
> I've sent a patch fixing this.

Thanks for this and sorry for inconvenience.

My changes were compile tested and I ran the resulted kernel in a
gnubee pc1 without issues. More than that I did not test anything
else.
I have just recompile the linux-next tree and the kernel linked for me:

$ git log
commit 975f7a88c64dfdfde014530730ba7a6f3141f773 (tag: next-20200327,
origin/master, origin/HEAD)
$ ls -l ./arch/mips/ralink/mt7621.o
-rw-rw-r-- 1 sergio sergio 28616 mar 28 12:14 ./arch/mips/ralink/mt7621.o
$ ls -l vmlinux
-rwxrwxr-x 1 sergio sergio 42324732 mar 28 12:19 vmlinux

I wonder why I am not seeing the error pointed out here...

I am using:

$ /opt/cross/bin/mipsel-unknown-linux-gnu-gcc --version
mipsel-unknown-linux-gnu-gcc (GCC) 7.2.0

>
> Thomas.
>

Thanks,
    Sergio Paracuellos
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
