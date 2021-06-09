Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 205D23A15D5
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jun 2021 15:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbhFINo1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Jun 2021 09:44:27 -0400
Received: from linux.microsoft.com ([13.77.154.182]:44608 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235626AbhFINoX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Jun 2021 09:44:23 -0400
Received: from sequoia (162-237-133-238.lightspeed.rcsntx.sbcglobal.net [162.237.133.238])
        by linux.microsoft.com (Postfix) with ESMTPSA id D272620B7188;
        Wed,  9 Jun 2021 06:42:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D272620B7188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1623246148;
        bh=3S0cjPrBcR+3nBH/+d3KjavqI+i+G4sJoTL48oxLtdQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qWew9gMXEfvQXlEdgUzSmBYt4Blq8X3RkJIgXec0dXMxhEoTLTt8nxeUWtp8mvbcN
         N2olqKxlUkY0gVuTrdDTiaremHWVOWXcSYLnNzkWuLdgAqr7Co+zRo5wBaw28oLOLV
         t67gt0mIsiMc2R/dznDUDY7cYrbAF+XbaBACABXQ=
Date:   Wed, 9 Jun 2021 08:42:25 -0500
From:   Tyler Hicks <tyhicks@linux.microsoft.com>
To:     Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>
Cc:     Rijo-john.Thomas@amd.com, Allen Pais <apais@linux.microsoft.com>,
        Peter Huewe <peterhuewe@gmx.de>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Vikas Gupta <vikas.gupta@broadcom.com>,
        Thirupathaiah Annapureddy <thiruan@microsoft.com>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        op-tee@lists.trustedfirmware.org,
        linux-integrity <linux-integrity@vger.kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/7] tee: Support shm registration without dma-buf
 backing
Message-ID: <20210609134225.GC4910@sequoia>
References: <20210609002326.210024-1-tyhicks@linux.microsoft.com>
 <20210609002326.210024-6-tyhicks@linux.microsoft.com>
 <CAFA6WYOZC0iHzZm6pOxz31eW_=8g2wyJdm4wiOGKggO6-a9MdA@mail.gmail.com>
 <20210609054621.GB4910@sequoia>
 <CAFA6WYOYt2vcQ4ng=Nwu2R7d6=R=DGXQKpQ-+UiENerEtQRKWg@mail.gmail.com>
 <20210609121533.GA2267052@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609121533.GA2267052@jade>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-06-09 14:15:33, Jens Wiklander wrote:
