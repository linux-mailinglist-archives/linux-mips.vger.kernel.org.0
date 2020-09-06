Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D63025F03C
	for <lists+linux-mips@lfdr.de>; Sun,  6 Sep 2020 21:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgIFTcC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Sep 2020 15:32:02 -0400
Received: from crapouillou.net ([89.234.176.41]:36112 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726420AbgIFTcB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Sep 2020 15:32:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599420601; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1G3bUlgshQqNl4lGaTXsuCXI8wy10MkoW5Q89GP5UAY=;
        b=PuY/AaV1GCfrKXkWXQd9s9GVgefjzQEHaPNAZpCP7AcLYz0jX91wuxa5/Rf2YO5A5EdOnW
        eWNWv0inm7pFfDexL9rdFn6jXllfKAMiGOikLoBjy7ettmsuIzBRfVEGtk4ZsevdHeCXgd
        Nl+IStZNUKVy8eolI0MeFug1e347TqM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 15/15] MAINTAINERS: Update paths to Ingenic platform code
Date:   Sun,  6 Sep 2020 21:29:35 +0200
Message-Id: <20200906192935.107086-16-paul@crapouillou.net>
In-Reply-To: <20200906192935.107086-1-paul@crapouillou.net>
References: <20200906192935.107086-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Support for Ingenic chips has been moved to the generic MIPS platform.
Update the paths accordingly.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: No change
    
    v3: Add arch/mips/include/asm/mach-ingenic/ path too

 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index deaafb617361..52ce4a1beede 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8595,8 +8595,9 @@ INGENIC JZ47xx SoCs
 M:	Paul Cercueil <paul@crapouillou.net>
 S:	Maintained
 F:	arch/mips/boot/dts/ingenic/
-F:	arch/mips/include/asm/mach-jz4740/
-F:	arch/mips/jz4740/
+F:	arch/mips/generic/board-ingenic.c
+F:	arch/mips/include/asm/mach-ingenic/
+F:	arch/mips/ingenic/Kconfig
 F:	drivers/clk/ingenic/
 F:	drivers/dma/dma-jz4780.c
 F:	drivers/gpu/drm/ingenic/
-- 
2.28.0

