Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC52E22BE12
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jul 2020 08:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgGXG1h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jul 2020 02:27:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:41474 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726178AbgGXG1h (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Jul 2020 02:27:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 54606AC20;
        Fri, 24 Jul 2020 06:27:44 +0000 (UTC)
From:   Jiri Slaby <jslaby@suse.cz>
To:     gregkh@linuxfoundation.org
Cc:     linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Slaby <jslaby@suse.cz>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH] newport_con: vc_color is now in state
Date:   Fri, 24 Jul 2020 08:27:35 +0200
Message-Id: <20200724062735.18229-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <202007241318.wXYkumEO%lkp@intel.com>
References: <202007241318.wXYkumEO%lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since commit 28bc24fc46f9 (vc: separate state), vc->vc_color is known as
vc->state.color. Somehow both me and 0-day bot missed this driver during
the conversion.

So fix the driver now.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-mips@vger.kernel.org
---
 drivers/video/console/newport_con.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index df3c52d72159..72f146d047d9 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -362,12 +362,12 @@ static void newport_clear(struct vc_data *vc, int sy, int sx, int height,
 
 	if (ystart < yend) {
 		newport_clear_screen(sx << 3, ystart, xend, yend,
-				     (vc->vc_color & 0xf0) >> 4);
+				     (vc->state.color & 0xf0) >> 4);
 	} else {
 		newport_clear_screen(sx << 3, ystart, xend, 1023,
-				     (vc->vc_color & 0xf0) >> 4);
+				     (vc->state.color & 0xf0) >> 4);
 		newport_clear_screen(sx << 3, 0, xend, yend,
-				     (vc->vc_color & 0xf0) >> 4);
+				     (vc->state.color & 0xf0) >> 4);
 	}
 }
 
@@ -591,11 +591,11 @@ static bool newport_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 			topscan = (topscan + (lines << 4)) & 0x3ff;
 			newport_clear_lines(vc->vc_rows - lines,
 					    vc->vc_rows - 1,
-					    (vc->vc_color & 0xf0) >> 4);
+					    (vc->state.color & 0xf0) >> 4);
 		} else {
 			topscan = (topscan + (-lines << 4)) & 0x3ff;
 			newport_clear_lines(0, lines - 1,
-					    (vc->vc_color & 0xf0) >> 4);
+					    (vc->state.color & 0xf0) >> 4);
 		}
 		npregs->cset.topscan = (topscan - 1) & 0x3ff;
 		return false;
-- 
2.27.0

