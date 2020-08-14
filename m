Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8393B2443A2
	for <lists+linux-mips@lfdr.de>; Fri, 14 Aug 2020 04:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgHNC4i (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 22:56:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39610 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726564AbgHNC4h (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 13 Aug 2020 22:56:37 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj95h_TVfJbkIAA--.14S2;
        Fri, 14 Aug 2020 10:56:34 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Loongson: Set CONFIG_FRAME_WARN=2048 in loongson3_defconfig to fix build warning
Date:   Fri, 14 Aug 2020 10:56:33 +0800
Message-Id: <1597373793-8482-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj95h_TVfJbkIAA--.14S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ary8GFykKw43uF4Uur15Jwb_yoW8WryfpF
        WfJr1DAr48KF4Fya98CF97WFZYvFn3AFW7WFW7Xa4UXF909ayDZr9rKF1UJr47tryqyw40
        9as5KFnIvFWDC37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
        Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
        1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU3pnPUUU
        UU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After commit 70b838292bef ("MIPS: Update default config file for
Loongson-3"), CONFIG_VHOST_SCSI and CONFIG_VHOST are set when use
loongson3_defconfig, and then there exists the following two build
warnings related with these two configs, set CONFIG_FRAME_WARN=2048
in loongson3_defconfig to fix it.

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

Fixes: 70b838292bef ("MIPS: Update default config file for Loongson-3")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/configs/loongson3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index a65b08d..2b356d9 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -403,7 +403,7 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_DEFLATE=m
 CONFIG_PRINTK_TIME=y
-CONFIG_FRAME_WARN=1024
+CONFIG_FRAME_WARN=2048
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
-- 
2.1.0

