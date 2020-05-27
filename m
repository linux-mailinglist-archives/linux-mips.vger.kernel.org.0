Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADE521E359C
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 04:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgE0C0J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 22:26:09 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41658 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725905AbgE0C0J (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 22:26:09 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr2uQz81e3nc5AA--.351S2;
        Wed, 27 May 2020 10:25:20 +0800 (CST)
From:   Bibo Mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
Subject: [PATCH v7 0/4] MIPS: page fault handling optimization
Date:   Wed, 27 May 2020 10:25:16 +0800
Message-Id: <1590546320-21814-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxr2uQz81e3nc5AA--.351S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr18Ar1xtr45GFy7GFWxWFg_yoW8JF43pr
        98Cw15Wwn7J39xKryfJw4kCr43Gw4kGFWUKr9rA345AanrZr1kKrsxt3W0yrykXFy5A3WS
        qFWUtr4UW34kZwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
        0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxa
        n2IY04v7MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
        UI43ZEXa7IU8a-e5UUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

V7:
- define function flush_tlb_fix_spurious_fault as inline rather
  than macro
V6:
- Add update_mmu_tlb function as empty on all platform except mips
  system, we use this function to update local tlb for page fault
  smp-race handling
V5:
- define update_mmu_cache function specified on MIPS platform, and
  add page fault smp-race stats info
V4:
- add pte_sw_mkyoung function to implement readable privilege, and
  this function is  only in effect on MIPS system.
- add page valid bit judgement in function pte_modify
V3:
- add detailed changelog, modify typo issue in patch V2
v2:
- split flush_tlb_fix_spurious_fault and tlb update into two patches
- comments typo modification
- separate tlb update and add pte readable privilege into two patches

Bibo Mao (4):
  MIPS: Do not flush tlb page when updating PTE entry
  mm/memory.c: Update local TLB if PTE entry exists
  mm/memory.c: Add memory read privilege on page fault handling
  MIPS: mm: add page valid judgement in function pte_modify

 arch/mips/include/asm/pgtable.h | 37 +++++++++++++++++++++++++++++++++++--
 include/asm-generic/pgtable.h   | 33 +++++++++++++++++++++++++++++++++
 mm/memory.c                     | 30 ++++++++++++++++++++++--------
 3 files changed, 90 insertions(+), 10 deletions(-)

-- 
1.8.3.1

