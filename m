Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11D57A4A4F
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728644AbfIAP56 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:57:58 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:58346 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfIAP56 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:57:58 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 8C081402D7
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:57:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wUMcICxGXh7L for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:57:55 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D61853FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:57:55 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:57:54 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 053/120] MIPS: PS2: IOP: Define error numbers, descriptions
 and errno mapping
Message-ID: <8e1a8a4e97c9415d0e1483c7d0a7b9b5fbee8890.1567326213.git.noring@nocrew.org>
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

IOP ROM modules use a set of special numbers to indicate error conditions
of various kinds. These are translated into approximate kernel error
numbers. Some of the IOP error numbers are unclear or unknown.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/iop-error.h | 76 ++++++++++++++++++++++
 drivers/ps2/sif.c                          | 39 +++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ps2/iop-error.h

diff --git a/arch/mips/include/asm/mach-ps2/iop-error.h b/arch/mips/include/asm/mach-ps2/iop-error.h
new file mode 100644
index 000000000000..c01bcad28a99
--- /dev/null
+++ b/arch/mips/include/asm/mach-ps2/iop-error.h
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 input/output processor (IOP) error codes
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#ifndef __ASM_MACH_PS2_IOP_ERROR_H
+#define __ASM_MACH_PS2_IOP_ERROR_H
+
+#define IOP_ERRORS(E)							\
+	E(BADEXCE,	50,	EINVAL,	"Bad exception")		\
+	E(NOEXCE,	51,	ENOENT,	"Exception not found")		\
+	E(BUSYEXCE,	52,	EBUSY,	"Exception in use")		\
+									\
+	E(INIRQ,	100,	EPERM,	"In IRQ context")		\
+	E(BADIRQ,	101,	EINVAL,	"Bad IRQ")			\
+	E(CPUINTD,	102,	EPERM,	"CPU interrupts disabled")	\
+	E(INTD,		103,	EPERM,	"Interrupts disabled")		\
+	E(BUSYHAND,	104,	EBUSY,	"Handler in use")		\
+	E(NOHAND,	105,	ENOENT,	"Handler not found")		\
+									\
+	E(NOTIMER,	150,	ENOENT,	"Timer not found")		\
+	E(BADTIMER,	151,	EINVAL,	"Bad timer")			\
+									\
+	E(BUSYUNIT,	160,	EBUSY,	"Unit in use")			\
+	E(NOUNIT,	161,	ENOENT,	"Unit not found")		\
+	E(NOROMDIR,	162,	ENOENT,	"ROM directory not found")	\
+									\
+	E(LINK,		200,	ENOEXEC, "Module linking error")	\
+	E(BADOBJ,	201,	ENOEXEC, "Object not module")		\
+	E(NOMOD,	202,	ENOENT,	"Module not found")		\
+	E(NOENT,	203,	ENOENT,	"No such file")			\
+	E(FILE,		204,	EIO,	"File error")			\
+	E(BUSYMEM,	205,	EBUSY,	"Memory in use")		\
+									\
+	E(NOMEM,	400,	ENOMEM,	"Out of memory")		\
+	E(BADATTR,	401,	EINVAL,	"Bad attribute")		\
+	E(BADENTRY,	402,	EINVAL,	"Bad entry")			\
+	E(BADPRIO,	403,	EINVAL,	"Bad priority")			\
+	E(BADSTSZ,	404,	EINVAL,	"Bad stack size")		\
+	E(BADMODE,	405,	EINVAL,	"Bad mode")			\
+	E(BADTHR,	406,	EINVAL,	"Bad thread")			\
+	E(NOTHR,	407,	ESRCH,	"Thread not found")		\
+	E(NOSEM,	408,	ENOENT,	"Semaphore not found")		\
+	E(NOEVF,	409,	ENXIO,	"ENOEVF")	/* FIXME */	\
+	E(NOMBX,	410,	ENXIO,	"ENOMBX")	/* FIXME */	\
+	E(NOVPL,	411,	ENXIO,	"ENOVPL")	/* FIXME */	\
+	E(NOFPL,	412,	ENXIO,	"ENOFPL")	/* FIXME */	\
+	E(DORM,		413,	EINVAL,	"EDORM")	/* FIXME */	\
+	E(NODORM,	414,	ENOENT,	"ENODORM")	/* FIXME */	\
+	E(NOSUSP,	415,	ENOENT,	"ENOSUSP")	/* FIXME */	\
+	E(BADWAIT,	416,	EINVAL,	"EBADWAIT")	/* FIXME */	\
+	E(NOWAIT,	417,	ENOENT,	"ENOWAIT")	/* FIXME */	\
+	E(RELWAIT,	418,	EINVAL,	"ERELWAIT")	/* FIXME */	\
+	E(SEMZERO,	419,	EINVAL,	"ESEMZERO")	/* FIXME */	\
+	E(SEMOVF,	420,	EINVAL,	"ESEMOVF")	/* FIXME */	\
+	E(EVFCOND,	421,	EINVAL,	"EEVFCOND")	/* FIXME */	\
+	E(EVFMULTI,	422,	EINVAL,	"EEVFMULTI")	/* FIXME */	\
+	E(EVFILPAT,	423,	EINVAL,	"EEVFILPAT")	/* FIXME */	\
+	E(MBOXNOMSG,	424,	ENOENT,	"EMBOXNOMSG")	/* FIXME */	\
+	E(WAITDEL,	425,	EINVAL,	"EWAITDEL")	/* FIXME */	\
+	E(INVMEMBLK,	426,	EINVAL,	"EINVMEMBLK")	/* FIXME */	\
+	E(INVMEMSZ,	427,	ENOSPC,	"EINVMEMSZ")	/* FIXME */
+
+enum iop_error {
+#define IOP_ERROR_ENUM(identifier, number, errno, description)		\
+	IOP_E##identifier = number,
+	IOP_ERRORS(IOP_ERROR_ENUM)
+};
+
+int errno_for_iop_error(int ioperr);
+
+const char *iop_error_message(int ioperr);
+
+#endif /* __ASM_MACH_PS2_IOP_ERROR_H */
diff --git a/drivers/ps2/sif.c b/drivers/ps2/sif.c
index 6564af245880..8320c5b68d17 100644
--- a/drivers/ps2/sif.c
+++ b/drivers/ps2/sif.c
@@ -42,6 +42,7 @@
 #include <asm/io.h>
 
 #include <asm/mach-ps2/dmac.h>
