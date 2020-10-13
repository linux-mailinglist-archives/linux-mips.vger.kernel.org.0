Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8108828D629
	for <lists+linux-mips@lfdr.de>; Tue, 13 Oct 2020 23:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgJMVQh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Oct 2020 17:16:37 -0400
Received: from elvis.franken.de ([193.175.24.41]:60772 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbgJMVQh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Oct 2020 17:16:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kSRer-0001Go-00; Tue, 13 Oct 2020 23:16:33 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C9F13C0296; Tue, 13 Oct 2020 23:16:10 +0200 (CEST)
Date:   Tue, 13 Oct 2020 23:16:10 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Add set_memory_node()
Message-ID: <20201013211610.GA27034@alpha.franken.de>
References: <1602559183-12225-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602559183-12225-1-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 13, 2020 at 11:19:43AM +0800, Jinyang He wrote:
> Commit e7ae8d174eec ("MIPS: replace add_memory_region with memblock")

this commit just changed code and doesn't change the problem you want to
solve.

> replaced add_memory_region(, , BOOT_MEM_RAM) with memblock_add(). But
> it doesn't work well on some platforms which have NUMA like Loongson64.
> Because memblock_add() calls memblock_add_range() and sets memory at
> MAX_NUMNODES. As mm/memblock.c says, assign the region to a NUMA node
> later by using memblock_set_node(). This patch provides a NUMA port

so it says later, which doesn't have to be right after the memblock_add.
I don't know why you need the whole mem=/memmap= game, but please do a

for_each_memblock(...) 
	memblock_set_node(...);

somewhere in arch/mips/loongson64 to fix up the memory blocks as needed.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
