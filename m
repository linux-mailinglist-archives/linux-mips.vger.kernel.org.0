Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F33F6D8D2A
	for <lists+linux-mips@lfdr.de>; Wed, 16 Oct 2019 12:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404478AbfJPKDR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Oct 2019 06:03:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48799 "EHLO
        mail.loongson.cn" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404289AbfJPKDR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Oct 2019 06:03:17 -0400
Received: from linux.loongson.cn (unknown [10.20.41.27])
        by mail (Coremail) with SMTP id QMiowPDxb2Ld6qZdxwQSAA--.75S2;
        Wed, 16 Oct 2019 18:03:09 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     paul.burton@mips.com, ralf@linux-mips.org, jhogan@kernel.org,
        chenhc@lemote.com
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] MIPS: Loongson: Make default kernel log buffer size as 128KB for Loongson3
Date:   Wed, 16 Oct 2019 18:03:00 +0800
Message-Id: <1571220180-5478-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: QMiowPDxb2Ld6qZdxwQSAA--.75S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr1rXF45Ar4rtr1kXw4fKrg_yoWkAFX_Jr
        ZIkr1Uuw45JrW7uw4Iva1rur42ya4xA3WFyr47JrZrA3yakr15Jws0qr4UGwn8Zayqyr4f
        Z3ykJF92kFn2qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbxxYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjcxG0xvY0x0EwIxGrVCF
        72vEw4AK0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
        0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
        IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
        AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWU
        JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUI3
        C7UUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When I update kernel with loongson3_defconfig based on the Loongson 3A3000
platform, then using dmesg command to show kernel ring buffer, the initial
kernel messages have disappeared due to the log buffer is too small, it is
better to change the kernel log buffer size from 16KB to 128KB which is
enough to save the boot messages.

Since the default LOG_BUF_SHIFT value is 17, the default kernel log buffer
size is 128KB, just delete the CONFIG_LOG_BUF_SHIFT line.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v3: use the default LOG_BUF_SHIFT value 17 and update the commit message

 arch/mips/configs/loongson3_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 90ee008..25e1179 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -12,7 +12,6 @@ CONFIG_TASKSTATS=y
 CONFIG_TASK_DELAY_ACCT=y
 CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
-CONFIG_LOG_BUF_SHIFT=14
 CONFIG_MEMCG=y
 CONFIG_MEMCG_SWAP=y
 CONFIG_BLK_CGROUP=y
-- 
2.1.0


