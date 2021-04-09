Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0D735A6EC
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 21:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbhDITUt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 15:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234979AbhDITUr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Apr 2021 15:20:47 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B4AC061762;
        Fri,  9 Apr 2021 12:20:31 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id e12so6631044wro.11;
        Fri, 09 Apr 2021 12:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TQPV/D5Slla4tO1OZEdplYJsUdKoA4adaddnoqiUdzE=;
        b=e5f0gSXt301wIIg27vtvEpJ3yzzpVdind86ReZNPmOYLQPcYHMWMPUb15G5N+7B3VA
         Yn+4BBvRJls7/COt6pySwPs+OYc+f1LX3ZwXzK8+VHpjpi4Y24BaJTiAAwtDYKZkv0y0
         wOprxlvPqQdLsRqhPKIg7b3Mx4YQ16I5FC0k/a/slXYP/MmY4VjOj+ZQfwwGvk/5ud2f
         OMPO36CUWVVPLtvunwq18rAfPlLHfZxlFj6d/u0UsrSteJv3jyrHaAuiFnBspvqZs3nf
         uVVNW4PGhYoE7lY650uAIfpn1W1aSYsiCogjok57FmR3Tjnd6K8cnUUS4+axnAo/+rU+
         rdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TQPV/D5Slla4tO1OZEdplYJsUdKoA4adaddnoqiUdzE=;
        b=KPx06bAvHQ7WKDFlgqWk/BUAu23fGTOET92JVLN315Hmv88ArmM1luTZA8QYP4Ejn3
         fTlSPSP0FHAfhnxTxOHzsvFyEenJ0af9WUYvbdCyq9Z4JbXGPkKmGa0VrxLzevleYGMi
         VlvfT/a1uoV8Zavj0+KXk5Je559EhlBS38ArDJnH/uIzM8VVS60yFXneUrUSI/UnRQ+s
         n9oija1mKoFoxIOxMymeDXuPmuQELhZYkW1qYCreiKJIvQxx0vc47u8kR6+52Tid/Wc2
         kc5Wj1mFORyjXJbGWdPtIhQ/ZhAsDMIF5JN/6BCA5HqqGv3F7QyD1Ypihtjp9S66OSHR
         7ZPw==
X-Gm-Message-State: AOAM531KEuvH3JJKsTRE9amxsPFQlVQpE9GsooQQDpQowA2mINgX7z4G
        L7EijAZ5Kv/xaBXmT7xHMk4=
X-Google-Smtp-Source: ABdhPJyVTCc1h+mzklLi+9jP8W2SUl5/zznK0UpSgoNNHyI0ZxKHURGdfSgqpp9VDKPLuMLd20M8Ng==
X-Received: by 2002:adf:90f0:: with SMTP id i103mr18693785wri.318.1617996029976;
        Fri, 09 Apr 2021 12:20:29 -0700 (PDT)
Received: from localhost.localdomain (225.red-83-57-119.dynamicip.rima-tde.net. [83.57.119.225])
        by smtp.gmail.com with ESMTPSA id l9sm734259wrz.7.2021.04.09.12.20.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Apr 2021 12:20:29 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v12 4/4] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Fri,  9 Apr 2021 21:20:24 +0200
Message-Id: <20210409192024.10024-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409192024.10024-1-sergio.paracuellos@gmail.com>
References: <20210409192024.10024-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adding myself as maintainer for mt7621 clock driver.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 809a68af5efd..ecad5d972122 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11288,6 +11288,12 @@ L:	linux-wireless@vger.kernel.org
 S:	Maintained
 F:	drivers/net/wireless/mediatek/mt7601u/
 
+MEDIATEK MT7621 CLOCK DRIVER
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml
+F:	drivers/clk/ralink/clk-mt7621.c
+
 MEDIATEK MT7621/28/88 I2C DRIVER
 M:	Stefan Roese <sr@denx.de>
 L:	linux-i2c@vger.kernel.org
-- 
2.25.1

