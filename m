Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7CB33EF8B
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 12:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbhCQL1U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 07:27:20 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52535 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbhCQL1A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 07:27:00 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMUKJ-0004ZD-7f
        for linux-mips@vger.kernel.org; Wed, 17 Mar 2021 11:26:59 +0000
Received: by mail-ed1-f71.google.com with SMTP id a26so12180783edt.23
        for <linux-mips@vger.kernel.org>; Wed, 17 Mar 2021 04:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W3i1S5nSI5GQ1Rm3eTV6gENUYn6kHPlchBLYEZp476o=;
        b=CgVY9WuNtU5pVJjNMVC0MkrFRO/mt5m3xpDiZnz4ZdpKMoJ1F8aGpo3nhFRN5hQATE
         h1cZjVcUCSEfHcqNTgNM0QVLSc+XBt5GnMK4Kpd2aRW2L0VsSpv7PVbGp2bTRkHwYOA0
         gDcYI6Abfy+uBg5JVzuU3Py1+pgadiAFtIY8r/28eRzb775USGZ6JXJrM+0zp6oQtruo
         WkCmARAxWGrKD+xWjp/wsVOky9dfLZIVHw6ekhFC/9zNJUXojZlKWsB6Op9KJHbWORnw
         9Lv5tL9WeujfJc9FmGbztfseXfaNqgJs+/0fb19yExgdn+VFBGubNttMMxUW91lDmjQ6
         xAtw==
X-Gm-Message-State: AOAM5306OED7XE5Oo3Opq6U8b8VhLVM7Xc2EDm99hdNouvR/vG3Cyqic
        6NN+hJXJxlUF/b9J4CMyVjdnoMqB2BaGH174ie1uNUHFHIcToobU6AoOWUow9oZQgARe2YkXtTB
        2EhdU9xPrjnHAep9nE56X2+rNX093zhg/ftwD1xY=
X-Received: by 2002:a05:6402:382:: with SMTP id o2mr42341117edv.238.1615980418961;
        Wed, 17 Mar 2021 04:26:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5x/cDlMw6SaEJj9H5rTOUDY1Yw09Ll4aykisHylVG8DI6vUze0EVsqSRYodfykEC0ngmVbA==
X-Received: by 2002:a05:6402:382:: with SMTP id o2mr42341106edv.238.1615980418807;
        Wed, 17 Mar 2021 04:26:58 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id l18sm11143936ejk.86.2021.03.17.04.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 04:26:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     sergei.shtylyov@gmail.com, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, balbi@kernel.org, digetx@gmail.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] MIPS: ralink: define stubs for clk_set_parent to fix compile testing
Date:   Wed, 17 Mar 2021 12:26:44 +0100
Message-Id: <20210317112644.24502-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Ralink MIPS platform does not use Common Clock Framework and does
not define certain clock operations leading to compile test failures:

    /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
    phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: John Crispin <john@phrozen.org>

---

Changes since v1:
1. Use EXPORT_SYMBOL_GPL like two other stubs in the file.
2. Add Ack
---
 arch/mips/ralink/clk.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
index 2f9d5acb38ea..f0bcb1051c30 100644
--- a/arch/mips/ralink/clk.c
+++ b/arch/mips/ralink/clk.c
@@ -70,6 +70,20 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_round_rate);
 
+int clk_set_parent(struct clk *clk, struct clk *parent)
+{
+	WARN_ON(clk);
+	return -1;
+}
+EXPORT_SYMBOL_GPL(clk_set_parent);
+
+struct clk *clk_get_parent(struct clk *clk)
+{
+	WARN_ON(clk);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(clk_get_parent);
+
 void __init plat_time_init(void)
 {
 	struct clk *clk;
-- 
2.25.1

