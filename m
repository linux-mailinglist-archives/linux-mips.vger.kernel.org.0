Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345E828D543
	for <lists+linux-mips@lfdr.de>; Tue, 13 Oct 2020 22:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbgJMUQO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Oct 2020 16:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727436AbgJMUQO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Oct 2020 16:16:14 -0400
Received: from orcam.me.uk (unknown [IPv6:2001:4190:8020::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4E8E8C061755;
        Tue, 13 Oct 2020 13:16:14 -0700 (PDT)
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 9FAE72BE086;
        Tue, 13 Oct 2020 21:16:10 +0100 (BST)
Date:   Tue, 13 Oct 2020 21:16:10 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Jinyang He <hejinyang@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Add set_memory_node()
In-Reply-To: <1602559183-12225-1-git-send-email-hejinyang@loongson.cn>
Message-ID: <alpine.LFD.2.21.2010132110060.866917@eddie.linux-mips.org>
References: <1602559183-12225-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 13 Oct 2020, Jinyang He wrote:

> Commit e7ae8d174eec ("MIPS: replace add_memory_region with memblock")
> replaced add_memory_region(, , BOOT_MEM_RAM) with memblock_add(). But
> it doesn't work well on some platforms which have NUMA like Loongson64.

 Please note this is not a full review, I haven't investigated the fitness 
for purpose of this change and instead just addressed one aspect of coding 
style.

> diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
> index aa03b12..29e2d9c 100644
> --- a/arch/mips/include/asm/bootinfo.h
> +++ b/arch/mips/include/asm/bootinfo.h
> @@ -92,6 +92,10 @@ extern unsigned long mips_machtype;
>  
>  extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min,  phys_addr_t sz_max);
>  
> +#ifdef CONFIG_NUMA
> +extern void set_memory_node(phys_addr_t start, phys_addr_t size);
> +#endif
> +

 If anything this needs to be:

#ifdef CONFIG_NUMA
extern void set_memory_node(phys_addr_t start, phys_addr_t size);
#else
static inline void set_memory_node(phys_addr_t start, phys_addr_t size) {}
#endif

so as to avoid #ifdef clutter across call places.

  Maciej
