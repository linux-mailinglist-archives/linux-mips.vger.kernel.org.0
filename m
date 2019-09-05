Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F032AA47C
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 15:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbfIENc6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 09:32:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:53076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727514AbfIENc6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Sep 2019 09:32:58 -0400
Received: from rapoport-lnx (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F90F206DE;
        Thu,  5 Sep 2019 13:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567690377;
        bh=gAfpREAUjPx32bCVpX/QRONrGLArS9EYowVV+J13G2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZPtL/gE9krL/IhempLi40HKIdV/N1wp5V5h2NnWuIEQ5s8ZLexH/BzM6btza01Tn5
         vEbfq7ciYK9AeyCxqIifTErleu0e2Oe8cRnPLbKamyYMgRg0Cn57fQAovmRYWSqCib
         WMLnf9IqsMzJkqH9GYjlNhXmeB76s0wF4U04thJs=
Date:   Thu, 5 Sep 2019 16:32:53 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-ID: <20190905133251.GA3650@rapoport-lnx>
References: <1567662477-27404-1-git-send-email-rppt@kernel.org>
 <20190905152150.f7ff6ef70726085de63df828@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190905152150.f7ff6ef70726085de63df828@suse.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 05, 2019 at 03:21:50PM +0200, Thomas Bogendoerfer wrote:
> On Thu,  5 Sep 2019 08:47:57 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > The memory initialization of SGI-IP27 is already half-way to support
> > SPARSEMEM and only a call to sparse_init() was missing. Add it to
> > prom_meminit() and adjust arch/mips/Kconfig to enable SPARSEMEM and
> > SPARSEMEM_EXTREME for SGI-IP27
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> > 
> > Thomas, could you please test this on your Origin machine?
> 
> it crashes in sparse_early_usemaps_alloc_pgdat_section(). Since there is
> already a sparse_init() in arch_mem_setup() I removed it from ip27-memory.c.

Oops, missed that.

> With this booting made more progress but I get an unaligned access in
> kernel_init_free_pages(). 

Can you please share the log?
 
> My time is a little bit limited today to dig deeper, but testing patches
> is easy.
> 
> Thomas.
> 
> -- 
> SUSE Software Solutions Germany GmbH
> HRB 247165 (AG München)
> Geschäftsführer: Felix Imendörffer

-- 
Sincerely yours,
Mike.
