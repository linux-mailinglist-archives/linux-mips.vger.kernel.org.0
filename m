Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99679248121
	for <lists+linux-mips@lfdr.de>; Tue, 18 Aug 2020 10:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgHRI47 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Aug 2020 04:56:59 -0400
Received: from mx2.suse.de ([195.135.220.15]:37684 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgHRI46 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 18 Aug 2020 04:56:58 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 28929AC48;
        Tue, 18 Aug 2020 08:57:22 +0000 (UTC)
From:   Jiri Slaby <jslaby@suse.cz>
To:     gregkh@linuxfoundation.org
Cc:     linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Slaby <jslaby@suse.cz>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 2/8] newport_con: fix no return statement in newport_show_logo
Date:   Tue, 18 Aug 2020 10:56:49 +0200
Message-Id: <20200818085655.12071-2-jslaby@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200818085655.12071-1-jslaby@suse.cz>
References: <20200818085655.12071-1-jslaby@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When CONFIG_LOGO_SGI_CLUT224 is unset, newport_show_logo contains no
return, despite it should return a pointer. Add one returning NULL to
fix a compiler warning:
   drivers/video/console/newport_con.c: In function 'newport_show_logo':
   drivers/video/console/newport_con.c:132:1: warning: no return statement in function returning non-void

Note that the caller expects NULL from the function already.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-mips@vger.kernel.org
---
 drivers/video/console/newport_con.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 72f146d047d9..4d9110393479 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -131,6 +131,8 @@ static const struct linux_logo *newport_show_logo(void)
 		npregs->go.hostrw0 = *data++ << 24;
 
 	return logo;
+#else
+	return NULL;
 #endif /* CONFIG_LOGO_SGI_CLUT224 */
 }
 
-- 
2.28.0

