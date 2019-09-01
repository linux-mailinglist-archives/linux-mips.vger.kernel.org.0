Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC72DA4A3B
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbfIAPv6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:51:58 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:56978 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbfIAPv5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:51:57 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 6B99B404FF
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:43:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 6CLKjmgsfE7T for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:43:05 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 751EB403CF
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:43:05 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:43:05 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 020/120] MIPS: R5900: Define CP0.Config register fields
Message-ID: <e7bb27bb8ff03271ee0da7f94fbd41a68bd404ca.1567326213.git.noring@nocrew.org>
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

The following CP0.Config fields are specific to the R5900[1]:

	Field | Bit | Type | Description
	------+-----+------+-----------------------------
	  DIE |  18 |   RW | Enable double issue
	  ICE |  17 |   RW | Enable the instruction cache
	  DCE |  16 |   RW | Enable the data cache
	  BE  |  15 |   RO | Enable big-endian
	  NBE |  13 |   RW | Enable nonblocking load
	  BPE |  12 |   RW | Enable branch prediction
	------+-----+------+-----------------------------

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. 4-23, https://wiki.qemu.org/File:C790.pdf

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mipsregs.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index ec22406c800f..a3b3ee011539 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -511,6 +511,14 @@
 #define R5K_CONF_SE		(_ULCAST_(1) << 12)
 #define R5K_CONF_SS		(_ULCAST_(3) << 20)
 
+/* Bits specific to the R5900.	*/
+#define R5900_CONF_BPE		(_ULCAST_(1) << 12)	/* Enable branch prediction. */
+#define R5900_CONF_NBE		(_ULCAST_(1) << 13)	/* Enable non-blocking load. */
+#define R5900_CONF_BE		(_ULCAST_(1) << 15)	/* Enable big-endian (read-only). */
+#define R5900_CONF_DCE		(_ULCAST_(1) << 16)	/* Enable the data cache. */
+#define R5900_CONF_ICE		(_ULCAST_(1) << 17)	/* Enable the instruction cache. */
+#define R5900_CONF_DIE		(_ULCAST_(1) << 18)	/* Enable double issue. */
+
 /* Bits specific to the RM7000.	 */
 #define RM7K_CONF_SE		(_ULCAST_(1) <<	 3)
 #define RM7K_CONF_TE		(_ULCAST_(1) << 12)
-- 
2.21.0

