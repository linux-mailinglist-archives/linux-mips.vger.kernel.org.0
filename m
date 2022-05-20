Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4FA52EB24
	for <lists+linux-mips@lfdr.de>; Fri, 20 May 2022 13:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348733AbiETLvY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 May 2022 07:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348723AbiETLvX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 May 2022 07:51:23 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D04C19C0C
        for <linux-mips@vger.kernel.org>; Fri, 20 May 2022 04:51:20 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2FD18402E2
        for <linux-mips@vger.kernel.org>; Fri, 20 May 2022 11:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1653047478;
        bh=ulZqruHzuXibmsmfjZ5kTMOimfHFQdq4BeiWtFLLtng=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=X7uHG9VDORGKRLGbuo5Xis8d+Y9Nwh9YoFSxezbC7eGCQBLpwsE6f7DxQUBDQVF8p
         pZ+AEBOcpLPvR504MLr5EA/ku2KOTKXa2RoO1LQpiRz2gebHuhO16YLe892qnRfsHH
         iPrEpo7QY7L/JlTbwNV627DyFww2MV89zFIeWNm/5Bzwb/yDLikuj63np+1KgPrPou
         gqcL1WVWQZHkkpn/g3IIR//PwY/qUuiQGL0+WQjYzrX/NcclGxcRcPCpujfh4cNPdO
         /Bjg4Jb9K7XOYIkY8UqZwNoX2bLEv9m/XLeEbD1xJB+XLt3ykwb84MNDCX2qi1cHlV
         5rauryB6fuLkg==
Received: by mail-ej1-f69.google.com with SMTP id sd38-20020a1709076e2600b006f3e54b1dbcso3902042ejc.4
        for <linux-mips@vger.kernel.org>; Fri, 20 May 2022 04:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ulZqruHzuXibmsmfjZ5kTMOimfHFQdq4BeiWtFLLtng=;
        b=5BRO5XP77QmHS5TY+Ahhoc3rOJ/z/AE9ZV5fn6JCu8oCGfBONlCvUbyV9XpsyY5jKV
         DNXV7sXvv+WQz6B9NMQ+HEc6QCbcgFd08ASCov11IF96xJfEu0aNjoBEsM9H/mfu/VH5
         YkNOD4cY/ZpOVPqtjtnjhsGMfja8totKVmG/lcvs6xsiQYpkVIjYrYr17T34ne5YbANh
         cf9LYD5GJ7VxLEtl94A0SgtigGbT30qPF3YuhL/tw3yy7uHN4sE4UvHFicRsi7F7w64J
         CuqC8Mh+58a7eNtlcSAEmplJFZha81c5kXNE+99CrpJuua2LGmtBbg+8grSR0xmi6hXT
         j19w==
X-Gm-Message-State: AOAM533+ln4V10UWMz1LWax/2AiN8sc6FQEBCRXzzt7gH4oeTR27EnxR
        YsALOCqoGA00ecO2XiaF2Mi7xmssQYuDtGffoFUkIee5RUM+yBPlt96qI+ROHP+LsAEevy37GX1
        XIs8emlWogRkz0EmFehbhrNo0+2AVe8Tkd8dcd+o=
X-Received: by 2002:a17:907:7ea2:b0:6fe:7ef2:b71d with SMTP id qb34-20020a1709077ea200b006fe7ef2b71dmr8127409ejc.508.1653047477468;
        Fri, 20 May 2022 04:51:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcRQRee3TWn0TijUw5yehWrcDOC+S3/Ig1s/PEUC/T4w2AOT2xmnYsTj5rT1lS6xgC2pgVrQ==
X-Received: by 2002:a17:907:7ea2:b0:6fe:7ef2:b71d with SMTP id qb34-20020a1709077ea200b006fe7ef2b71dmr8127397ejc.508.1653047477330;
        Fri, 20 May 2022 04:51:17 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id e18-20020a50fb92000000b0042ab8c5e99fsm4112411edq.14.2022.05.20.04.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 04:51:16 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     keguang.zhang@gmail.com, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH] MIPS: loongson32: Kconfig: Remove extra space
Date:   Fri, 20 May 2022 13:51:13 +0200
Message-Id: <20220520115113.147170-1-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove extra space between 'prompt' keyword and string.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/mips/loongson32/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/loongson32/Kconfig b/arch/mips/loongson32/Kconfig
index e27879b4813b..2ef9da0016df 100644
--- a/arch/mips/loongson32/Kconfig
+++ b/arch/mips/loongson32/Kconfig
@@ -46,7 +46,7 @@ menuconfig CEVT_CSRC_LS1X
 	  If unsure, say N.
 
 choice
-	prompt  "Select clockevent/clocksource"
+	prompt "Select clockevent/clocksource"
 	depends on CEVT_CSRC_LS1X
 	default TIMER_USE_PWM0
 
-- 
2.32.0

