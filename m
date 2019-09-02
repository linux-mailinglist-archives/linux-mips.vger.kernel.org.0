Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD96AA5C37
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 20:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfIBSW7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 14:22:59 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46351 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbfIBSW7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Sep 2019 14:22:59 -0400
Received: by mail-wr1-f68.google.com with SMTP id h7so13548350wrt.13;
        Mon, 02 Sep 2019 11:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8A/kzDKosPuqQJbNKUfUKEZ3g88LloK7fbrgo3dQ42Q=;
        b=X1Hbz3B066PMs/wFzGMdVngPlmfveUnUO/NuPBD+yyoHoS/9BlKzuv6Ckhzew5pOv/
         ULDRFPERFg0KWvkfbvIML575gChH/77GxlL9dyk0qa5UbCTonhi5xuz7mlZvij7GUpvU
         l8QZ4qFlwn7TuZaW7UAUDyhkPZsuaTeATTFAGn7Qd8HvQZmhQky+CvoiJmtue1FDyubn
         P/yL1vPboPGUH9tzCouFRzdLC3HVehGXkouMh5YjL0urGmjTKniylfgtdMV0yebN/eRz
         7uoeQ6KEpliOCJn3osbrEoocuMhC4Yp1FBqhiDOASFKIs2V0PKzjMQyq6vK0Cfy1LKoW
         ARkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=8A/kzDKosPuqQJbNKUfUKEZ3g88LloK7fbrgo3dQ42Q=;
        b=sPFksgp++BwVc11NqdEPgVcgsF6+gvtdk77p5TRBFScEGWqvWOhW2bWdxwAMfHIn22
         RN+3ZWiX8IXeRlcQo+KISRwGtC/iuYhzB5JZwahS+G2Stxhg1r5SH51makiKPMBiHEXa
         D04eUN7RIVQUUrIW2S62oARJp4HLTh5ZEqA9MoIq/pnqSjlMrDo3eA1j2z4lXISENf1w
         6tVZPt7PlbM1r4jkmi8T3fGVas9IShQ90Ljpee5yDioIGLkpDjmQvldAOkOV/q2zX1be
         jq5poy+U488HZii/35/fgiFMYCQkin0qTENAvzdBwGZxVZgW7jPpF/iC9IMr2rwdG0he
         8FVQ==
X-Gm-Message-State: APjAAAX7Wwe4CYeX1fTxrjA6j5q4QMTSqOYdwukJazHaW+eLCpyFSKrs
        QUwEafkyCs/evHz7LiQxz4I=
X-Google-Smtp-Source: APXvYqzIotofKxre9TSXVZbGJRzt2MUIul0zkl0rNXE9gzwa4Z1Lg36GB0S2Qsdlyw89JY76H73b4Q==
X-Received: by 2002:adf:a4c8:: with SMTP id h8mr15266864wrb.293.1567448576040;
        Mon, 02 Sep 2019 11:22:56 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id z21sm3901958wmf.30.2019.09.02.11.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 11:22:55 -0700 (PDT)
Date:   Mon, 2 Sep 2019 20:22:52 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Yunsheng Lin <linyunsheng@huawei.com>, dalias@libc.org,
        linux-sh@vger.kernel.org, catalin.marinas@arm.com,
        dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
        linuxarm@huawei.com, jiaxun.yang@flygoat.com,
        linux-kernel@vger.kernel.org, mwb@linux.vnet.ibm.com,
        paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org,
        chenhc@lemote.com, will@kernel.org, linux-s390@vger.kernel.org,
        ysato@users.sourceforge.jp, mpe@ellerman.id.au, x86@kernel.org,
        rppt@linux.ibm.com, borntraeger@de.ibm.com, dledford@redhat.com,
        mingo@redhat.com, jeffrey.t.kirsher@intel.com,
        benh@kernel.crashing.org, jhogan@kernel.org,
        nfont@linux.vnet.ibm.com, mattst88@gmail.com, len.brown@intel.com,
        gor@linux.ibm.com, anshuman.khandual@arm.com,
        ink@jurassic.park.msu.ru, cai@lca.pw, luto@kernel.org,
        tglx@linutronix.de, naveen.n.rao@linux.vnet.ibm.com,
        linux-arm-kernel@lists.infradead.org, rth@twiddle.net,
        axboe@kernel.dk, robin.murphy@arm.com, linux-mips@vger.kernel.org,
        ralf@linux-mips.org, tbogendoerfer@suse.de, paul.burton@mips.com,
        linux-alpha@vger.kernel.org, bp@alien8.de,
        akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
        davem@davemloft.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
