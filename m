Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE6A71D436D
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 04:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgEOCPK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 22:15:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33772 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726122AbgEOCPK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 22:15:10 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9wl+71e7Ok0AA--.8S2;
        Fri, 15 May 2020 10:15:02 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 1/2] MIPS: Loongson: Fix fatal error during GPU init
Date:   Fri, 15 May 2020 10:15:00 +0800
Message-Id: <1589508901-18077-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxr9wl+71e7Ok0AA--.8S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWUWr4kKrW7tFW5JF4ruFg_yoW8XrWDpr
        45Gan3JFWkWrnYkrZ7CrWkWrWYvFs5JFW3ur40kry7Crs3ua40vr90qwnrJr4UXrZ8ta1S
        9F93Kr1SkanrCa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK
        6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
        0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
        0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
        WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjByIUUUUU
        U==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When ATI Radeon graphics card has been compiled directly into the kernel
instead of as a module, we should make sure the firmware for the model
(check available ones in /lib/firmware/radeon) is built-in to the kernel
as well, otherwise there exists the following fatal error during GPU init,
change CONFIG_DRM_RADEON=y to CONFIG_DRM_RADEON=m to fix it.

[    1.900997] [drm] Loading RS780 Microcode
[    1.905077] radeon 0000:01:05.0: Direct firmware load for radeon/RS780_pfp.bin failed with error -2
[    1.914140] r600_cp: Failed to load firmware "radeon/RS780_pfp.bin"
[    1.920405] [drm:r600_init] *ERROR* Failed to load firmware!
[    1.926069] radeon 0000:01:05.0: Fatal error during GPU init
[    1.931729] [drm] radeon: finishing device.

Fixes: 024e6a8b5bb1 ("MIPS: Loongson: Add a Loongson-3 default config file")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/configs/loongson3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 6768c16..4df2434 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -230,7 +230,7 @@ CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_DRM=y
-CONFIG_DRM_RADEON=y
+CONFIG_DRM_RADEON=m
 CONFIG_FB_RADEON=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=m
-- 
2.1.0

