Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7BB1DA9B2
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 07:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgETFNR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 01:13:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:41182 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726403AbgETFNR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 01:13:17 -0400
IronPort-SDR: /hKXzLxNFCTuoIpY3eoyY6djwEqBYaj8/JIMHNudlPFsyorwdXViLeje7Ke4GlgFZ8Jw7nD69l
 6iQroEJ5VxmQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 22:13:16 -0700
IronPort-SDR: WmoC4hUYiR7JNn8619hAjjYz7TWT9psqQxnwh045tX7/jT/bvy1RfqxhT5OjjfSF9i1OiaMvS+
 nDNlwL0DIiCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,412,1583222400"; 
   d="scan'208";a="264557290"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by orsmga003.jf.intel.com with ESMTP; 19 May 2020 22:13:16 -0700
Date:   Tue, 19 May 2020 22:13:16 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org,
        Christian Koenig <christian.koenig@amd.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519194215.GA71941@roeck-us.net>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 19, 2020 at 12:42:15PM -0700, Guenter Roeck wrote:
> On Tue, May 19, 2020 at 11:40:32AM -0700, Ira Weiny wrote:
> > On Tue, May 19, 2020 at 09:54:22AM -0700, Guenter Roeck wrote:
> > > On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> > > > From: Ira Weiny <ira.weiny@intel.com>
> > > > 
> > > > The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> > > > enables when vaddr is not in the fixmap.
> > > > 
> > > > Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> > > > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > > 
> > > microblazeel works with this patch,
> > 
> > Awesome...  Andrew in my rush yesterday I should have put a reported by on the
> > patch for Guenter as well.
> > 
> > Sorry about that Guenter,
> 
> No worries.
> 
> > Ira
> > 
> > > as do the nosmp sparc32 boot tests,
> > > but sparc32 boot tests with SMP enabled still fail with lots of messages
> > > such as:
> > > 
> > > BUG: Bad page state in process swapper/0  pfn:006a1
> > > page:f0933420 refcount:0 mapcount:1 mapping:(ptrval) index:0x1
> > > flags: 0x0()
> > > raw: 00000000 00000100 00000122 00000000 00000001 00000000 00000000 00000000
> > > page dumped because: nonzero mapcount
> > > Modules linked in:
> > > CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.7.0-rc6-next-20200518-00002-gb178d2d56f29 #1
> > > [f00e7ab8 :
> > > bad_page+0xa8/0x108 ]
> > > [f00e8b54 :
> > > free_pcppages_bulk+0x154/0x52c ]
> > > [f00ea024 :
> > > free_unref_page+0x54/0x6c ]
> > > [f00ed864 :
> > > free_reserved_area+0x58/0xec ]
> > > [f0527104 :
> > > kernel_init+0x14/0x110 ]
> > > [f000b77c :
> > > ret_from_kernel_thread+0xc/0x38 ]
> > > [00000000 :
> > > 0x0 ]
> > > 
> > > Code path leading to that message is different but always the same
> > > from free_unref_page().

Actually it occurs to me that the patch consolidating kmap_prot is odd for
sparc 32 bit...

Its a long shot but could you try reverting this patch?

4ea7d2419e3f kmap: consolidate kmap_prot definitions

Alternately I will need to figure out how to run the sparc on qemu here...

Thanks very much for all the testing though!  :-D

Ira

> > > 
> > > Still testing ppc images.
> > > 
> 
> ppc image tests are passing with this patch.
> 
> Guenter
