Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DF21C0C2D
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 04:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbgEAChm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 22:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728008AbgEAChm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 22:37:42 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091F0C035494;
        Thu, 30 Apr 2020 19:37:42 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jULYU-00FXQg-6F; Fri, 01 May 2020 02:37:34 +0000
Date:   Fri, 1 May 2020 03:37:34 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
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
Subject: Re: [PATCH V1 09/10] arch/kmap: Define kmap_atomic_prot() for all
 arch's
Message-ID: <20200501023734.GF23230@ZenIV.linux.org.uk>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-10-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430203845.582900-10-ira.weiny@intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 30, 2020 at 01:38:44PM -0700, ira.weiny@intel.com wrote:

> -static inline void *kmap_atomic(struct page *page)
> +static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
>  {
>  	preempt_disable();
>  	pagefault_disable();
>  	if (!PageHighMem(page))
>  		return page_address(page);
> -	return kmap_atomic_high(page);
> +	return kmap_atomic_high_prot(page, prot);
>  }
> +#define kmap_atomic(page)	kmap_atomic_prot(page, kmap_prot)

OK, so it *was* just a bisect hazard - you return to original semantics
wrt preempt_disable()...
