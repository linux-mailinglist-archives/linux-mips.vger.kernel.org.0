Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D73815257E
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 05:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgBEEId (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Feb 2020 23:08:33 -0500
Received: from mail.loongson.cn ([114.242.206.163]:42316 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727832AbgBEEId (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 4 Feb 2020 23:08:33 -0500
Received: from linux.HaierAP (unknown [111.18.44.203])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax1um3Pzpeh44MAA--.150S2;
        Wed, 05 Feb 2020 12:08:24 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Jean Delvare <jdelvare@suse.com>,
        Jean Delvare <jdelvare@suse.de>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] firmware: dmi: Add macro SMBIOS_ENTRY_POINT_SCAN_START
Date:   Wed,  5 Feb 2020 12:08:32 +0800
Message-Id: <1580875713-18252-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Ax1um3Pzpeh44MAA--.150S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4ktF13Xr4rAF15CF15Jwb_yoW8JFyDpF
        yUGFW5ZrsrJF47t3s5J3WrZF15Xa9aqF98KFWUAr1ruas8Za4fJr4kJaykGr1DArZ5tayS
        9r1Sqr4FkF1qkaUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
        wI0_GFv_Wrylc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
        wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
        v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
        Y4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
        AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRxb18UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use SMBIOS_ENTRY_POINT_SCAN_START instead of 0xF0000, because other
archtecture maybe use a special start address such as 0xFFFE000 for
Loongson platform.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---

v3:
  - split the v2 patch into two patches
  - make MIPS DMI config depend on MACH_LOONGSON64

v2:
  - add SMBIOS_ENTRY_POINT_SCAN_START suggested by Jean
  - refine definitions and Kconfig by Jiaxun

 drivers/firmware/dmi_scan.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 2045566..f59163c 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -11,6 +11,10 @@
 #include <asm/dmi.h>
 #include <asm/unaligned.h>
 
+#ifndef SMBIOS_ENTRY_POINT_SCAN_START
+#define SMBIOS_ENTRY_POINT_SCAN_START 0xF0000
+#endif
+
 struct kobject *dmi_kobj;
 EXPORT_SYMBOL_GPL(dmi_kobj);
 
@@ -663,7 +667,7 @@ static void __init dmi_scan_machine(void)
 			return;
 		}
 	} else if (IS_ENABLED(CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK)) {
-		p = dmi_early_remap(0xF0000, 0x10000);
+		p = dmi_early_remap(SMBIOS_ENTRY_POINT_SCAN_START, 0x10000);
 		if (p == NULL)
 			goto error;
 
-- 
1.8.3.1

