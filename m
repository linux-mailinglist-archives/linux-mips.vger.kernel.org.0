Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A97AB38919
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jun 2019 13:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbfFGLdu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Jun 2019 07:33:50 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:39280 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbfFGLdt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Jun 2019 07:33:49 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id MnZn2000V3XaVaC06nZn3S; Fri, 07 Jun 2019 13:33:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZD7z-0004Fh-K0; Fri, 07 Jun 2019 13:33:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZD7z-0003sG-Ic; Fri, 07 Jun 2019 13:33:47 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Kosina <trivial@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH trivial] memory: jz4780-nemc: Grammar s/the its/its/
Date:   Fri,  7 Jun 2019 13:33:43 +0200
Message-Id: <20190607113343.14828-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/memory/jz4780-nemc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/jz4780-nemc.c b/drivers/memory/jz4780-nemc.c
index bcf06adefc96c1c9..bb17b422ccebba2f 100644
--- a/drivers/memory/jz4780-nemc.c
+++ b/drivers/memory/jz4780-nemc.c
@@ -59,7 +59,7 @@ struct jz4780_nemc {
  *
  * Return: The number of unique NEMC banks referred to by the specified NEMC
  * child device. Unique here means that a device that references the same bank
- * multiple times in the its "reg" property will only count once.
+ * multiple times in its "reg" property will only count once.
  */
 unsigned int jz4780_nemc_num_banks(struct device *dev)
 {
-- 
2.17.1

