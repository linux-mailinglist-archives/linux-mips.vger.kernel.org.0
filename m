Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 917F76FDBC2
	for <lists+linux-mips@lfdr.de>; Wed, 10 May 2023 12:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjEJKdn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 May 2023 06:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236629AbjEJKdf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 May 2023 06:33:35 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11EE3593
        for <linux-mips@vger.kernel.org>; Wed, 10 May 2023 03:33:31 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bcae898b2so12584861a12.0
        for <linux-mips@vger.kernel.org>; Wed, 10 May 2023 03:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683714810; x=1686306810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xlE7spSGsKAgVWPUR+vWV4NoI3eGfOxTWcfSnua2kek=;
        b=rQwgdYG3Bne9DbEByN0PihZpmyPeVoBb4wIzlPW902HVTBd1VsgMKPeUIv8z5So/LM
         mbjLonaC6J73aHlcf7LTd82o6G58KtjxtRwPm1TPGcnvmtWkCtt1cSKpHmixu3fMDk0y
         llA0n8097qDMuLcdgQFICXLo8k+YJQxsG9vxZBhSV/LkgIfwzN1+lT/PHlDGyie67828
         80LThJnSy/Z2tkD578QcW9bnJDXINfG09qlp3oto3v9zp7lvCWR582979BoCTP/Dsi+e
         iRIWR1inGO1zjD2kLg8auFrK3aMrNCbw9OJ1U8Eq+uBszIS4QvwgEl91cWlz+WwEc1+g
         7ssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683714810; x=1686306810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlE7spSGsKAgVWPUR+vWV4NoI3eGfOxTWcfSnua2kek=;
        b=jU2I4+xXa1ybCxggoPOSrUyhSaY6rpY7nsg+4p8o1SiyO4eXXyTqLC4ObgRy4d5G5+
         L2Wxfc1gGBn17gwItLN44YuyD6LVS7QNhxqicGVBPXdtEGsMJNsnc3h6IsPtjFwaM8D5
         CwN5sIpy/NwMP1tMPU7cAl3NwnD4LlGGEmBbaCmND1SR6PcEZNp/Qra5SFoXsl2/mPGP
         qhWWGsXFVaQwYbi7FO+i8JvT16dKCOfgtKO1PXpJLOK4PpO3SBpv8wFQQf+IAFR+IjIk
         k68PuDJ31gdZvV2q4tMbWXmyoeZLc/JC/nEGLzVVKmzkS8jRs9xGgiurFBarHSXXLBiN
         GXcQ==
X-Gm-Message-State: AC+VfDz3mK/FOHGzcPgwUtKLbEKHhVleEyAIcZ51t0gljFvVnqat6/hE
        bn8M3aB78zwhpoTMnLF2xg6jZ7XRCA4=
X-Google-Smtp-Source: ACHHUZ4fzHC1M1rxGhsxj2fanOcv7AHQ2Jm4kLqpDlAvPfwiyWrOG4x6HEoX67clsn1I3peOee/ezg==
X-Received: by 2002:aa7:c713:0:b0:50b:c6c6:2fdd with SMTP id i19-20020aa7c713000000b0050bc6c62fddmr12519595edq.38.1683714810282;
        Wed, 10 May 2023 03:33:30 -0700 (PDT)
Received: from flagship2.deu.mlau.at (p200300c02712e50000000000000002af.dip0.t-ipconnect.de. [2003:c0:2712:e500::2af])
        by smtp.gmail.com with ESMTPSA id i15-20020a05640200cf00b0050bca43ff55sm1708510edu.68.2023.05.10.03.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 03:33:29 -0700 (PDT)
From:   Manuel Lauss <manuel.lauss@gmail.com>
To:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH] MIPS: Restore Au1300 support
Date:   Wed, 10 May 2023 12:33:23 +0200
Message-Id: <20230510103323.301065-1-manuel.lauss@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Au1300, at least the one I have to test, uses the NetLogic vendor
ID, but commit 95b8a5e0111a ("MIPS: Remove NETLOGIC support") also
dropped Au1300 detection.  Restore Au1300 detection.

Tested on DB1300 with Au1380 chip.

Signed-off-by: Manuel Lauss <manuel.lauss@gmail.com>
---
 arch/mips/kernel/cpu-probe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 6d15a398d389..e79adcb128e6 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1502,6 +1502,10 @@ static inline void cpu_probe_alchemy(struct cpuinfo_mips *c, unsigned int cpu)
 			break;
 		}
 		break;
+	case PRID_IMP_NETLOGIC_AU13XX:
+		c->cputype = CPU_ALCHEMY;
+		__cpu_name[cpu] = "Au1300";
+		break;
 	}
 }
 
@@ -1863,6 +1867,7 @@ void cpu_probe(void)
 		cpu_probe_mips(c, cpu);
 		break;
 	case PRID_COMP_ALCHEMY:
+	case PRID_COMP_NETLOGIC:
 		cpu_probe_alchemy(c, cpu);
 		break;
 	case PRID_COMP_SIBYTE:
-- 
2.40.1