Message-ID: <20190902182252.GC35858@gmail.com>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <ae64285f-5134-4147-7b02-34bb5d519e8c@huawei.com>
 <20190902072542.GN2369@hirez.programming.kicks-ass.net>
 <5fa2aa99-89fa-cd41-b090-36a23cfdeb73@huawei.com>
 <20190902125644.GQ2369@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902125644.GQ2369@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Sep 02, 2019 at 08:25:24PM +0800, Yunsheng Lin wrote:
> > On 2019/9/2 15:25, Peter Zijlstra wrote:
> > > On Mon, Sep 02, 2019 at 01:46:51PM +0800, Yunsheng Lin wrote:
> > >> On 2019/9/1 0:12, Peter Zijlstra wrote:
> > > 
> > >>> 1) because even it is not set, the device really does belong to a node.
> > >>> It is impossible a device will have magic uniform access to memory when
> > >>> CPUs cannot.
> > >>
> > >> So it means dev_to_node() will return either NUMA_NO_NODE or a
> > >> valid node id?
> > > 
> > > NUMA_NO_NODE := -1, which is not a valid node number. It is also, like I
> > > said, not a valid device location on a NUMA system.
> > > 
> > > Just because ACPI/BIOS is shit, doesn't mean the device doesn't have a
> > > node association. It just means we don't know and might have to guess.
> > 
> > How do we guess the device's location when ACPI/BIOS does not set it?
> 
> See device_add(), it looks to the device's parent and on NO_NODE, puts
> it there.
> 
> Lacking any hints, just stick it to node0 and print a FW_BUG or
> something.
> 
> > It seems dev_to_node() does not do anything about that and leave the
> > job to the caller or whatever function that get called with its return
> > value, such as cpumask_of_node().
> 
> Well, dev_to_node() doesn't do anything; nor should it. It are the
> callers of set_dev_node() that should be taking care.
> 
> Also note how device_add() sets the device node to the parent device's
> node on NUMA_NO_NODE. Arguably we should change it to complain when it
> finds NUMA_NO_NODE and !parent.
> 
> ---
>  drivers/base/core.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index f0dd8e38fee3..2caf204966a0 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2120,8 +2120,16 @@ int device_add(struct device *dev)
>  		dev->kobj.parent = kobj;
>  
>  	/* use parent numa_node */
> -	if (parent && (dev_to_node(dev) == NUMA_NO_NODE))
> -		set_dev_node(dev, dev_to_node(parent));
> +	if (dev_to_node(dev) == NUMA_NO_NODE) {
> +		if (parent)
> +			set_dev_node(dev, dev_to_node(parent));
> +#ifdef CONFIG_NUMA
> +		else {
> +			pr_err("device: '%s': has no assigned NUMA node\n", dev_name(dev));
> +			set_dev_node(dev, 0);
> +		}
> +#endif

BTW., is firmware required to always provide a NUMA node on NUMA systems?

I.e. do we really want this warning on non-NUMA systems that don't assign 
NUMA nodes?

Also, even on NUMA systems, is firmware required to provide a NUMA node - 
i.e. is it in principle invalid to offer no NUMA binding?

Thanks,

	Ingo
