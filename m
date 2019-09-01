Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6748A4A66
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbfIAQLd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:11:33 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:59680 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfIAQLc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:11:32 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 2F9133F52B
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:11:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4T9eZSUFd1WE for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:11:30 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 7F8653F53F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:11:30 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:11:30 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 069/120] MIPS: PS2: IOP: Module version compatibility
 verification
Message-ID: <83c5eb267a56f26ff166ece6c8d9fbf56f0b875f.1567326213.git.noring@nocrew.org>
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

IOP module link requests are only permitted if the major versions match
and the module version is at least of the same minor as the requested
version.

The IOP module version is read from the special .iopmod section.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/ps2/iop-module.c | 44 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/ps2/iop-module.c b/drivers/ps2/iop-module.c
index d332a7d1af60..532b3cce91c0 100644
--- a/drivers/ps2/iop-module.c
+++ b/drivers/ps2/iop-module.c
@@ -12,6 +12,10 @@
  * (ELF). All valid IOP modules have a special `.iopmod` section containing
  * the module name, version, etc.
  *
+ * IOP module link requests are only permitted if the major versions match
+ * and the module version is at least of the same minor as the requested
+ * version.
+ *
  * When the IOP is reset, a set of modules are automatically linked from
  * read-only memory (ROM). Non-ROM modules are handled as firmware by the
  * IOP module linker.
@@ -226,6 +230,34 @@ static unsigned int minor_version(unsigned int version)
 	return bcd2bin(version & 0xff);
 }
 
+/**
+ * version_compatible - is the version compatible with the requested version?
+ * @version: version to check
+ * @version_request: requested version
+ *
+ * Return: %true if the major versions match and the version to check is at
+ * 	least of the same minor as the requested version, otherwise %false
+ */
+static bool version_compatible(int version, int requested_version)
+{
+	return major_version(version) == major_version(requested_version) &&
+	       minor_version(version) >= minor_version(requested_version);
+}
+
+/**
+ * irx_version_compatible - is the module compatible with the requested version?
+ * @ehdr: ELF header of module to check
+ * @requested_version: request version
+ *
+ * Return: %true if the major versions match and the module version is at
+ * 	least of the same minor as the requested version, otherwise %false
+ */
+static bool irx_version_compatible(const struct elf32_hdr *ehdr,
+	int requested_version)
+{
+	return version_compatible(irx_iopmod(ehdr)->version, requested_version);
+}
+
 /**
  * irx_identify - does the buffer contain an IRX object?
  * @buffer: pointer to data to identify
@@ -344,8 +376,20 @@ static int iop_module_request_firmware(
 
 	ehdr = (const struct elf32_hdr *)fw->data;
 
+	if (!irx_version_compatible(ehdr, version)) {
+		pr_err("iop-module: %s module version %u.%u is incompatible with requested version %u.%u\n",
+			filepath,
+			major_version(irx_iopmod(ehdr)->version),
+			minor_version(irx_iopmod(ehdr)->version),
+			major_version(version),
+			minor_version(version));
+		err = -ENOEXEC;
+		goto err_incompatible;
+	}
+
 	err = iop_module_link_buffer(fw->data, fw->size, arg);
 
+err_incompatible:
 err_identify:
 err_request:
 err_name:
-- 
2.21.0

