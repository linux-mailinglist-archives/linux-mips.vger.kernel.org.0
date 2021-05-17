Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0BA38245C
	for <lists+linux-mips@lfdr.de>; Mon, 17 May 2021 08:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234317AbhEQGdZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 May 2021 02:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbhEQGdY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 May 2021 02:33:24 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 428A6C061573;
        Sun, 16 May 2021 23:32:08 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so4685096otg.2;
        Sun, 16 May 2021 23:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ie0SvJLAVnukBdnR1QH9TyMAlD3l6NvpyUmRVBYG5OM=;
        b=TG5DifERKl9iNqPG0E2T+TEQURb3zYbaADjc2V1XVmPJyQYoQd5P4j8KsJgj3Rp17c
         N2+UPPvB6AbrnqB6zsWEXuGAjYlzHqccnAwaGIBEOAPNkqvyBb4l1CK9lGna5hwlIC4/
         zOza1nbmi9FqwkejMr006NTVkEWlRaU/ePq73k7//0o1EDu9F+OgHijJkNV4/VyjDCUs
         Uw5P4T/y7SuLTWAV2YjywWQvlX87wJmqXjITw7/o+/pfxJ1mUZtEGczyXzReoF5kQ9RS
         bG22l1mKkSLUxKqu8wOQFjbX0HCBYl0JIl4SvyaUwxz3ucRGzVW7c2U/Sgq2+x+kbwwC
         EbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ie0SvJLAVnukBdnR1QH9TyMAlD3l6NvpyUmRVBYG5OM=;
        b=bkWPyTvExnjeqyFVND+uh9phJh3uR31nyOs860A6Sw0lpqCrjwb/MFh0FrPO5dZBCa
         Q/dSTotI1eJbNFOt8IjuiMQYmT2k+fSqIs9M4FlcyHgPIdQx+rdOdHSWs+ihwWmXjfsK
         ue2vzyTZY8gNxPpL4n2XWacsesVo5PKCjTFoORaS2ij2LkpCRIdQUlBG+9cVSzGjp+z5
         rjrnc9Ezj8EVAL69N2L+LbdfowI1TqQ/hYP1ybx4OUDx3NOFa2q11kg/L++XojX3zBbN
         e3DMeDtcGzf+1N6OdQPnTc2jXlEedVb+c4MIceWEPQAzTRIZhbNbQoOTU+LpjKE1OfQD
         OvTA==
X-Gm-Message-State: AOAM532pjc1AgbpM/kI2+c3sDYZlZaTHWA9ZXAHC9MvHC302OVImLbpE
        ko3lN0d+ekztzZPDO877tLCpe+UbQaXP3A5dEhhjbOuDT2Giuw==
X-Google-Smtp-Source: ABdhPJxjC5r+0BGClxopx1pgtNNKYuabuin6oS0xx/Xg9kGTm/WcJZeJguQLHlAUx7KNjOJnZu4DMwdxp+EMEii3U44=
X-Received: by 2002:a9d:2ae8:: with SMTP id e95mr50259208otb.72.1621233127733;
 Sun, 16 May 2021 23:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210517005417.18338-1-rdunlap@infradead.org> <e56fa6d9-1305-b3c5-d385-37042835686c@roeck-us.net>
In-Reply-To: <e56fa6d9-1305-b3c5-d385-37042835686c@roeck-us.net>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Mon, 17 May 2021 08:31:56 +0200
Message-ID: <CAMhs-H9nfHxGTOgww-cC-s_gkZtJBtWsQkhNKCX3NdTJpD=R0Q@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: export rt_sysc_membase for rt2880_wdt.c
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@iguana.be>,
        John Crispin <john@phrozen.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Guenter,

On Mon, May 17, 2021 at 8:23 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 5/16/21 5:54 PM, Randy Dunlap wrote:
> > rt2880_wdt.c uses (well, attempts to use) rt_sysc_membase. However,
> > when this watchdog driver is built as a loadable module, there is a
> > build error since the rt_sysc_membase symbol is not exported.
> > Export it to quell the build error.
> >
> > ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] undefined!
> >
> > Fixes: 473cf939ff34 ("watchdog: add ralink watchdog driver")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Wim Van Sebroeck <wim@iguana.be>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> > Cc: John Crispin <john@phrozen.org>
> > Cc: linux-mips@vger.kernel.org
> > Cc: linux-watchdog@vger.kernel.org
> > ---
> > or make the Kconfig symbol RALINK_WDT bool instead of tristate?
> >
>
> You'd have to change several other config symbols to boolean as well.
>
> Example with PHY_MT7621_PCI=m:
>
> ERROR: modpost: "rt_sysc_membase" [drivers/phy/ralink/phy-mt7621-pci.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:150: modules-only.symvers] Error 1

This is already changed and not using this rt_* apis anymore. See:

https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit/?h=next&id=60ece833ccd00c4fc9b10bbce2fa6291f61c6230
https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit/?h=next&id=6eded551cefe3ef6e2b3ff76b6a77a2ecd4fa20a

>
> Same with MT7621_WDT=m.
>
> ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/mt7621_wdt.ko] undefined!
>
> At that point I stopped looking.
>
> Guenter

Best regards,
    Sergio Paracuellos

>
> >   arch/mips/ralink/of.c |    2 ++
> >   1 file changed, 2 insertions(+)
> >
> > --- linux-next-20210514.orig/arch/mips/ralink/of.c
> > +++ linux-next-20210514/arch/mips/ralink/of.c
> > @@ -8,6 +8,7 @@
> >
> >   #include <linux/io.h>
> >   #include <linux/clk.h>
> > +#include <linux/export.h>
> >   #include <linux/init.h>
> >   #include <linux/sizes.h>
> >   #include <linux/of_fdt.h>
> > @@ -25,6 +26,7 @@
> >
> >   __iomem void *rt_sysc_membase;
> >   __iomem void *rt_memc_membase;
> > +EXPORT_SYMBOL_GPL(rt_sysc_membase);
> >
> >   __iomem void *plat_of_remap_node(const char *node)
> >   {
> >
>
