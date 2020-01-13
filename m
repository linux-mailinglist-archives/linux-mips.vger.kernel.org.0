Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36317138A47
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 05:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387594AbgAMEjZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 23:39:25 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54798 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733103AbgAMEjY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 23:39:24 -0500
Received: from localhost.localdomain.localdomain (unknown [222.209.11.32])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD91s9BteOV0EAA--.4S3;
        Mon, 13 Jan 2020 12:39:09 +0800 (CST)
From:   Xing Li <lixing@loongson.cn>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] KVM: MIPS: Fixup VPN2_MASK definition over 32bits virtual address
Date:   Mon, 13 Jan 2020 12:39:07 +0800
Message-Id: <1578890348-2734-2-git-send-email-lixing@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1578890348-2734-1-git-send-email-lixing@loongson.cn>
References: <1578890348-2734-1-git-send-email-lixing@loongson.cn>
X-CM-TRANSID: AQAAf9DxD91s9BteOV0EAA--.4S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKr47GrWxWw4DXr1xKrW3ZFb_yoWDKwbEva
        4xZws7Zr1kGFZFyrWxZan5WFy5W34UWF9Igr98WryDC34Syrs8Wa93ury7Jw45uw4jyFsY
        va4vv34rZrnF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbS8YjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
        IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUXVWUCwA2ocxC64kIII0Yj41l84x0c7CE
        w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6x
        kF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE
        c7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
        Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S
        6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8XwCF04k20xvY0x
        0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
        7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
        C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
        04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
        CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jwXo7UUUUU=
X-CM-SenderInfo: pol0x03j6o00pqjv00gofq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If the cpu support more than 32bits vmbits, VPN2_MASK set to fixed
0xffffe000 will lead to wrong entryhi for _kvm_mips_host_tlb_inv

The cpu_vmbits definition of 32bit in cpu-features.h is 31,
so still use the old style for 32bits.

Signed-off-by: Xing Li <lixing@loongson.cn>
---
v2:
Change VPN2_MASK definition according to Jiaxun Yang's comment
 arch/mips/include/asm/kvm_host.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 6be70d5..ef8e606 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -274,7 +274,11 @@ enum emulation_result {
 #define MIPS3_PG_SHIFT		6
 #define MIPS3_PG_FRAME		0x3fffffc0
 
+#if defined(CONFIG_64BIT)
+#define VPN2_MASK		GENMASK(cpu_vmbits - 1, 13)
+#else
 #define VPN2_MASK		0xffffe000
+#endif
 #define KVM_ENTRYHI_ASID	cpu_asid_mask(&current_cpu_data)
 #define TLB_IS_GLOBAL(x)	((x).tlb_lo[0] & (x).tlb_lo[1] & ENTRYLO_G)
 #define TLB_VPN2(x)		((x).tlb_hi & VPN2_MASK)
-- 
2.1.0

