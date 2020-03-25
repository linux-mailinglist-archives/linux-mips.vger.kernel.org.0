Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76C1D1921C5
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 08:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgCYHeH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 03:34:07 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:18719 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgCYHeG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 25 Mar 2020 03:34:06 -0400
X-Greylist: delayed 53583 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Mar 2020 03:34:05 EDT
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 02P7Xo5Y011468;
        Wed, 25 Mar 2020 16:33:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 02P7Xo5Y011468
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585121631;
        bh=kh7EjCwaL2YO03hE6EYB+/Y7QkJFCBvPs4JMoSyx6h8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2K6Z/0OmUrzRBRj/QobY6dhMiiEs5Wt0uXhs+A4PS2ipnw8EU6AZ964xRSmcUcBXl
         WSycTTjbaA617VvDQVPG+byzuFN6f/rTWBr+aWtYcvUZSZHGS6AxGNBMbTNA97srDS
         GuXanGNfCbgYo+siB3QmiNafpqxWeREnzRXxzYMxRCzc3O8OcmX4DW7wSej0Ezw5QM
         0NJX/NfS/EgMSGVk+IeP6TW7MhEsjlfZCwcmW5n+F1VsIcfaxWA5FJCCJhCTjve3SN
         XfpQER8cXCMdnQ3ZiLAWL9kSYdRCGiZ4F7kejrE3TRtlu2JLFuwt6XrhvRfXNj6Fqm
         Oeu/Tpv3BedJw==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id j128so905716vsd.6;
        Wed, 25 Mar 2020 00:33:51 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2iaPPQUK+8w2yf8hDHahDAtpFUad2Z0ec/lJQGev6UwPzKQFAP
        g+ABurcDyPqDzvhose/YWgDrftceojFeeVhKYrI=
X-Google-Smtp-Source: ADFU+vupY5MKc0N7phoId/Wg3qfoFYs2Xj94X9bAAO5uwR+leqxxVHKV7RSZG+L/Iht2P9KlsTGSu6FiHR8YTYsr23k=
X-Received: by 2002:a67:3201:: with SMTP id y1mr1636838vsy.54.1585121629966;
 Wed, 25 Mar 2020 00:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200324164005.8259-1-masahiroy@kernel.org> <alpine.LFD.2.21.2003250240110.2689954@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.2003250240110.2689954@eddie.linux-mips.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 25 Mar 2020 16:33:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQA1Z3=9QFvvVx8Zqiq3zKTM8W=JurBuua4iEZf=WL9ZA@mail.gmail.com>
Message-ID: <CAK7LNAQA1Z3=9QFvvVx8Zqiq3zKTM8W=JurBuua4iEZf=WL9ZA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: mark some functions as weak to avoid conflict with
 Octeon ones
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Paul Burton <paulburton@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Maciej,

On Wed, Mar 25, 2020 at 11:46 AM Maciej W. Rozycki <macro@linux-mips.org> wrote:
>
> On Wed, 25 Mar 2020, Masahiro Yamada wrote:
>
> > MIPS provides multiple definitions for the following functions:
> >
> >   fw_init_cmdline
> >   __delay
> >   __udelay
> >   __ndelay
> >   memmove
> >   __rmemcpy
> >   memcpy
> >   __copy_user
> >
> > The generic ones are defined in lib-y objects, which are overridden by
> > the Octeon ones when CONFIG_CAVIUM_OCTEON_SOC is enabled.
> >
> > The use of EXPORT_SYMBOL in static libraries potentially causes a
> > problem for the llvm linker [1]. So, I want to forcibly link lib-y
> > objects to vmlinux when CONFIG_MODULES=y.
> >
> > As a groundwork, we must fix multiple definitions that have been
> > hidden by lib-y.
>
>  IIUC that causes known dead code to be included in the kernel image.
> Wouldn't it be possible to actually omit replaced functions from output by
> keying the build of the sources providing generic code with appropriate
> CONFIG_* settings (such as CONFIG_GENERIC_DELAY, CONFIG_GENERIC_MEMCPY,
> etc. or suchlike)?
>
>   Maciej


You are right.
__weak cannot trim the dead code.


I can work on the CONFIG_ approach,
but I'd rather to use inverted
CONFIG_HAVE_PLAT_* because it is easier
to make CAVIUM_OCTEON_SOC select them.



-- 
Best Regards
Masahiro Yamada
