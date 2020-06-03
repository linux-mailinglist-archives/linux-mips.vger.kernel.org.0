Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5FB1ED7B0
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2020 22:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726235AbgFCU5j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Jun 2020 16:57:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:39446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbgFCU5j (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Jun 2020 16:57:39 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41A652067B;
        Wed,  3 Jun 2020 20:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591217858;
        bh=SA51jkVVsXD1P0/zuGau7LRvGwUl3rZwCvD7U14lHT0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=R+x3Nw9u+7nEi0n9itYHOzSOxlNljPSeK///Mzs4PX4z9nuno+Auj7Ou/r8TfYcQj
         uztZdVJR2O9plQuWNmfFkbrIVuKApSrGtnDYKJxw1kdVo7XgNWC760pouhfMKv0YAR
         x/btwctWzOGNMZ8iDeLFOfWGWVXq4qA+zZh+kfGg=
Date:   Wed, 3 Jun 2020 13:57:36 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Ira Weiny <ira.weiny@intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
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
Message-Id: <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
In-Reply-To: <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
        <20200518184843.3029640-1-ira.weiny@intel.com>
        <20200519165422.GA5838@roeck-us.net>
        <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
        <20200519194215.GA71941@roeck-us.net>
        <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
        <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
        <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 21 May 2020 10:42:50 -0700 Ira Weiny <ira.weiny@intel.com> wrote:

> > > 
> > > Actually it occurs to me that the patch consolidating kmap_prot is odd for
> > > sparc 32 bit...
> > > 
> > > Its a long shot but could you try reverting this patch?
> > > 
> > > 4ea7d2419e3f kmap: consolidate kmap_prot definitions
> > > 
> > 
> > That is not easy to revert, unfortunately, due to several follow-up patches.
> 
> I have gotten your sparc tests to run and they all pass...
> 
> 08:10:34 > ../linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
> Build reference: v5.7-rc4-17-g852b6f2edc0f
> 
> Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
> Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
> Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
> Building sparc32:SS-4:nosmp:initrd ... running ......... passed
> Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
> Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
> Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
> Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
> Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
> Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
> Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
> Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
> Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
> Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
> Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed
> 
> Is there another test I need to run?

This all petered out, but as I understand it, this patchset still might
have issues on various architectures.

Can folks please provide an update on the testing status?
