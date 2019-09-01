Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAEEEA4A80
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbfIAQUV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:20:21 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:44434 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbfIAQUU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:20:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 0DEEE3F660
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:20:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id q01IsAAr1y7W for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:20:18 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 4803E3F58C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:20:18 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:20:18 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 081/120] MIPS: PS2: GS: Privileged register write macros with
 named fields
Message-ID: <bbab8e0c1cb585d74fc246e01ebade10fa317d3f.1567326213.git.noring@nocrew.org>
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

The Graphics Synthesizer write macros simplifies register writing,
allowing named fields in statements such as GS_WRITE_CSR( .flush = 1 ).

The following registers have macros: PMODE, SMODE1, SMODE2, SRFSH, SYNCH1,
SYNCH2, SYNCV, DISPLAY1, DISPLAY2, DISPFB1, DISPFB2, CSR and BUSDIR.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/gs-registers.h | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/gs-registers.h b/arch/mips/include/asm/mach-ps2/gs-registers.h
index badcb3cce5c2..95243a35e26d 100644
--- a/arch/mips/include/asm/mach-ps2/gs-registers.h
+++ b/arch/mips/include/asm/mach-ps2/gs-registers.h
@@ -609,6 +609,32 @@ GS_DECLARE_RW_REG(imr,      imr);
 GS_DECLARE_RW_REG(busdir,   busdir);
 GS_DECLARE_RW_REG(siglblid, siglblid);
 
+#define GS_WS_REG(reg, str, ...)			\
+	gs_write_##reg((struct gs_##str) { __VA_ARGS__ })
+
+/**
+ * DOC:
+ *
+ * The Graphics Synthesizer write macros simplifies register writing,
+ * allowing named fields in statements such as GS_WRITE_CSR( .flush = 1 ).
+ *
+ * The following registers have macros: PMODE, SMODE1, SMODE2, SRFSH, SYNCH1,
+ * SYNCH2, SYNCV, DISPLAY1, DISPLAY2, DISPFB1, DISPFB2, CSR and BUSDIR.
+ */
+#define GS_WRITE_PMODE(...)    GS_WS_REG(pmode,    pmode,   __VA_ARGS__)
+#define GS_WRITE_SMODE1(...)   GS_WS_REG(smode1,   smode1,  __VA_ARGS__)
+#define GS_WRITE_SMODE2(...)   GS_WS_REG(smode2,   smode2,  __VA_ARGS__)
+#define GS_WRITE_SRFSH(...)    GS_WS_REG(srfsh,    srfsh,   __VA_ARGS__)
+#define GS_WRITE_SYNCH1(...)   GS_WS_REG(synch1,   synch1,  __VA_ARGS__)
+#define GS_WRITE_SYNCH2(...)   GS_WS_REG(synch2,   synch2,  __VA_ARGS__)
+#define GS_WRITE_SYNCV(...)    GS_WS_REG(syncv,    syncv,   __VA_ARGS__)
+#define GS_WRITE_DISPLAY1(...) GS_WS_REG(display1, display, __VA_ARGS__)
+#define GS_WRITE_DISPLAY2(...) GS_WS_REG(display2, display, __VA_ARGS__)
+#define GS_WRITE_DISPFB1(...)  GS_WS_REG(dispfb1,  dispfb,  __VA_ARGS__)
+#define GS_WRITE_DISPFB2(...)  GS_WS_REG(dispfb2,  dispfb,  __VA_ARGS__)
+#define GS_WRITE_CSR(...)      GS_WS_REG(csr,      csr,     __VA_ARGS__)
+#define GS_WRITE_BUSDIR(...)   GS_WS_REG(busdir,   busdir,  __VA_ARGS__)
+
 /**
  * gs_xorq_imr - exclusive or (XOR) value with the IMR register
  * @value: value to XOR with the IMR register
-- 
2.21.0

