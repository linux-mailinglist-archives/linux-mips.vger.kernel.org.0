Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDC4DAADE7
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 23:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730485AbfIEViC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 5 Sep 2019 17:38:02 -0400
Received: from mx2.suse.de ([195.135.220.15]:46820 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730193AbfIEViC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Sep 2019 17:38:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 0A7C5ABC7;
        Thu,  5 Sep 2019 21:38:01 +0000 (UTC)
Date:   Thu, 5 Sep 2019 23:38:00 +0200
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-Id: <20190905233800.0f6b3fb3722cde2f5a88663a@suse.de>
In-Reply-To: <20190905154747.GB3650@rapoport-lnx>
References: <1567662477-27404-1-git-send-email-rppt@kernel.org>
        <20190905152150.f7ff6ef70726085de63df828@suse.de>
        <20190905133251.GA3650@rapoport-lnx>
        <20190905154831.88b7853b47ba7db7bd7626bd@suse.de>
        <20190905154747.GB3650@rapoport-lnx>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 5 Sep 2019 18:47:49 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> On Thu, Sep 05, 2019 at 03:48:31PM +0200, Thomas Bogendoerfer wrote:
> > On Thu, 5 Sep 2019 16:32:53 +0300
> > Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > > On Thu, Sep 05, 2019 at 03:21:50PM +0200, Thomas Bogendoerfer wrote:
> > > > On Thu,  5 Sep 2019 08:47:57 +0300
> > > > Mike Rapoport <rppt@kernel.org> wrote:
> > > > 
> > > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > > 
> > > > > The memory initialization of SGI-IP27 is already half-way to support
> > > > > SPARSEMEM and only a call to sparse_init() was missing. Add it to
> > > > > prom_meminit() and adjust arch/mips/Kconfig to enable SPARSEMEM and
> > > > > SPARSEMEM_EXTREME for SGI-IP27
> > > > > 
> > > > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > > > > ---
> > > > > 
> > > > > Thomas, could you please test this on your Origin machine?
> > > > 
> > > > it crashes in sparse_early_usemaps_alloc_pgdat_section(). Since there is
> > > > already a sparse_init() in arch_mem_setup() I removed it from ip27-memory.c.
> > > 
> > > Oops, missed that.
> > > 
> > > > With this booting made more progress but I get an unaligned access in
> > > > kernel_init_free_pages(). 
> > > 
> > > Can you please share the log?
> > 
> > sure
> 
> Nothing looked particularly suspicious, but I've found that I've missed the
> definition of pfn_to_nid() is for DISCONTIGMEM only, maybe making it
> available for SPARSE would help :)
> 
> I'm pretty much shooting in the dark here, but can you please try the patch
> below on top of the original one:

doesn't compile: 

/home/tbogendoerfer/wip/mips/linux/include/linux/mmzone.h:1367:0: warning: "pfn_to_nid" redefined
 #define pfn_to_nid(pfn)       \


For testing I've removed the version in linux/mmzone.h, but kernel still crashes. Only
difference is that several CPUs are printing the oops in unaligned handler in parallel.
With the sparse_init() in prom_meminit() kernel dies at the same spot as before.

Thomas.

-- 
SUSE Software Solutions Germany GmbH
HRB 247165 (AG München)
Geschäftsführer: Felix Imendörffer
