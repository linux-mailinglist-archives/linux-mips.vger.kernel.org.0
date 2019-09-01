Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8D6A4A7D
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbfIAQS7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:18:59 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:44324 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIAQS7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:18:59 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 02CBB3F63C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:18:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7HR1CRSFTY7T for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:18:56 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 44EEA3F58C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:18:56 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:18:56 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 079/120] MIPS: PS2: GS: Define privileged register structures
Message-ID: <72856c09f705f922d240a38ff0532ed607e9cb42.1567326213.git.noring@nocrew.org>
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

Read and write registers as structures, which simplifies notation. For
example, the CSR register can be read and written with struct gs_csr:

struct gs_csr gs_read_csr(void);
void gs_write_csr(struct gs_csr value);

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/gs-registers.h | 53 +++++++------
 drivers/ps2/gs-registers.c                    | 75 +++++++++++++------
 2 files changed, 83 insertions(+), 45 deletions(-)

diff --git a/arch/mips/include/asm/mach-ps2/gs-registers.h b/arch/mips/include/asm/mach-ps2/gs-registers.h
index 315a25c102c9..596e277a6940 100644
--- a/arch/mips/include/asm/mach-ps2/gs-registers.h
+++ b/arch/mips/include/asm/mach-ps2/gs-registers.h
@@ -554,10 +554,18 @@ struct gs_siglblid {
 #define GS_DECLARE_WQ_REG(reg)				\
 	void gs_writeq_##reg(u64 value)
 
-#define GS_DECLARE_RW_REG(reg)				\
+#define GS_DECLARE_RS_REG(reg, str)			\
+	struct gs_##str gs_read_##reg(void)
+
+#define GS_DECLARE_WS_REG(reg, str)			\
+	void gs_write_##reg(struct gs_##str value)
+
+#define GS_DECLARE_RW_REG(reg, str)			\
 	GS_DECLARE_VALID_REG(reg);			\
 	GS_DECLARE_RQ_REG(reg);				\
-	GS_DECLARE_WQ_REG(reg)
+	GS_DECLARE_WQ_REG(reg);				\
+	GS_DECLARE_RS_REG(reg, str);			\
+	GS_DECLARE_WS_REG(reg, str)
 
 /**
  * DOC:
@@ -569,6 +577,9 @@ struct gs_siglblid {
  *	u64 gs_readq_csr(void);
  *	void gs_writeq_csr(u64 value);
  *
+ *	struct gs_csr gs_read_csr(void);
+ *	void gs_write_csr(struct gs_csr value);
+ *
  * gs_valid_csr() indicates whether CSR is readable, which is always true,
  * since CSR is read-write in hardware. The IMR register however is write-
  * only in hardware, so its shadow register is only valid and readable once
@@ -578,24 +589,24 @@ struct gs_siglblid {
  * SYNCH1, SYNCH2, SYNCV, DISPFB1 , DISPLAY1, DISPFB2, DISPLAY2, EXTBUF,
  * EXTDATA, EXTWRITE, BGCOLOR, CSR, IMR, BUSDIR and SIGLBLID.
  */
-GS_DECLARE_RW_REG(pmode);
-GS_DECLARE_RW_REG(smode1);
-GS_DECLARE_RW_REG(smode2);
-GS_DECLARE_RW_REG(srfsh);
-GS_DECLARE_RW_REG(synch1);
-GS_DECLARE_RW_REG(synch2);
-GS_DECLARE_RW_REG(syncv);
-GS_DECLARE_RW_REG(dispfb1 );
-GS_DECLARE_RW_REG(display1);
-GS_DECLARE_RW_REG(dispfb2);
-GS_DECLARE_RW_REG(display2);
-GS_DECLARE_RW_REG(extbuf);
-GS_DECLARE_RW_REG(extdata);
-GS_DECLARE_RW_REG(extwrite);
-GS_DECLARE_RW_REG(bgcolor);
-GS_DECLARE_RW_REG(csr);
-GS_DECLARE_RW_REG(imr);
-GS_DECLARE_RW_REG(busdir);
-GS_DECLARE_RW_REG(siglblid);
+GS_DECLARE_RW_REG(pmode,    pmode);
+GS_DECLARE_RW_REG(smode1,   smode1);
+GS_DECLARE_RW_REG(smode2,   smode2);
+GS_DECLARE_RW_REG(srfsh,    srfsh);
+GS_DECLARE_RW_REG(synch1,   synch1);
+GS_DECLARE_RW_REG(synch2,   synch2);
+GS_DECLARE_RW_REG(syncv,    syncv);
+GS_DECLARE_RW_REG(dispfb1 , dispfb);
+GS_DECLARE_RW_REG(display1, display);
+GS_DECLARE_RW_REG(dispfb2,  dispfb);
+GS_DECLARE_RW_REG(display2, display);
+GS_DECLARE_RW_REG(extbuf,   extbuf);
+GS_DECLARE_RW_REG(extdata,  extdata);
+GS_DECLARE_RW_REG(extwrite, extwrite);
+GS_DECLARE_RW_REG(bgcolor,  bgcolor);
+GS_DECLARE_RW_REG(csr,      csr);
+GS_DECLARE_RW_REG(imr,      imr);
+GS_DECLARE_RW_REG(busdir,   busdir);
+GS_DECLARE_RW_REG(siglblid, siglblid);
 
 #endif /* __ASM_MACH_PS2_GS_REGISTERS_H */
diff --git a/drivers/ps2/gs-registers.c b/drivers/ps2/gs-registers.c
index debaf0153fbe..1bd1d072f4cf 100644
--- a/drivers/ps2/gs-registers.c
+++ b/drivers/ps2/gs-registers.c
@@ -108,37 +108,64 @@ static struct {
 	}								\
 	EXPORT_SYMBOL_GPL(gs_writeq_##reg)
 
+/* Read registers as structures, which simplifies notation. */
+#define GS_DEFINE_RS_REG(reg, str)					\
+	struct gs_##str gs_read_##reg(void)				\
+	{								\
+		const u64 v = gs_readq_##reg();				\
+		struct gs_##str value;					\
+		BUILD_BUG_ON(sizeof(v) != sizeof(value));		\
+		memcpy(&value, &v, sizeof(v));				\
+		return value;						\
+	}								\
+	EXPORT_SYMBOL_GPL(gs_read_##reg)
+
+/* Write registers as structures, which simplifies notation. */
+#define GS_DEFINE_WS_REG(reg, str)					\
+	void gs_write_##reg(struct gs_##str value)			\
+	{								\
+		u64 v;							\
+		BUILD_BUG_ON(sizeof(v) != sizeof(value));		\
+		memcpy(&v, &value, sizeof(v));				\
+		gs_writeq_##reg(v);					\
+	}								\
+	EXPORT_SYMBOL_GPL(gs_write_##reg)
+
 /* Only CSR and SIGLBLID are read-write (RW) with hardware. */
-#define GS_DEFINE_RW_REG(reg, addr)					\
+#define GS_DEFINE_RW_REG(reg, str, addr)				\
 	GS_DEFINE_VALID_RW_REG(reg, addr);				\
 	GS_DEFINE_RQ_RW_REG(reg, addr);					\
-	GS_DEFINE_WQ_RW_REG(reg, addr)
+	GS_DEFINE_WQ_RW_REG(reg, addr);					\
+	GS_DEFINE_RS_REG(reg, str);					\
+	GS_DEFINE_WS_REG(reg, str)
 
 /* The rest are write-only (WO) with reading emulated by shadow registers. */
-#define GS_DEFINE_WO_REG(reg, addr)					\
+#define GS_DEFINE_WO_REG(reg, str, addr)				\
 	GS_DEFINE_VALID_WO_REG(reg, addr);				\
 	GS_DEFINE_RQ_WO_REG(reg, addr);					\
-	GS_DEFINE_WQ_WO_REG(reg, addr)
-
-GS_DEFINE_WO_REG(pmode,    GS_PMODE);
-GS_DEFINE_WO_REG(smode1,   GS_SMODE1);
-GS_DEFINE_WO_REG(smode2,   GS_SMODE2);
-GS_DEFINE_WO_REG(srfsh,    GS_SRFSH);
-GS_DEFINE_WO_REG(synch1,   GS_SYNCH1);
-GS_DEFINE_WO_REG(synch2,   GS_SYNCH2);
-GS_DEFINE_WO_REG(syncv,    GS_SYNCV);
-GS_DEFINE_WO_REG(dispfb1,  GS_DISPFB1);
-GS_DEFINE_WO_REG(display1, GS_DISPLAY1);
-GS_DEFINE_WO_REG(dispfb2,  GS_DISPFB2);
-GS_DEFINE_WO_REG(display2, GS_DISPLAY2);
-GS_DEFINE_WO_REG(extbuf,   GS_EXTBUF);
-GS_DEFINE_WO_REG(extdata,  GS_EXTDATA);
-GS_DEFINE_WO_REG(extwrite, GS_EXTWRITE);
-GS_DEFINE_WO_REG(bgcolor,  GS_BGCOLOR);
-GS_DEFINE_RW_REG(csr,      GS_CSR);		/* Read-write */
-GS_DEFINE_WO_REG(imr,      GS_IMR);
-GS_DEFINE_WO_REG(busdir,   GS_BUSDIR);
-GS_DEFINE_RW_REG(siglblid, GS_SIGLBLID);	/* Read-write */
+	GS_DEFINE_WQ_WO_REG(reg, addr);					\
+	GS_DEFINE_RS_REG(reg, str);					\
+	GS_DEFINE_WS_REG(reg, str)
+
+GS_DEFINE_WO_REG(pmode,    pmode,    GS_PMODE);
+GS_DEFINE_WO_REG(smode1,   smode1,   GS_SMODE1);
+GS_DEFINE_WO_REG(smode2,   smode2,   GS_SMODE2);
+GS_DEFINE_WO_REG(srfsh,    srfsh,    GS_SRFSH);
+GS_DEFINE_WO_REG(synch1,   synch1,   GS_SYNCH1);
+GS_DEFINE_WO_REG(synch2,   synch2,   GS_SYNCH2);
+GS_DEFINE_WO_REG(syncv,    syncv,    GS_SYNCV);
+GS_DEFINE_WO_REG(dispfb1,  dispfb,   GS_DISPFB1);
+GS_DEFINE_WO_REG(display1, display,  GS_DISPLAY1);
+GS_DEFINE_WO_REG(dispfb2,  dispfb,   GS_DISPFB2);
+GS_DEFINE_WO_REG(display2, display,  GS_DISPLAY2);
+GS_DEFINE_WO_REG(extbuf,   extbuf,   GS_EXTBUF);
+GS_DEFINE_WO_REG(extdata,  extdata,  GS_EXTDATA);
+GS_DEFINE_WO_REG(extwrite, extwrite, GS_EXTWRITE);
+GS_DEFINE_WO_REG(bgcolor,  bgcolor,  GS_BGCOLOR);
+GS_DEFINE_RW_REG(csr,      csr,      GS_CSR);		/* Read-write */
+GS_DEFINE_WO_REG(imr,      imr,      GS_IMR);
+GS_DEFINE_WO_REG(busdir,   busdir,   GS_BUSDIR);
+GS_DEFINE_RW_REG(siglblid, siglblid, GS_SIGLBLID);	/* Read-write */
 
 MODULE_DESCRIPTION("PlayStation 2 privileged Graphics Synthesizer registers");
 MODULE_AUTHOR("Fredrik Noring");
-- 
2.21.0

