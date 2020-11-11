Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485D42AFC29
	for <lists+linux-mips@lfdr.de>; Thu, 12 Nov 2020 02:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbgKLBdT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 20:33:19 -0500
Received: from elvis.franken.de ([193.175.24.41]:54619 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727759AbgKKXGN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Nov 2020 18:06:13 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kczBl-0005fC-02; Thu, 12 Nov 2020 00:06:05 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C55E3C4DDF; Thu, 12 Nov 2020 00:04:07 +0100 (CET)
Date:   Thu, 12 Nov 2020 00:04:07 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v3 0/6] Modify some registers operations and move
 decode_cpucfg() to loongson_regs.h
Message-ID: <20201111230407.GC19275@alpha.franken.de>
References: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 03, 2020 at 03:11:59PM +0800, Tiezhu Yang wrote:
> v2: Add some callbacks in csr_ipi probe() for patch #4
> v3: Update the commit message and comment for patch #5
> 
> Tiezhu Yang (6):
>   MIPS: Loongson64: Do not write the read only field LPA of CP0_CONFIG3
>   MIPS: Loongson64: Set the field ELPA of CP0_PAGEGRAIN only once
>   MIPS: Loongson64: Set IPI_Enable register per core by itself
>   MIPS: Loongson64: Add Mail_Send support for 3A4000+ CPU
>   MIPS: Loongson64: SMP: Fix up play_dead jump indicator
>   MIPS: Loongson64: Move decode_cpucfg() to loongson_regs.h
> 
>  .../asm/mach-loongson64/kernel-entry-init.h        |   8 --
>  .../include/asm/mach-loongson64/loongson_regs.h    |  34 ++++++
>  arch/mips/kernel/cpu-probe.c                       |  31 +-----
>  arch/mips/loongson64/numa.c                        |  20 +---
>  arch/mips/loongson64/smp.c                         | 123 +++++++++++++++++----
>  5 files changed, 136 insertions(+), 80 deletions(-)

applied patches 1-5 of this series to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
