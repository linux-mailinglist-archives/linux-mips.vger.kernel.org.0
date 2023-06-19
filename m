Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA7E3735E37
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 22:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjFSUMk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 16:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjFSUMj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 16:12:39 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F35E63
        for <linux-mips@vger.kernel.org>; Mon, 19 Jun 2023 13:12:37 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id BLEoqAqsDv5uIBLEqqiBLs; Mon, 19 Jun 2023 22:12:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205556; bh=lyCbjqHo7qkwYB9OohFbhbYIko9aM20GhJlzYuX2OhY=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=rMTeh3n0tWsPXHQGL7oVdumJ8UPBh8msvZNzAEEWpiVjDNiOWDecvvgVyC1D+XCjS
         GPAZnYHFBBRwhiWOW791fP6rmZOYlF25DT2EvnlcNosYzW7IAgdTsYmcB/lY8ULfvr
         hAy93ejCaI05jF1jfe9jVBNEqN/aTvt0SCt9RVqhGXzjGfAV4P0uW3BX0gVLqGPE3q
         T0cvQXcEVhSHp0MSniyqsTNbROt4QkYSsr6+2Z21JHtBKm+RgWVPjFvYvJqCILPAgK
         48PJHpDHIG4dh2C2AiQBZO/2FHFF/+93OJBdyo2/sPqK0OQ3yWdKNl3G7mbtCXj7uq
         pIjwoetHhH+4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205556; bh=lyCbjqHo7qkwYB9OohFbhbYIko9aM20GhJlzYuX2OhY=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=rMTeh3n0tWsPXHQGL7oVdumJ8UPBh8msvZNzAEEWpiVjDNiOWDecvvgVyC1D+XCjS
         GPAZnYHFBBRwhiWOW791fP6rmZOYlF25DT2EvnlcNosYzW7IAgdTsYmcB/lY8ULfvr
         hAy93ejCaI05jF1jfe9jVBNEqN/aTvt0SCt9RVqhGXzjGfAV4P0uW3BX0gVLqGPE3q
         T0cvQXcEVhSHp0MSniyqsTNbROt4QkYSsr6+2Z21JHtBKm+RgWVPjFvYvJqCILPAgK
         48PJHpDHIG4dh2C2AiQBZO/2FHFF/+93OJBdyo2/sPqK0OQ3yWdKNl3G7mbtCXj7uq
         pIjwoetHhH+4w==
Date:   Mon, 19 Jun 2023 22:12:34 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 04/11] MIPS: OCTEON: octeon-usb: use bitfields for shim
 register
Message-ID: <ZJC2sipL99ClOwV+@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJC165p0Mj4jHcBh@lenoch>
X-CMAE-Envelope: MS4wfOQoUkTR/cfOd95jOLfVwC6n+t1GYeXJD8XUFvnQY46yvUrjKYLc3q/fQNiDOm9Kmp1TvXon6sCiV1J9/WOzPVHnC11qHegcf448WKMW2trGZXBFzzOl
 MGKCjxHzqehjuF0OTpX9XmqIAFeewY4wC1POc3jKJ09oKLoeOMzFGfXKBFJd5+KArGtmqTJsSGLax5qRjc1CVk/L6/OykHKMMHqnx8Atn9H/nI/okvapCwI8
 32a///sr6rjLtdXjEmAeCA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Use Linux standard bitfield access macros to manipulate
shim register.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 arch/mips/cavium-octeon/octeon-usb.c | 96 ++++++++++++----------------
 1 file changed, 41 insertions(+), 55 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
index 17051aee491d..1c48ee77125a 100644
--- a/arch/mips/cavium-octeon/octeon-usb.c
+++ b/arch/mips/cavium-octeon/octeon-usb.c
@@ -152,57 +152,43 @@
  */
 # define USBDRD_UCTL_HOST_PPC_ACTIVE_HIGH_EN	BIT(24)
 
+/*
+ * UCTL Shim Features Register
+ */
 #define USBDRD_UCTL_SHIM_CFG			0xe8
