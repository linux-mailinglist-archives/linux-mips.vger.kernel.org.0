Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71AC21ED7DC
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2020 23:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgFCVOS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Jun 2020 17:14:18 -0400
Received: from mga14.intel.com ([192.55.52.115]:59440 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbgFCVOS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Jun 2020 17:14:18 -0400
IronPort-SDR: 5ek801NqabKPt2D00nTDtDS1IuU/CQO1cyXfRunp9aTg1iaLs8ubkRYPzwaTDg5EFLjGQnjv9C
 edr5/mzdO1zQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2020 14:14:16 -0700
IronPort-SDR: /+lphg5mhpEEZkBRitWFLPKo3DT2QNviSG1HWZMRFsCRphzo4Njn3WjwLxNQkn0kQpJrJnSBuZ
 Bg3bhJF0orwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,469,1583222400"; 
   d="scan'208";a="294107077"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jun 2020 14:14:16 -0700
Date:   Wed, 3 Jun 2020 14:14:16 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org,
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
Message-ID: <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 03, 2020 at 01:57:36PM -0700, Andrew Morton wrote:
> On Thu, 21 May 2020 10:42:50 -0700 Ira Weiny <ira.weiny@intel.com> wrote:
> 
> > > > 
> > > > Actually it occurs to me that the patch consolidating kmap_prot is odd for
> > > > sparc 32 bit...
> > > > 
> > > > Its a long shot but could you try reverting this patch?
> > > > 
> > > > 4ea7d2419e3f kmap: consolidate kmap_prot definitions
> > > > 
> > > 
> > > That is not easy to revert, unfortunately, due to several follow-up patches.
> > 
> > I have gotten your sparc tests to run and they all pass...
> > 
> > 08:10:34 > ../linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
> > Build reference: v5.7-rc4-17-g852b6f2edc0f
> > 
> > Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
> > Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
> > Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
> > Building sparc32:SS-4:nosmp:initrd ... running ......... passed
> > Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
> > Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
> > Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
> > Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
> > Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
> > Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
> > Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
> > Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
> > Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
> > Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
> > Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed
> > 
> > Is there another test I need to run?
> 
> This all petered out, but as I understand it, this patchset still might
> have issues on various architectures.
> 
> Can folks please provide an update on the testing status?

I believe the tests were failing for Guenter due to another patch set...[1]

My tests with just this series are working.

From my understanding the other failures were unrelated.[2]

	<quote Mike Rapoport>
	I've checked the patch above on top of the mmots which already has
	Ira's patches and it booted fine. I've used sparc32_defconfig to build
	the kernel and qemu-system-sparc with default machine and CPU.
	</quote>

Mike, am I wrong?  Do you think the kmap() patches are still causing issues?

Ira

[1] https://lore.kernel.org/lkml/2807E5FD2F6FDA4886F6618EAC48510E92EAB1DE@CRSMSX101.amr.corp.intel.com/
[2] https://lore.kernel.org/lkml/20200520195110.GH1118872@kernel.org/

