Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F197D2C6104
	for <lists+linux-mips@lfdr.de>; Fri, 27 Nov 2020 09:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728429AbgK0Ijo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Nov 2020 03:39:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbgK0Ijn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 Nov 2020 03:39:43 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192D7C0613D1
        for <linux-mips@vger.kernel.org>; Fri, 27 Nov 2020 00:39:43 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id j205so5937167lfj.6
        for <linux-mips@vger.kernel.org>; Fri, 27 Nov 2020 00:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VJvzcy7h7t5+J43wnvVJczkQ0LgcB85G7JBKDrFHI7g=;
        b=w3q+qxNPouWPe6x/o6c77TaTt08SpFNzjr2oWYBx4LxGIT9P+ex8wViAzcDjj+VKqM
         IVqLZPZRsb+sjnl1VzOKQZRSz0ZBjnzrfZ+n2nxt1n26GC4z6TUuMM7qQIHL6ku5tVAn
         cotpvTklekXtAT6IDPGrgy6ghLxKmB74ZVtVMWosxEbWwGcNK5+DEqPYQc6l+K6kQVZj
         mN+OskOisIwFEv1lIcXozcFwbF3fHl3kE6Koq3oA/H1dkc85YK0DuIEyMtZdSts70ANU
         urhj1+bEBfj+PowcqItOY8hsFTiupNmcN+xT5SW7dReFP7Kxoiif3TV88ROvXrVpieob
         PcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VJvzcy7h7t5+J43wnvVJczkQ0LgcB85G7JBKDrFHI7g=;
        b=PTKjPvwMocRzL/sJa2ouqFDtyRga7d1J3fR6saLvJVPin3cNw0Ry6y/7U0yc1kUTkI
         8pXCrD5nNDs4lEDsEl/foDgBM/L35Q1+xHUuKeUvde+vJUVcks3WHy2ArSuvI3Zx7nPs
         4m+RYQzTe0/ac8Vj+SQzhIQvGZeL7jg69UR3U+6D00B4Ob8hmufIfoILGHJQjlqSGHfT
         XBmXesySTFTNUilA/JroAWvX6i2pmX2aEvDwfh4CXziDsYxe5kxKFBN7Q0jdoQbonjEG
         YKvw1nZn3ilC5OJNqEBqQXKOJabl2AXmE95RjXnoSiUXDf86RzYpEC8DGUA+YKzcRwMU
         UT4Q==
X-Gm-Message-State: AOAM53389a3eIF9xsTcw91rhY4F4XFNAY/33BCB/B+wUVWOBtcSd32z2
        xKMXBKuUU2wGTFlqU0KRXyLf6A==
X-Google-Smtp-Source: ABdhPJzEhJ3V5UZEyXJY1luOg1HNRaF3x+W7SsS0gUK9mT8lhBWFwSmdGHVA0B9K92mGdaQm478Ecg==
X-Received: by 2002:a05:6512:1095:: with SMTP id j21mr2739630lfg.309.1606466381557;
        Fri, 27 Nov 2020 00:39:41 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id v1sm603194lfp.305.2020.11.27.00.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 00:39:41 -0800 (PST)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     tsbogend@alpha.franken.de, natechancellor@gmail.com,
        ndesaulniers@google.com
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] mips: lib: uncached: fix uninitialized variable 'sp'
Date:   Fri, 27 Nov 2020 09:39:38 +0100
Message-Id: <20201127083938.2666770-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When building mips tinyconfig with clang the following warning show up:

/tmp/arch/mips/lib/uncached.c:40:18: note: initialize the variable 'sp' to silence this warning
        register long sp __asm__("$sp");
                        ^
                         = 0

Rework to make an explicit inline move.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/mips/lib/uncached.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/lib/uncached.c b/arch/mips/lib/uncached.c
index 09d5deea747f..21a4b94a0558 100644
--- a/arch/mips/lib/uncached.c
+++ b/arch/mips/lib/uncached.c
@@ -37,10 +37,11 @@
  */
 unsigned long run_uncached(void *func)
 {
-	register long sp __asm__("$sp");
 	register long ret __asm__("$2");
 	long lfunc = (long)func, ufunc;
 	long usp;
+	long sp;
+	asm ("move %0, $sp" : "=r" (sp));
 
 	if (sp >= (long)CKSEG0 && sp < (long)CKSEG2)
 		usp = CKSEG1ADDR(sp);
-- 
2.29.2

