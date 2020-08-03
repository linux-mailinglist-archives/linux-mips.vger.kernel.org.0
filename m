Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D7523AB44
	for <lists+linux-mips@lfdr.de>; Mon,  3 Aug 2020 19:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgHCRCk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Aug 2020 13:02:40 -0400
Received: from crapouillou.net ([89.234.176.41]:37938 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgHCRCk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Aug 2020 13:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1596474109; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f1OMfRPUo8Q/TcXGxpBUAtyxSMnopsvdrRwQm/eAjGA=;
        b=ocSG34R5By/n3GIXKmnV2klqpFl8g8yZj6mikPRq+39Vf4MtIvWWU2Yjf8be6xZe1Ji2bS
        DVw5gyvMolbm+nfuLCEJhAws456FsyvoUpxFinMMNesDFP7CflWCLJDr4p5vlFozf1vkNJ
        LKIdyuqEGNuo5l1HJWd+nh7JKunGb/8=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 07/13] MIPS: generic: Support booting with built-in or appended DTB
Date:   Mon,  3 Aug 2020 19:01:18 +0200
Message-Id: <20200803170124.231110-8-paul@crapouillou.net>
In-Reply-To: <20200803170124.231110-1-paul@crapouillou.net>
References: <20200803170124.231110-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The plat_get_fdt() checked that the kernel was booted using UHI before
reading the 'fw_passed_dtb' variable. However, this variable is also set
when the kernel has been appended, or when it has been built into the
kernel.

Support these usecases by removing the UHI check.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/generic/init.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index 7d82b436939e..2465537672fa 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -39,12 +39,11 @@ void __init *plat_get_fdt(void)
 		/* Already set up */
 		return (void *)fdt;
 
-	if ((fw_arg0 == -2) && !fdt_check_header((void *)fw_passed_dtb)) {
+	if (fw_passed_dtb && !fdt_check_header((void *)fw_passed_dtb)) {
 		/*
-		 * We booted using the UHI boot protocol, so we have been
-		 * provided with the appropriate device tree for the board.
-		 * Make use of it & search for any machine struct based upon
-		 * the root compatible string.
+		 * We have been provided with the appropriate device tree for
+		 * the board. Make use of it & search for any machine struct
+		 * based upon the root compatible string.
 		 */
 		fdt = (void *)fw_passed_dtb;
 
-- 
2.27.0

