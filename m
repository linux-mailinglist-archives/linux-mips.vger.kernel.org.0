Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F30A5324CD
	for <lists+linux-mips@lfdr.de>; Tue, 24 May 2022 10:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiEXIDV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 May 2022 04:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbiEXIDU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 May 2022 04:03:20 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0779346F
        for <linux-mips@vger.kernel.org>; Tue, 24 May 2022 01:03:16 -0700 (PDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 924783F221
        for <linux-mips@vger.kernel.org>; Tue, 24 May 2022 08:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1653379395;
        bh=llXcMB27bzBY3jTzV9fPnL3rBPYYoIJI1kMb7QxoWZs=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=B9bqwFjDie1BebsjK6oFuRMw41YRvY9bNBRhtLoylGL7/urkydGPgAg1DhTSW0jv2
         Lt1FcPSL1s0f9WswQhi4gK5EGvuUkrIbRK9MXPHkByBY9SJthMiNOHxPjcupfsYgYq
         3/klFUnXCrwMdCpK335/oA+CohsApPZKQ+ZdS1SfcKNj6ZIVHXmmoodOp9DOep+9If
         FpzDY1K3OCl6XUsl+hjyc+TeVRFrdCJkAoyKBm81vlp2V57CEseLMA5i/q+uQtO2yA
         nN1lq9lXRBPOrwLp1kj0Pn+dk7sh/Ca6uxaNtFxtYbwkLcXcknLGVtDaeGEEhiXEZy
         s457SGHeJqVug==
Received: by mail-wm1-f69.google.com with SMTP id m31-20020a05600c3b1f00b003973a563605so3969472wms.9
        for <linux-mips@vger.kernel.org>; Tue, 24 May 2022 01:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=llXcMB27bzBY3jTzV9fPnL3rBPYYoIJI1kMb7QxoWZs=;
        b=Glib4k6pf6Me5wCWgINj71HAZMDbQQGEH4o8viGRMCIrf3P/uLhkkXeIj9k1FzDIwE
         EbKxYS0qhjBXIQO+ovTQXLUKQ+OwwvdXHT9Vir3/hvtTYMkrG8EQpk3rYiNdSeddra9K
         lExpqaenmSHoom7n4gVlrExwidK2tDsJp6uumsx9N3bRj6/UBuCA2NZ/oynmDA9c+ok7
         ej7qujokY/v/MjSuNAcnYbINim25SirQzG8HIs2xDywSsHodX0qDoTBzilqfqmk5OPGw
         ZCNZdPNiHLoXgiIakY7VERlP3MXdgKamGKpdWEvoVSCSEgiymfWSIRL0Xuff3Bho8ATc
         Iphg==
X-Gm-Message-State: AOAM5319SYMtnbjBDhUqn0/ErYFZguBXNtCUJ9mtfP+8k5H3gZwISfoR
        XOsmAr/56ILXMLGqHEhI+vmp7JOcygQvIARJYnX5aXvC9IOfYEoIR5xwJoEvSThmLmHRCTmDw55
        poo/+aKgZJI02kYeWiV1IFBa6Vamyz/wcakYbc18=
X-Received: by 2002:a05:6000:1621:b0:20f:f723:ec49 with SMTP id v1-20020a056000162100b0020ff723ec49mr717745wrb.284.1653379395046;
        Tue, 24 May 2022 01:03:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWNw9OXR8ld6R1bAnCAZMWCeilUppYldTLCS0p1zIsVBDty0O40XQ4SsBaWhBThWVJe6AacQ==
X-Received: by 2002:a05:6000:1621:b0:20f:f723:ec49 with SMTP id v1-20020a056000162100b0020ff723ec49mr717726wrb.284.1653379394819;
        Tue, 24 May 2022 01:03:14 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id f9-20020adfc989000000b0020c5253d8e0sm11983117wrh.44.2022.05.24.01.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 01:03:14 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH] MIPS: Kconfig: Fix indentation and add endif comment
Date:   Tue, 24 May 2022 10:03:11 +0200
Message-Id: <20220524080311.22133-1-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The convention for indentation seems to be a single tab. Help text is
further indented by an additional two whitespaces. Fix the lines that
violate these rules.

While add it, add a missing trailing endif comment.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/mips/Kconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index de3b32a507d2..6e92ca97e479 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1321,11 +1321,11 @@ config CPU_LOONGSON64
 	select SWIOTLB
 	select HAVE_KVM
 	help
-		The Loongson GSx64(GS264/GS464/GS464E/GS464V) series of processor
-		cores implements the MIPS64R2 instruction set with many extensions,
-		including most 64-bit Loongson-2 (2H, 2K) and Loongson-3 (3A1000,
-		3B1000, 3B1500, 3A2000, 3A3000 and 3A4000) processors. However, old
-		Loongson-2E/2F is not covered here and will be removed in future.
+	  The Loongson GSx64(GS264/GS464/GS464E/GS464V) series of processor
+	  cores implements the MIPS64R2 instruction set with many extensions,
+	  including most 64-bit Loongson-2 (2H, 2K) and Loongson-3 (3A1000,
+	  3B1000, 3B1500, 3A2000, 3A3000 and 3A4000) processors. However, old
+	  Loongson-2E/2F is not covered here and will be removed in future.
 
 config LOONGSON3_ENHANCEMENT
 	bool "New Loongson-3 CPU Enhancements"
@@ -3255,7 +3255,7 @@ menu "CPU Power Management"
 
 if CPU_SUPPORTS_CPUFREQ && MIPS_EXTERNAL_TIMER
 source "drivers/cpufreq/Kconfig"
-endif
+endif # CPU_SUPPORTS_CPUFREQ && MIPS_EXTERNAL_TIMER
 
 source "drivers/cpuidle/Kconfig"
 
-- 
2.32.0

