Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E49CE136968
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2020 10:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgAJJIt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jan 2020 04:08:49 -0500
Received: from mail.loongson.cn ([114.242.206.163]:53782 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727156AbgAJJIt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 10 Jan 2020 04:08:49 -0500
Received: from localhost.localdomain.localdomain (unknown [182.149.160.139])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL2oYPxheAPICAA--.2S2;
        Fri, 10 Jan 2020 17:08:41 +0800 (CST)
From:   Xing Li <lixing@loongson.cn>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] KVM: MIPS: Change KVM_ENTRYHI_ASID to cpu_asid_mask(&current_cpu_data)
Date:   Fri, 10 Jan 2020 17:08:38 +0800
Message-Id: <1578647320-14391-1-git-send-email-lixing@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxL2oYPxheAPICAA--.2S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFWktw1rWw47uFW3tFWDJwb_yoWkWrc_Z3
        W7Zws7ur4fCrZFy39Iywn3WFWFgw1UWF929r9IgFyq9asFyry5Wa9xJr9rAwsxur4qyF4r
        W34DJ34rZrnrCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2xYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4fMxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
        z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU4fHUUUUUU
X-CM-SenderInfo: pol0x03j6o00pqjv00gofq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The code in decode_config4 of arch/mips/kernel/cpu-probe.c

        asid_mask = MIPS_ENTRYHI_ASID;
        if (config4 & MIPS_CONF4_AE)
                asid_mask |= MIPS_ENTRYHI_ASIDX;
        set_cpu_asid_mask(c, asid_mask);

set asid_mask to cpuinfo->asid_mask

So KVM_ENTRYHI_ASID should change to cpu_asid_mask(&current_cpu_data)
for support 10bits ASID_MASK

Signed-off-by: Xing Li <lixing@loongson.cn>
---
 arch/mips/include/asm/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 41204a4..6be70d5 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -275,7 +275,7 @@ enum emulation_result {
 #define MIPS3_PG_FRAME		0x3fffffc0
 
 #define VPN2_MASK		0xffffe000
-#define KVM_ENTRYHI_ASID	MIPS_ENTRYHI_ASID
+#define KVM_ENTRYHI_ASID	cpu_asid_mask(&current_cpu_data)
 #define TLB_IS_GLOBAL(x)	((x).tlb_lo[0] & (x).tlb_lo[1] & ENTRYLO_G)
 #define TLB_VPN2(x)		((x).tlb_hi & VPN2_MASK)
 #define TLB_ASID(x)		((x).tlb_hi & KVM_ENTRYHI_ASID)
-- 
2.1.0

