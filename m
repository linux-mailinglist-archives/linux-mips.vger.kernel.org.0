Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7168C244808
	for <lists+linux-mips@lfdr.de>; Fri, 14 Aug 2020 12:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgHNKbg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Aug 2020 06:31:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44992 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726012AbgHNKbg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 14 Aug 2020 06:31:36 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx398DaDZfOuUIAA--.29S2;
        Fri, 14 Aug 2020 18:31:31 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2] MIPS: Loongson: Use default CONFIG_FRAME_WARN as 2048 for Loongson64 to fix build warnings
Date:   Fri, 14 Aug 2020 18:31:30 +0800
Message-Id: <1597401090-4314-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx398DaDZfOuUIAA--.29S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trWDuF1DAr47Kw13tw1UJrb_yoW8AFWUpF
        WfJr1DAr4UKF4Fya90kFZ7GFZYy3Z3AFW7GFW7Xa4UXF909ayDXrnrKF1UGr42qFWvyay8
        uF95KF1a9a4q937anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUuOJ5UUU
        UU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After commit 70b838292bef ("MIPS: Update default config file for
Loongson-3"), CONFIG_VHOST_SCSI and CONFIG_VHOST are set when use
loongson3_defconfig, and then there exists the following two build
warnings related with these two configs:

  CC [M]  drivers/vhost/scsi.o
drivers/vhost/scsi.c: In function ‘vhost_scsi_flush’:
drivers/vhost/scsi.c:1374:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
 }
 ^
  LD [M]  drivers/vhost/vhost_scsi.o
  CC [M]  drivers/vhost/vsock.o
  LD [M]  drivers/vhost/vhost_vsock.o
  CC [M]  drivers/vhost/vhost.o
drivers/vhost/vhost.c: In function ‘log_used’:
drivers/vhost/vhost.c:1896:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
 }
 ^

CONFIG_FRAME_WARN=2048 can fix it, since the default CONFIG_FRAME_WARN
for 64BIT is 2048, just delete the CONFIG_FRAME_WARN line in defconfig.

config FRAME_WARN
        int "Warn for stack frames larger than"
        range 0 8192
        default 2048 if GCC_PLUGIN_LATENT_ENTROPY
        default 1280 if (!64BIT && PARISC)
        default 1024 if (!64BIT && !PARISC)
        default 2048 if 64BIT

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/configs/loongson3_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index a65b08d..a5005c8 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -403,7 +403,6 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_DEFLATE=m
 CONFIG_PRINTK_TIME=y
-CONFIG_FRAME_WARN=1024
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
-- 
2.1.0

