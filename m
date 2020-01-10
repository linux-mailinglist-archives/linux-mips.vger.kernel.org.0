Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 002B9136966
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2020 10:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgAJJIs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jan 2020 04:08:48 -0500
Received: from mail.loongson.cn ([114.242.206.163]:53784 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727167AbgAJJIs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 10 Jan 2020 04:08:48 -0500
Received: from localhost.localdomain.localdomain (unknown [182.149.160.139])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL2oYPxheAPICAA--.2S4;
        Fri, 10 Jan 2020 17:08:42 +0800 (CST)
From:   Xing Li <lixing@loongson.cn>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] KVM: MIPS: Support kvm modules autoprobed when startup system
Date:   Fri, 10 Jan 2020 17:08:40 +0800
Message-Id: <1578647320-14391-3-git-send-email-lixing@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1578647320-14391-1-git-send-email-lixing@loongson.cn>
References: <1578647320-14391-1-git-send-email-lixing@loongson.cn>
X-CM-TRANSID: AQAAf9DxL2oYPxheAPICAA--.2S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1xCFy7uF1UKFWkuw4rKrg_yoW8Zr1rpF
        4DAa93Cr45uryDJFWfZFnFgrW3Ja1DG3yj9ayjgryjv3ZYqFs8Jws2kwnxKr1DXFsIq3WF
        gas3Xr1jka92vw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBYb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv
        6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
        02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
        4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4fMxAIw28IcxkI7V
        AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
        r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
        IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
        w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8LqXPUUUUU==
X-CM-SenderInfo: pol0x03j6o00pqjv00gofq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently, the module_init of kvm_mips_init cannot force the kvm
modules insmod when startup system.

Add new feature CPU_MIPS_VZ in elf_hwcap to support KVM auto probe
when hardware virtualization supported.

Signed-off-by: Xing Li <lixing@loongson.cn>
---
 arch/mips/include/uapi/asm/hwcap.h | 1 +
 arch/mips/kernel/cpu-probe.c       | 4 +++-
 arch/mips/kvm/mips.c               | 3 ++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/uapi/asm/hwcap.h b/arch/mips/include/uapi/asm/hwcap.h
index 1ade1da..9e66509 100644
--- a/arch/mips/include/uapi/asm/hwcap.h
+++ b/arch/mips/include/uapi/asm/hwcap.h
@@ -17,5 +17,6 @@
 #define HWCAP_LOONGSON_MMI  (1 << 11)
 #define HWCAP_LOONGSON_EXT  (1 << 12)
 #define HWCAP_LOONGSON_EXT2 (1 << 13)
+#define HWCAP_MIPS_VZ       (1 << 14)
 
 #endif /* _UAPI_ASM_HWCAP_H */
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index c543326..b305269 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -2242,8 +2242,10 @@ void cpu_probe(void)
 	if (cpu_has_loongson_ext2)
 		elf_hwcap |= HWCAP_LOONGSON_EXT2;
 
-	if (cpu_has_vz)
+	if (cpu_has_vz) {
 		cpu_probe_vz(c);
+		elf_hwcap |= HWCAP_MIPS_VZ;
+	}
 
 	cpu_probe_vmbits(c);
 
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 1109924..1da5df3 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -19,6 +19,7 @@
 #include <linux/sched/signal.h>
 #include <linux/fs.h>
 #include <linux/memblock.h>
+#include <linux/cpufeature.h>
 
 #include <asm/fpu.h>
 #include <asm/page.h>
@@ -1742,7 +1743,7 @@ static void __exit kvm_mips_exit(void)
 	unregister_die_notifier(&kvm_mips_csr_die_notifier);
 }
 
-module_init(kvm_mips_init);
+module_cpu_feature_match(MIPS_VZ, kvm_mips_init);
 module_exit(kvm_mips_exit);
 
 EXPORT_TRACEPOINT_SYMBOL(kvm_exit);
-- 
2.1.0

