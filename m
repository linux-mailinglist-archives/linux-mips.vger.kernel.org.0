Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F2D2996CF
	for <lists+linux-mips@lfdr.de>; Mon, 26 Oct 2020 20:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1784705AbgJZT2r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Oct 2020 15:28:47 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:46242 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1771819AbgJZT2r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Oct 2020 15:28:47 -0400
X-Greylist: delayed 483 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Oct 2020 15:28:46 EDT
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id A0A7F20025;
        Mon, 26 Oct 2020 20:20:41 +0100 (CET)
Date:   Mon, 26 Oct 2020 20:20:40 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: ingenic: remove unused platform_data header file
Message-ID: <20201026192040.GA350265@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=ER_8r6IbAAAA:8 a=pGLkceISAAAA:8
        a=VwQbUJbxAAAA:8 a=uQuhfNHRO4FUOSlaa58A:9 a=xKLVSe3KOgD2ymKV:21
        a=1kv-E1XruN2_AKl-:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
        a=9LHmKk7ezEChjTCyhBa9:22 a=AjGcO6oz07-iQ99wixmX:22
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are no users of this headers file in the kernel.
All users are likely migrated to device tree which is a good thing.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mips@vger.kernel.org
---

I noticed this while surfing around in platform_data for no apperant
reason. So no fancy tooling or some such involved.

	Sam

 .../linux/platform_data/jz4740/jz4740_nand.h  | 25 -------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 include/linux/platform_data/jz4740/jz4740_nand.h

diff --git a/include/linux/platform_data/jz4740/jz4740_nand.h b/include/linux/platform_data/jz4740/jz4740_nand.h
deleted file mode 100644
index b3f066d63059..000000000000
--- a/include/linux/platform_data/jz4740/jz4740_nand.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
- *  JZ4740 SoC NAND controller driver
- */
-
-#ifndef __JZ4740_NAND_H__
-#define __JZ4740_NAND_H__
-
-#include <linux/mtd/rawnand.h>
-#include <linux/mtd/partitions.h>
-
-#define JZ_NAND_NUM_BANKS 4
-
-struct jz_nand_platform_data {
-	int			num_partitions;
-	struct mtd_partition	*partitions;
-
-	unsigned char banks[JZ_NAND_NUM_BANKS];
-
-	void (*ident_callback)(struct platform_device *, struct mtd_info *,
-				struct mtd_partition **, int *num_partitions);
-};
-
-#endif
-- 
2.27.0

