Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA597A4A84
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbfIAQWA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:22:00 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:59532 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728672AbfIAQWA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:22:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 103CA3F393
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:21:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nUM9eo2b1Y51 for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:21:56 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 32C2F3F73E
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:21:55 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:21:55 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 084/120] MIPS: PS2: GIF: Define Graphics Synthesizer
 interface structures
Message-ID: <277cabae8f0e5ff45a952fea64dbdf1213d52af0.1567326213.git.noring@nocrew.org>
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

The Graphics Synthesizer interface (GIF) formats data based on the GIF
tags at the start of display list packets, and then transfer formatted
data to the GS as drawing commands[1].

The GIF has three kinds of general data transfer paths:

- PATH1: data from vector processor unit 1 (VPU1) memory;
- PATH2: data via the VPU1 interface packet expansion engine (VIF1) FIFO;
- PATH3: data directly from the main bus to the Graphics Synthesizer.

The GIF tag is a 16-byte fixed length object that specifies the size
and structure of subsequent data. Up to 16 register descriptors can be
specified in one GIF tag, specifying to which registers of the GS the
input data following the GIF tag should be output and the packing
format mode:

- in PACKED mode, the data of each quadword is interpreted and packed
  according to the register descriptor in the GIF tag, and is output
  to the address specified in the same way by the register descriptor;

- in REGLIST mode, the data following the GIF tag is considered to be
  data strings of 2x64 bits and output as is without packing by setting
  the register descriptor value as the output destination address;

- in IMAGE mode, the data following the GIF tag is considered to be
  data strings of 2x64 bits and output to the host-local transfer
  register HWREG of the GS, used when transferring image data such as
  textures.

The privileged registers of the GS are directly mapped in the address
space of the main bus, and are not accessible via the GIF regardless of
the state of the general data transfer path. The GIF monitors access to
the privileged registers.

It is nontrivial to transfer data from GS local memory by reversing the
direction with the privileged BUSDIR register.

References:

[1] "EE User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    pp. 147-160.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
I think a /dev/gs device for the Graphics Synthesizer could be very useful,
which is why the GIF header file is put in the uapi directory, but no such
device driver exists at the moment so perhaps the header file could be
kernel private until then?
---
 arch/mips/include/uapi/asm/gif.h | 164 +++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 arch/mips/include/uapi/asm/gif.h

