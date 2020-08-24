Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D2F24FB3B
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 12:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgHXKT7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 06:19:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39210 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725906AbgHXKT7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 06:19:59 -0400
Received: from ambrosehua-HP-xw6600-Workstation (unknown [222.209.10.89])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxqMU_lENfWVwNAA--.18667S2;
        Mon, 24 Aug 2020 18:19:50 +0800 (CST)
Date:   Mon, 24 Aug 2020 18:19:43 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, lixuefeng@loongson.cn,
        gaojuxin@loongson.cn, yangtiezhu@loongson.cn,
        tsbogend@alpha.franken.de
Subject: Re: [PATCH 3/3] Revert "MIPS: Flush wrong invalid FTLB entry for
 huge page"
Message-ID: <20200824101943.s2l4hfvqlz3zpyqq@ambrosehua-HP-xw6600-Workstation>
References: <20200821072329.18006-1-huangpei@loongson.cn>
 <20200821072329.18006-3-huangpei@loongson.cn>
 <CAAhV-H4pg0pL_Sh+ibYcPs2QjzMJxDOhNwBi3AT=481NOB-5zA@mail.gmail.com>
 <20200822042707.5754967.41900.8563@loongson.cn>
 <CAAhV-H72uX0nPLgTBp+cA71Q1G97M98WA=e__8XvutTpD5jgAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H72uX0nPLgTBp+cA71Q1G97M98WA=e__8XvutTpD5jgAQ@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-CM-TRANSID: AQAAf9DxqMU_lENfWVwNAA--.18667S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr17CFy3ZryxWryxJryUGFg_yoW7CF13pr
        9YyFs8AF4jqr1UWr1vvF90qF1S93yDK392qrsrtFy5Xa4qy3Z3GFs5Kr1Fyr97CFZ7Zw4I
        9r1jgrZxWF97ZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUym14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l
        4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
        AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
        cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
        8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
        14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUywZ7UUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 24, 2020 at 03:13:20PM +0800, Huacai Chen wrote:

the fix in __update_tlb is same as [1], which is to check if the CP0
index returned by tlbp is in FTLB range, if so, then invalidate this
entry and rewrite it with Huge Page by tlbwr again, otherwise tlbwr 
when not hit or tlbwi when hit in VTLB range.

The previous patch, aka patch 2, just reveal the problem *explicitly*. Just 
with Patch 3 but without Patch 2, the __update_tlb would write a Huge Page
mapping into VTLB without _PAGE_VALID set successfully, which still need [1]
to cover it in the second TLb Invalid exception, and make Patch 3 looks
like DOES NOT WORK

Anyway，Patch 3 can not fix it perfectly, without Patch 2

