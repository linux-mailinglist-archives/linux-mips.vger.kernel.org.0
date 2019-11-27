Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17A4710A926
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 04:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfK0DfC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 22:35:02 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25823 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfK0DfC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 22:35:02 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574825656; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=S8mYFofO6qtRDtxatTmv4Q/S9LXlSrLvEZjKX6BnjIUTnQ2FUj31YrBYAVE0ZGl98QEngDYgk81ygIq+qjayweXH8bFS+vZDhp2CpNG6ocLZ3sBvuLzIjH7KQ4MR5FOTWIAK8oVv0uXs9DNrPEl0sx0uxkqfK31ZuMQ9bVANPPE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574825656; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=R/+7jdDa0EFrpAUyp2tl61s/1DciqRZ9DpBBE4CUXeg=; 
        b=gwh0RTnr+q4LQt4p6Z7qenqcrt6XDO0FNpQ/P+EEvzSbiznkytugD1rihp6mIW7gMj6Gi1JiWKWawIWG44FIKic8yBVC+mQ5OqQCRkHjLuyMOno7whRYlGvDo3jvRW2jfEJKpIw4rFglL1wtfHKcDwM6jeDEmYmywoeMcSi8zP8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=GSUO1SC8PNrIwrBllGq7JPrFA1kdLpX912JnK3ImA3wcWIErrUSsRF6DhaaV8g4v25M+wJtcOmd/
    NhgyfSCg/iGcQ6fSY7GeooUqSlG5XUvx9KklAHUKmVZFaDm3REa9  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574825656;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=R/+7jdDa0EFrpAUyp2tl61s/1DciqRZ9DpBBE4CUXeg=;
        b=Ba+p7pRo8gHWYXAPAK42FI+XngKfH8iTtczEpAXtGF7MWZpoqELEwwEM4CG0TtBY
        Uh5mgZAkdwP7ANFuw3L8e3OAftkvaZPbCbDcFk+4XoqKpwE0vglbqHRm6gL9Cath/gb
        ShYiGq40ZCKRDxWrsmZuYLPiaXY2L1NqOsjEYsHI=
Received: from zhouyanjie-virtual-machine.localdomain (139.207.174.158 [139.207.174.158]) by mx.zohomail.com
        with SMTPS id 1574825655180599.1227371290488; Tue, 26 Nov 2019 19:34:15 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        syq@debian.org, paul@crapouillou.net, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH 4/5] dt-bindings: clock: Add USB OTG clock for X1000.
Date:   Wed, 27 Nov 2019 11:32:55 +0800
Message-Id: <1574825576-91028-5-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
References: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the USB OTC clock bindings for the X1000 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 include/dt-bindings/clock/x1000-cgu.h | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/dt-bindings/clock/x1000-cgu.h b/include/dt-bindings/clock/x1000-cgu.h
index bbaebaf..c401fce 100644
--- a/include/dt-bindings/clock/x1000-cgu.h
+++ b/include/dt-bindings/clock/x1000-cgu.h
@@ -29,16 +29,17 @@
 #define X1000_CLK_MSCMUX	14
 #define X1000_CLK_MSC0		15
 #define X1000_CLK_MSC1		16
-#define X1000_CLK_SSIPLL	17
-#define X1000_CLK_SSIMUX	18
-#define X1000_CLK_SFC		19
-#define X1000_CLK_I2C0		20
-#define X1000_CLK_I2C1		21
-#define X1000_CLK_I2C2		22
-#define X1000_CLK_UART0		23
-#define X1000_CLK_UART1		24
-#define X1000_CLK_UART2		25
-#define X1000_CLK_SSI		26
-#define X1000_CLK_PDMA		27
+#define X1000_CLK_OTG		17
+#define X1000_CLK_SSIPLL	18
+#define X1000_CLK_SSIMUX	19
+#define X1000_CLK_SFC		20
+#define X1000_CLK_I2C0		21
+#define X1000_CLK_I2C1		22
+#define X1000_CLK_I2C2		23
+#define X1000_CLK_UART0		24
+#define X1000_CLK_UART1		25
+#define X1000_CLK_UART2		26
+#define X1000_CLK_SSI		27
+#define X1000_CLK_PDMA		28
 
 #endif /* __DT_BINDINGS_CLOCK_X1000_CGU_H__ */
-- 
2.7.4


