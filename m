Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDEB52FB925
	for <lists+linux-mips@lfdr.de>; Tue, 19 Jan 2021 15:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395406AbhASOSY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Jan 2021 09:18:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391301AbhASLYt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Jan 2021 06:24:49 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66669C061573
        for <linux-mips@vger.kernel.org>; Tue, 19 Jan 2021 03:24:08 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id q131so1697480pfq.10
        for <linux-mips@vger.kernel.org>; Tue, 19 Jan 2021 03:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WdnFZ7UiJHbYCL32m0l8Nb/dWojdrFU10VBQi4v8Vug=;
        b=I8YdDEkhA22hrI/y5xwZqMvfsunwXyf7g56aRkhCY8yW3s6iozc50c7B3Fz8VFL6Qb
         TuTbJ0tU8T+iFldDePsVwohmyvLKiqR1A1+1BRgZehHj3+bC9+VFGlNbZ6pc2nminV+1
         LMCxdynWe4dMMt4HmLUCuF6/YRZIJoug0F92R2XX5Gv4DLoOdkZGT496LQeHX7L1UT1y
         pw2r/eHR/i7D3yxZmvA47SMeDVF8Bzmwjr7iPFUcXvTFihEb4fhbyTWU7WkLbRJseHd2
         ZvrZ8RoSx2Xv0/f+PRe/Lh3h4nXLn0oO5zNCkmEm90ODf0KxSCbVWpskJdHK5jBuc5h7
         dzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WdnFZ7UiJHbYCL32m0l8Nb/dWojdrFU10VBQi4v8Vug=;
        b=A1WIXuHwzwzb8VJQFRS8YlUPaKeSWgrZiHIqgeU80B1A/9O6wvilL5GN66GIjRL9U+
         ljkR1DecznkqV55A5122oSWs7tqwXHBhuldDHC3ql8wRdeAGpKvHNI34CXDHvm1lxX01
         rSD10b98V3IX/EYsXhwnScUbk2OU6To7LaNtPDbWJQ+QnCeYEyUcX7FsbCvX+HWkLK8Y
         YNIi1r9slCeUCsGcZ85gvcBd5j9Q06c5XaqrtSfdtqV06WApdnhxOOoqvpX7RtSjxbMb
         qDdVIPT4NU9pLOFwssj9+QN5VMoiEBPyIIPfaOoF06DpNymOpp105H8Nz2HVGYByc9lv
         /U7Q==
X-Gm-Message-State: AOAM532XltJO8jpNF0KYjULj9sNCcUj9BuZjgLLQgzP373Tf+yCpQMTS
        fDMAQQteP3UpxjMGaQFgQWc=
X-Google-Smtp-Source: ABdhPJx1VejAFRbK0F8Fc+QKWQY3CChwYKWpt4Qg9pTA1w5qXsiIsW6jO/7FcbbLMVoDTygtxMPKaA==
X-Received: by 2002:a63:1047:: with SMTP id 7mr4061929pgq.292.1611055447956;
        Tue, 19 Jan 2021 03:24:07 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-123.windriver.com. [147.11.105.123])
        by smtp.gmail.com with ESMTPSA id gt21sm3075285pjb.56.2021.01.19.03.24.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 03:24:07 -0800 (PST)
From:   Kevin Hao <haokexin@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Yasha Cherikovsky <yasha.che3@gmail.com>,
        linux-mips@vger.kernel.org
Subject: [PATCH v2] Revert "MIPS: Octeon: Remove special handling of CONFIG_MIPS_ELF_APPENDED_DTB=y"
Date:   Tue, 19 Jan 2021 19:15:31 +0800
Message-Id: <20210119111531.37375-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This reverts commit d9df9fb901d25b941ab2cfb5b570d91fb2abf7a3.

For the OCTEON boards, it need to patch the built-in DTB before using
it. Previously it judges if it is a built-in DTB by checking
fw_passed_dtb. But after commit 37e5c69ffd41 ("MIPS: head.S: Init
fw_passed_dtb to builtin DTB", the fw_passed_dtb is initialized even
when using built-in DTB. This causes the OCTEON boards boot broken due
to an unpatched built-in DTB is used. Revert the commit d9df9fb901d2 to
restore the codes before the fw_passed_dtb is used and then fix this
issue.

Fixed: 37e5c69ffd41 ("MIPS: head.S: Init fw_passed_dtb to builtin DTB")
Cc: stable@vger.kernel.org
Suggested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 arch/mips/cavium-octeon/setup.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 982826ba0ef7..ce4e2806159b 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1149,12 +1149,15 @@ void __init device_tree_init(void)
 	bool do_prune;
 	bool fill_mac;
 
-	if (fw_passed_dtb) {
-		fdt = (void *)fw_passed_dtb;
+#ifdef CONFIG_MIPS_ELF_APPENDED_DTB
+	if (!fdt_check_header(&__appended_dtb)) {
+		fdt = &__appended_dtb;
 		do_prune = false;
 		fill_mac = true;
 		pr_info("Using appended Device Tree.\n");
-	} else if (octeon_bootinfo->minor_version >= 3 && octeon_bootinfo->fdt_addr) {
+	} else
+#endif
+	if (octeon_bootinfo->minor_version >= 3 && octeon_bootinfo->fdt_addr) {
 		fdt = phys_to_virt(octeon_bootinfo->fdt_addr);
 		if (fdt_check_header(fdt))
 			panic("Corrupt Device Tree passed to kernel.");
-- 
2.29.2

