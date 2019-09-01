Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21C6AA4A3C
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfIAPv6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:51:58 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:56980 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIAPv5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:51:57 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id D59A03F8A6
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:42:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oDsKhZb89sZS for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:42:03 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id D7BA63F752
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:42:03 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:42:03 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 017/120] MIPS: R5900: Define CACHE instruction operation
 field encodings
Message-ID: <e54ca2c5650a047fd2dbc3ebe9d5d6d388733e3c.1567326213.git.noring@nocrew.org>
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

The CACHE instruction operation field encodings are listed in the TX79
manual[1]:

    Table C-1. CACHE Instruction Op Field Encoding

    Mnemonic | OpCode | CACHE Instruction            | Target
    ---------+--------+------------------------------+------------------
    IXIN     |  00111 | INDEX INVALIDATE             | Instruction Cache
    IXLTG    |  00000 | INDEX LOAD TAG               | Instruction Cache
    IXSTG    |  00100 | INDEX STORE TAG              | Instruction Cache
    IHIN     |  01011 | HIT INVALIDATE               | Instruction Cache
    IFL      |  01110 | FILL                         | Instruction Cache
    IXLDT    |  00001 | INDEX LOAD DATA              | Instruction Cache
    IXSDT    |  00101 | INDEX STORE DATA             | Instruction Cache
    ---------+--------+------------------------------+------------------
    BXLBT    |  00010 | INDEX LOAD BTACC             | BTAC
    BXSBT    |  00110 | INDEX STORE BTAC             | BTAC
    BFH      |  01100 | BTAC FLUSH                   | BTAC
    BHINBT   |  01010 | HIT INVALIDATE BTAC          | BTAC
    ---------+--------+------------------------------+------------------
    DXWBIN   |  10100 | INDEX WRITE BACK INVALIDATE  | Data Cache
    DXLTG    |  10000 | INDEX LOAD TAG               | Data Cache
    DXSTG    |  10010 | INDEX STORE TAG              | Data Cache
    DXIN     |  10110 | INDEX INVALIDATE             | Data Cache
    DHIN     |  11010 | HIT INVALIDATE               | Data Cache
    DHWBIN   |  11000 | HIT WRITEBACK INVALIDATE     | Data Cache
    DXLDT    |  10001 | INDEX LOAD DATA              | Data Cache
    DXSDT    |  10011 | INDEX STORE DATA             | Data Cache
    DHWOIN   |  11100 | HIT WRITEBACK W/O INVALIDATE | Data Cache
    ---------+--------+------------------------------+------------------

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. C-6, https://wiki.qemu.org/File:C790.pdf

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/cacheops.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/mips/include/asm/cacheops.h b/arch/mips/include/asm/cacheops.h
index 8031fbc6b69a..3a6b34be1122 100644
--- a/arch/mips/include/asm/cacheops.h
+++ b/arch/mips/include/asm/cacheops.h
@@ -34,6 +34,17 @@
 /*
  * Cache Operations available on all MIPS processors with R4000-style caches
  */
+#ifdef CONFIG_CPU_R5900
+#define Index_Invalidate_I		0x07
+#define Index_Writeback_Inv_D		0x14
+#define Index_Load_Tag_I		0x00
+#define Index_Load_Tag_D		0x10
+#define Index_Store_Tag_I		0x04
+#define Index_Store_Tag_D		0x12
+#define Hit_Invalidate_I		0x0b
+#define Hit_Invalidate_D		0x1a
+#define Hit_Writeback_Inv_D		0x18
+#else
 #define Index_Invalidate_I		(Cache_I | Index_Writeback_Inv)
 #define Index_Writeback_Inv_D		(Cache_D | Index_Writeback_Inv)
 #define Index_Load_Tag_I		(Cache_I | Index_Load_Tag)
@@ -43,14 +54,20 @@
 #define Hit_Invalidate_I		(Cache_I | Hit_Invalidate)
 #define Hit_Invalidate_D		(Cache_D | Hit_Invalidate)
 #define Hit_Writeback_Inv_D		(Cache_D | Hit_Writeback_Inv)
+#endif
 
 /*
  * R4000-specific cacheops
  */
 #define Create_Dirty_Excl_D		(Cache_D | 0x0c)
+#ifdef CONFIG_CPU_R5900
+#define Fill				0x0e
+#define Hit_Writeback_D			0x1c
+#else
 #define Fill				(Cache_I | 0x14)
 #define Hit_Writeback_I			(Cache_I | Hit_Writeback)
 #define Hit_Writeback_D			(Cache_D | Hit_Writeback)
+#endif
 
 /*
  * R4000SC and R4400SC-specific cacheops
-- 
2.21.0