+#include <asm/mach-ps2/iop-error.h>
 #include <asm/mach-ps2/irq.h>
 #include <asm/mach-ps2/sif.h>
 
@@ -315,6 +316,44 @@ static void sif_disable_dma(void)
 	outl(DMAC_CHCR_STOP, DMAC_SIF1_CHCR);
 }
 
+/**
+ * errno_for_iop_error - kernel error number corresponding to a given IOP error
+ * @ioperr: IOP error number
+ *
+ * Return: approximative kernel error number
+ */
+int errno_for_iop_error(int ioperr)
+{
+	switch (ioperr) {
+#define IOP_ERROR_ERRNO(identifier, number, errno, description)		\
+	case -IOP_E##identifier: return -errno;
+	IOP_ERRORS(IOP_ERROR_ERRNO)
+	}
+
+	return -1000 < ioperr && ioperr < 0 ? -EINVAL : ioperr;
+}
+EXPORT_SYMBOL_GPL(errno_for_iop_error);
+
+/**
+ * iop_error_message - message corresponding to a given IOP error
+ * @ioperr: IOP error number
+ *
+ * Return: error message string
+ */
+const char *iop_error_message(int ioperr)
+{
+	switch (ioperr) {
+	case 0:              return "Success";
+	case 1:              return "Error";
+#define IOP_ERROR_MSG(identifier, number, errno, description)		\
+	case IOP_E##identifier: return description;
+	IOP_ERRORS(IOP_ERROR_MSG)
+	}
+
+	return "Unknown error";
+}
+EXPORT_SYMBOL_GPL(iop_error_message);
+
 /**
  * sif_init - initialise the SIF with a reset
  *
-- 
2.21.0

