Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCB02483F0
	for <lists+linux-mips@lfdr.de>; Tue, 18 Aug 2020 13:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgHRLeV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Aug 2020 07:34:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44242 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726145AbgHRLdY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 18 Aug 2020 07:33:24 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD99gvDtfbm0KAA--.22S2;
        Tue, 18 Aug 2020 19:32:48 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Loongson64: Fix build error about redeclaration of enumerator 'VIRTUAL' and "CONFIG_DM_THIN_PROVISIONING"
Date:   Tue, 18 Aug 2020 19:32:48 +0800
Message-Id: <1597750368-14086-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxD99gvDtfbm0KAA--.22S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1DAr4kKw1xZF1UAFyDAwb_yoW8tFy8pa
        nrAwn5Gr4DWrW3AFn5ArW8uryrAa98GrW2qFW29F1YgasIqFy0qrs8GFn5ArsFyF45Ka4x
        WrySgry7GFnrAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8KwCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUc8nYUUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After commit 39c1485c8baa (MIPS: KVM: Add kvm guestsupport for Loongson-3)

Fix the following build error:

drivers/md/dm-thin.c:116:2: error: redeclaration of enumerator ‘VIRTUAL’
  VIRTUAL,
  ^
In file included from ./arch/mips/include/asm/mach-loongson64/mmzone.h:12:0,
                 from ./arch/mips/include/asm/mmzone.h:12,
                 from ./include/linux/mmzone.h:962,
                 from ./include/linux/gfp.h:6,
                 from ./include/linux/slab.h:15,
                 from ./include/linux/genhd.h:16,
                 from ./include/linux/blkdev.h:8,
                 from drivers/md/persistent-data/dm-block-manager.h:11,
                 from drivers/md/dm-thin-metadata.h:10,
                 from drivers/md/dm-thin.c:7:
./arch/mips/include/asm/mach-loongson64/boot_param.h:198:2: note: previous
definition of ‘VIRTUAL’ was here VIRTUAL = 3
                                 ^
scripts/Makefile.build:283: recipe for target 'drivers/md/dm-thin.o' failed
make[2]: *** [drivers/md/dm-thin.o] Error 1

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/mips/include/asm/mach-loongson64/boot_param.h | 2 +-
 arch/mips/loongson64/env.c                         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index afc92b7..a4ef4ac 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -195,7 +195,7 @@ struct boot_params {
 enum loongson_bridge_type {
 	LS7A = 1,
 	RS780E = 2,
-	VIRTUAL = 3
+	VIRT = 3
 };
 
 struct loongson_system_configuration {
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 134cb8e..623b3f1 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -180,8 +180,8 @@ void __init prom_init_env(void)
 		loongson_sysconf.early_config = rs780e_early_config;
 		break;
 	default:
-		pr_info("The bridge chip is VIRTUAL\n");
-		loongson_sysconf.bridgetype = VIRTUAL;
+		pr_info("The bridge chip is VIRT\n");
+		loongson_sysconf.bridgetype = VIRT;
 		loongson_sysconf.early_config = virtual_early_config;
 		loongson_fdt_blob = __dtb_loongson64v_4core_virtio_begin;
 		break;
-- 
2.1.0

