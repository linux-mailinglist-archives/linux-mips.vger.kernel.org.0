Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7995B1DAE8F
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 11:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgETJUD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 05:20:03 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:44012 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgETJUC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 05:20:02 -0400
Received: by mail-ej1-f65.google.com with SMTP id a2so2737474ejb.10;
        Wed, 20 May 2020 02:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bpDRYRDMQiVjwIJT1RoRKDBUA/dqL0sPbiP0pNBKO7c=;
        b=gZ6ivzUw/L8bzVk/xeJEs2E8CyTqaDaGBnz0f7omi0o0xHAzutjOyqWtRQSiI/yJu9
         W/BoEEIn8KLtUKEA98UHzAFHDe/S53ycLSOqMhJmNGTMxqYqSuTdIkUKA/zzCj7plFQ9
         mvtHXlRqwVsHKlbC8GMzIpOcsISsYou/BvSc1nm0b9h/rFWQ+93gnANxlhX7LoFcRWDQ
         Fl+hrdN7YIqO10T1thPfWmRtj2X9bWpTAEXoRWtfYMWsZ+xKvCt6JjD7MyEP0+O1j2I2
         13KREglDd0TL1NSNxjGc+f9oeEmP3XgDUHabD9jEuK7kjfetpQpOMlZcjDdbls2ohQAn
         NHlw==
X-Gm-Message-State: AOAM531l2mWM7leTWSewnoy77cPPIWFifP4za1hGbBYXhM3k+DQ/brnt
        9IM3co6mLBQkQrqQNq0L2uIqJHGtHTs5adciVScrdbE3p04=
X-Google-Smtp-Source: ABdhPJwDLOl+kWyH4LvTpW602huABmGTNEUWWMOQrPgH/YgpYmhLQVDKhDGGGTwZYkk2igj7bsE4KJRQ6TcI+xuTqEA=
X-Received: by 2002:a17:907:9492:: with SMTP id dm18mr2991513ejc.328.1589966401262;
 Wed, 20 May 2020 02:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200519212230.313365-1-paul@crapouillou.net> <20200520064520.GB7630@alpha.franken.de>
In-Reply-To: <20200520064520.GB7630@alpha.franken.de>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Wed, 20 May 2020 11:19:49 +0200
Message-ID: <CAAdtpL4cZ4==07=kNJf6Xkhnzy6jiqgMc1XzG0NV6RZi1KqgXA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ingenic: Add missing include
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Wed, May 20, 2020 at 8:50 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Tue, May 19, 2020 at 11:22:30PM +0200, Paul Cercueil wrote:
> > Add missing include which adds the prototype to plat_time_init().
> >
> > Fixes: f932449c11da ("MIPS: ingenic: Drop obsolete code, merge the rest in setup.c")
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > Reported-by: kbuild test robot <lkp@intel.com>
> > ---
> >  arch/mips/jz4740/setup.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> applied to mips-next.

Since mips-next is not merged, can you simply squash the fix to the
incomplete f932449c11da please?

Thanks,

Phil.

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
