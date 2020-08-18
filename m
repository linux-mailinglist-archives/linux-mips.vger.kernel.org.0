Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC2724811E
	for <lists+linux-mips@lfdr.de>; Tue, 18 Aug 2020 10:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgHRI47 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Aug 2020 04:56:59 -0400
Received: from mx2.suse.de ([195.135.220.15]:37694 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726370AbgHRI46 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 18 Aug 2020 04:56:58 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5A7DEB02B;
        Tue, 18 Aug 2020 08:57:22 +0000 (UTC)
From:   Jiri Slaby <jslaby@suse.cz>
To:     gregkh@linuxfoundation.org
Cc:     linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Slaby <jslaby@suse.cz>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 3/8] newport_con: make module's init & exit static using module_driver
Date:   Tue, 18 Aug 2020 10:56:50 +0200
Message-Id: <20200818085655.12071-3-jslaby@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200818085655.12071-1-jslaby@suse.cz>
References: <20200818085655.12071-1-jslaby@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The compiler complains that newport_console_init and
newport_console_exit are not declared:
   drivers/video/console/newport_con.c:745:12: warning: no previous prototype for 'newport_console_init'
   drivers/video/console/newport_con.c:750:13: warning: no previous prototype for 'newport_console_exit'

Here, it translates into: they should be marked static. Do so by
converting the simple un/registration to module_driver().

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-mips@vger.kernel.org
---
 drivers/video/console/newport_con.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 4d9110393479..0d0989040c58 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -751,18 +751,6 @@ static struct gio_driver newport_driver = {
 	.probe = newport_probe,
 	.remove = newport_remove,
 };
-
-int __init newport_console_init(void)
-{
-	return gio_register_driver(&newport_driver);
-}
-
-void __exit newport_console_exit(void)
-{
-	gio_unregister_driver(&newport_driver);
-}
-
-module_init(newport_console_init);
-module_exit(newport_console_exit);
+module_driver(newport_driver, gio_register_driver, gio_unregister_driver);
 
 MODULE_LICENSE("GPL");
-- 
2.28.0

