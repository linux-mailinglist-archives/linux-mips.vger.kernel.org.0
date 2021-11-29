Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA6F460CE0
	for <lists+linux-mips@lfdr.de>; Mon, 29 Nov 2021 03:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241220AbhK2C7y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Nov 2021 21:59:54 -0500
Received: from mail-qk1-f177.google.com ([209.85.222.177]:46076 "EHLO
        mail-qk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233236AbhK2C5y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Nov 2021 21:57:54 -0500
Received: by mail-qk1-f177.google.com with SMTP id d2so21312160qki.12;
        Sun, 28 Nov 2021 18:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qbTe+lH71a6p8wzsCbhSxpErG9OzglSEt6YvNDwG21c=;
        b=V1E2rThbUE0Cf5aObZnXmW8UKGIkTFCF0st4gbUmwSM55nvCanRU4adsiSqZG8rcrI
         5juPLYreExfwVwNOPZIE44+EO7RO38Dx5+Kt58t8OOGOhEIZ3AThV0w46lnTY2f9mBCd
         k50HZ4rHE/Cay1fyKdNIgF/xL12qvEiTyRKKuuBfj9T/SEgfMz+CTJd3QhHiv2ohNza0
         SF/IzbV790kTILVls8Abvo9V15D2MzPsmpSEQu3H6r91KBYZpRxtK0HJ76e4UcNvALQ4
         zU2L3SypbllWiLOcasNl30dtF2iSnPA5whCaxmAroRH26niDFrM672sZxlBiCPSpCXG6
         SywA==
X-Gm-Message-State: AOAM530ROYKtgSuHX8cYqceiR18eNRweeMvUKU+z8DtOaS7cpUfSXzFy
        4uq7b/3VYvHjj4kr0wwAB5M=
X-Google-Smtp-Source: ABdhPJyi7aAcRBTHZ33Xv2m6ARGtjYSUACLIAGWWBFseVcXDEPx4RpqRlD7ZTzSfnjCXSQaXvSA7XQ==
X-Received: by 2002:a05:620a:1468:: with SMTP id j8mr36368878qkl.170.1638154476884;
        Sun, 28 Nov 2021 18:54:36 -0800 (PST)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net. [173.68.57.129])
        by smtp.gmail.com with ESMTPSA id s6sm5164326qko.43.2021.11.28.18.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 18:54:36 -0800 (PST)
Date:   Sun, 28 Nov 2021 21:54:34 -0500
From:   Dennis Zhou <dennis@kernel.org>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, tj@kernel.org, gregkh@linuxfoundation.org,
        cl@linux.com, catalin.marinas@arm.com, will@kernel.org,
        tsbogend@alpha.franken.de, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, davem@davemloft.net, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH RFC 0/4] mm: percpu: Cleanup percpu first chunk funciton
Message-ID: <YaRA6o0pHU6/206a@fedora>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
 <4fecd1ac-6c0a-f0fa-1ffb-18f3f266809d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fecd1ac-6c0a-f0fa-1ffb-18f3f266809d@huawei.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 29, 2021 at 10:51:18AM +0800, Kefeng Wang wrote:
> Hi Dennis and all maintainers, any comments about the changes, many thanks.
> 
> On 2021/11/21 17:35, Kefeng Wang wrote:
> > When support page mapping percpu first chunk allocator on arm64, we
> > found there are lots of duplicated codes in percpu embed/page first
> > chunk allocator. This patchset is aimed to cleanup them and should
> > no funciton change, only test on arm64.
> > 
> > Kefeng Wang (4):
> >    mm: percpu: Generalize percpu related config
> >    mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
> >    mm: percpu: Add generic pcpu_fc_alloc/free funciton
> >    mm: percpu: Add generic pcpu_populate_pte() function
> > 
> >   arch/arm64/Kconfig             |  20 +----
> >   arch/ia64/Kconfig              |   9 +--
> >   arch/mips/Kconfig              |  10 +--
> >   arch/mips/mm/init.c            |  14 +---
> >   arch/powerpc/Kconfig           |  17 +---
> >   arch/powerpc/kernel/setup_64.c |  92 +--------------------
> >   arch/riscv/Kconfig             |  10 +--
> >   arch/sparc/Kconfig             |  12 +--
> >   arch/sparc/kernel/smp_64.c     | 105 +-----------------------
> >   arch/x86/Kconfig               |  17 +---
> >   arch/x86/kernel/setup_percpu.c |  66 ++-------------
> >   drivers/base/arch_numa.c       |  68 +---------------
> >   include/linux/percpu.h         |  13 +--
> >   mm/Kconfig                     |  12 +++
> >   mm/percpu.c                    | 143 +++++++++++++++++++++++++--------
> >   15 files changed, 165 insertions(+), 443 deletions(-)
> > 

Hi Kefang,

I apologize for the delay. It's a holiday week in the US + I had some
personal things come up at the beginning of last week. I'll have it
reviewed by tomorrow.

Thanks,
Dennis
