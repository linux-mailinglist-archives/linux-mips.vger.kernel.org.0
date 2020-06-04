Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63BCE1EDD5B
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2020 08:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgFDGni (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Jun 2020 02:43:38 -0400
Received: from mga11.intel.com ([192.55.52.93]:50353 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726248AbgFDGni (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Jun 2020 02:43:38 -0400
IronPort-SDR: yjs1WZ+4yqgFJQFhCUGU/ty04bW+Hfm0paEKyaafTTUVorzi8NtMtpwJzF0J2MkCGZisjfpvKr
 h2ErY3F/JJgw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2020 23:43:37 -0700
IronPort-SDR: qLkuqIEEQFEH1TV5HnSysQza63rrf1zfSA97eNVzKr6bXzJ9VY74YOzF3Wl+1ZUuQyJZwMvFxc
 fP2COJ1wBMoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,471,1583222400"; 
   d="scan'208";a="304620121"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2020 23:43:36 -0700
Date:   Wed, 3 Jun 2020 23:43:36 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
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
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org,
        Christian Koenig <christian.koenig@amd.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200604064336.GC1740285@iweiny-DESK2.sc.intel.com>
References: <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
 <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
 <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
 <20200604061805.GA202650@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604061805.GA202650@kernel.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 04, 2020 at 09:18:05AM +0300, Mike Rapoport wrote:
> On Wed, Jun 03, 2020 at 04:44:17PM -0700, Guenter Roeck wrote:
> > On 6/3/20 2:14 PM, Ira Weiny wrote:
> > > On Wed, Jun 03, 2020 at 01:57:36PM -0700, Andrew Morton wrote:
> > >> On Thu, 21 May 2020 10:42:50 -0700 Ira Weiny <ira.weiny@intel.com> wrote:
> > >>
> > >>>>>
> > >>>>> Actually it occurs to me that the patch consolidating kmap_prot is odd for
> > >>>>> sparc 32 bit...
> > >>>>>
> > >>>>> Its a long shot but could you try reverting this patch?
> > >>>>>
> > >>>>> 4ea7d2419e3f kmap: consolidate kmap_prot definitions
> > >>>>>
> > >>>>
> > >>>> That is not easy to revert, unfortunately, due to several follow-up patches.
> > >>>
> > >>> I have gotten your sparc tests to run and they all pass...
> > >>>
> > >>> 08:10:34 > ../linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
> > >>> Build reference: v5.7-rc4-17-g852b6f2edc0f
> > >>>
> > >>> Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
> > >>> Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
> > >>> Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-4:nosmp:initrd ... running ......... passed
> > >>> Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
> > >>> Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
> > >>> Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
> > >>> Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
> > >>> Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed
> > >>>
> > >>> Is there another test I need to run?
> > >>
> > >> This all petered out, but as I understand it, this patchset still might
> > >> have issues on various architectures.
> > >>
> > >> Can folks please provide an update on the testing status?
> > > 
> > > I believe the tests were failing for Guenter due to another patch set...[1]
> > > 
> > > My tests with just this series are working.
> > > 
> > >>From my understanding the other failures were unrelated.[2]
> > > 
> > > 	<quote Mike Rapoport>
> > > 	I've checked the patch above on top of the mmots which already has
> > > 	Ira's patches and it booted fine. I've used sparc32_defconfig to build
> > > 	the kernel and qemu-system-sparc with default machine and CPU.
> > > 	</quote>
> > > 
> > > Mike, am I wrong?  Do you think the kmap() patches are still causing issues?
> 
> sparc32 UP and microblaze work for me with next-20200603, but I didn't
> test other architectures. 
>  
> > For my part, all I can say is that -next is in pretty bad shape right now.
> > The summary of my tests says:
> > 
> > Build results:
> > 	total: 151 pass: 130 fail: 21
> > Qemu test results:
> > 	total: 430 pass: 375 fail: 55
> > 
> > sparc32 smp images in next-20200603 still crash for me with a spinlock
> > recursion.
> 
> I think this is because Will's fixes [1] are not yet in -next.
> 
> > s390 images hang early in boot. Several others (alpha, arm64,
> > various ppc) don't even compile. I can run some more bisects over time,
> > but this is becoming a full-time job :-(.
> > 
> > Guenter
> 
> [1] https://lore.kernel.org/lkml/20200526173302.377-1-will@kernel.org

I abandoned the bisect and tested with this fix.[1]  It passes.  Guenter, on
the original thread we had microblaze and ppc working with my fix.

https://lore.kernel.org/lkml/20200519194215.GA71941@roeck-us.net/

Sounds like the current failures above are from something much newer in the
tree.

Ira

[1]
23:26:24 > /home/iweiny/dev/linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
Build reference: next-20200603-3-gf5afe92a2135

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


> -- 
> Sincerely yours,
> Mike.
