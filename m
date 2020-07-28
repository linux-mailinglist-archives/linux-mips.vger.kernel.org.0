Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C3D23084D
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 13:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbgG1LDO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 07:03:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51683 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728819AbgG1LDO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jul 2020 07:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595934192;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KbH/+n2HvZybv5SHoykd6djdgy/t/5KkFVDCxrMDM1E=;
        b=FpyBFgEYAdPH3frIXeqvXGy6kgOJxM/9AHjX72Rb2v9RbeEO8q1MyhszM7mOxtuaK9j/8S
        CaJP9U1fZblnyeXmyod7yzielFYMq5N/PDpHezk1wH3itx2ca7I5CQwc0VlsYMHgLDhVQa
        X7DVmRn5CE98eNOsxgPjGZnZZ4Tiq3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-YtpimbUANf-rLILSqHuJcA-1; Tue, 28 Jul 2020 07:03:08 -0400
X-MC-Unique: YtpimbUANf-rLILSqHuJcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA57C800597;
        Tue, 28 Jul 2020 11:03:00 +0000 (UTC)
Received: from localhost (ovpn-13-103.pek2.redhat.com [10.72.13.103])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BD995DA33;
        Tue, 28 Jul 2020 11:02:56 +0000 (UTC)
Date:   Tue, 28 Jul 2020 19:02:54 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        clang-built-linux@googlegroups.com,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org
Subject: Re: [PATCH 14/15] x86/numa: remove redundant iteration over
 memblock.reserved
Message-ID: <20200728110254.GA14854@MiWiFi-R3L-srv>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-15-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07/28/20 at 08:11am, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> numa_clear_kernel_node_hotplug() function first traverses numa_meminfo
> regions to set node ID in memblock.reserved and than traverses
> memblock.reserved to update reserved_nodemask to include node IDs that were
> set in the first loop.
> 
> Remove redundant traversal over memblock.reserved and update
> reserved_nodemask while iterating over numa_meminfo.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/x86/mm/numa.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index 8ee952038c80..4078abd33938 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -498,31 +498,25 @@ static void __init numa_clear_kernel_node_hotplug(void)
>  	 * and use those ranges to set the nid in memblock.reserved.
>  	 * This will split up the memblock regions along node
>  	 * boundaries and will set the node IDs as well.
> +	 *
> +	 * The nid will also be set in reserved_nodemask which is later
> +	 * used to clear MEMBLOCK_HOTPLUG flag.
> +	 *
> +	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
> +	 *   numa_meminfo might not include all memblock.reserved
> +	 *   memory ranges, because quirks such as trim_snb_memory()
> +	 *   reserve specific pages for Sandy Bridge graphics.
> +	 *   These ranges will remain with nid == MAX_NUMNODES. ]
>  	 */
>  	for (i = 0; i < numa_meminfo.nr_blks; i++) {
>  		struct numa_memblk *mb = numa_meminfo.blk + i;
>  		int ret;
>  
>  		ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
> +		node_set(mb->nid, reserved_nodemask);

Really? This will set all node id into reserved_nodemask. But in the
current code, it's setting nid into memblock reserved region which
interleaves with numa_memoinfo, then get those nid and set it in
reserved_nodemask. This is so different, with my understanding. Please
correct me if I am wrong.

Thanks
Baoquan

>  		WARN_ON_ONCE(ret);
>  	}
>  
> -	/*
> -	 * Now go over all reserved memblock regions, to construct a
> -	 * node mask of all kernel reserved memory areas.
> -	 *
> -	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
> -	 *   numa_meminfo might not include all memblock.reserved
> -	 *   memory ranges, because quirks such as trim_snb_memory()
> -	 *   reserve specific pages for Sandy Bridge graphics. ]
> -	 */
> -	for_each_memblock(reserved, mb_region) {
> -		int nid = memblock_get_region_node(mb_region);
> -
> -		if (nid != MAX_NUMNODES)
> -			node_set(nid, reserved_nodemask);
> -	}
> -
>  	/*
>  	 * Finally, clear the MEMBLOCK_HOTPLUG flag for all memory
>  	 * belonging to the reserved node mask.
> -- 
> 2.26.2
> 
> 

