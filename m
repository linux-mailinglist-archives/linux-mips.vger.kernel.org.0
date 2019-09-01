Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCC8A4A48
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbfIAPyX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:54:23 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:42070 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfIAPyX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:54:23 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id ECA963F69D
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:54:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sy9hcjzcMVHU for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:54:21 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 4D07D3F695
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:54:21 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:54:21 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 046/120] MIPS: PS2: Identify the machine by model name
Message-ID: <c4177e45f552502135f9fba336c921580c75c192.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ROM version 1.00 is always SCPH-10000. Later machines with ROM version
1.0x have the machine name in the ROM0 file OSDSYS at offset 0x8c808.
These are late SCPH-10000 and all SCPH-15000. Even later machines have
a system command (SCMD) to read the machine name.

The machine name is shown in the /proc/cpuinfo file, for example:

	# grep machine /proc/cpuinfo
	machine			: SCPH-37000 L

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/ps2/Makefile   |  1 +
 arch/mips/ps2/identify.c | 80 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 arch/mips/ps2/identify.c

diff --git a/arch/mips/ps2/Makefile b/arch/mips/ps2/Makefile
index a56ea782120e..b53bddcc8c01 100644
--- a/arch/mips/ps2/Makefile
+++ b/arch/mips/ps2/Makefile
@@ -1,4 +1,5 @@
 obj-y		+= dmac-irq.o
+obj-y		+= identify.o
 obj-y		+= intc-irq.o
 obj-y		+= irq.o
 obj-y		+= memory.o
diff --git a/arch/mips/ps2/identify.c b/arch/mips/ps2/identify.c
new file mode 100644
index 000000000000..264fdc13dc43
--- /dev/null
+++ b/arch/mips/ps2/identify.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 identification
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/printk.h>
+
+#include <asm/prom.h>
+
+#include <asm/mach-ps2/rom.h>
+#include <asm/mach-ps2/scmd.h>
+
+static int __init set_machine_name_by_scmd(void)
+{
+	const struct scmd_machine_name machine = scmd_read_machine_name();
+
+	if (machine.name[0] == '\0') {
+		pr_err("identify: %s: Reading failed\n", __func__);
+		return -EIO;
+	}
+
+	mips_set_machine_name(machine.name);
+
+	return 0;
+}
+
+static int __init set_machine_name_by_osdsys(void)
+{
+	char name[12] = { };
+	int err = rom_read_file(rom0_dir, "OSDSYS",
+		name, sizeof(name) - 1, 0x8c808);
+
+	if (err) {
+		pr_err("identify: %s: Reading failed with %d\n", __func__, err);
+		return err;
+	}
+
+	mips_set_machine_name(name);
+
+	return 0;
+}
+
+static void __init set_machine_name(void)
+{
+	const int rom_version_number = rom_version().number;
+	int err = 0;
+
+	/*
+	 * ROM version 1.00 is always SCPH-10000. Later machines with
+	 * ROM version 1.0x have the machine name in the ROM0 file OSDSYS
+	 * at offset 0x8c808. These are late SCPH-10000 and all SCPH-15000.
+	 * Even later machines have a system command (SCMD) to read the
+	 * machine name.
+	 */
+
+	if (rom_version_number >= 0x110)
+		err = set_machine_name_by_scmd();	/* ver >= 1.10 */
+	else if (rom_version_number > 0x100)
+		err = set_machine_name_by_osdsys();	/* 1.10 > ver > 1.00 */
+	else if (rom_version_number == 0x100)
+		mips_set_machine_name("SCPH-10000");	/* ver = 1.00 */
+	else
+		err = -ENODEV;
+
+	if (err)
+		pr_err("identify: Determining machine name for ROM %04x failed with %d\n",
+			rom_version_number, err);
+}
+
+static int __init ps2_identify_init(void)
+{
+	set_machine_name();
+
+	return 0;
+}
+subsys_initcall(ps2_identify_init);
-- 
2.21.0

