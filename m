Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05C84A4A2F
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbfIAPtB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:49:01 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:41556 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728901AbfIAPtB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:49:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 859FD3F65F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:48:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id V9zDc9D24ClT for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:48:58 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id CFC743F615
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:48:58 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:48:58 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 033/120] MIPS: PS2: SCMD: Read system machine name command
Message-ID: <58d39cd6e1f0e341342ace77f6ef518f15be5fd7.1567326213.git.noring@nocrew.org>
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

An example of machine name is SCPH-50004.

Machines SCPH-10000 and SCPH-15000 do not implement this command. Late
SCPH-10000 and all SCPH-15000 have the name in rom0:OSDSYS instead.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/scmd.h | 12 ++++++
 arch/mips/ps2/scmd.c                  | 62 +++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/scmd.h b/arch/mips/include/asm/mach-ps2/scmd.h
index 9e0135655ce8..2389b937eec0 100644
--- a/arch/mips/include/asm/mach-ps2/scmd.h
+++ b/arch/mips/include/asm/mach-ps2/scmd.h
@@ -21,9 +21,11 @@
 /**
  * enum scmd_cmd - system commands
  * @scmd_cmd_power_off: power off the system
+ * @scmd_cmd_read_machine_name: read machine name
  */
 enum scmd_cmd {
 	scmd_cmd_power_off = 15,
+	scmd_cmd_read_machine_name = 23,
 };
 
 int scmd(enum scmd_cmd cmd,
@@ -32,4 +34,14 @@ int scmd(enum scmd_cmd cmd,
 
 int scmd_power_off(void);
 
+/**
+ * struct scmd_machine_name - machine name, or the empty string
+ * @name: NUL terminated string, for example ``"SCPH-50004"``
+ */
+struct scmd_machine_name {
+	char name[16];
+};
+
+struct scmd_machine_name scmd_read_machine_name(void);
+
 #endif /* __ASM_MACH_PS2_SCMD_H */
diff --git a/arch/mips/ps2/scmd.c b/arch/mips/ps2/scmd.c
index 5544c7dfb7b4..aecd4f35e312 100644
--- a/arch/mips/ps2/scmd.c
+++ b/arch/mips/ps2/scmd.c
@@ -175,6 +175,12 @@ int scmd(enum scmd_cmd cmd,
 }
 EXPORT_SYMBOL_GPL(scmd);
 
+static int scmd_send_byte(enum scmd_cmd cmd, u8 send_byte,
+	void *recv, size_t recv_size)
+{
+	return scmd(cmd, &send_byte, sizeof(send_byte), recv, recv_size);
+}
+
 /**
  * scmd_power_off - system command to power off the system
  *
@@ -204,6 +210,62 @@ int scmd_power_off(void)
 }
 EXPORT_SYMBOL_GPL(scmd_power_off);
 
+/**
+ * scmd_read_machine_name - system command to read the machine name
+ *
+ * An example of machine name is SCPH-50004.
+ *
+ * Machines SCPH-10000 and SCPH-15000 do not implement this command. Late
+ * SCPH-10000 and all SCPH-15000 have the name in rom0:OSDSYS instead.
+ *
+ * Context: sleep
+ * Return: the machine name, or the empty string on failure
+ */
+struct scmd_machine_name scmd_read_machine_name(void)
+{
+	struct scmd_machine_name machine = { .name = "" };
+	struct __attribute__ ((packed)) {
+		u8 status;
+		char name[8];
+	} buffer0, buffer8;
+	int err;
+
+	BUILD_BUG_ON(sizeof(buffer0) != 9 ||
+		     sizeof(buffer8) != 9);
+
+	/* The machine name comes in two halves that need to be combined. */
+
+	err = scmd_send_byte(scmd_cmd_read_machine_name, 0,
+		&buffer0, sizeof(buffer0));
+	if (err < 0) {
+		pr_debug("%s: Read failed with %d at 0\n", __func__, err);
+		goto out_err;
+	}
+
+	err = scmd_send_byte(scmd_cmd_read_machine_name, 8,
+		&buffer8, sizeof(buffer8));
+	if (err < 0) {
+		pr_debug("%s: Read failed with %d at 8\n", __func__, err);
+		goto out_err;
+	}
+
+	if (buffer0.status != 0 ||
+	    buffer8.status != 0) {
+		pr_debug("%s: Invalid results with statuses 0x%x and 0x%x\n",
+			__func__, buffer0.status, buffer8.status);
+		goto out_err;
+	}
+
+	BUILD_BUG_ON(sizeof(machine.name) < 16);
+	memcpy(&machine.name[0], buffer0.name, 8);
+	memcpy(&machine.name[8], buffer8.name, 8);
+	machine.name[15] = '\0';
+
+out_err:
+	return machine;
+}
+EXPORT_SYMBOL_GPL(scmd_read_machine_name);
+
 MODULE_DESCRIPTION("PlayStation 2 system commands");
 MODULE_AUTHOR("Fredrik Noring");
 MODULE_LICENSE("GPL");
-- 
2.21.0