> Hi, Pei,
> 
> On Sat, Aug 22, 2020 at 12:27 PM 黄沛 <huangpei@loongson.cn> wrote:
> >
> >
> > ‎
> >   原始消息
> > 发件人： Huacai Chen
> > 已发送： 2020年8月21日星期五 18:37
> > 收件人： Huang Pei
> > 抄送： Thomas Bogendoerfer; Paul Ambrose; Li Xuefeng; Yang Tiezhu; Gao Juxin; Fuxin Zhang; open list:MIPS
> > 主题： Re: [PATCH 3/3] Revert "MIPS: Flush wrong invalid FTLB entry for huge page"
> >
> > Got it, it is "too late", anything else?
> >
> > I will re-send it next week
> How to fix it in __update_tlb? the previous patch?
> 
> Huacai
> >
> >
> > On Fri, Aug 21, 2020 at 3:24 PM Huang Pei <huangpei@loongson.cn> wrote:
> > >
> > > This reverts commit 0115f6cbf26663c86496bc56eeea293f85b77897.
> > >
> > > The fix in 0115f6cbf26663c86496bc56eeea293f85b77897 is two late, since
> > Do you means "too late"?
> >
> > > __update_tlb hit the same problem first. So let __update_tlb fix it
> > >
> > > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > > ---
> > > arch/mips/mm/tlb-r4k.c | 15 ++++++++++++++-
> > > arch/mips/mm/tlbex.c | 25 ++++---------------------
> > > 2 files changed, 18 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
> > > index 38e2894d5fa3..cb8afa326b2c 100644
> > > --- a/arch/mips/mm/tlb-r4k.c
> > > +++ b/arch/mips/mm/tlb-r4k.c
> > > @@ -328,6 +328,7 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
> > > /* this could be a huge page */
> > > if (pmd_huge(*pmdp)) {
> > > unsigned long lo;
> > > + unsigned long entryhi;
> > > write_c0_pagemask(PM_HUGE_MASK);
> > > ptep = (pte_t *)pmdp;
> > > lo = pte_to_entrylo(pte_val(*ptep));
> > > @@ -335,7 +336,19 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
> > > write_c0_entrylo1(lo + (HPAGE_SIZE >> 7));
> > >
> > > mtc0_tlbw_hazard();
> > > - if (idx < 0)
> > > + if (idx >= current_cpu_data.tlbsizevtlb) {
> > > + /* hit in FTLB.
> > > + * Invalid it then tlbwr, since FTLB hold only base page*/
> > > + entryhi = read_c0_entryhi();
> > > + write_c0_entryhi(MIPS_ENTRYHI_EHINV);
> > > + tlb_write_indexed();
> > > + tlbw_use_hazard();
> > > + write_c0_entryhi(entryhi);
> > > +
> > > + }
> > > +
> > > +
> > > + if (idx < 0 || idx >= current_cpu_data.tlbsizevtlb)
> > > tlb_write_random();
> > > else
> > > tlb_write_indexed();
> > > diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
> > > index 14f8ba93367f..9c4cd08c00d3 100644
> > > --- a/arch/mips/mm/tlbex.c
> > > +++ b/arch/mips/mm/tlbex.c
> > > @@ -762,8 +762,7 @@ static void build_huge_update_entries(u32 **p, unsigned int pte,
> > > static void build_huge_handler_tail(u32 **p, struct uasm_reloc **r,
> > > struct uasm_label **l,
> > > unsigned int pte,
> > > - unsigned int ptr,
> > > - unsigned int flush)
> > > + unsigned int ptr)
> > > {
> > > #ifdef CONFIG_SMP
> > > UASM_i_SC(p, pte, 0, ptr);
> > > @@ -772,22 +771,6 @@ static void build_huge_handler_tail(u32 **p, struct uasm_reloc **r,
> > > #else
> > > UASM_i_SW(p, pte, 0, ptr);
> > > #endif
> > > - if (cpu_has_ftlb && flush) {
> > > - BUG_ON(!cpu_has_tlbinv);
> > > -
> > > - UASM_i_MFC0(p, ptr, C0_ENTRYHI);
> > > - uasm_i_ori(p, ptr, ptr, MIPS_ENTRYHI_EHINV);
> > > - UASM_i_MTC0(p, ptr, C0_ENTRYHI);
> > > - build_tlb_write_entry(p, l, r, tlb_indexed);
> > > -
> > > - uasm_i_xori(p, ptr, ptr, MIPS_ENTRYHI_EHINV);
> > > - UASM_i_MTC0(p, ptr, C0_ENTRYHI);
> > > - build_huge_update_entries(p, pte, ptr);
> > > - build_huge_tlb_write_entry(p, l, r, pte, tlb_random, 0);
> > > -
> > > - return;
> > > - }
> > > -
> > > build_huge_update_entries(p, pte, ptr);
> > > build_huge_tlb_write_entry(p, l, r, pte, tlb_indexed, 0);
> > > }
> > > @@ -2278,7 +2261,7 @@ static void build_r4000_tlb_load_handler(void)
> > > uasm_l_tlbl_goaround2(&l, p);
> > > }
> > > uasm_i_ori(&p, wr.r1, wr.r1, (_PAGE_ACCESSED | _PAGE_VALID));
> > > - build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2, 1);
> > > + build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2);
> > > #endif
> > >
> > > uasm_l_nopage_tlbl(&l, p);
> > > @@ -2334,7 +2317,7 @@ static void build_r4000_tlb_store_handler(void)
> > > build_tlb_probe_entry(&p);
> > > uasm_i_ori(&p, wr.r1, wr.r1,
> > > _PAGE_ACCESSED | _PAGE_MODIFIED | _PAGE_VALID | _PAGE_DIRTY);
> > > - build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2, 1);
> > > + build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2);
> > > #endif
> > >
> > > uasm_l_nopage_tlbs(&l, p);
> > > @@ -2391,7 +2374,7 @@ static void build_r4000_tlb_modify_handler(void)
> > > build_tlb_probe_entry(&p);
> > > uasm_i_ori(&p, wr.r1, wr.r1,
> > > _PAGE_ACCESSED | _PAGE_MODIFIED | _PAGE_VALID | _PAGE_DIRTY);
> > > - build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2, 0);
> > > + build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2);
> > > #endif
> > >
> > > uasm_l_nopage_tlbm(&l, p);
> > > --
> > > 2.17.1
> > >

