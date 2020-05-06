Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5871C67F1
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 08:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgEFGLX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 02:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725782AbgEFGLW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 02:11:22 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E3AC061A0F;
        Tue,  5 May 2020 23:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=P11S868Du0HesvmsqxCwWCcyLr9HALCMySezlQJYbk0=; b=oP1hjP2OSgsVM0gfohwmDa6TcJ
        pe2nyvwO4gyPy3EogWVPUyLuJPjNyzmhpbMc6GD0yzBaUgwBJpYMZIawh2cAn7pSWJAwKcIy+N0iG
        9KkDB6HJKLdpOkO/nyh4dRaVF84SQb2vNPPhyCMtxFB0WAak2bb8S8mhB4zF3CH0ftvBkjXoHBk1j
        lXn9GQGt6AGvGJ41Jsb/VXUqUImhdk8jGfzPUaJrKaKm9H3m2LOW5RvK+roHmF5va7Rs/3C0Fi/Yg
        iNoAGMMEenG3ML28zKZZs3mCsUTgT0wAnSwGRhowW6de9Ed1X2TZvrXtds/aJBumQp91Nu+3irWcY
        Z2xba3Cw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jWDGz-0003zA-SZ; Wed, 06 May 2020 06:11:13 +0000
Date:   Tue, 5 May 2020 23:11:13 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     ira.weiny@intel.com
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>,
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
        Dan Williams <dan.j.williams@intel.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH V2 05/11] {x86,powerpc,microblaze}/kmap: Move preempt
 disable
Message-ID: <20200506061113.GA5192@infradead.org>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504010912.982044-6-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504010912.982044-6-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 03, 2020 at 06:09:06PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> During this kmap() conversion series we must maintain bisect-ability.
> To do this, kmap_atomic_prot() in x86, powerpc, and microblaze need to
> remain functional.
> 
> Create a temporary inline version of kmap_atomic_prot within these
> architectures so we can rework their kmap_atomic() calls and then lift
> kmap_atomic_prot() to the core.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> 
> ---
> Changes from V1:
> 	New patch
> ---
>  arch/microblaze/include/asm/highmem.h | 11 ++++++++++-
>  arch/microblaze/mm/highmem.c          | 10 ++--------
>  arch/powerpc/include/asm/highmem.h    | 11 ++++++++++-
>  arch/powerpc/mm/highmem.c             |  9 ++-------
>  arch/x86/include/asm/highmem.h        | 11 ++++++++++-
>  arch/x86/mm/highmem_32.c              | 10 ++--------
>  6 files changed, 36 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
> index 0c94046f2d58..ec9954b091e1 100644
> --- a/arch/microblaze/include/asm/highmem.h
> +++ b/arch/microblaze/include/asm/highmem.h
> @@ -51,7 +51,16 @@ extern pte_t *pkmap_page_table;
>  #define PKMAP_NR(virt)  ((virt - PKMAP_BASE) >> PAGE_SHIFT)
>  #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
>  
> -extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
> +extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
> +void *kmap_atomic_prot(struct page *page, pgprot_t prot)

Shouldn't this be marked inline?

The rest looks fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>
