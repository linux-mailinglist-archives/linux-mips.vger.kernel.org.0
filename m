Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B5E24F2F0
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 09:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgHXHNe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 24 Aug 2020 03:13:34 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:43044 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgHXHNd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Aug 2020 03:13:33 -0400
Received: by mail-io1-f67.google.com with SMTP id s1so7594502iot.10
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2020 00:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YhwFR9sJBCt2frFSKycWqB/jliYwXTOkDDZR7ygzOrM=;
        b=IiUHeA2/JTHXBTAb5KaOsnXElmIKjPLL68fKgIqIGB7dlrhuGhbr3eqRzWiRaMl69C
         nfoGnMFm5+LhnYo9g7PZpkDDXTF4h432pbHIOcVHizpxUUkxI12VjKuhRpyEv/qnT4d6
         2Up6wW8o0CtJPytCcz0pWzwpRFhwaBmtJf2v0s9Dm7+P++ZZvXciNtcxTmdsn3SF8YtH
         lxv719IzAEawcrQyo+5CIZz8RgULPbA7zwHL+0Asw+RwsCHhq+UIJgvSU0dOT+TcTrui
         Zr+YZfNLn4a5cNhWpMXB3obL8FfnLsN89pRMlxTaQDE1NseJb8UYZYFOvyziOsvoq3VR
         /UWw==
X-Gm-Message-State: AOAM530nLvLnuSfLF9rOrA3gP+TQAdlnReqo/eOReRUwkAir6ozrqgDt
        +nusWmY9ibWsG0APzc0UigQe8KKetT5wptellV7N2ADuXaYGzacB
X-Google-Smtp-Source: ABdhPJyh0pVE4OYF0iW/55n08mTK/7FvylwTrFpyEUNsL40UJgc5DBEwbgMpDtNe4BPOknMu1Ez/XrywaG1MO3VLjGU=
X-Received: by 2002:a5d:9516:: with SMTP id d22mr3762120iom.196.1598253212279;
 Mon, 24 Aug 2020 00:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200821072329.18006-1-huangpei@loongson.cn> <20200821072329.18006-3-huangpei@loongson.cn>
 <CAAhV-H4pg0pL_Sh+ibYcPs2QjzMJxDOhNwBi3AT=481NOB-5zA@mail.gmail.com> <20200822042707.5754967.41900.8563@loongson.cn>
In-Reply-To: <20200822042707.5754967.41900.8563@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Mon, 24 Aug 2020 15:13:20 +0800
Message-ID: <CAAhV-H72uX0nPLgTBp+cA71Q1G97M98WA=e__8XvutTpD5jgAQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] Revert "MIPS: Flush wrong invalid FTLB entry for huge page"
To:     =?UTF-8?B?6buE5rKb?= <huangpei@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Ambrose <ambrosehua@gmail.com>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Pei,

On Sat, Aug 22, 2020 at 12:27 PM 黄沛 <huangpei@loongson.cn> wrote:
>
>
> ‎
>   原始消息
> 发件人： Huacai Chen
> 已发送： 2020年8月21日星期五 18:37
> 收件人： Huang Pei
> 抄送： Thomas Bogendoerfer; Paul Ambrose; Li Xuefeng; Yang Tiezhu; Gao Juxin; Fuxin Zhang; open list:MIPS
> 主题： Re: [PATCH 3/3] Revert "MIPS: Flush wrong invalid FTLB entry for huge page"
>
> Got it, it is "too late", anything else?
>
> I will re-send it next week
How to fix it in __update_tlb? the previous patch?

