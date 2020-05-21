Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4981DD4A9
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 19:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbgEURmx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 13:42:53 -0400
Received: from mga04.intel.com ([192.55.52.120]:32606 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727966AbgEURmw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 May 2020 13:42:52 -0400
IronPort-SDR: LGtdCXt1sxDmvx/NGhfkjzU/4AW/abq8PW8PIYDNsJ67/12zE+KYF/tGmaOm/u91qRVPoWj3o9
 Pq2hOgekXfCA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 10:42:51 -0700
IronPort-SDR: s5ulawStg94Cu9y3YOCakFhS9iVyiQrqWbqZMNZIpr4rCQpdet6Bu4hecbYJ8KDWYPUF1KKYgT
 4/nzZR2X+tUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,418,1583222400"; 
   d="scan'208";a="265129438"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by orsmga003.jf.intel.com with ESMTP; 21 May 2020 10:42:50 -0700
Date:   Thu, 21 May 2020 10:42:50 -0700
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
Message-ID: <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 09:05:41AM -0700, Guenter Roeck wrote:
> On 5/19/20 10:13 PM, Ira Weiny wrote:
> > On Tue, May 19, 2020 at 12:42:15PM -0700, Guenter Roeck wrote:
> >> On Tue, May 19, 2020 at 11:40:32AM -0700, Ira Weiny wrote:
> >>> On Tue, May 19, 2020 at 09:54:22AM -0700, Guenter Roeck wrote:
> >>>> On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> >>>>> From: Ira Weiny <ira.weiny@intel.com>
> >>>>>
> >>>>> The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> >>>>> enables when vaddr is not in the fixmap.
> >>>>>
> >>>>> Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> >>>>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> >>>>
> >>>> microblazeel works with this patch,
> >>>
> >>> Awesome...  Andrew in my rush yesterday I should have put a reported by on the
> >>> patch for Guenter as well.
> >>>
> >>> Sorry about that Guenter,
> >>
> >> No worries.
> >>
> >>> Ira
> >>>
> >>>> as do the nosmp sparc32 boot tests,
> >>>> but sparc32 boot tests with SMP enabled still fail with lots of messages
> >>>> such as:
> >>>>
> >>>> BUG: Bad page state in process swapper/0  pfn:006a1
> >>>> page:f0933420 refcount:0 mapcount:1 mapping:(ptrval) index:0x1
> >>>> flags: 0x0()
> >>>> raw: 00000000 00000100 00000122 00000000 00000001 00000000 00000000 00000000
> >>>> page dumped because: nonzero mapcount
> >>>> Modules linked in:
> >>>> CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.7.0-rc6-next-20200518-00002-gb178d2d56f29 #1
> >>>> [f00e7ab8 :
> >>>> bad_page+0xa8/0x108 ]
> >>>> [f00e8b54 :
> >>>> free_pcppages_bulk+0x154/0x52c ]
> >>>> [f00ea024 :
> >>>> free_unref_page+0x54/0x6c ]
> >>>> [f00ed864 :
> >>>> free_reserved_area+0x58/0xec ]
> >>>> [f0527104 :
> >>>> kernel_init+0x14/0x110 ]
> >>>> [f000b77c :
> >>>> ret_from_kernel_thread+0xc/0x38 ]
> >>>> [00000000 :
> >>>> 0x0 ]
> >>>>
> >>>> Code path leading to that message is different but always the same
> >>>> from free_unref_page().
> > 
> > Actually it occurs to me that the patch consolidating kmap_prot is odd for
> > sparc 32 bit...
> > 
> > Its a long shot but could you try reverting this patch?
> > 
> > 4ea7d2419e3f kmap: consolidate kmap_prot definitions
> > 
> 
> That is not easy to revert, unfortunately, due to several follow-up patches.

I have gotten your sparc tests to run and they all pass...

08:10:34 > ../linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
Build reference: v5.7-rc4-17-g852b6f2edc0f

Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
Building sparc32:SS-4:nosmp:initrd ... running ......... passed
Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed

Is there another test I need to run?

Ira


> 
> Guenter
> 
> > Alternately I will need to figure out how to run the sparc on qemu here...
> > 
> > Thanks very much for all the testing though!  :-D
> > 
> > Ira
> > 
> >>>>
> >>>> Still testing ppc images.
> >>>>
> >>
> >> ppc image tests are passing with this patch.
> >>
> >> Guenter
> 
