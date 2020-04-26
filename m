Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEEFA1B8D67
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 09:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgDZH0o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 03:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725847AbgDZH0o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 03:26:44 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96806C061A0C;
        Sun, 26 Apr 2020 00:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=CWSwm8Yeluzm8cpwZm/62btaRJCyoviiCLbacfabnGM=; b=Re1ECLpOnjCxMnMxw3nbFwqX2n
        aoIEpiDwCOhSXjRFQsAtKAUzFPfcZvScmnluhdPrGcpB4A73YnCcAK3X1/Udnt463gXZiWTPz/hdY
        Zm1qsK/TTQvahB8trR8xHhgpUygnDRg+nIVFpopoPErU2kCehwboKE+gZgzOWx7tGiBfdqF+7XjLQ
        nXGbVkpLeDiFJyDIB00acjlEnat0Goyv5mEX0AfFgXOl9BLdSgCkmDQwkWJK/Ym/oifDtpOlRDYDp
        XopgAFXT0HVE//Q7QrX3iZhO0PVRR0c/B26jlIRviJj+L4KI9zh60oN87/iGag0hjjm6rgmN2bu1K
        JDzqUHOw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jSbgY-00048J-Cx; Sun, 26 Apr 2020 07:26:42 +0000
Date:   Sun, 26 Apr 2020 00:26:42 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     ira.weiny@intel.com
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 4/5] arch/kmap_atomic: Consolidate duplicate code
Message-ID: <20200426072642.GB22024@infradead.org>
References: <20200426055406.134198-1-ira.weiny@intel.com>
 <20200426055406.134198-5-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426055406.134198-5-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
> index 4db13a6b9f3b..1cae4b911a33 100644
> --- a/arch/arc/mm/highmem.c
> +++ b/arch/arc/mm/highmem.c
> @@ -53,11 +53,10 @@ void *kmap_atomic(struct page *page)
>  {
>  	int idx, cpu_idx;
>  	unsigned long vaddr;
> +	void *addr = kmap_atomic_fast(page);
>  
> -	preempt_disable();
> -	pagefault_disable();
> -	if (!PageHighMem(page))
> -		return page_address(page);
> +	if (addr)
> +		return addr;

Wouldn't it make sense to just move kmap_atomic itelf to common code,
and call out to a kmap_atomic_high for the highmem case, following the
scheme in kmap?  Same for the unmap side.  That might require to support
kmap_atomic_prot everywhere first, which sounds like a really good
idea anyway, and would avoid the need for strange workaround in drm.
