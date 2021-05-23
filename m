Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9D838DE06
	for <lists+linux-mips@lfdr.de>; Mon, 24 May 2021 01:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbhEWX1e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 23 May 2021 19:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231982AbhEWX1d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 23 May 2021 19:27:33 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEE8C061574;
        Sun, 23 May 2021 16:26:05 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id b12so23929979ljp.1;
        Sun, 23 May 2021 16:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pPiK1DfUxZZrTBI/5iz69l7qULP78LHErLsYFXd4x9o=;
        b=Wh4IAnNxXo994rOpcpBG1uHjyJm1icPsdNE7/2cIz+9OcmAv8x5QRPsjauEGrPNXiW
         RQkuH5Bx1P5mQmEgcSIo+dbZENJWfm+ttnjxO+s92XMY+RPBJ2+nun7R4NtaOHRkojvQ
         W5cyhqxNL775x1J4LWzOqkZigA/1vrCffMUNYpOkXrHm5cFJmaSSfTKIr13MI9bCY/Nq
         LR2+mcOUhyQTrJmbrtHh4CssW4Gvgsl5T+cpjBpF4kz2QpQPMu12h5jDZ0hMpEJyjgTp
         0ruHCtRGDigp05ZBlZJ/ZsD0UV5aaUlUx5toHznF4RKhugLSlHIIAWqhOg4k8RZwG5Gm
         lDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pPiK1DfUxZZrTBI/5iz69l7qULP78LHErLsYFXd4x9o=;
        b=jhWIjkhX2KaEO3WTXIqdibrHMOxSzM8s9SLXzZKmdrV/A3PCU6al9QfdugiZwy9mlN
         lhCel3t9yKV1V+diDuQiBlTOSYuIcSYbw3MSDZ6bzhxCJ/8aWfVBNCadDfGhnWhCvT9P
         MwXZXRnitNsTbpQ8FTCVoZN/idVqIkAB5wqmpNf04LN1CwvZ1YsERImnOblBxnVqE5je
         Y5T2CsxSubh2JSAWuh+fJhybVKa+tTykpdwYtHBNt4QwJIl2mH160FqFyGhjyq3fX1aJ
         yFKrdemv+KYfKo2QTNxJ7jm+6Tx4fsWjWhYpIM+uXgLbNeK99VvoRljb10tQsqA234aA
         safg==
X-Gm-Message-State: AOAM5325oMpCA4l1MeupAONgBuU40P4cn2SCQQxOmRX+6L/IJbJ3E4k+
        vCY65+A9PTgl24Qykw2B5gs=
X-Google-Smtp-Source: ABdhPJzn0nkTvNJ4/y5/7O9Cpdv0X5iyxFW9w+e888CSbB1VKcAijfzu9imoGp+TgHIWvgjlKrqffQ==
X-Received: by 2002:a05:651c:1043:: with SMTP id x3mr14722134ljm.130.1621812363346;
        Sun, 23 May 2021 16:26:03 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id p7sm1489329ljg.61.2021.05.23.16.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 16:26:02 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Paul Burton <paul.burton@mips.com>,
        John Crispin <john@phrozen.org>
Cc:     linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v1] kbuild: Disable compile testing if HAVE_LEGACY_CLK enabled
Date:   Mon, 24 May 2021 02:25:56 +0300
Message-Id: <20210523232556.15017-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are couple older platforms that can't be compile-tested because they
partially implement CLK API. It causes build failure of kernel drivers due
to the missing symbols of the unimplemented part of CLK API.

These platforms are: ARM EP93XX, ARM OMAP1, m68k ColdFire, MIPS AR7,
                     MIPS Ralink.

Disable compile-testing for HAVE_LEGACY_CLK=y.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 173a474012d7..42701b04be00 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -131,7 +131,7 @@ config INIT_ENV_ARG_LIMIT
 
 config COMPILE_TEST
 	bool "Compile also drivers which will not load"
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM && !HAVE_LEGACY_CLK
 	help
 	  Some drivers can be compiled on a different platform than they are
 	  intended to be run on. Despite they cannot be loaded there (or even
-- 
2.30.2

