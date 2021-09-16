Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1033240D663
	for <lists+linux-mips@lfdr.de>; Thu, 16 Sep 2021 11:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235725AbhIPJmC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Sep 2021 05:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhIPJmB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Sep 2021 05:42:01 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D01AC061574;
        Thu, 16 Sep 2021 02:40:41 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id h16so16049160lfk.10;
        Thu, 16 Sep 2021 02:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f4r5L82T8lVgmjDxktA/sisuupFmx7x30+6IlhMnYag=;
        b=jPcF0P+cHfyIuFllT9s+XQDbpTKL/DP/WZ12xBmDnC0LZJsbJeGpydQ+nj1jG3vyhQ
         MXkF+s9f9DZe82C3OUmuCqssXSW6Xy1D8PFT7XMOVkyU74aEXJL7HBQJL//WLAcHnHlT
         6JAWY0XBjZ7XwV9xpdiHpNmVxyHHj5cWcQPRN6QHBZx1dqJ5C5ttXeA+io6IcnyWEI1q
         dTKH6A8fDq2gQ2GNoUTTZGZkVAhST9ZUJ+pdKy05GPpnzXG3EkGwi93ZGAuCS4fkFkql
         PEeqVQZUULvnCU7rK1P4+9aDwbpW2w/MkOtNecCIBYtcqqkOy4RB/4LhCrlLfobSeeON
         wc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f4r5L82T8lVgmjDxktA/sisuupFmx7x30+6IlhMnYag=;
        b=d04CrElN+9LPFiaWg1zURVABzwjkEb76HQgpIWxTIjVr4nosqwCnbKO1ax7BMFt4Xz
         VC1trQ0VRjoJiEYb4kD5JVaREOQtjVzJdyglz87/vZGbZR90Jb/zYHWXdSlZQcgjbK48
         diS3URh+bIfi9ERq957JnZuox8NDamdyU5trBs9+p4ApfJz2dPxo0fNuxUb/VpBT9Bzn
         AhPbuyDtRyTvTx8HY4YM1C7+RMnjRlmUi6KHnxHZDOzQxoDs5I5hEO7xZutprJKJnj0F
         QYLM2JnUM/g4WTM/ofUJPYttHzggw9olPcW0QEHt9L1dZl8L8s7jWk2L6018V6u6OaMO
         NYzA==
X-Gm-Message-State: AOAM5333fyZugtkXw++Qe9/ZSHnRPIuZnJhWWDKTTJ/5yGEFvM7RO7wa
        EJjeSxj62CZK5zr2dqWOkL2z9W9yOEa2yVL1cEg=
X-Google-Smtp-Source: ABdhPJyIIyf4A7fhfDx7l6dTfpk1Ec/zzEqy4u9mdnznrZCiaqfyA9V5XQj08EEuePeq9U7P318zvMYzkOuwjxToNGM=
X-Received: by 2002:a2e:1508:: with SMTP id s8mr3587923ljd.240.1631785239506;
 Thu, 16 Sep 2021 02:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210914151016.3174924-1-Roman_Skakun@epam.com>
 <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com> <20210914153046.GB815@lst.de> <alpine.DEB.2.21.2109141838290.21985@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109141838290.21985@sstabellini-ThinkPad-T480s>
From:   Roman Skakun <rm.skakun@gmail.com>
Date:   Thu, 16 Sep 2021 12:40:28 +0300
Message-ID: <CADu_u-OjpYB0-B=tLKYsZH=auvQF-o7PJb-11W=1emY8jaA-mg@mail.gmail.com>
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
To:     Stefano Stabellini <sstabellini@kernel.org>
Cc:     Jan Beulich <jbeulich@suse.com>,
        Andrii Anisov <andrii_anisov@epam.com>,
        Roman Skakun <roman_skakun@epam.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Mike Rapoport <rppt@kernel.org>, Will Deacon <will@kernel.org>,
        xen-devel@lists.xenproject.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        iommu <iommu@lists.linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Stefano,

> Also, Option 1 listed in the webpage seems to be a lot better. Any
> reason you can't do that? Because that option both solves the problem
> and increases performance.

Yes, Option 1 is probably more efficient.
But I use another platform under Xen without DMA adjustment functionality.
I pinned this webpage only for example to describe the similar problem I ha=
d.

Cheers,
Roman

=D1=81=D1=80, 15 =D1=81=D0=B5=D0=BD=D1=82. 2021 =D0=B3. =D0=B2 04:51, Stefa=
no Stabellini <sstabellini@kernel.org>:

>
> On Tue, 14 Sep 2021, Christoph Hellwig wrote:
> > On Tue, Sep 14, 2021 at 05:29:07PM +0200, Jan Beulich wrote:
> > > I'm not convinced the swiotlb use describe there falls under "intende=
d
> > > use" - mapping a 1280x720 framebuffer in a single chunk? (As an aside=
,
> > > the bottom of this page is also confusing, as following "Then we can
> > > confirm the modified swiotlb size in the boot log:" there is a log
> > > fragment showing the same original size of 64Mb.
> >
> > It doesn't.  We also do not add hacks to the kernel for whacky out
> > of tree modules.
>
> Also, Option 1 listed in the webpage seems to be a lot better. Any
> reason you can't do that? Because that option both solves the problem
> and increases performance.



--
Best Regards, Roman.
