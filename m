Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8A11C0C82
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 05:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgEADUa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 23:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbgEADUa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Apr 2020 23:20:30 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F23C035494;
        Thu, 30 Apr 2020 20:20:29 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jUMDs-00FZCv-Qj; Fri, 01 May 2020 03:20:20 +0000
Date:   Fri, 1 May 2020 04:20:20 +0100
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
Message-ID: <20200501032020.GG23230@ZenIV.linux.org.uk>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-10-ira.weiny@intel.com>
 <20200501023734.GF23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501023734.GF23230@ZenIV.linux.org.uk>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 01, 2020 at 03:37:34AM +0100, Al Viro wrote:
> On Thu, Apr 30, 2020 at 01:38:44PM -0700, ira.weiny@intel.com wrote:
> 
> > -static inline void *kmap_atomic(struct page *page)
> > +static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
> >  {
> >  	preempt_disable();
> >  	pagefault_disable();
> >  	if (!PageHighMem(page))
> >  		return page_address(page);
> > -	return kmap_atomic_high(page);
> > +	return kmap_atomic_high_prot(page, prot);
> >  }
> > +#define kmap_atomic(page)	kmap_atomic_prot(page, kmap_prot)
> 
> OK, so it *was* just a bisect hazard - you return to original semantics
> wrt preempt_disable()...

FWIW, how about doing the following: just before #5/10 have a patch
that would touch only microblaze, ppc and x86 splitting their
kmap_atomic_prot() into an inline helper + kmap_atomic_high_prot().
Then your #5 would leave their kmap_atomic_prot() as-is (it would
use kmap_atomic_prot_high() instead).  The rest of the series plays
out pretty much the same way it does now, and wrappers on those
3 architectures would go away when an identical generic one is
introduced in this commit (#9/10).

AFAICS, that would avoid the bisect hazard and might even end
up with less noise in the patches...
