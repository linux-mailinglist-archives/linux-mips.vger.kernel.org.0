Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86492AA437
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 15:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731556AbfIENVv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 5 Sep 2019 09:21:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:60580 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726097AbfIENVv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Sep 2019 09:21:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 79872B035;
        Thu,  5 Sep 2019 13:21:50 +0000 (UTC)
Date:   Thu, 5 Sep 2019 15:21:50 +0200
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-Id: <20190905152150.f7ff6ef70726085de63df828@suse.de>
In-Reply-To: <1567662477-27404-1-git-send-email-rppt@kernel.org>
References: <1567662477-27404-1-git-send-email-rppt@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu,  5 Sep 2019 08:47:57 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The memory initialization of SGI-IP27 is already half-way to support
> SPARSEMEM and only a call to sparse_init() was missing. Add it to
> prom_meminit() and adjust arch/mips/Kconfig to enable SPARSEMEM and
> SPARSEMEM_EXTREME for SGI-IP27
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
> 
> Thomas, could you please test this on your Origin machine?

it crashes in sparse_early_usemaps_alloc_pgdat_section(). Since there is
already a sparse_init() in arch_mem_setup() I removed it from ip27-memory.c.
With this booting made more progress but I get an unaligned access in
kernel_init_free_pages(). 

My time is a little bit limited today to dig deeper, but testing patches
is easy.

Thomas.

-- 
SUSE Software Solutions Germany GmbH
HRB 247165 (AG München)
Geschäftsführer: Felix Imendörffer
