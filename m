Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E295437894
	for <lists+linux-mips@lfdr.de>; Fri, 22 Oct 2021 15:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbhJVOBs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Oct 2021 10:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhJVOBr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Oct 2021 10:01:47 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1317DC061764;
        Fri, 22 Oct 2021 06:59:30 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i24so847916lfj.13;
        Fri, 22 Oct 2021 06:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=r/XYzQj06TlWTxA1kKcI6lBOM9M4QsL12wnXXitW/rk=;
        b=AqNMDhY2/584RrRisIDZh05BQb3tScvsSX4cYDYoyEORHJviHp+gFCMmGll/4icg9k
         RQYy+/xK13UoZICKHzxL8hNEWs1XQMta4FLNkZmSzbj1QarQN0zEq1VKbme9/+iIVyOq
         3Qw9YJq4S55v6AxmTKs/ZSfhtIM+9AMG0STKfeqw9GKbMUOCwuxkYwhFzSlRnGQZHiy3
         ruAYgHTGwTbVH0nVaEeOMl35Zj7y1I4555cEeLjA9aN/LC3IgF9ODQZgr7Wf2nhKVHh2
         IcFfIwXjzU4sSfBaOTbGtNr5uljHfb/LnLCaul8bkvrDORN31l+7QUtAADyuLYoHOFgk
         2l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r/XYzQj06TlWTxA1kKcI6lBOM9M4QsL12wnXXitW/rk=;
        b=btWUJCtMmjt2tAc2/cabVClGuCuiKqAy17IuYRQsIOZHoQTWMwLbRMzgvuSeMQ0ldT
         uRSWcOwlLQ+Ro+r3e+WLRPiD5WI4jnwW0bFsCjslmxy+Q8Y224OpHz7M0rIbUZm0TNCY
         r/yg+qOTXC6bvnYuEUfx7+v1KpjPfHbXGY/XA63kd1ymO/wBkKL9LqDPGf+gh3eiYUMp
         kW4k7ZCsnC/SdcuGOlVRItrFTo8MteogWZidgTbcL25JtKuSGtpUM2QItkSzsSKTnXv5
         O+yaj3MPhus52kEcq3gl/r5r++R54VV1PZ7rS8ezkU1H7w4XhZ8kuu46Jj2ahMIXewqr
         dmWQ==
X-Gm-Message-State: AOAM530By1iKO40oh5IHCh7wx/maZTfL4kpDmpPDkl50uFUKO5wo+oWj
        PBskaUGuxcPNsD5pZAxnxN806WXZvi0=
X-Google-Smtp-Source: ABdhPJzTsAN6pB62BlnAxQwOmYHzWK0D02hhiwkjJ2/++Bk5izTC+RUhBtn8Og/7LtwWhhZj0va52A==
X-Received: by 2002:ac2:4c49:: with SMTP id o9mr12269402lfk.482.1634911168499;
        Fri, 22 Oct 2021 06:59:28 -0700 (PDT)
Received: from mobilestation ([95.79.132.211])
        by smtp.gmail.com with ESMTPSA id e8sm739946lft.308.2021.10.22.06.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 06:59:28 -0700 (PDT)
Date:   Fri, 22 Oct 2021 16:59:26 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, f.fainelli@gmail.com,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 0/3] genirq: Make irq_cpu_{on,off}line() an Octeon-special
Message-ID: <20211022135926.nlxdmuu6tfhrqlui@mobilestation>
References: <20211021170414.3341522-1-maz@kernel.org>
 <20211022135353.ibze6z67xokbwkts@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022135353.ibze6z67xokbwkts@mobilestation>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 22, 2021 at 04:53:56PM +0300, Serge Semin wrote:
> Hello Marc
> 
> On Thu, Oct 21, 2021 at 06:04:11PM +0100, Marc Zyngier wrote:
> > Now that Florian has updated BMIPS to not rely on irq_cpu_offline [1],
> > it is pretty tempting to totally get of this misfeature. We can't
> > really do that because Octeon uses it like crazy, but the couple of
> > other users are easy to convert.
> > 
> > Once this is done, these helpers are hidden behind a config symbol
> > that depends on the Octeon platform being selected. When Octeon is
> > finally removed from the tree, we'll be able to drop this as well.
> 
> The whole series has been tested in kernel 5.13 running on
> Baikal-T1 SoC (2x P5600 cores) with MIPS GIC used as the clock source
> and clock event device.

> Acked-by: Serge Semin <fancer.lancer@gmail.com>

Ah, sorry. copy-pasted a wrong tag. Tested-by of course:
Tested-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> 
> -Sergey
> 
> > 
> > 
> > Marc Zyngier (3):
> >   MIPS: loongson64: Drop call to irq_cpu_offline()
> >   irqchip/mips-gic: Get rid of the reliance on irq_cpu_online()
> >   genirq: Hide irq_cpu_{on,off}line() behind a deprecated option
> > 
> >  arch/mips/loongson64/smp.c     |  1 -
> >  drivers/irqchip/irq-mips-gic.c | 37 ++++++++++++++++++++++++----------
> >  include/linux/irq.h            |  5 ++++-
> >  kernel/irq/Kconfig             |  7 +++++++
> >  kernel/irq/chip.c              |  2 ++
> >  5 files changed, 39 insertions(+), 13 deletions(-)
> > 
> > -- 
> > 2.30.2
> > 
