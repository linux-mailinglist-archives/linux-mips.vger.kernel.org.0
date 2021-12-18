Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF573479874
	for <lists+linux-mips@lfdr.de>; Sat, 18 Dec 2021 04:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhLRDag (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Dec 2021 22:30:36 -0500
Received: from mail.loongson.cn ([114.242.206.163]:51094 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231964AbhLRDaa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Dec 2021 22:30:30 -0500
Received: from loongson-pc (unknown [111.9.175.10])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx3NzOVb1h0vUBAA--.4510S2;
        Sat, 18 Dec 2021 11:30:24 +0800 (CST)
Date:   Sat, 18 Dec 2021 11:30:22 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 2/4] MIPS: tx39: adjust tx39_flush_cache_page
Message-ID: <20211218033022.bjbzmvg5e5bgfup6@loongson-pc>
References: <20211215084500.24444-1-huangpei@loongson.cn>
 <20211215084500.24444-3-huangpei@loongson.cn>
 <20211216125204.GB12930@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211216125204.GB12930@alpha.franken.de>
User-Agent: NeoMutt/20180716
X-CM-TRANSID: AQAAf9Dx3NzOVb1h0vUBAA--.4510S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF1DGw13JF1fKw45Xw4kCrg_yoW8Aw4rp3
        y7tFWrKw4kWw4UuFW7AwsFyr1xZ3sxJF4Ig3W5tryYvay5WFnrKw1UCa1F93ZxArs2yw47
        Zr4UX3ZrZry5Zw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
        0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
        0xkIwI1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUb2g4DUUUUU==
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 16, 2021 at 01:52:04PM +0100, Thomas Bogendoerfer wrote:
> On Wed, Dec 15, 2021 at 04:44:58PM +0800, Huang Pei wrote:
> > Indexed cache operation actually uses KSEG0/CKSEG0 (AKA physical
> > address, see INDEX_BASE in arch/mips/include/asm/r4kcache.h) to
> > index cache line, so it CAN NOT handle cache alias(cache alias
> > is first introduced into MIPS by R4000, indexing cache line with
> > virtual address).
> > 
> > It is said, on "32-Bit TX System TX39 Family TMPR3911/3912", P86,
> > 
> > •Translation Look-aside Buffer (TLB) (4 Kbyte Page size, 32 Entries)
> > •4Kbyte instruction cache (I-cache)
> > 	•16 bytes (4 words) per line (256 lines total)
> > 	•physical address tag per cache line
> > 	•single valid bit per cache line
> > 	•direct-mapped
> > •1 Kbyte data cache (D-cache)
> > 	•4bytes (1 word) per line (128 lines total)
> > 	•physical address tag per cache line
> > 	•write-through
> > 	•two-way set associate
> > 
> > We can assume there is NO cache alias on TX39's R3900 core
> 
> in the same sense the whole cache flushing magic isn't needed and
> we could to the same as for pure R3k CPUs. But this code is there
> and none of the user manuals I found describe excat cache behaviour.
> 
the original code is odd, I think this may be better, if we do not need
to consider cache alias

-       if (cpu_has_dc_aliases || exec)
-               tx39_blast_dcache_page_indexed(page);
+       tx39_blast_dcache_page_indexed(page);
        if (exec)
	        tx39_blast_icache_page_indexed(page);

> I've planned to retire the whole tx39 soon, so please no more patches
> for it. 
> 

Ok, I can wait. I need more test of my patch on reviving
f685a533a7f ("MIPS: make userspace mapping young by default")
> Thomas.

> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

