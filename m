Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A305C2AF671
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 17:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbgKKQai (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 11:30:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727682AbgKKQa1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 11:30:27 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE44C0613D4;
        Wed, 11 Nov 2020 08:30:26 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 33so3115162wrl.7;
        Wed, 11 Nov 2020 08:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R48LKl5uD2WOhx9sVKsENNgBh5qFklRsFvrBh/MY3WI=;
        b=uQw8HWW5Lg8VPRI5TX4As3orIqYvpjuJD8ETj35RV9rTM2Z4/aIls/S6qXgcXoy4+b
         k09LO7xzwSavojAbYia+az0zqhTZiHu52M098b3oPXcgOvVSIKueuFQmXvQ/SdZC6LQl
         m3NK7N76KgAtLSPcijj2fFklWcoYll907qMEtRC8Ufa7T6jRzca42Hd5o7/ja+O6Excw
         yrau8pKrCORJ/NSwO94+3NRb0S1XxDbUDdoytCn/XOcQ+SpYzndyqkK3eAuPabUSJJOr
         6A74IPFCorMRVYuMH0zpj/esrfOOhXB1djuA8xMqYinH18ywlyW2ZOMidYSCPE8oOin+
         laDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R48LKl5uD2WOhx9sVKsENNgBh5qFklRsFvrBh/MY3WI=;
        b=fy8HEA6kVIz5W48TqlM1g1hOGL5uu4u6XAdKv/qh+qkDDpyfKk7r+4vNt1D2j6f+1I
         lOClnKL5ZjLpBsbKj5LnO0AH/o0SYIEh2DRRQQDEDCCMigSelwVyEqpt0+/6Wi8tPQy5
         ohmKhravKMt18Oyf4QULcXe/1SS8KsTuA+FzAKcLEcdMCrJ+enyf3KcNwYJua106Xre1
         7nVWsV1ID04k0WXEeVvKku2KNS8Rp46R3FYqZBOJF6wyDx17BSw8KPIC7wOrAe+KQjOl
         xOnSTOESA8X2lM/aFDPAZyqXMMXBSBQncg97OuPaCoSai3oYChmreTfKYHdMdCd4mnHn
         DrWA==
X-Gm-Message-State: AOAM531AgwILBWE1vVzoAsm0c7/wJBTk5u/18z0GObE0tafcfeqBMNe1
        2HuY/Bc5Uqkt/mB+ylyzNlI8IEOph9bKSqGb
X-Google-Smtp-Source: ABdhPJw4OZZ5bKoc+TqQ7yNk7FmYt2R4fov1i9MSbikC6ofPjSY82yH4MDbF76GaqSr1KHQC8rvluA==
X-Received: by 2002:adf:f846:: with SMTP id d6mr14020338wrq.128.1605112225740;
        Wed, 11 Nov 2020 08:30:25 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id w186sm3196753wmb.26.2020.11.11.08.30.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 08:30:25 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH 7/7] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Wed, 11 Nov 2020 17:30:13 +0100
Message-Id: <20201111163013.29412-8-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adding myself as maintainer for mt7621 clock driver.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1f088a29bc2..c34c12d62355 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11142,6 +11142,14 @@ L:	linux-wireless@vger.kernel.org
 S:	Maintained
 F:	drivers/net/wireless/mediatek/mt7601u/
 
+MEDIATEK MT7621 CLOCK DRIVER
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
+F:	Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.yaml
+F:	arch/mips/ralink/mt7621.c
+F:	drivers/clk/ralink/clk-mt7621.c
+
 MEDIATEK MT7621/28/88 I2C DRIVER
 M:	Stefan Roese <sr@denx.de>
 L:	linux-i2c@vger.kernel.org
-- 
2.25.1

