Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4676022E17B
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jul 2020 18:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgGZQ7H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Jul 2020 12:59:07 -0400
Received: from crapouillou.net ([89.234.176.41]:59356 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbgGZQ7H (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Jul 2020 12:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1595782745; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=DbBpSLw5/JLX90h2KR5FyFQ8Zg2QkV+H5IhMCbYo81U=;
        b=QtVxTnDbFwPkZtSct8zNzmgxmD5h+8PByu4dgypb1ULQeVZQKGWkldlEotF0lM13uHrBI/
        /B28lYgcIeGk8jt+nQN1FF3kmAAQ7rrP8oYXcH1MyhOqPoRdGRFO4OOmzEglSI0BzlGQtS
        aYwRAC8D57Eu1GmQX8f6tluwELj/VmE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Arnd Bergmann <arnd@arndb.de>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] MIPS: ath79: Remove unused include <asm/mips_machine.h>
Date:   Sun, 26 Jul 2020 18:58:27 +0200
Message-Id: <20200726165828.55175-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since commit 3a77e0d75eed ("MIPS: ath79: drop machfiles"), this header
is not used anymore.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/ath79/setup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 4b7c066ac88e..7e7bf9c2ad26 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -23,7 +23,6 @@
 #include <asm/idle.h>
 #include <asm/time.h>		/* for mips_hpt_frequency */
 #include <asm/reboot.h>		/* for _machine_{restart,halt} */
-#include <asm/mips_machine.h>
 #include <asm/prom.h>
 #include <asm/fw/fw.h>
 
-- 
2.27.0

