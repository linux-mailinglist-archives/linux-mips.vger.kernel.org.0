Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4748025F02E
	for <lists+linux-mips@lfdr.de>; Sun,  6 Sep 2020 21:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgIFTbD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Sep 2020 15:31:03 -0400
Received: from crapouillou.net ([89.234.176.41]:35928 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726623AbgIFTbB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Sep 2020 15:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599420592; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8smfQBOSeAYUyN6ywO7oX394JF1Jab2dVsaM0oxRtpw=;
        b=mDcI2KLxSvvs9lkYkXKzSu/BS4gY+th0uQ2mityjgVFLQJ4nLejajAJtX/p9/Aq4ytSwgf
        DWBIUGWUHcI3fRp9ySao6E4LMOciM8KDYX/p2nUSIRMIla1GH5GNRpV5amfxzMqhs2imKb
        gwmMhHT911/x/v+YtZ5VL6/ABpzVwUQ=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 08/15] MIPS: generic: Support booting with built-in or appended DTB
Date:   Sun,  6 Sep 2020 21:29:28 +0200
Message-Id: <20200906192935.107086-9-paul@crapouillou.net>
In-Reply-To: <20200906192935.107086-1-paul@crapouillou.net>
References: <20200906192935.107086-1-paul@crapouillou.net>
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

Notes:
    v2-v3: No change

 arch/mips/generic/init.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index 029f47ea390c..66a19337d2ab 100644
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
2.28.0

