Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0554363AB0
	for <lists+linux-mips@lfdr.de>; Mon, 19 Apr 2021 06:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhDSE5F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Apr 2021 00:57:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42954 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229473AbhDSE5E (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Apr 2021 00:57:04 -0400
Received: from ambrosehua-HP-xw6600-Workstation (unknown [125.69.46.152])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxQ+BrDX1gGisKAA--.9026S2;
        Mon, 19 Apr 2021 12:56:14 +0800 (CST)
Date:   Mon, 19 Apr 2021 12:56:11 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        paul.burton@mips.com, paul@crapouillou.net, siyanteng@loongson.cn,
        ira.weiny@intel.com, yangtiezhu@loongson.cn, jun.jiang@ingenic.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com
Subject: Re: [PATCH] Revert "MIPS: make userspace mapping young by default".
Message-ID: <20210419045610.frhzxskec47s5rmq@ambrosehua-HP-xw6600-Workstation>
References: <1618562868-91115-1-git-send-email-zhouyanjie@wanyeetech.com>
 <20210416092003.5754967.19768.9603@loongson.cn>
 <ae06522f-eda8-96d1-6f58-072905afa65c@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae06522f-eda8-96d1-6f58-072905afa65c@wanyeetech.com>
User-Agent: NeoMutt/20171215
X-CM-TRANSID: AQAAf9CxQ+BrDX1gGisKAA--.9026S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKw1xZryDtFW5KFyxKrW7Jwb_yoWxuFWrp3
        s7Ca4xCayIqr17Aa4xAr17A34rAa97Aa48ArnrCF1jvayxZryjqrnxW34DXryDAFZYy347
        ZF9rXrn0ga48uw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
        c2xKxwCY02Avz4vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUfcTPUUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 17, 2021 at 12:45:59AM +0800, Zhou Yanjie wrote:
> 
> On 2021/4/16 下午5:20, 黄沛 wrote:
> > Is there any log about the panic?
> 
> 
> Yes, below is the log:
> 
> 
> [  195.436017] CPU 0 Unable to handle kernel paging request at virtual
> address 77eb8000, epc == 80117868, ra == 80118208
> [  195.446709] Oops[#1]:
> [  195.448977] CPU: 0 PID: 1461 Comm: Xsession Not tainted
> 5.12.0-rc6-00227-gc8fc6defbd2e-dirty #1
> [  195.457661] $ 0   : 00000000 00000001 80117864 77eb9000
> [  195.462888] $ 4   : 77eb8000 82419600 838ea000 82482ba0
> [  195.468116] $ 8   : 826f8b18 8306f800 000072d5 8306f800
> [  195.473343] $12   : 00000002 00000a03 00000001 00000402
> [  195.478568] $16   : 77eb8000 809faf60 00000004 82482ba0
> [  195.483794] $20   : 77eb8000 82419600 82482ba0 80860000
> [  195.489021] $24   : 8086121c 80117864
> [  195.494248] $28   : 838ea000 838ebd70 00000000 80118208
> [  195.499475] Hi    : 00008c4e
> [  195.502343] Lo    : 00004627
> [  195.505212] epc   : 80117868 r4k_blast_dcache_page_dc32+0x4/0x9c
> [  195.511217] ra    : 80118208 local_r4k_flush_cache_page+0x120/0x1b8
> [  195.517476] Status: 10001403 KERNEL EXL IE
> [  195.521657] Cause : 4080800c (ExcCode 03)
> [  195.525654] BadVA : 77eb8000
> [  195.528523] PrId  : 00d00100 (Ingenic XBurst)
> [  195.532866] Modules linked in:
> [  195.535911] Process Xsession (pid: 1461, threadinfo=00975a3e,
> task=3724fd66, tls=77ebd690)
> [  195.544162] Stack : 808a05ec f7edcbfd 8306f800 00000000 80860000 809faf60
> 80990a3c 80117f90
> [  195.552524]         809faf60 82419600 8306f800 801fd84c 00000000 801180b4
> 838ebe80 80110b7c
> [  195.560887]         80990a3c 82482ba0 82482ba0 77eb8000 00004627 f7edcbfd
> 838ebe80 801cbc08
> [  195.569249]         00000001 181b2000 00000000 801fa06c 00000000 83999ae0
> 80860000 00000004
> [  195.577610]         80990a3c f7edcbfd 80990a3c 838ebe80 00000004 80990a3c
> 82482ba0 04627685
> [  195.585973]         ...
> [  195.588413] Call Trace:
> [  195.590849] [<80117868>] r4k_blast_dcache_page_dc32+0x4/0x9c
> [  195.596501] [<80118208>] local_r4k_flush_cache_page+0x120/0x1b8
> [  195.602413] [<80117f90>] r4k_on_each_cpu.isra.8+0x24/0x58
> [  195.607805] [<801180b4>] r4k_flush_cache_page+0x34/0x58
> [  195.613023] [<801cbc08>] wp_page_copy+0x3a8/0x56c
> [  195.617723] [<801ce944>] do_swap_page+0x4cc/0x558
> [  195.622419] [<801cf3f8>] handle_mm_fault+0x790/0x93c
> [  195.627374] [<8011025c>] do_page_fault+0x19c/0x540
> [  195.632159] [<801142f0>] tlb_do_page_fault_1+0x10c/0x11c
> [  195.637465]
> [  195.638947] Code: 03e00008  00000000  24831000 <bc950000> bc950020 
> bc950040  bc950060  bc950080  bc9500a0
> [  195.648706]
> [  195.650243] ---[ end trace 7cc7d7f611932c42 ]---
> [  195.654857] Kernel panic - not syncing: Fatal exception
> [  195.660072] Rebooting in 10 seconds..
> 
> 
> this problem can be triggered stably (by use Microsoft Remote Desktop client
> to login to debian9 running on CU1830-Neo).
> 
Could you print out the PTE value at 0x77eb8000 ?

I really have no idea of how the page_prot setting affecting the swap
handling.

> 
> Thanks and best regards!
> 
> 
> > 
> >    Original Message
> > From: 周琰杰 (Zhou Yanjie)
> > Sent: 2021年4月16日星期五 16:48
> > To: tsbogend@alpha.franken.de
> > Cc: linux-mips@vger.kernel.org; linux-kernel@vger.kernel.org; akpm@linux-foundation.org; paul.burton@mips.com; paul@crapouillou.net; siyanteng@loongson.cn; huangpei@loongson.cn; ira.weiny@intel.com; yangtiezhu@loongson.cn; zhouyanjie@wanyeetech.com; jun.jiang@ingenic.com; dongsheng.qiu@ingenic.com; aric.pzqi@ingenic.com; rick.tyliu@ingenic.com; sernia.zhou@foxmail.com
> > Subject: [PATCH] Revert "MIPS: make userspace mapping young by default".
> > 
> > This reverts commit f685a533a7fab35c5d069dcd663f59c8e4171a75.
> > 
> > It cause kernel panic on Ingenic X1830, so let's revert it.
> > 
> > Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> > ---
> > arch/mips/mm/cache.c | 31 ++++++++++++++-----------------
> > 1 file changed, 14 insertions(+), 17 deletions(-)
> > 
> > diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
> > index 7719d63..9cfd432 100644
> > --- a/arch/mips/mm/cache.c
> > +++ b/arch/mips/mm/cache.c
> > @@ -21,7 +21,6 @@
> > #include <asm/cpu.h>
> > #include <asm/cpu-features.h>
> > #include <asm/setup.h>
> > -#include <asm/pgtable.h>
> > 
> > /* Cache operations. */
> > void (*flush_cache_all)(void);
> > @@ -157,31 +156,29 @@ unsigned long _page_cachable_default;
> > EXPORT_SYMBOL(_page_cachable_default);
> > 
> > #define PM(p)	__pgprot(_page_cachable_default | (p))
> > -#define PVA(p)	PM(_PAGE_VALID | _PAGE_ACCESSED | (p))
> > 
> > static inline void setup_protection_map(void)
> > {
> > protection_map[0] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
> > -	protection_map[1] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
> > -	protection_map[2] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
> > -	protection_map[3] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
> > -	protection_map[4] = PVA(_PAGE_PRESENT);
> > -	protection_map[5] = PVA(_PAGE_PRESENT);
> > -	protection_map[6] = PVA(_PAGE_PRESENT);
> > -	protection_map[7] = PVA(_PAGE_PRESENT);
> > +	protection_map[1] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
> > +	protection_map[2] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
> > +	protection_map[3] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
> > +	protection_map[4] = PM(_PAGE_PRESENT);
> > +	protection_map[5] = PM(_PAGE_PRESENT);
> > +	protection_map[6] = PM(_PAGE_PRESENT);
> > +	protection_map[7] = PM(_PAGE_PRESENT);
> > 
> > protection_map[8] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
> > -	protection_map[9] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
> > -	protection_map[10] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
> > +	protection_map[9] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
> > +	protection_map[10] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
> > _PAGE_NO_READ);
> > -	protection_map[11] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
> > -	protection_map[12] = PVA(_PAGE_PRESENT);
> > -	protection_map[13] = PVA(_PAGE_PRESENT);
> > -	protection_map[14] = PVA(_PAGE_PRESENT);
> > -	protection_map[15] = PVA(_PAGE_PRESENT);
> > +	protection_map[11] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
> > +	protection_map[12] = PM(_PAGE_PRESENT);
> > +	protection_map[13] = PM(_PAGE_PRESENT);
> > +	protection_map[14] = PM(_PAGE_PRESENT | _PAGE_WRITE);
> > +	protection_map[15] = PM(_PAGE_PRESENT | _PAGE_WRITE);
> > }
> > 
> > -#undef _PVA
> > #undef PM
> > 
> > void cpu_cache_init(void)

