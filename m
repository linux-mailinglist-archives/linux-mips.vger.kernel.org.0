Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A14E71D4404
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 05:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgEODXL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 23:23:11 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46358 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727819AbgEODXL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 23:23:11 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx32gaC75ehPA0AA--.47S2;
        Fri, 15 May 2020 11:23:06 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 1/2] MIPS: Loongson: Build ATI Radeon GPU driver as module
Date:   Fri, 15 May 2020 11:23:04 +0800
Message-Id: <1589512985-27419-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx32gaC75ehPA0AA--.47S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWUWr4kKrW7tFW5JF4ruFg_yoW8Xw1xpr
        45Gan3JFWkGrnYkrZ7CrZ7WrWYvFs5JFW3ur40kry7Crs3Za40vry5tr1UJr4UXrZ8ta1S
        9r93Gr1SkanrCa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
        Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
        4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUg_-PUUUU
        U==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When ATI Radeon GPU driver has been compiled directly into the kernel
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

v2:
  - Modify the patch subject and update the commit message

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

