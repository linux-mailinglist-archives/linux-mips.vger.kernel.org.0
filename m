Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC45AAE931
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2019 13:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfIJLcv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Sep 2019 07:32:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:57556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbfIJLcu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 10 Sep 2019 07:32:50 -0400
Received: from rapoport-lnx (unknown [148.69.85.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7228B2082C;
        Tue, 10 Sep 2019 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568115170;
        bh=oVJlcC6Fa3JOCh03KW8/C6wrCtWNwPECY7yZpA43UUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s5xWQ/DsXA441n81LmgcIULE1UtAG6DK3yayVS4B55bE3N7MKkrmbIcnRuifyvso6
         IATe001oZ5KRxL6NYiIzwRg1IiQmRWc/k1O7FcGghI/l5/tH8osPxDSHu6rHH1qqgL
         OEZP254v+Oq4EsuiYJstBDsYMrwAwaNtJsIQFniU=
Date:   Tue, 10 Sep 2019 12:32:44 +0100
From:   Mike Rapoport <rppt@kernel.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-ID: <20190910113243.GA19207@rapoport-lnx>
References: <1567662477-27404-1-git-send-email-rppt@kernel.org>
 <20190905152150.f7ff6ef70726085de63df828@suse.de>
 <20190905133251.GA3650@rapoport-lnx>
 <20190905154831.88b7853b47ba7db7bd7626bd@suse.de>
 <20190905154747.GB3650@rapoport-lnx>
 <20190905233800.0f6b3fb3722cde2f5a88663a@suse.de>
 <20190906130223.GA17704@rapoport-lnx>
 <20190909182242.c1ef9717d14b20212ef75954@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190909182242.c1ef9717d14b20212ef75954@suse.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 09, 2019 at 06:22:42PM +0200, Thomas Bogendoerfer wrote:
> On Fri, 6 Sep 2019 16:02:24 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > I suspect that unaligned access comes from __page_to_pfn, can you please
> > check what scripts/fadd2line reports for kernel_init_free_pages+0xcc/0x138?
> 
> kernel_init_free_pages+0xcc/0x138:
> pagefault_disabled_dec at include/linux/uaccess.h:173
> (inlined by) pagefault_enable at include/linux/uaccess.h:200
> (inlined by) __kunmap_atomic at include/linux/highmem.h:101
> (inlined by) clear_highpage at include/linux/highmem.h:215
> (inlined by) kernel_init_free_pages at mm/page_alloc.c:1124
> 
> While making some sense out of this I booted the system a few times
> with the same kernel and I get different crashes (it even booted once
> to userspace).
> 
> Here a list (decoded with fadd2line)

... 
 
> I couldn't make real sense out of this yet, but maybe it gives
> a hint for you.

Unfortunately, no :(

Before we start adding printks, can you please run with
CONFIG_DEBUG_MEMORY_INIT=y and with 

mminit_loglevel=4 ignore_loglevel

in the command line?

> Thomas.
> 
> -- 
> SUSE Software Solutions Germany GmbH
> HRB 247165 (AG München)
> Geschäftsführer: Felix Imendörffer

-- 
Sincerely yours,
Mike.
