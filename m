Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADCED5B8A1
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2019 12:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728623AbfGAKF1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jul 2019 06:05:27 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:36125 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728635AbfGAKF1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jul 2019 06:05:27 -0400
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: antoine.tenart@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 529EA200010;
        Mon,  1 Jul 2019 10:05:25 +0000 (UTC)
From:   Antoine Tenart <antoine.tenart@bootlin.com>
To:     davem@davemloft.net, richardcochran@gmail.com,
        alexandre.belloni@bootlin.com, UNGLinuxDriver@microchip.com,
        ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org
Cc:     Antoine Tenart <antoine.tenart@bootlin.com>,
        netdev@vger.kernel.org, linux-mips@vger.kernel.org,
        thomas.petazzoni@bootlin.com, allan.nielsen@microchip.com
Subject: [PATCH net-next 6/8] net: mscc: improve the frame header parsing readability
Date:   Mon,  1 Jul 2019 12:03:25 +0200
Message-Id: <20190701100327.6425-7-antoine.tenart@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701100327.6425-1-antoine.tenart@bootlin.com>
References: <20190701100327.6425-1-antoine.tenart@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This cosmetic patch improves the frame header parsing readability by
introducing a new macro to access and mask its fields.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 drivers/net/ethernet/mscc/ocelot_board.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mscc/ocelot_board.c b/drivers/net/ethernet/mscc/ocelot_board.c
index c508e51c1e28..09ad6a123347 100644
--- a/drivers/net/ethernet/mscc/ocelot_board.c
+++ b/drivers/net/ethernet/mscc/ocelot_board.c
@@ -16,24 +16,26 @@
 
 #include "ocelot.h"
 
-static int ocelot_parse_ifh(u32 *ifh, struct frame_info *info)
+#define IFH_EXTRACT_BITFIELD64(x, o, w) (((x) >> (o)) & GENMASK_ULL((w) - 1, 0))
+
+static int ocelot_parse_ifh(u32 *_ifh, struct frame_info *info)
 {
-	int i;
 	u8 llen, wlen;
+	u64 ifh[2];
+
+	ifh[0] = be64_to_cpu(((__force __be64 *)_ifh)[0]);
+	ifh[1] = be64_to_cpu(((__force __be64 *)_ifh)[1]);
 
-	/* The IFH is in network order, switch to CPU order */
-	for (i = 0; i < IFH_LEN; i++)
-		ifh[i] = ntohl((__force __be32)ifh[i]);
+	wlen = IFH_EXTRACT_BITFIELD64(ifh[0], 7,  8);
+	llen = IFH_EXTRACT_BITFIELD64(ifh[0], 15,  6);
 
-	wlen = (ifh[1] >> 7) & 0xff;
-	llen = (ifh[1] >> 15) & 0x3f;
 	info->len = OCELOT_BUFFER_CELL_SZ * wlen + llen - 80;
 
-	info->port = (ifh[2] & GENMASK(14, 11)) >> 11;
+	info->port = IFH_EXTRACT_BITFIELD64(ifh[1], 43, 4);
 
-	info->cpuq = (ifh[3] & GENMASK(27, 20)) >> 20;
-	info->tag_type = (ifh[3] & BIT(16)) >> 16;
-	info->vid = ifh[3] & GENMASK(11, 0);
+	info->cpuq = IFH_EXTRACT_BITFIELD64(ifh[1], 20, 8);
+	info->tag_type = IFH_EXTRACT_BITFIELD64(ifh[1], 16,  1);
+	info->vid = IFH_EXTRACT_BITFIELD64(ifh[1], 0,  12);
 
 	return 0;
 }
-- 
2.21.0