+/* Out-of-bound UAHC register access: 0 = read, 1 = write */
+# define USBDRD_UCTL_SHIM_CFG_XS_NCB_OOB_WRN	BIT(63)
+/* SRCID error log for out-of-bound UAHC register access:
+ *	[59:58] = chipID
+ *	[57] = Request source: 0 = core, 1 = NCB-device
+ *	[56:51] = Core/NCB-device number, [56] always 0 for NCB devices
+ *	[50:48] = SubID
+ */
+# define USBDRD_UCTL_SHIM_CFG_XS_NCB_OOB_OSRC	GENMASK(59, 48)
+/* Error log for bad UAHC DMA access: 0 = Read log, 1 = Write log */
+# define USBDRD_UCTL_SHIM_CFG_XM_BAD_DMA_WRN	BIT(47)
+/* Encoded error type for bad UAHC DMA */
+# define USBDRD_UCTL_SHIM_CFG_XM_BAD_DMA_TYPE	GENMASK(43, 40)
+/* Select the IOI read command used by DMA accesses */
+# define USBDRD_UCTL_SHIM_CFG_DMA_READ_CMD	BIT(12)
+/* Select endian format for DMA accesses to the L2C:
+ *	0x0 = Little endian
+ *	0x1 = Big endian
+ *	0x2 = Reserved
+ *	0x3 = Reserved
+ */
+# define USBDRD_UCTL_SHIM_CFG_DMA_ENDIAN_MODE	GENMASK(9, 8)
+/* Select endian format for IOI CSR access to UAHC:
+ *	0x0 = Little endian
+ *	0x1 = Big endian
+ *	0x2 = Reserved
+ *	0x3 = Reserved
+ */
+# define USBDRD_UCTL_SHIM_CFG_CSR_ENDIAN_MODE	GENMASK(1, 0)
+
 #define USBDRD_UCTL_ECC				0xf0
 #define USBDRD_UCTL_SPARE1			0xf8
 
-/* UCTL Shim Features Register */
-union cvm_usbdrd_uctl_shim_cfg {
-	uint64_t u64;
-	struct cvm_usbdrd_uctl_shim_cfg_s {
-	/* Out-of-bound UAHC register access: 0 = read, 1 = write */
-	__BITFIELD_FIELD(uint64_t xs_ncb_oob_wrn:1,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_60_62:3,
-	/* SRCID error log for out-of-bound UAHC register access:
-	 *	[59:58] = chipID
-	 *	[57] = Request source: 0 = core, 1 = NCB-device
-	 *	[56:51] = Core/NCB-device number, [56] always 0 for NCB devices
-	 *	[50:48] = SubID
-	 */
-	__BITFIELD_FIELD(uint64_t xs_ncb_oob_osrc:12,
-	/* Error log for bad UAHC DMA access: 0 = Read log, 1 = Write log */
-	__BITFIELD_FIELD(uint64_t xm_bad_dma_wrn:1,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_44_46:3,
-	/* Encoded error type for bad UAHC DMA */
-	__BITFIELD_FIELD(uint64_t xm_bad_dma_type:4,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_13_39:27,
-	/* Select the IOI read command used by DMA accesses */
-	__BITFIELD_FIELD(uint64_t dma_read_cmd:1,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_10_11:2,
-	/* Select endian format for DMA accesses to the L2c:
-	 *	0x0 = Little endian
-	 *`	0x1 = Big endian
-	 *	0x2 = Reserved
-	 *	0x3 = Reserved
-	 */
-	__BITFIELD_FIELD(uint64_t dma_endian_mode:2,
-	/* Reserved */
-	__BITFIELD_FIELD(uint64_t reserved_2_7:6,
-	/* Select endian format for IOI CSR access to UAHC:
-	 *	0x0 = Little endian
-	 *`	0x1 = Big endian
-	 *	0x2 = Reserved
-	 *	0x3 = Reserved
-	 */
-	__BITFIELD_FIELD(uint64_t csr_endian_mode:2,
-	;))))))))))))
-	} s;
-};
-
 #define OCTEON_H_CLKDIV_SEL		8
 #define OCTEON_MIN_H_CLK_RATE		150000000
 #define OCTEON_MAX_H_CLK_RATE		300000000
@@ -456,17 +442,17 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
 
 static void __init dwc3_octeon_set_endian_mode(u64 base)
 {
-	union cvm_usbdrd_uctl_shim_cfg shim_cfg;
+	u64 val;
+	u64 uctl_shim_cfg_reg = base + USBDRD_UCTL_SHIM_CFG;
 
-	shim_cfg.u64 = cvmx_read_csr(base + USBDRD_UCTL_SHIM_CFG);
+	val = cvmx_read_csr(uctl_shim_cfg_reg);
+	val &= ~USBDRD_UCTL_SHIM_CFG_DMA_ENDIAN_MODE;
+	val &= ~USBDRD_UCTL_SHIM_CFG_CSR_ENDIAN_MODE;
 #ifdef __BIG_ENDIAN
-	shim_cfg.s.dma_endian_mode = 1;
-	shim_cfg.s.csr_endian_mode = 1;
-#else
-	shim_cfg.s.dma_endian_mode = 0;
-	shim_cfg.s.csr_endian_mode = 0;
+	val |= FIELD_PREP(USBDRD_UCTL_SHIM_CFG_DMA_ENDIAN_MODE, 1);
+	val |= FIELD_PREP(USBDRD_UCTL_SHIM_CFG_CSR_ENDIAN_MODE, 1);
 #endif
-	cvmx_write_csr(base + USBDRD_UCTL_SHIM_CFG, shim_cfg.u64);
+	cvmx_write_csr(uctl_shim_cfg_reg, val);
 }
 
 static void __init dwc3_octeon_phy_reset(u64 base)
-- 
2.39.2

