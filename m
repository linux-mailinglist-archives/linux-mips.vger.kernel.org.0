Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92284A4A2D
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729182AbfIAPse (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:48:34 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:56720 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729181AbfIAPse (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:48:34 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 1C6FC3F73E
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:48:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DNj_EkfpVSnS for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:48:31 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 6AF9D3F708
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:48:31 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:48:31 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 031/120] MIPS: PS2: SCMD: System command support
Message-ID: <f5e5a0d92314d695c09c091a25217f7b710c55ca.1567326213.git.noring@nocrew.org>
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

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/scmd.h |  33 +++++
 arch/mips/ps2/Makefile                |   1 +
 arch/mips/ps2/scmd.c                  | 180 ++++++++++++++++++++++++++
 3 files changed, 214 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ps2/scmd.h
 create mode 100644 arch/mips/ps2/scmd.c

diff --git a/arch/mips/include/asm/mach-ps2/scmd.h b/arch/mips/include/asm/mach-ps2/scmd.h
new file mode 100644
index 000000000000..b2b98dbaec9b
--- /dev/null
+++ b/arch/mips/include/asm/mach-ps2/scmd.h
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 system commands
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#ifndef __ASM_MACH_PS2_SCMD_H
+#define __ASM_MACH_PS2_SCMD_H
+
+#include <linux/types.h>
+
+#define SCMD_COMMAND	0x1f402016
+#define SCMD_STATUS	0x1f402017
+#define SCMD_SEND	0x1f402017
+#define SCMD_RECV	0x1f402018
+
+#define SCMD_STATUS_EMPTY	0x40	/* Data is unavailable */
+#define SCMD_STATUS_BUSY	0x80	/* Command is processing */
+
+/**
+ * enum scmd_cmd - system commands
+ * @scmd_cmd_power_off: power off the system
+ */
+enum scmd_cmd {
+	scmd_cmd_power_off = 15,
+};
+
+int scmd(enum scmd_cmd cmd,
+	const void *send, size_t send_size,
+	void *recv, size_t recv_size);
+
+#endif /* __ASM_MACH_PS2_SCMD_H */
diff --git a/arch/mips/ps2/Makefile b/arch/mips/ps2/Makefile
index 2015870f9fe7..d90d3e06387f 100644
--- a/arch/mips/ps2/Makefile
+++ b/arch/mips/ps2/Makefile
@@ -2,4 +2,5 @@ obj-y		+= dmac-irq.o
 obj-y		+= intc-irq.o
 obj-y		+= irq.o
 obj-y		+= memory.o
+obj-y		+= scmd.o
 obj-y		+= time.o
diff --git a/arch/mips/ps2/scmd.c b/arch/mips/ps2/scmd.c
new file mode 100644
index 000000000000..0516766ffdba
--- /dev/null
+++ b/arch/mips/ps2/scmd.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 system commands
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/build_bug.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/sched.h>
+#include <linux/sched/signal.h>
+
+#include <asm/mach-ps2/scmd.h>
+
+/**
+ * completed - poll for condition to happen, or timeout
+ * @condition: function to poll for condition
+ *
+ * Return: %true if condition happened, else %false on timeout
+ */
+static bool completed(bool (*condition)(void))
+{
+	const unsigned long timeout = jiffies + 5*HZ;
+
+	do {
+		if (condition())
+			return true;
+
+		msleep(1);
+	} while (time_is_after_jiffies(timeout));
+
+	return false;
+}
+
+/**
+ * scmd_status - read system command status register
+ *
+ * Return: system command status register value
+ */
+static u8 scmd_status(void)
+{
+	return inb(SCMD_STATUS);
+}
+
+/**
+ * scmd_write - write system command data
+ * @data: pointer to data to write
+ * @size: number of bytes to write
+ */
+static void scmd_write(const u8 *data, size_t size)
+{
+	size_t i;
+
+	for (i = 0; i < size; i++)
+		outb(data[i], SCMD_SEND);
+}
+
+/**
+ * scmd_ready - can the system receive a command or has finished processing?
+ *
+ * Return: %true if the system is ready to receive a command, or has finished
+ * 	processing a previous command, otherwise %false
+ */
+static bool scmd_ready(void)
+{
+	return (scmd_status() & SCMD_STATUS_BUSY) == 0;
+}
+
+/**
+ * scmd_wait - wait for the system command to become ready
+ *
+ * Return: %true if the system command is ready, else %false on timeout
+ */
+static bool scmd_wait(void)
+{
+	return completed(scmd_ready);
+}
+
+/**
+ * scmd_data - is command data available to be read from the system?
+ *
+ * Return: %true if system data is readable, else %false
+ */
+static bool scmd_data(void)
+{
+	return (scmd_status() & SCMD_STATUS_EMPTY) == 0;
+}
+
+/**
+ * scmd_flush - read and discard all available command data from the system
+ *
+ * Return: %true if something was read, else %false
+ */
+static bool scmd_flush(void)
+{
+	bool flushed;
+
+	for (flushed = false; scmd_data(); flushed = true)
+		inb(SCMD_RECV);
+
+	return flushed;
+}
+
+/**
+ * scmd_read - read command data from the system
+ * @data: pointer to data to read
+ * @size: maximum number of bytes to read
+ *
+ * Return: actual number of bytes read
+ */
+static size_t scmd_read(u8 *data, size_t size)
+{
+	size_t r;
+
+	for (r = 0; r < size && scmd_data(); r++)
+		data[r] = inb(SCMD_RECV);
+
+	return r;
+}
+
+/**
+ * scmd - general system command function
+ * @cmd: system command
+ * @send: pointer to command data to send
+ * @send_size: size in bytes of command data to send
+ * @recv: pointer to command data to receive
+ * @recv_size: exact size in bytes of command data to receive
+ *
+ * Context: sleep
+ * Return: 0 on success, else a negative error number
+ */
+int scmd(enum scmd_cmd cmd,
+	const void *send, size_t send_size,
+	void *recv, size_t recv_size)
+{
+	static DEFINE_MUTEX(scmd_lock);
+	int err = 0;
+	size_t r;
+
+	mutex_lock(&scmd_lock);
+
+	if (!scmd_ready()) {
+		pr_warn("%s: Unexpectedly busy preceding command %d\n",
+			__func__, cmd);
+
+		if (!scmd_wait()) {
+			err = -EBUSY;
+			goto out_err;
+		}
+	}
+	if (scmd_flush())
+		pr_warn("%s: Unexpected data preceding command %d\n",
+			__func__, cmd);
+
+	scmd_write(send, send_size);
+	outb(cmd, SCMD_COMMAND);
+
+	if (!scmd_wait()) {
+		err = -EIO;
+		goto out_err;
+	}
+	r = scmd_read(recv, recv_size);
+	if (r == recv_size && scmd_flush())
+		pr_warn("%s: Unexpected data following command %d\n",
+			__func__, cmd);
+	if (r != recv_size)
+		err = -EIO;
+
+out_err:
+	mutex_unlock(&scmd_lock);
+	return err;
+}
+EXPORT_SYMBOL_GPL(scmd);
+
+MODULE_DESCRIPTION("PlayStation 2 system commands");
+MODULE_AUTHOR("Fredrik Noring");
+MODULE_LICENSE("GPL");
-- 
2.21.0

