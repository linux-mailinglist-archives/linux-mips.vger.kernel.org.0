Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9119C273D9D
	for <lists+linux-mips@lfdr.de>; Tue, 22 Sep 2020 10:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgIVIod (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 04:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgIVIoc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Sep 2020 04:44:32 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B62FC061755
        for <linux-mips@vger.kernel.org>; Tue, 22 Sep 2020 01:44:32 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id r9so18749998ioa.2
        for <linux-mips@vger.kernel.org>; Tue, 22 Sep 2020 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pUwHhTsHd2epA/svud7vpuh5X/vM+O6oxDZUErBfD+A=;
        b=WVzUWjIjuab2C15C+1brSnTZi6aK632V6RFdKOUBpSNwTr38GHab3p/J1zVqXpwu10
         qUaWoA7rpAZbHxR22HY/nFNXElwKB482L/wchOafqbG+G8HlS4yXVg7XZ5GHzAckE64q
         10T0ttxUBETwb808e/jOjycp5Q7BeKpLGRdIPLBw/B6EesLIbS2COBQuPo96zcca6/ww
         9Szse2wSNBRUJG1DFW0wyLPng+uUHDQRw3Gb9qAFLryTtGS6hBumby6SIhAU44HAdsXz
         YIaItdQpe8zuUzi0sYjjwnSEGLz5jfh7dtNiZ1wUfUy90NfQwq7zQFbgLQzkCTuiodCq
         8SyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pUwHhTsHd2epA/svud7vpuh5X/vM+O6oxDZUErBfD+A=;
        b=IgwrX6VVh2HpikhGKJCQNoZXCk7oYfa9ZzIFFjo0Tffv7Mwvq/P6ZUX1Sbfhcge3GG
         ssZOG6Ec+rdujdbUFQwMRB8RK3GTIKja2Sns8BN8bKuQ7hlSKtTmTq8zMmjfOSPDw40c
         Q2tIHWDzJvyOPZJZ9GS/I1x9o1/EX/5BoHOYXPltt21WFFkI2HVfS6NmEockOuEmXkjB
         ohnMnPuY/Ky63TqA/nsLWnkY0XGiEIVd8caYs6u8iCs6xbfyMNO59dUwMETqR48n5p3p
         TNv+ajrE5EoTwhh7zbw8SIDcEMBPNxsYEBZwHG9+Rev6FqqwMHOwcZ9wnApB+aO8d28X
         yAUg==
X-Gm-Message-State: AOAM532Hoj+9zCHxWl8ruMewR73n+OSxIrYyJv/xg4QeG8xEdSKkorpl
        i0mEYMopzmHyh8rqzxCdCQslHWRB+sCkk3i1YKeEiTmkWlA=
X-Google-Smtp-Source: ABdhPJzIkUr7Bu4WPe8L/W6w/pa0rmu+oG7yHVB6jnJt5PYTc2++E3uKQ6czmirwb8z094UxCdIPDZxPsiAuD1960VY=
X-Received: by 2002:a5d:9483:: with SMTP id v3mr2487308ioj.84.1600764271964;
 Tue, 22 Sep 2020 01:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <1598255043-11839-1-git-send-email-chenhc@lemote.com>
 <CAAhV-H7hzoO6OfunBZ4R0dUDRNX=jyjhdurV6VdGhdtXZ4Mj5g@mail.gmail.com> <20200922070356.GA6275@alpha.franken.de>
In-Reply-To: <20200922070356.GA6275@alpha.franken.de>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Tue, 22 Sep 2020 16:44:20 +0800
Message-ID: <CAAhV-H5W51U+FGt51oycngCg4u6Y69JDSUWouMPucUYwSOT-NA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson-3: Fix fp register access if MSA enabled
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Pei Huang <huangpei@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Tue, Sep 22, 2020 at 3:04 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Tue, Sep 22, 2020 at 10:06:24AM +0800, Huacai Chen wrote:
> > On Mon, Aug 24, 2020 at 3:40 PM Huacai Chen <chenhc@lemote.com> wrote:
> > >
> > > If MSA is enabled, FPU_REG_WIDTH is 128 rather than 64, then get_fpr64()
> > > /set_fpr64() in the original unaligned instruction emulation code access
> > > the wrong fp registers. This is because the current code doesn't specify
> > > the correct index field, so fix it.
> > >
> > > Fixes: f83e4f9896eff614d0f2547a ("MIPS: Loongson-3: Add some unaligned instructions emulation")
> > > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > > Signed-off-by: Pei Huang <huangpei@loongson.cn>
> > > ---
> > >  arch/mips/loongson64/cop2-ex.c | 24 ++++++++----------------
> > >  1 file changed, 8 insertions(+), 16 deletions(-)
>
> should this go via mips-fixes ?
Yes, it should go.

Huacai
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
