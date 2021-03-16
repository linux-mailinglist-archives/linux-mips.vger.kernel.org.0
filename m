Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E4533CA6E
	for <lists+linux-mips@lfdr.de>; Tue, 16 Mar 2021 01:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhCPAkr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Mar 2021 20:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhCPAk0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Mar 2021 20:40:26 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF29C06174A;
        Mon, 15 Mar 2021 17:40:26 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id r7so11175420ilb.0;
        Mon, 15 Mar 2021 17:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3EbL30ZKOOeXL4H1TZYLjRw3pggZqctEO1xSA9/mHts=;
        b=GGih0i+gaWiOOV/rY9Kk0Hz4ESEucxOUUu1sRKY07Y/zDeioTnX7ffg8k4f94lddB+
         7OhMSP8N223FQJOWN4ZXjNEK2SOk1GonqrTKrGEVn0ncg7e92fHhMXcfLwxmgD6HSbgm
         ZdqT+HTCPU93tcfXlW7xbWvVbgEASugI+S2DQWLEewl1d5W1qHMRai69emzp74YMzAQd
         7MS9sm37OLvpu3NKDqn/OPJwM8J2BOtTT3YIO7FlypHTE+GYhQU8YpWck6RBD9WQr6eV
         KQH8OzmlvZbDKiPHJLo7hZ/torvC74Rseyfy9oCuvSU51ZaydyovJ16kLUsZS9kyp/K6
         w9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3EbL30ZKOOeXL4H1TZYLjRw3pggZqctEO1xSA9/mHts=;
        b=TCNJ1f/j/6j0JuBnISL0Q7gac9DYAlpK62trWFN0qkBlbB/0/9W5b4tLpQn8rv23nI
         vPRx/54D4aV0oM1wvBDKmzfwBKu+0NyoCqBjHoWFAim6wdu/NIfZkImQpsbq0/nz076+
         Vd2ZLZHp/Bv/ZVsVnXWAURYTvWjCrfQfWolsSAeEM452JMvoKBRd03ImCMvsBFL4LLX5
         8HkAs8BRbiydQi+lG+91/eaDp97afyI2+U0G/9cuDTWLJO7BnXtUV9PrWBVp42fa2JFV
         ZeBORrtI6/6bj1S8SrQjoU1dRItxVfH/7iTljwtgMYQ3bpYuP714cLvr4b/4ACveZYHi
         7CqA==
X-Gm-Message-State: AOAM530kuJ8PkY8uIAk4eX89hk1xypp0rLGBrYcvLdxkLaGVtrP2H997
        EH5OdMWJb4FrLl5ZwIALD5Td/Jx3JexKL+fJhgU=
X-Google-Smtp-Source: ABdhPJyxa6wlB/tn5ckNPuhK4wVNcVJk4BAHOIm3WntCpiZ/Z+/AtKagKe9+qA68jaIxz6WRjOEINtWYhIAg1+Ww9wM=
X-Received: by 2002:a05:6e02:12ac:: with SMTP id f12mr1696246ilr.103.1615855226213;
 Mon, 15 Mar 2021 17:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210307190806.5211-1-ilya.lipnitskiy@gmail.com> <20210312103341.GG7027@alpha.franken.de>
In-Reply-To: <20210312103341.GG7027@alpha.franken.de>
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date:   Mon, 15 Mar 2021 17:40:15 -0700
Message-ID: <CALCv0x0EiX-RiH79izHymURxos2SZF+J8GZ1N2AQkrFqiKmY0g@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: select WEAK_REORDERING_BEYOND_LLSC on MT7621
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     John Crispin <john@phrozen.org>,
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Fri, Mar 12, 2021 at 2:34 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Sun, Mar 07, 2021 at 11:08:06AM -0800, Ilya Lipnitskiy wrote:
> > Upstream a long-standing OpenWrt patch for RALINK MT7621 SoC. Selecting
> > WEAK_REORDERING_BEYOND_LLSC fixes random kernel hangs. This bug and fix
> > was reported by MediaTek WCN division [0].
> >
> > [0]: https://lists.infradead.org/pipermail/lede-commits/2017-August/004537.html
>
> I don't see the Mediatek WCN reporting there. Looking at the 1004K user
> manual I couldn't find a notice about such behaviour. So this looks
> more like a fix for papering over the real bug by just introducing
> a few more syncs. Could you please point me to where this is
> really documented ?
You may actually be right. After doing some testing we may not need
this change after all. Let me drop this patch for now. FYI, the
following commit may have fixed LL SC issues this change was covering
up: https://lore.kernel.org/lkml/20190613134933.048961704@infradead.org/

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
Ilya
