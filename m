Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6283F39DD
	for <lists+linux-mips@lfdr.de>; Sat, 21 Aug 2021 11:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233296AbhHUJ0A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Aug 2021 05:26:00 -0400
Received: from elvis.franken.de ([193.175.24.41]:41941 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233311AbhHUJ0A (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 21 Aug 2021 05:26:00 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mHNFe-0005Uw-00; Sat, 21 Aug 2021 11:25:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 504C1C081C; Sat, 21 Aug 2021 10:40:52 +0200 (CEST)
Date:   Sat, 21 Aug 2021 10:40:52 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huilong Deng <denghuilong@cdjrlc.com>
Cc:     chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Return true/false (not 1/0) from bool functions
Message-ID: <20210821084052.GA3555@alpha.franken.de>
References: <20210817025338.3552-1-denghuilong@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817025338.3552-1-denghuilong@cdjrlc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 17, 2021 at 10:53:38AM +0800, Huilong Deng wrote:
> ./arch/mips/kernel/uprobes.c:261:8-9: WARNING: return of 0/1 in function
> 'arch_uprobe_skip_sstep' with return type bool
> ./arch/mips/kernel/uprobes.c:78:10-11: WARNING: return of 0/1 in
> function 'is_trap_insn' with return type bool
> ./arch/mips/kvm/mmu.c:489:9-10: WARNING: return of 0/1 in function
> 'kvm_test_age_gfn' with return type bool
> ./arch/mips/kvm/mmu.c:445:8-9: WARNING: return of 0/1 in function
> 'kvm_unmap_gfn_range' with return type bool
> 
> Signed-off-by: Huilong Deng <denghuilong@cdjrlc.com>
> ---
>  arch/mips/kernel/uprobes.c | 10 +++++-----
>  arch/mips/kvm/mmu.c        |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
