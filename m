Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D53451D17
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727743AbfFXV2K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:28:10 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:38584 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfFXV2K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Jun 2019 17:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561411688; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=Hlbcb6l9yiX+hOM4Bc0EQHzETkdFwe9zp7QRPnRT/04=;
        b=mqK6FDiFCVc7CKkIbkgIdt5KBOsnx/uYHSkCQNZQDDDw6yZoqEQcE9+1MfcMvOrvGwTpl/
        /p7Zm0jNVLX+tJrzQO4XeNWbae1263OFwD7Y9yp0Hjo+vLyFihIrIFQtIl0EMPPyZ7P56I
        IIZzo6XnEAMpUM641oU/NyMkjDmGoUI=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] MAINTAINERS: Correct path to moved files
Date:   Mon, 24 Jun 2019 23:27:51 +0200
Message-Id: <20190624212752.6816-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The driver was moved in commit 1838a7b31fcb ("mtd: rawnand: Move
drivers for Ingenic SoCs to subfolder").

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d0ed735994a5..dfedde2f5720 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7800,7 +7800,7 @@ INGENIC JZ4780 NAND DRIVER
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
-F:	drivers/mtd/nand/raw/jz4780_*
+F:	drivers/mtd/nand/raw/ingenic/
 
 INOTIFY
 M:	Jan Kara <jack@suse.cz>
-- 
2.21.0.593.g511ec345e18