> Hi,
> 
> On Wed, Jun 09, 2021 at 04:22:49PM +0530, Sumit Garg wrote:
> > + Rijo
> > 
> > On Wed, 9 Jun 2021 at 11:16, Tyler Hicks <tyhicks@linux.microsoft.com> wrote:
> > >
> > > On 2021-06-09 09:59:04, Sumit Garg wrote:
> > > > Hi Tyler,
> > >
> > > Hey Sumit - Thanks for the review.
> > >
> > > >
> > > > On Wed, 9 Jun 2021 at 05:55, Tyler Hicks <tyhicks@linux.microsoft.com> wrote:
> > > > >
> > > > > Uncouple the registration of dynamic shared memory buffers from the
> > > > > TEE_SHM_DMA_BUF flag. Drivers may wish to allocate dynamic shared memory
> > > > > regions but do not need them to be backed by a dma-buf when the memory
> > > > > region is private to the driver.
> > > >
> > > > In this case drivers should use tee_shm_register() instead where the
> > > > memory allocated is actually private to the driver. However, you need
> > > > to remove TEE_SHM_DMA_BUF as a mandatory flag for tee_shm_register().
> > > > Have a look at an example here [1]. So modifying tee_shm_alloc() for
> > > > this purpose doesn't look appropriate to me.
> > > >
> > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/security/keys/trusted-keys/trusted_tee.c#n73
> > >
> > > I noticed what you did in commit 2a6ba3f794e8 ("tee: enable support to
> > > register kernel memory") and considered moving ftpm and tee_bnxt_fw over
> > > to tee_shm_register(). I think that's likely the right long term
> > > approach but I decided against it since this series is a minimal set of
> > > bug fixes that will hopefully go to stable (I'm affected by these bugs
> > > in 5.4). Here are my reasons for feeling like moving to
> > > tee_shm_register() isn't minimal in terms of a stable-focused fix:
> > >
> > > - tee_shm_alloc() looks like it should work fine with AMD-TEE today.
> > >   tee_shm_register() definitely does not since AMD-TEE doesn't provide a
> > >   .shm_register or .shm_unregister hook. This may break existing users
> > >   of AMD-TEE?
> > 
> > AFAIK, ftpm and tee_bnxt_fw drivers only support OP-TEE at this point.
> > See ftpm_tee_match() and optee_ctx_match() APIs in corresponding
> > drivers.
> > 
> > > - tee_shm_register() has not historically been used for kernel
> > >   allocations and is not fixed wrt the bug that Jens fixed in commit
> > >   f1bbacedb0af ("tee: don't assign shm id for private shms").
> > 
> > Yes, that's what I meant earlier to make the TEE_SHM_DMA_BUF flag optional.
> > 
> > > - tee_shm_alloc() performs allocations using contiguous pages
> > >   from alloc_pages() while tee_shm_register() performs non-contiguous
> > >   allocations with kcalloc(). I suspect this would be fine but I don't
> > >   know the secure world side of these things well enough to assess the
> > >   risk involved with such a change on the kernel side.
> > >
> > 
> > I don't think that would make any difference.
> > 
> > > I should have mentioned this in the cover letter but my hope was that
> > > these minimal changes would be accepted and then additional work could
> > > be done to merge tee_shm_alloc() and tee_shm_register() in a way that
> > > would allow the caller to request contiguous or non-contiguous pages,
> > > fix up the additional issues mentioned above, and then adjust the
> > > call sites in ftpm and tee_bnxt_fw as appropriate.
> > >
> > > I think that's a bigger set of changes because there are several things
> > > that still confuse/concern me:
> > >
> > > - Why does tee_shm_alloc() use TEE_SHM_MAPPED while tee_shm_register()
> > >   uses TEE_SHM_KERNEL_MAPPED or TEE_SHM_USER_MAPPED? Why do all three
> > >   exist?
> > 
> > AFAIK, its due the the inherent nature of tee_shm_alloc() and
> > tee_shm_register() where tee_shm_alloc() doesn't need to know whether
> > its a kernel or user-space memory since it is the one that allocates
> > whereas tee_shm_register() need to know that since it has to register
> > pre-allocated client memory.
> > 
> > > - Why does tee_shm_register() unconditionally use non-contiguous
> > >   allocations without ever taking into account whether or not
> > >   OPTEE_SMC_SEC_CAP_DYNAMIC_SHM was set? It sounds like that's required
> > >   from my reading of https://optee.readthedocs.io/en/latest/architecture/core.html#noncontiguous-shared-buffers.
> > 
> > Yeah, but do we have platforms in OP-TEE that don't support dynamic
> > shared memory? I guess it has become the sane default which is a
> > mandatory requirement when it comes to OP-TEE driver in u-boot.
> > 
> > > - Why is TEE_SHM_REGISTER implemented at the TEE driver level when it is
> > >   specific to OP-TEE? How to better abstract that away?
> > >
> > 
> > I would like you to go through Section "3.2.4. Shared Memory" in TEE
> > Client API Specification. There are two standard ways for shared
> > memory approach with TEE:
> > 
> > 1. A Shared Memory block can either be existing Client Application
> > memory (kernel driver in our case) which is subsequently registered
> > with the TEE Client API (using tee_shm_register() in our case).
> > 
> > 2. Or memory which is allocated on behalf of the Client Application
> > using the TEE
> > Client API (using tee_shm_alloc() in our case).
> > 
> > > Let me know if you agree with the more minimal approach that I took for
> > > these bug fix series or still feel like tee_shm_register() should be
> > > fixed up so that it is usable. Thanks!
> > 
> > From drivers perspective I think the change should be:
> > 
> > tee_shm_alloc()
> > 
> > to
> > 
> > kcalloc()
> > tee_shm_register()
> 
> I've just posted "[PATCH 0/7] tee: shared memory updates",
> https://lore.kernel.org/lkml/20210609102324.2222332-1-jens.wiklander@linaro.org/
> 
> Where tee_shm_alloc() is replaced by among other functions
> tee_shm_alloc_kernel_buf(). tee_shm_alloc_kernel_buf() takes care of the
> problem with TEE_SHM_DMA_BUF.

Thanks! At first glance, that series would take care of the last three
patches in my kexec/kdump series.

I'm a bit worried that it is a rewrite of the shm allocator. Do you plan
to send all of that to stable? (I mentioned earlier in this thread that
I'm affected by these bugs in linux-5.4.y.)

Also, you and Sumit don't seem to have the same opinion on kernel
drivers making use of tee_shm_register() for allocations that are only
used internally. Can you comment on that?

I'm not clear on the next steps for fixing these kexec/kdump bugs in
older releases. I appreciate any guidance here.

Tyler

> 
> Cheers,
> Jens
> 
