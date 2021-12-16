Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3152D47724F
	for <lists+linux-mips@lfdr.de>; Thu, 16 Dec 2021 13:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbhLPM4X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Dec 2021 07:56:23 -0500
Received: from elvis.franken.de ([193.175.24.41]:50497 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237029AbhLPM4W (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Dec 2021 07:56:22 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mxqJ3-0000kq-01; Thu, 16 Dec 2021 13:56:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C04E6C0995; Thu, 16 Dec 2021 13:52:04 +0100 (CET)
Date:   Thu, 16 Dec 2021 13:52:04 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 2/4] MIPS: tx39: adjust tx39_flush_cache_page
Message-ID: <20211216125204.GB12930@alpha.franken.de>
References: <20211215084500.24444-1-huangpei@loongson.cn>
 <20211215084500.24444-3-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211215084500.24444-3-huangpei@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 15, 2021 at 04:44:58PM +0800, Huang Pei wrote:
> Indexed cache operation actually uses KSEG0/CKSEG0 (AKA physical
> address, see INDEX_BASE in arch/mips/include/asm/r4kcache.h) to
> index cache line, so it CAN NOT handle cache alias(cache alias
> is first introduced into MIPS by R4000, indexing cache line with
> virtual address).
> 
> It is said, on "32-Bit TX System TX39 Family TMPR3911/3912", P86,
> 
> •Translation Look-aside Buffer (TLB) (4 Kbyte Page size, 32 Entries)
> •4Kbyte instruction cache (I-cache)
> 	•16 bytes (4 words) per line (256 lines total)
> 	•physical address tag per cache line
> 	•single valid bit per cache line
> 	•direct-mapped
> •1 Kbyte data cache (D-cache)
> 	•4bytes (1 word) per line (128 lines total)
> 	•physical address tag per cache line
> 	•write-through
> 	•two-way set associate
> 
> We can assume there is NO cache alias on TX39's R3900 core

in the same sense the whole cache flushing magic isn't needed and
we could to the same as for pure R3k CPUs. But this code is there
and none of the user manuals I found describe excat cache behaviour.

I've planned to retire the whole tx39 soon, so please no more patches
for it. 

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
