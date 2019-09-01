Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF5AA4A2E
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbfIAPsq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:48:46 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:41548 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728975AbfIAPsp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:48:45 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id E5E3F3F65F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:48:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sFwMC-r6a4kN for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:48:43 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 468563F615
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:48:43 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:48:43 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 032/120] MIPS: PS2: SCMD: System power off command
Message-ID: <d19947035af1b17f3297187738158a9d8e66d7c5.1567326213.git.noring@nocrew.org>
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
 arch/mips/include/asm/mach-ps2/scmd.h |  2 ++
 arch/mips/ps2/scmd.c                  | 29 +++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/scmd.h b/arch/mips/include/asm/mach-ps2/scmd.h
index b2b98dbaec9b..9e0135655ce8 100644
--- a/arch/mips/include/asm/mach-ps2/scmd.h
+++ b/arch/mips/include/asm/mach-ps2/scmd.h
@@ -30,4 +30,6 @@ int scmd(enum scmd_cmd cmd,
 	const void *send, size_t send_size,
 	void *recv, size_t recv_size);
 
+int scmd_power_off(void);
+
 #endif /* __ASM_MACH_PS2_SCMD_H */
diff --git a/arch/mips/ps2/scmd.c b/arch/mips/ps2/scmd.c
index 0516766ffdba..5544c7dfb7b4 100644
--- a/arch/mips/ps2/scmd.c
+++ b/arch/mips/ps2/scmd.c
@@ -175,6 +175,35 @@ int scmd(enum scmd_cmd cmd,
 }
 EXPORT_SYMBOL_GPL(scmd);
 
+/**
+ * scmd_power_off - system command to power off the system
+ *
+ * On success, the processor will have to wait for the shut down to take effect.
+ *
+ * Context: sleep
+ * Return: 0 on success, else a negative error number
+ */
+int scmd_power_off(void)
+{
+	u8 status;
+	int err;
+
+	err = scmd(scmd_cmd_power_off, NULL, 0, &status, sizeof(status));
+	if (err < 0) {
+		pr_err("%s: Write failed with %d\n", __func__, err);
+		return err;
+	}
+
+	if (status != 0) {
+		pr_err("%s: Invalid result with status 0x%x\n",
+			__func__, status);
+		return -EIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(scmd_power_off);
+
 MODULE_DESCRIPTION("PlayStation 2 system commands");
 MODULE_AUTHOR("Fredrik Noring");
 MODULE_LICENSE("GPL");
-- 
2.21.0

