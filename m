Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8371840F649
	for <lists+linux-mips@lfdr.de>; Fri, 17 Sep 2021 12:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241620AbhIQKyl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Sep 2021 06:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240684AbhIQKyk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Sep 2021 06:54:40 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13435C061574;
        Fri, 17 Sep 2021 03:53:18 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id d42so9657365lfv.10;
        Fri, 17 Sep 2021 03:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GwPKvHPa7SWPdAxFNaWPHxr/qhyv9zoje0np7fedQKE=;
        b=WPqhGp7YFJx9AUCevICXrAodjCpr6nIpm2Ih1DUPRgTO2JIO4D88GB1S962YfHO9vm
         DRezWJVTxjj9rs0AZRWxJOWrvy9r+qKMeskCPE927IzPuRXFDgRa2iadYLcTMOd/64+4
         nzSruXNpaJKUZ/QJMboU8PnvfhM3HxH1/+n2Hxdlkx7TK9deyd8BenrLblqAQ+bMgzVD
         B6WKlUg0EoDvkkaNdaR+KyTdmSq6OG0BlpLoAPZbqIl9QPO8MWAsO5TjFbpFLhkwDdr4
         XYe66QAT2Ou7DTn+qqH8GubuMGhG8e16UInR2xW2MYta03lHYWn05LHNPgYs5vhLU3q9
         bpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GwPKvHPa7SWPdAxFNaWPHxr/qhyv9zoje0np7fedQKE=;
        b=T0LpQ8w5B8lTJvVNTMlI+TgfdBMRT/MrX/qcfPOoy5mJM3JH8sh60RsisntFYzx689
         xGvyC067l7gigDRi9rWMGjFHmOwtd442hW0fFlapNp6iQ1ijN3b6x9eBuzwBetdRecUc
         HQobn7I8+pMnc3auDM2tmhbukFc0VfGa2A1dgrBA/EaTb1SPW66LHHM5DjQ0utk4+GBd
         F64TCVbhhMrx1MEOtAI9k5Ae24VSwYOw4MEoN3ebjeL3v9aqxQQuLi9ACNNrba3w6mCa
         yBiwoZm4wu0yTWppFIaxFrdb3NkVFa1UFHrUzPOBaZ7Y3mNkW26BmKwsyHyL/AYQ58Qu
         8CTg==
X-Gm-Message-State: AOAM5322pmm2JT2tao4FGiQcjQKwLkkWhbjEsz8IOOwiDPYrgm0K2Ruk
        eebLOs8k70EQDetaG+yYiDh1mA1h2EP7G+FTYA0+0OWOUOYORA==
X-Google-Smtp-Source: ABdhPJxECw0V3jWNF/BA8gW1zDMxBYDkGOJs8qFL3/XqUc3j9ICvKltI4RP4oRxJGpZWee5/Y+mW8GOAZO8FS/BZnHE=
X-Received: by 2002:ac2:5310:: with SMTP id c16mr7346042lfh.393.1631875996413;
 Fri, 17 Sep 2021 03:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210914151016.3174924-1-Roman_Skakun@epam.com>
 <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com> <CADu_u-Ou08tMFm5xU871ae8ct+2YOuvn4rQ=83CMTbg2bx87Pg@mail.gmail.com>
 <84ef7ff7-2c9c-113a-4a2c-cef54a6ded51@suse.com>
In-Reply-To: <84ef7ff7-2c9c-113a-4a2c-cef54a6ded51@suse.com>
From:   Roman Skakun <rm.skakun@gmail.com>
Date:   Fri, 17 Sep 2021 13:53:05 +0300
Message-ID: <CADu_u-NvDrKkYJXoPSH8BL2GzKmCUNtsSz=6mn1yA+pPcUMpLA@mail.gmail.com>
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
To:     Jan Beulich <jbeulich@suse.com>
Cc:     Andrii Anisov <andrii_anisov@epam.com>,
        Roman Skakun <roman_skakun@epam.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
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
        iommu <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jan,

>>>  In order to be sure to catch all uses like this one (including ones
>>>  which make it upstream in parallel to yours), I think you will want
>>>  to rename the original IO_TLB_SEGSIZE to e.g. IO_TLB_DEFAULT_SEGSIZE.
>>
>> I don't understand your point. Can you clarify this?
>
> There's a concrete present example: I have a patch pending adding
> another use of IO_TLB_SEGSIZE. This use would need to be replaced
> like you do here in several places. The need for the additional
> replacement would be quite obvious (from a build failure) if you
> renamed the manifest constant. Without renaming, it'll take
> someone running into an issue on a live system, which I consider
> far worse. This is because a simple re-basing of one of the
> patches on top of the other will not point out the need for the
> extra replacement, nor would a test build (with both patches in
> place).

It's reasonable.
I will change the original IO_TLB_SEGSIZE to IO_TLB_DEFAULT_SEGSIZE in the
next patch series.

Thanks.

=D1=81=D1=80, 15 =D1=81=D0=B5=D0=BD=D1=82. 2021 =D0=B3. =D0=B2 16:50, Jan B=
eulich <jbeulich@suse.com>:
>
> On 15.09.2021 15:37, Roman Skakun wrote:
> >>> From: Roman Skakun <roman_skakun@epam.com>
> >>>
> >>> It is possible when default IO TLB size is not
> >>> enough to fit a long buffers as described here [1].
> >>>
> >>> This patch makes a way to set this parameter
> >>> using cmdline instead of recompiling a kernel.
> >>>
> >>> [1] https://www.xilinx.com/support/answers/72694.html
> >>
> >>  I'm not convinced the swiotlb use describe there falls under "intende=
d
> >>  use" - mapping a 1280x720 framebuffer in a single chunk?
> >
> > I had the same issue while mapping DMA chuck ~4MB for gem fb when
> > using xen vdispl.
> > I got the next log:
> > [ 142.030421] rcar-fcp fea2f000.fcp: swiotlb buffer is full (sz:
> > 3686400 bytes), total 32768 (slots), used 32 (slots)
> >
> > It happened when I tried to map bounce buffer, which has a large size.
> > The default size if 128(IO_TLB_SEGSIZE) * 2048(IO_TLB_SHIFT) =3D 262144
> > bytes, but we requested 3686400 bytes.
> > When I change IO_TLB_SEGSIZE to 2048. (2048(IO_TLB_SEGSIZE)  *
> > 2048(IO_TLB_SHIFT) =3D 4194304bytes).
> > It makes possible to retrieve a bounce buffer for requested size.
> > After changing this value, the problem is gone.
>
> But the question remains: Why does the framebuffer need to be mapped
> in a single giant chunk?
>
> >>  In order to be sure to catch all uses like this one (including ones
> >>  which make it upstream in parallel to yours), I think you will want
> >>  to rename the original IO_TLB_SEGSIZE to e.g. IO_TLB_DEFAULT_SEGSIZE.
> >
> > I don't understand your point. Can you clarify this?
>
> There's a concrete present example: I have a patch pending adding
> another use of IO_TLB_SEGSIZE. This use would need to be replaced
> like you do here in several places. The need for the additional
> replacement would be quite obvious (from a build failure) if you
> renamed the manifest constant. Without renaming, it'll take
> someone running into an issue on a live system, which I consider
> far worse. This is because a simple re-basing of one of the
> patches on top of the other will not point out the need for the
> extra replacement, nor would a test build (with both patches in
> place).
>
> Jan
>


--=20
Best Regards, Roman.
