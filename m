Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724BC1C320A
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2020 07:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgEDFEv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 May 2020 01:04:51 -0400
Received: from mga12.intel.com ([192.55.52.136]:43373 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgEDFEu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 May 2020 01:04:50 -0400
IronPort-SDR: RI4gvK+9HDVAKbRklvMRzIq+pixxdYwbvyTVuNGFD83c+J+nmEf9PVYs8K3ZAJRRWmwQxHCADe
 82/fHngT1KIw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2020 22:04:49 -0700
IronPort-SDR: MxCGejezytWAFr2qtWtnEu9Zlbx9sDBny4KBWGPuntnxpb8eeVieC20Y3SJ8U7XteAAgk3t7Pj
 fSoUNNLnXPgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,350,1583222400"; 
   d="scan'208";a="295395757"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by orsmga008.jf.intel.com with ESMTP; 03 May 2020 22:04:48 -0700
Date:   Sun, 3 May 2020 22:04:47 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Al Viro <viro@zeniv.linux.org.uk>
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
Subject: Re: [PATCH V2 00/11] Subject: Remove duplicated kmap code
Message-ID: <20200504050447.GA979899@iweiny-DESK2.sc.intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504013509.GU23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504013509.GU23230@ZenIV.linux.org.uk>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 04, 2020 at 02:35:09AM +0100, Al Viro wrote:
> On Sun, May 03, 2020 at 06:09:01PM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The kmap infrastructure has been copied almost verbatim to every architecture.
> > This series consolidates obvious duplicated code by defining core functions
> > which call into the architectures only when needed.
> > 
> > Some of the k[un]map_atomic() implementations have some similarities but the
> > similarities were not sufficient to warrant further changes.
> > 
> > In addition we remove a duplicate implementation of kmap() in DRM.
> > 
> > Testing was done by 0day to cover all the architectures I can't readily
> > build/test.
> 
> OK...  Looking through my old notes on kmap unification (this winter, never
> went anywhere),
> 
> * arch/mips/mm/cache.c ought to use linux/highmem.h, not asm/highmem.h
> I suspect that your series doesn't build on some configs there.  Hadn't
> verified that, though.

Yes patch 6 makes the change because kmap_atomic() was no longer declared in
asm/highmem.h.  I'm pretty sure 0-day caught that ...  but I seem to remember
noticing some oddness in that file and I did go through it by hand.

> 
> * kmap_atomic_to_page() is dead, but not quite gone - csky and nds32 brought
> the damn thing back (nds32 - only an extern).  It needs killin'...

Easy enough. Added as a follow on patch.

> 
> * parisc is (arguably) abusing kunmap()/kunmap_atomic() for cache flushing.
> Replace the bulk of its highmem.h with
> #define ARCH_HAS_FLUSH_ON_KUNMAP
> #define arch_before_kunmap flush_kernel_dcache_page_addr
> and have default kunmap()/kunmap_atomic() do
> #ifdef ARCH_HAS_FLUSH_ON_KUNMAP
> 	arch_before_kunmap(page_address(page));
> #endif
> and
> #ifdef ARCH_HAS_FLUSH_ON_KUNMAP
> 	arch_before_kunmap(addr);
> #endif
> resp.  Kills ARCH_HAS_KMAP along with ifdefs on it, makes parisc use somewhat
> less hacky.

Agreed.  Done in a follow on patch.

> 
> I'd suggest checking various configs on mips - that's likely to cause headache.
> Said that, my analysis of include chains back then is pretty much worthless
> by now - I really hate the amount of indirect include chains leading to that
> sucker on some, but not all configs ;-/  IIRC, the proof that everything
> using kmap*/kunmap* would pull linux/highmem.h regardless of config took several
> hours of digging, ran for several pages and had been hopelessly brittle.
> arch/mips/mm/cache.c was the only exception caught by it, but these days
> there might be more.

Grepping for 'asm/highmem.h' and investigations don't reveal any issues...  But
you do have me worried.  That said 0-day has been crunching on multiple
versions of this series without issues such as this (save the mips issue
above).

I have to say it would be nice if the relation between linux/highmem.h and
asm/highmem.h was more straightforward.

Ira

