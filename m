Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F610A4376
	for <lists+linux-mips@lfdr.de>; Sat, 31 Aug 2019 10:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbfHaI4w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Aug 2019 04:56:52 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37630 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfHaI4w (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 31 Aug 2019 04:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=bpmJrLVfa0mf3hodzsOvY8P9oDNTTP+ppQS83HW7TuU=; b=qiono8HQcx8QMb67P+xwGsPTW
        hJjYBTrxg3+Yk4GWZfJcquXrDgt7B8HtUI5jx+NHxBPbjbFcDxbkxbEX4rFiYOgNzm8rjxiXYXCY2
        etA1eNQAnRoonCmdg9YEYakEi5hwYc0X5eLurwRMdQXe8Uj/3PK3Er7egbBd2c5r5NlfHKsbbhaUS
        cudRPM4bnnBGRIQlI03YwfyYpc4rAy2PySVqM3qgv4L5CQdE3KJtvuEgdJEMxcWQYVEPsQVue2EU7
        8A8Otkomvo6eVA4C7FxNvLKS8ZmxTAuQbczi1YAXTglJ91f5i3n8lWYqQge3fqosoxI+qv9c2aFlp
        L6kX9czzA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i3zAh-0003Sj-AG; Sat, 31 Aug 2019 08:55:47 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C4B93300B8D;
        Sat, 31 Aug 2019 10:55:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id A1EE429B2CD09; Sat, 31 Aug 2019 10:55:39 +0200 (CEST)
Date:   Sat, 31 Aug 2019 10:55:39 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Yunsheng Lin <linyunsheng@huawei.com>
Cc:     catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com,
        bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru,
        mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org,
        mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, ysato@users.sourceforge.jp,
        dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com,
        chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com,
        anshuman.khandual@arm.com, tglx@linutronix.de, cai@lca.pw,
        robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org,
        dave.hansen@linux.intel.com, luto@kernel.org, len.brown@intel.com,
        axboe@kernel.dk, dledford@redhat.com, jeffrey.t.kirsher@intel.com,
        linux-alpha@vger.kernel.org, nfont@linux.vnet.ibm.com,
        naveen.n.rao@linux.vnet.ibm.com, mwb@linux.vnet.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        tbogendoerfer@suse.de, linux-mips@vger.kernel.org,
        linuxarm@huawei.com
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
Message-ID: <20190831085539.GG2369@hirez.programming.kicks-ass.net>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Aug 31, 2019 at 01:58:16PM +0800, Yunsheng Lin wrote:
> According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
> of proximity domain is optional, as below:
> 
> This optional object is used to describe proximity domain
> associations within a machine. _PXM evaluates to an integer
> that identifies a device as belonging to a Proximity Domain
> defined in the System Resource Affinity Table (SRAT).

That's just words.. what does it actually mean?

> This patch checks node id with the below case before returning
> node_to_cpumask_map[node]:
> 1. if node_id >= nr_node_ids, return cpu_none_mask
> 2. if node_id < 0, return cpu_online_mask
> 3. if node_to_cpumask_map[node_id] is NULL, return cpu_online_mask
> 
> [1] https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
> 
> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> ---
>  arch/x86/include/asm/topology.h | 6 ++++++
>  arch/x86/mm/numa.c              | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
> index 4b14d23..f36e9c8 100644
> --- a/arch/x86/include/asm/topology.h
> +++ b/arch/x86/include/asm/topology.h
> @@ -69,6 +69,12 @@ extern const struct cpumask *cpumask_of_node(int node);
>  /* Returns a pointer to the cpumask of CPUs on Node 'node'. */
>  static inline const struct cpumask *cpumask_of_node(int node)
>  {
> +	if (node >= nr_node_ids)
> +		return cpu_none_mask;
> +
> +	if (node < 0 || !node_to_cpumask_map[node])
> +		return cpu_online_mask;
> +
>  	return node_to_cpumask_map[node];
>  }
>  #endif

I _reallly_ hate this. Users are expected to use valid numa ids. Now
we're adding all this checking to all users. Why do we want to do that?

Using '(unsigned)node >= nr_nods_ids' is an error.

> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index e6dad60..5e393d2 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -868,7 +868,7 @@ const struct cpumask *cpumask_of_node(int node)
>  		dump_stack();
>  		return cpu_none_mask;
>  	}
> -	if (node_to_cpumask_map[node] == NULL) {
> +	if (node < 0 || !node_to_cpumask_map[node]) {
>  		printk(KERN_WARNING
>  			"cpumask_of_node(%d): no node_to_cpumask_map!\n",
>  			node);
> -- 
> 2.8.1
> 
