Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7DB1E96D2
	for <lists+linux-mips@lfdr.de>; Sun, 31 May 2020 12:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgEaKGJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 31 May 2020 06:06:09 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:49650 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbgEaKGJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 31 May 2020 06:06:09 -0400
Received: from localhost.localdomain ([93.23.14.245])
        by mwinf5d05 with ME
        id lN652200L5HDzGl03N66mt; Sun, 31 May 2020 12:06:07 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 31 May 2020 12:06:07 +0200
X-ME-IP: 93.23.14.245
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     john@phrozen.org, tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] MIPS: ralink: bootrom: mark a function as __init to save some memory
Date:   Sun, 31 May 2020 12:06:03 +0200
Message-Id: <20200531100603.597847-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

'bootrom_setup()' is only called via 'postcore_initcall'.
It can be marked as __init to save a few bytes of memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/mips/ralink/bootrom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ralink/bootrom.c b/arch/mips/ralink/bootrom.c
index 88bcce59beeb..94ca8379b83c 100644
--- a/arch/mips/ralink/bootrom.c
+++ b/arch/mips/ralink/bootrom.c
@@ -31,7 +31,7 @@ static const struct file_operations bootrom_file_ops = {
 	.release	= single_release,
 };
 
-static int bootrom_setup(void)
+static int __init bootrom_setup(void)
 {
 	debugfs_create_file("bootrom", 0444, NULL, NULL, &bootrom_file_ops);
 	return 0;
-- 
2.25.1