Huacai
>
>
> On Fri, Aug 21, 2020 at 3:24 PM Huang Pei <huangpei@loongson.cn> wrote:
> >
> > This reverts commit 0115f6cbf26663c86496bc56eeea293f85b77897.
> >
> > The fix in 0115f6cbf26663c86496bc56eeea293f85b77897 is two late, since
> Do you means "too late"?
>
> > __update_tlb hit the same problem first. So let __update_tlb fix it
> >
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > ---
> > arch/mips/mm/tlb-r4k.c | 15 ++++++++++++++-
> > arch/mips/mm/tlbex.c | 25 ++++---------------------
> > 2 files changed, 18 insertions(+), 22 deletions(-)
> >
> > diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
> > index 38e2894d5fa3..cb8afa326b2c 100644
> > --- a/arch/mips/mm/tlb-r4k.c
> > +++ b/arch/mips/mm/tlb-r4k.c
> > @@ -328,6 +328,7 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
> > /* this could be a huge page */
> > if (pmd_huge(*pmdp)) {
> > unsigned long lo;
> > + unsigned long entryhi;
> > write_c0_pagemask(PM_HUGE_MASK);
> > ptep = (pte_t *)pmdp;
> > lo = pte_to_entrylo(pte_val(*ptep));
> > @@ -335,7 +336,19 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
> > write_c0_entrylo1(lo + (HPAGE_SIZE >> 7));
> >
> > mtc0_tlbw_hazard();
> > - if (idx < 0)
> > + if (idx >= current_cpu_data.tlbsizevtlb) {
> > + /* hit in FTLB.
> > + * Invalid it then tlbwr, since FTLB hold only base page*/
> > + entryhi = read_c0_entryhi();
> > + write_c0_entryhi(MIPS_ENTRYHI_EHINV);
> > + tlb_write_indexed();
> > + tlbw_use_hazard();
> > + write_c0_entryhi(entryhi);
> > +
> > + }
> > +
> > +
> > + if (idx < 0 || idx >= current_cpu_data.tlbsizevtlb)
> > tlb_write_random();
> > else
> > tlb_write_indexed();
> > diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
> > index 14f8ba93367f..9c4cd08c00d3 100644
> > --- a/arch/mips/mm/tlbex.c
> > +++ b/arch/mips/mm/tlbex.c
> > @@ -762,8 +762,7 @@ static void build_huge_update_entries(u32 **p, unsigned int pte,
> > static void build_huge_handler_tail(u32 **p, struct uasm_reloc **r,
> > struct uasm_label **l,
> > unsigned int pte,
> > - unsigned int ptr,
> > - unsigned int flush)
> > + unsigned int ptr)
> > {
> > #ifdef CONFIG_SMP
> > UASM_i_SC(p, pte, 0, ptr);
> > @@ -772,22 +771,6 @@ static void build_huge_handler_tail(u32 **p, struct uasm_reloc **r,
> > #else
> > UASM_i_SW(p, pte, 0, ptr);
> > #endif
> > - if (cpu_has_ftlb && flush) {
> > - BUG_ON(!cpu_has_tlbinv);
> > -
> > - UASM_i_MFC0(p, ptr, C0_ENTRYHI);
> > - uasm_i_ori(p, ptr, ptr, MIPS_ENTRYHI_EHINV);
> > - UASM_i_MTC0(p, ptr, C0_ENTRYHI);
> > - build_tlb_write_entry(p, l, r, tlb_indexed);
> > -
> > - uasm_i_xori(p, ptr, ptr, MIPS_ENTRYHI_EHINV);
> > - UASM_i_MTC0(p, ptr, C0_ENTRYHI);
> > - build_huge_update_entries(p, pte, ptr);
> > - build_huge_tlb_write_entry(p, l, r, pte, tlb_random, 0);
> > -
> > - return;
> > - }
> > -
> > build_huge_update_entries(p, pte, ptr);
> > build_huge_tlb_write_entry(p, l, r, pte, tlb_indexed, 0);
> > }
> > @@ -2278,7 +2261,7 @@ static void build_r4000_tlb_load_handler(void)
> > uasm_l_tlbl_goaround2(&l, p);
> > }
> > uasm_i_ori(&p, wr.r1, wr.r1, (_PAGE_ACCESSED | _PAGE_VALID));
> > - build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2, 1);
> > + build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2);
> > #endif
> >
> > uasm_l_nopage_tlbl(&l, p);
> > @@ -2334,7 +2317,7 @@ static void build_r4000_tlb_store_handler(void)
> > build_tlb_probe_entry(&p);
> > uasm_i_ori(&p, wr.r1, wr.r1,
> > _PAGE_ACCESSED | _PAGE_MODIFIED | _PAGE_VALID | _PAGE_DIRTY);
> > - build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2, 1);
> > + build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2);
> > #endif
> >
> > uasm_l_nopage_tlbs(&l, p);
> > @@ -2391,7 +2374,7 @@ static void build_r4000_tlb_modify_handler(void)
> > build_tlb_probe_entry(&p);
> > uasm_i_ori(&p, wr.r1, wr.r1,
> > _PAGE_ACCESSED | _PAGE_MODIFIED | _PAGE_VALID | _PAGE_DIRTY);
> > - build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2, 0);
> > + build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2);
> > #endif
> >
> > uasm_l_nopage_tlbm(&l, p);
> > --
> > 2.17.1
> >
