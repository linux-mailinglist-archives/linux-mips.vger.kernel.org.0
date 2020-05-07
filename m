Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3091C8563
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 11:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgEGJLX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 05:11:23 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45266 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgEGJLW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 05:11:22 -0400
Received: by mail-ot1-f66.google.com with SMTP id e20so3875287otk.12;
        Thu, 07 May 2020 02:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BkZGWfknPCW9diM50jSAbHmaT0n2Sk6fsGRA0H7i0Xs=;
        b=NAQm1ihsGf3Cf64FKrLokGUipqAiGlf5C2qjlgZ3GTmlXHVSdPMhktaEcfFi2L0YK5
         5L333nPj04luJ3OqzILUtu2g4te+jdSSyG21YGNF7NDmP4nJ3y6R468bmdPorsny/YQ2
         dDzNJUENiOi2sxMd5jtnNeJFv3oeVxsc0Lm/Nhjjcm28J0scPraq9JZq+ZRtqsuQ07lu
         fhjMc0JbH5t/GiEs+9ustZqUzR78X9Y9d10JrDR+y3loVXQllgrjwT6jtJncddNRP8tj
         0DGH4VJcCmCI/JMizoKYT9vbCXFmDpSL6L2NyFT5FXQUSJfCAChxhRkcMgEgZ4XH9G5G
         4U5A==
X-Gm-Message-State: AGi0PuYl3p2vZ2bAc4gRbe5oTL9SqaUznl85goIeuRGfjOFnp8BiBG6y
        FvnVsXvWWWHC3zawu3jYkP/o4mcU9Qb/n7I+I0yycg==
X-Google-Smtp-Source: APiQypJIyICbLvXxZlx0vjJlnk4zSUwjrVCNGJvVapRli59iojyXUbrXZScuCYamWR/wpuc1PxLmCTWsBtgZ2096MmE=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr3966867otl.107.1588842681338;
 Thu, 07 May 2020 02:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200506090452.1290-1-geert+renesas@glider.be> <20200507084058.GA9624@alpha.franken.de>
In-Reply-To: <20200507084058.GA9624@alpha.franken.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 May 2020 11:11:10 +0200
Message-ID: <CAMuHMdU=iZfBg9wkZ1JM_eLe8j-nVp0Q8761UM7p_UUEhuf1+w@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ingenic: Replace <linux/clk-provider.h> by <linux/of_clk.h>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Thu, May 7, 2020 at 11:05 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> On Wed, May 06, 2020 at 11:04:52AM +0200, Geert Uytterhoeven wrote:
> > The JZ4740 setup code is not a clock provider, and just needs to call
> > of_clk_init().
> >
> > Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
> >
> > Fixes: f932449c11dabb4b ("MIPS: ingenic: Drop obsolete code, merge the rest in setup.c")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  arch/mips/jz4740/setup.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Does this need to go via mips-fixes ? Or is mips-next good enough ?

The commit fixed is not yet upstream, only in next, and the fix is
non-critical.  It could even be merged into the original commit,
depending on your rebase policy.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
