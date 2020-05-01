Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90871C0FB3
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 10:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728452AbgEAIgy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 04:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728325AbgEAIgy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 May 2020 04:36:54 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4112C035494;
        Fri,  1 May 2020 01:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=jKY1/bxDwr65Net/8sGi43OjOzcOv/5LLiEA/MRVa7g=; b=LnfHuCMsjAn7lOVXQydmH2t5si
        oPrUOIAZBU69U3kxhYWOANIfs8sSq7V5rgpE4ZxiIoWGEnykSuEDSxDvClNdGSYNx2G1osiR/puVz
        vgIaIuZOZyW9jBnkBLJ6r5i6tLyAxZblilADgyJLJV4+N4meitaZBLfRUI0a4fxymxFMD3+VyTqyo
        +vMvkFxU/283QoM9IH5fUYBB5pQQi/e8qMy6dpFODRnRjVGnWJ8u5mmXkXxzS2T1a4uEkoddoaCgw
        R74KDtckF4JuDY5oASfn6waLSohpXnCj+DuFgl8ZqIwEn1Rn7773SDmHASfwd+QuYsBAHeRvwTN2/
        RlOwTGbg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jURAB-0003tJ-II; Fri, 01 May 2020 08:36:51 +0000
Date:   Fri, 1 May 2020 01:36:51 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     ira.weiny@intel.com
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        dri-devel@lists.freedesktop.org,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Helge Deller <deller@gmx.de>, x86@kernel.org,
        linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Chris Zankel <chris@zankel.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH V1 02/10] arch/xtensa: Move kmap build bug out of the way
Message-ID: <20200501083651.GB27858@infradead.org>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-3-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430203845.582900-3-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 30, 2020 at 01:38:37PM -0700, ira.weiny@intel.com wrote:
> @@ -88,6 +88,11 @@ void __init kmap_init(void)
>  {
>  	unsigned long kmap_vstart;
>  
> +	/* Check if this memory layout is broken because PKMAP overlaps
> +	 * page table.
> +	 */
> +	BUILD_BUG_ON(PKMAP_BASE <
> +		     TLBTEMP_BASE_1 + TLBTEMP_SIZE);

This can fit on a single line.  Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
