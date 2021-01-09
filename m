Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 516E82EFF4B
	for <lists+linux-mips@lfdr.de>; Sat,  9 Jan 2021 12:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbhAIL5z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Jan 2021 06:57:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbhAIL5z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Jan 2021 06:57:55 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7769C061786
        for <linux-mips@vger.kernel.org>; Sat,  9 Jan 2021 03:57:14 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id 30so9394342pgr.6
        for <linux-mips@vger.kernel.org>; Sat, 09 Jan 2021 03:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/0YyNo1AmSf3T+MSs+WXyvTLad4RHVuVph/CiC/rk1g=;
        b=D6KNgfj6g2ZodEeEzfdvVBIAjP+Lj6Q018v0XpUnu0canGT5r/Ch74VqGyLxF3TsAR
         LRb9WakK75cp0zBxa+ORaEysQJar/v4soTX38Qf7ZcBMBrHeLe3s3D9iM9bq4KGN05IS
         CB9x0kjCqM/hmQm7HEO5KcC4m/HURWU1m42GFmdC2Y7hR1g37vuoEXCGBo+CZxFKuicw
         ckvzUC/MZXUCSmDfiycJVGVQRbaAPyUfOE7S32KNZpeYr20ckpC/SuQKvW1++EelgmGE
         Frz7mrDmRrDInx9jHRvU/I94uHLSr8lf9kGOOLYlSNCqPkUfmTRi62yV8gNyBJRJph9o
         13WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/0YyNo1AmSf3T+MSs+WXyvTLad4RHVuVph/CiC/rk1g=;
        b=VNMTaWsfCTe1EzfpsTGzXh9VkfBPy6U7cFB+VFTg1s6dx4RkzVedIpmrSgfrIXy7ua
         KQ3b12AiC114rGXPv88lgYNwHP1UlKM51/FANXQ1cCGB5IwWyIUzzHlnqMmYJZzENP05
         P1R/ohBiDG7+r1FM5L693arDFk1wxiQhqhmg0/GjRiIi5Qftky4uDU2rE/w7ofBqvxBK
         36sdln3Es0CGF+S0CnzKIEnx/aGrdS40uqZ7jGpF9x+z0XwP1z/rpw8+748L40qr+5d4
         3Aappnh+ohjs+r95GODjR7WpUWSGKDf6ng+zDTAEhZEjUs6VLG4ztikKTkEPUKsovVXP
         mmKQ==
X-Gm-Message-State: AOAM533Mja7A9kIlRJNXO1kahfdsFnBqKcrFrAvh0AyZo2VE/JNV6G0P
        o6tcSEy6+JUGK++TS3hdBKM=
X-Google-Smtp-Source: ABdhPJyuGInHO/JuYAScB/ZRGOCmHA1KYcuVMo3/ZWXjutUOD9EM5akfZPozGqzI+Ef/z80VCLDjcQ==
X-Received: by 2002:aa7:854f:0:b029:1ae:7062:3a8b with SMTP id y15-20020aa7854f0000b02901ae70623a8bmr7024169pfn.64.1610193434232;
        Sat, 09 Jan 2021 03:57:14 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-123.windriver.com. [147.11.105.123])
        by smtp.gmail.com with ESMTPSA id s1sm14506920pjk.1.2021.01.09.03.57.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Jan 2021 03:57:13 -0800 (PST)
From:   Kevin Hao <haokexin@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: OCTEON: Fix the boot broken when using built-in DTB
Date:   Sat,  9 Jan 2021 19:49:58 +0800
Message-Id: <20210109114958.16470-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For the OCTEON boards, it need to patch the built-in DTB before using
it. Previously it judges if it is a built-in DTB by checking
fw_passed_dtb. But after commit 37e5c69ffd41 ("MIPS: head.S: Init
fw_passed_dtb to builtin DTB", the fw_passed_dtb is initialized even
when using built-in DTB. This causes the OCTEON boards boot broken due
to an unpatched built-in DTB is used. Add more checks to judge if we
really use built-in DTB or not.

Fixed: 37e5c69ffd41 ("MIPS: head.S: Init fw_passed_dtb to builtin DTB")
Cc: stable@vger.kernel.org
Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 arch/mips/cavium-octeon/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 982826ba0ef7..41d9c80e9666 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1149,7 +1149,8 @@ void __init device_tree_init(void)
 	bool do_prune;
 	bool fill_mac;
 
-	if (fw_passed_dtb) {
+	if (fw_passed_dtb && (fw_passed_dtb != (ulong)&__dtb_octeon_68xx_begin) &&
+	    (fw_passed_dtb != (ulong)&__dtb_octeon_3xxx_begin)) {
 		fdt = (void *)fw_passed_dtb;
 		do_prune = false;
 		fill_mac = true;
-- 
2.29.2

