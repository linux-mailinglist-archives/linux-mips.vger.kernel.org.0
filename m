Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B51B2A6A13
	for <lists+linux-mips@lfdr.de>; Wed,  4 Nov 2020 17:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730968AbgKDQm7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Nov 2020 11:42:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728999AbgKDQm7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Nov 2020 11:42:59 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F54C0613D3;
        Wed,  4 Nov 2020 08:42:57 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id o20so5031123eds.3;
        Wed, 04 Nov 2020 08:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qokV2RxYbYIAU1o66x6CCNd234NTvrv3bgBLtZz0JsA=;
        b=ki4LO36A9IPizrW/JcBKKN6Rm9gJTU1eDBmP3KjzgKShuiJUeJIjtMBDdaIdggAC2I
         IhwqJrEw7FJQw1COed/2xkmjgqo+wwW7rG23M/d/v3ZQRC2e3h2NI/IyAhPwl1P9lBig
         vv3gNUvl3o/XenvB5o+Ly03xe5+UEuCXth7E2yhERpCzK+Hf2JfIUHDpEkXVLXVjtqEk
         Y/JKn11pKFMdIINLcMivdTLICUC5cn0JBSl3AZ+2aWC70HCU/UXlCWSnq9vRiCpyi6c2
         Tkh6T4BdcEbcKOmzsmXRRgdR5EU5pHxreiih9U5BN81GGo6dY9DCvrPtC6gwARnkdry9
         tSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qokV2RxYbYIAU1o66x6CCNd234NTvrv3bgBLtZz0JsA=;
        b=OWWEeh1TJ4gxkyKzMxWq8c7JTWpdqDxWi7K3ppDoBFSXjFbhhe9Z38y2VspoiFaXmg
         iT9EL7Hmu1kdxH5XSTJxNudEE2P3tvQtb4yKWCf6UEgRREjEAvabWlvhoW6RqVy5LMV0
         82cEkpAdhttJo1QOi1AVhBYsrF1kA7208KZBy67iny0ib7iqUgKKqfhUNL6KW+kEz5he
         oQ6KypBkVKD5XrvoFsHMfMXJvP0GhKdCp6bc9iLMm8j1cYlXxix7X+arjSyZIxxnVMs9
         UD6HWpVM9pLS2zaqta6Dv48DRor2cibS02eBreFD3/+/Z4bBSrVrCDd4JjTw+GOrQcjV
         YaWg==
X-Gm-Message-State: AOAM533yEVsOYgx4NVM71YlKrjPo3PXWU5M9LMITy2JwdsATMa7Kyrbz
        xvY8Ob/OP70/PEnDHoK6Stg=
X-Google-Smtp-Source: ABdhPJzKkhz75HD0mdBiVwspHfwnLZRzJvrk0+grAkIYgnh97uadrikghnLYDte0nsZUPOAfQHapGg==
X-Received: by 2002:a05:6402:287:: with SMTP id l7mr27270752edv.212.1604508176568;
        Wed, 04 Nov 2020 08:42:56 -0800 (PST)
Received: from localhost.localdomain ([85.153.228.172])
        by smtp.gmail.com with ESMTPSA id og19sm1282874ejb.7.2020.11.04.08.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:42:55 -0800 (PST)
From:   Necip Fazil Yildiran <fazilyildiran@gmail.com>
To:     hauke@hauke-m.de
Cc:     szajec5@gmail.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul@pgazz.com, jeho@cs.utexas.edu,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>
Subject: [PATCH] MIPS: BMC47xx: fix kconfig dependency bug for BCM47XX_SSB
Date:   Wed,  4 Nov 2020 19:41:27 +0300
Message-Id: <20201104164126.36399-1-fazilyildiran@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When BCM47XX_SSB is enabled and SSB_PCIHOST is disabled, it results in the
following Kbuild warning:

WARNING: unmet direct dependencies detected for SSB_B43_PCI_BRIDGE
  Depends on [n]: SSB [=y] && SSB_PCIHOST [=n]
  Selected by [y]:
  - BCM47XX_SSB [=y] && BCM47XX [=y] && PCI [=y]

The reason is that BCM47XX_SSB selects SSB_B43_PCI_BRIDGE without
depending on or selecting SSB_PCIHOST while SSB_B43_PCI_BRIDGE depends on
SSB_PCIHOST. This can also fail building the kernel as demonstrated in a
bug report.

Honor the kconfig dependency to remove unmet direct dependency warnings
and avoid any potential build failures.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=210051
Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
---
 arch/mips/bcm47xx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/bcm47xx/Kconfig b/arch/mips/bcm47xx/Kconfig
index 6889f74e06f5..40876654423c 100644
--- a/arch/mips/bcm47xx/Kconfig
+++ b/arch/mips/bcm47xx/Kconfig
@@ -9,6 +9,7 @@ config BCM47XX_SSB
 	select SSB_DRIVER_MIPS
 	select SSB_DRIVER_EXTIF
 	select SSB_EMBEDDED
+	select SSB_PCIHOST if PCI
 	select SSB_B43_PCI_BRIDGE if PCI
 	select SSB_DRIVER_PCICORE if PCI
 	select SSB_PCICORE_HOSTMODE if PCI
-- 
2.25.1

