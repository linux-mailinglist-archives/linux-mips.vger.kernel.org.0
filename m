Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE582EB454
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jan 2021 21:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbhAEUfn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jan 2021 15:35:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727645AbhAEUfn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jan 2021 15:35:43 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D7CC061574;
        Tue,  5 Jan 2021 12:35:02 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id z9so696795qtn.4;
        Tue, 05 Jan 2021 12:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fxhczrrnewt21nxO1uR6gSDuR5cXjQC5Qv2bp8P5/qA=;
        b=gF1bawSTcWA+rJwICZ7lUWmT9+5jRJi3jGLujo+qeOBAWsbBYhBl8TVaJHQn5w3S1A
         WaKOnf8Lfy+8QpyJKupaoGR2XHkjYrQwsSGMb8fuS7GRN1dUEu+jezfgxmwnW2h8Sw97
         hucRwNNyydGbH+q8Ie+i8H5Q4Yd8ulSjYikC8CqrTkYNMCsXyK4/ootDH20h4oThjMMJ
         lVoiSjAegvE3Z6NoeQq461p/ohTSJFF274TqHjKCO0Zv2k2rArCma7rxT5B+HxfUgzIE
         Yf0wsyFbJAGdgTxx/0c6oDpLfr0AT5KLH1x7P+XcHOZAAISqT8SKImFUWFk5HSpE1e3w
         1c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fxhczrrnewt21nxO1uR6gSDuR5cXjQC5Qv2bp8P5/qA=;
        b=KkxpkvTPh1LQSQa4EUJCpJZIvedyXabiG77qBi6nIiYIEPbbRPzKr8tksiJNu3ABv2
         FfoPx+TFVvhjvrfmvFEq+cH7UDmDQJLOQ8kc5NifIaGxqhI/9yT1/odBuzw0N2rfFTg5
         wIitj6nLCTrI6NJSLLzb0dVi1cbrY0Eehz/LtYlsZmhox++oV540gKONkp27dMyM8MSU
         Jr0/oLczc7iEMny5pCKMSlwtYqoqoJ4UyMkrJ//R6uVLhMv+PMp4UgEmslEZtHI5SPzN
         i570y3QmUHL3jiWuBzgGPqTn/DmuIYbROjWJp4KxCY7ur+4xYPmWxt5huuNW0fdj4fGj
         HbHw==
X-Gm-Message-State: AOAM532h924ilQAODGNK9FGcM1r2oSxSfEpkw2HMc0ZCcFUhBl9VIiO+
        u28aLYh8j1OtbFNbePVKe2p45cc2/mWIsg==
X-Google-Smtp-Source: ABdhPJwW1aJo52Yl0DPsjJAhW/Z5FpmrgOBNMQJLOE91bt+gl2ARHixqc2f0weTNnI101TG1cobAnQ==
X-Received: by 2002:ac8:4e87:: with SMTP id 7mr1238831qtp.310.1609878901673;
        Tue, 05 Jan 2021 12:35:01 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id u65sm259481qkb.58.2021.01.05.12.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 12:35:01 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] MIPS: c-r4k: Fix section mismatch for loongson2_sc_init
Date:   Tue,  5 Jan 2021 13:34:56 -0700
Message-Id: <20210105203456.98148-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When building with clang, the following section mismatch warning occurs:

WARNING: modpost: vmlinux.o(.text+0x24490): Section mismatch in
reference from the function r4k_cache_init() to the function
.init.text:loongson2_sc_init()

This should have been fixed with commit ad4fddef5f23 ("mips: fix Section
mismatch in reference") but it was missed. Remove the improper __init
annotation like that commit did.

Fixes: 078a55fc824c ("MIPS: Delete __cpuinit/__CPUINIT usage from MIPS code")
Link: https://github.com/ClangBuiltLinux/linux/issues/787
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/mips/mm/c-r4k.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 4f976d687ab0..f67297b3175f 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1593,7 +1593,7 @@ static int probe_scache(void)
 	return 1;
 }
 
-static void __init loongson2_sc_init(void)
+static void loongson2_sc_init(void)
 {
 	struct cpuinfo_mips *c = &current_cpu_data;
 

base-commit: 36bbbd0e234d817938bdc52121a0f5473b3e58f5
-- 
2.30.0

