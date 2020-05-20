Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 770F21DAF8D
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 12:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgETKBx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 20 May 2020 06:01:53 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:33174 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgETKBx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 06:01:53 -0400
Received: by mail-ej1-f65.google.com with SMTP id n24so3029234ejd.0;
        Wed, 20 May 2020 03:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v8EDRqZtXtnh/hEmyxqDkZdYj8yN54lWYsJ0qEqpF+c=;
        b=q3Av2KcQKLfM8FcPKMb1krPXMRzDrxZyeSl/fuSlyfFu0TEc84+XdQ/5YzwnJb1+zB
         Y8jw433zvAYHxFU59htqTNd5Puy13H1oKfPvb393N8RLd96EGiSsCsySzQSgJWSGM8bB
         LzJPBUwy0TfjcpZKq+6JyhaFF4/WTzqgfWlr+hMrZffxa6KJEqeCJZE8uPxJWQcEJ3a3
         YjK52l6rQ4Vy3JcRQZjNQ/+6A3qu2vHV/2u2TtT6p7vvtcFxDz77yuFuSPwxX5zxInk+
         Ego2NOdtr5miCEIlqWTrVjH7kvKHPl1PkhIczKcaGhSlQcEb/aMO6YRNDd2vAg313Hbv
         k+2w==
X-Gm-Message-State: AOAM532mjR0UOtV2rczK6u5jpiPZfTNoS404LQqNjV0qiIXEgAz8vtU/
        BmrzIGfp3JxHVfnxrXHSGM/tbJAS/p+A8KUnLBwrST2b
X-Google-Smtp-Source: ABdhPJyNMixBtXdsQ4k57fw3AEyBZlSv9U9g0emO85Y2ome8aOFC6N6r+KX70ZONLl/mh44PO3rHaqf1AN3ao0AZz7s=
X-Received: by 2002:a17:907:9492:: with SMTP id dm18mr3116869ejc.328.1589968911424;
 Wed, 20 May 2020 03:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200519212230.313365-1-paul@crapouillou.net> <20200520064520.GB7630@alpha.franken.de>
 <CAAdtpL4cZ4==07=kNJf6Xkhnzy6jiqgMc1XzG0NV6RZi1KqgXA@mail.gmail.com> <20200520092757.GA12701@alpha.franken.de>
In-Reply-To: <20200520092757.GA12701@alpha.franken.de>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Wed, 20 May 2020 12:01:39 +0200
Message-ID: <CAAdtpL76AOoc+cLOP+khtLGOx6j81Ss3uqDKkuZXjeoqsdE72g@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ingenic: Add missing include
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 20, 2020 at 11:28 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, May 20, 2020 at 11:19:49AM +0200, Philippe Mathieu-Daudé wrote:
> > Hi Thomas,
> >
> > On Wed, May 20, 2020 at 8:50 AM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Tue, May 19, 2020 at 11:22:30PM +0200, Paul Cercueil wrote:
> > > > Add missing include which adds the prototype to plat_time_init().
> > > >
> > > > Fixes: f932449c11da ("MIPS: ingenic: Drop obsolete code, merge the rest in setup.c")
> > > > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > > ---
> > > >  arch/mips/jz4740/setup.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > >
> > > applied to mips-next.
> >
> > Since mips-next is not merged, can you simply squash the fix to the
> > incomplete f932449c11da please?
>
> no, I don't rebase mips-next.

OK. I had the understanding that mips-fixes was the stable branch not rebased,
and mips-next was not considered stable until merged in mainstream.
I took note of the changes, thanks.

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
