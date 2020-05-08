Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4EBD1CAA15
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 13:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727799AbgEHLz2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 May 2020 07:55:28 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49584 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727783AbgEHLz1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 May 2020 07:55:27 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX92ZSLVebikyAA--.9S4;
        Fri, 08 May 2020 19:55:06 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 2/3] MIPS: Loongson: Add hwmon support for generic CPU
Date:   Fri,  8 May 2020 19:55:03 +0800
Message-Id: <1588938904-924-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1588938904-924-1-git-send-email-yangtiezhu@loongson.cn>
References: <1588938904-924-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxX92ZSLVebikyAA--.9S4
X-Coremail-Antispam: 1UD129KBjvdXoWrurW5JrWfGrWfZF1UXFW3Awb_yoWxuFc_Wa
        109rWfJr95GrnIk3W8Kr1fWry2yr1DWa1xuwnxtw4av345C34FvrZ0ya47X3WUGayYkF43
        CwsYqryfCasxCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbSkFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
        0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
        62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
        AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
        0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4kMxAIw28Icx
        kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
        xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42
        IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
        6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
        CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRRVc_JUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add PRID_IMP_LOONGSON_64G case to enable hwmon support for Loongson
generic CPU such as 3A4000 and newer CPU.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/platform/mips/cpu_hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/mips/cpu_hwmon.c b/drivers/platform/mips/cpu_hwmon.c
index add5f52..7b4bde1 100644
--- a/drivers/platform/mips/cpu_hwmon.c
+++ b/drivers/platform/mips/cpu_hwmon.c
@@ -43,6 +43,7 @@ int loongson3_cpu_temp(int cpu)
 		break;
 	case PRID_REV_LOONGSON3A_R3_0:
 	case PRID_REV_LOONGSON3A_R3_1:
+	case PRID_IMP_LOONGSON_64G:
 	default:
 		reg = (reg & 0xffff)*731/0x4000 - 273;
 		break;
-- 
2.1.0