diff --git a/arch/mips/include/uapi/asm/gif.h b/arch/mips/include/uapi/asm/gif.h
new file mode 100644
index 000000000000..a952ed879de4
--- /dev/null
+++ b/arch/mips/include/uapi/asm/gif.h
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 Graphics Synthesizer interface (GIF)
+ *
+ * Copyright (C) 2018 Fredrik Noring
+ */
+
+/**
+ * DOC: Graphics Synthesizer interface (GIF) structures
+ *
+ * The Graphics Synthesizer interface (GIF) formats data based on the GIF tags
+ * at the start of display list packets, and then transfer formatted data to
+ * the GS as drawing commands.
+ *
+ * The GIF has three kinds of general data transfer paths:
+ *
+ * - PATH1: data from vector processor unit 1 (VPU1) memory;
+ * - PATH2: data via the VPU1 interface packet expansion engine (VIF1) FIFO;
+ * - PATH3: data directly from the main bus to the Graphics Synthesizer.
+ *
+ * The GIF tag is a 16-byte fixed length object that specifies the size and
+ * structure of subsequent data. Up to 16 register descriptors can be specified
+ * in one GIF tag, specifying to which registers of the GS the input data
+ * following the GIF tag should be output and the packing format mode.
+ *
+ * The privileged registers of the GS are directly mapped to the address space
+ * of the main bus, and are not accessible via the GIF regardless of the state
+ * of the general data transfer path. The GIF monitors access to the privileged
+ * registers.
+ */
+
+#ifndef _UAPI_MIPS_ASM_GIF_H
+#define _UAPI_MIPS_ASM_GIF_H
+
+#include <asm/bitfield.h>
+
+#include "gs.h"
+
+#define GIF_TAG_SIZE 16		/* 128 bits */
+#define gif_quadword_count(x) (((x) + GIF_TAG_SIZE-1) >> 4)
+
+/*
+ * When transferring data via PATH1 and PATH3 in parallel, do not apply the
+ * A+D packing format to the data on PATH3. This may cause the GS to hang.
+ */
+enum gif_tag_reg {
+	gif_reg_prim,        gif_reg_rgbaq,   gif_reg_st,     gif_reg_uv,
+	gif_reg_xyzf2,       gif_reg_xyz2,    gif_reg_tex0_1, gif_reg_tex0_2,
+	gif_reg_clamp_1,     gif_reg_clamp_2, gif_reg_fog,    /* Reserved */
+	gif_reg_xyzf3 = 0xc, gif_reg_xyz3,    gif_reg_ad,     gif_reg_nop
+};
+
+/**
+ * enum gif_tag_flg - GIF tag data packing format mode
+ * @gif_packed_mode: in PACKED mode, each quadword is interpreted and packed
+ * 	according to the register descriptor in the GIF tag, and is output to
+ * 	the address specified in the same way by the register descriptor
+ * @gif_reglist_mode: in REGLIST mode, the data following the GIF tag is
+ * 	considered to be data strings of 2x64 bits and output as is without
+ * 	packing by setting the register descriptor value as the output
+ * 	destination address
+ * @gif_image_mode: in IMAGE mode, the data following the GIF tag is considered
+ * 	to be data strings of 2x64 bits and output to the host-local transfer
+ * 	register HWREG of the GS, used when transferring image data such as
+ * 	textures
+ * @gif_disabled_mode: disable (same operation as the IMAGE mode)
+ */
+enum gif_tag_flg {
+	gif_packed_mode,
+	gif_reglist_mode,
+	gif_image_mode,
+	gif_disabled_mode
+};
+
+#define GIF_TAG_NLOOP_MAX 0x7fff	/* The NLOOP field is 15 bits */
+
+/*
+ * The REGS, NREG, PRIM and PRE fields of the GIF tag are ignored in IMAGE mode.
+ */
+struct gif_tag {
+	__BITFIELD_FIELD(__u64 reg15 : 4,
+	__BITFIELD_FIELD(__u64 reg14 : 4,
+	__BITFIELD_FIELD(__u64 reg13 : 4,
+	__BITFIELD_FIELD(__u64 reg12 : 4,
+	__BITFIELD_FIELD(__u64 reg11 : 4,
+	__BITFIELD_FIELD(__u64 reg10 : 4,
+	__BITFIELD_FIELD(__u64 reg9 : 4,
+	__BITFIELD_FIELD(__u64 reg8 : 4,
+	__BITFIELD_FIELD(__u64 reg7 : 4,
+	__BITFIELD_FIELD(__u64 reg6 : 4,
+	__BITFIELD_FIELD(__u64 reg5 : 4,
+	__BITFIELD_FIELD(__u64 reg4 : 4,
+	__BITFIELD_FIELD(__u64 reg3 : 4,
+	__BITFIELD_FIELD(__u64 reg2 : 4,
+	__BITFIELD_FIELD(__u64 reg1 : 4,
+	__BITFIELD_FIELD(__u64 reg0 : 4,	/* First register descriptor */
+	__BITFIELD_FIELD(__u64 nreg : 4,	/* 0 means 16 registers */
+	__BITFIELD_FIELD(__u64 flg : 2,		/* Data format mode */
+	__BITFIELD_FIELD(__u64 prim : 11,	/* PRIM register */
+	__BITFIELD_FIELD(__u64 pre : 1,		/* Enable PRIM field */
+	__BITFIELD_FIELD(__u64 : 30,
+	__BITFIELD_FIELD(__u64 eop : 1,		/* End of packet */
+	__BITFIELD_FIELD(__u64 nloop : 15,
+	;)))))))))))))))))))))))
+} __attribute__((aligned(GIF_TAG_SIZE)));
+
+union gif_reg {
+	struct gs_bitbltbuf bitbltbuf;
+	struct gs_clamp clamp_1;
+	struct gs_clamp clamp_2;
+	struct gs_dthe dthe;
+	struct gs_frame_12 frame_1;
+	struct gs_frame_12 frame_2;
+	struct gs_prim prim;
+	struct gs_prmode prmode;
+	struct gs_prmodecont prmodecont;
+	struct gs_rgbaq rgbaq;
+	struct gs_scanmsk_12 scanmsk;
+	struct gs_scissor_12 scissor_1;
+	struct gs_scissor_12 scissor_2;
+	struct gs_test_12 test_1;
+	struct gs_test_12 test_2;
+	struct gs_texa texa;
+	struct gs_tex0 tex0;
+	struct gs_tex1 tex1;
+	struct gs_tex2 tex2;
+	struct gs_trxdir trxdir;
+	struct gs_trxpos trxpos;
+	struct gs_trxreg trxreg;
+	struct gs_uv uv;
+	struct gs_xyz23 xyz2;
+	struct gs_xyz23 xyz3;
+	struct gs_xyoffset_12 xyoffset_1;
+	struct gs_xyoffset_12 xyoffset_2;
+	struct gs_zbuf zbuf;
+};
+
+struct gif_packed_ad {
+	union gif_reg data;			/* Register data */
+	__BITFIELD_FIELD(__u64 : 56,
+	__BITFIELD_FIELD(__u64 addr : 8,	/* Register address */
+	;))
+};
+
+struct gif_data_reg {
+	union gif_reg lo;
+	union gif_reg hi;
+};
+
+union gif_data {
+	struct gif_tag tag;
+	union {
+		struct gif_packed_ad ad;
+	} packed;
+	struct gif_data_reg reg;
+	struct gs_rgba32 rgba32[4];
+	__u8 image[16];	/* All pixel formats pack data without padding */
+	__u64 doubleword[2];
+	__u32 word[4];
+	__u16 halfword[8];
+	__u8 byte[16];
+} __attribute__((aligned(GIF_TAG_SIZE)));
+
+#endif /* _UAPI_MIPS_ASM_GIF_H */
-- 
2.21.0

