Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBF92B1F04
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 16:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgKMPqs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 10:46:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgKMPqs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Nov 2020 10:46:48 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94924C0617A6;
        Fri, 13 Nov 2020 07:46:47 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id d12so10360096wrr.13;
        Fri, 13 Nov 2020 07:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g0CHHJRFLkJgpWDc0kWpwLPadBEpgRbUEt1rTCDH2OM=;
        b=WE/2sCiUyHHpl2DCayvAvp1Q9QJYgwqI4FwsibXZlztfRyBbUpMrNWkHA3z6iwQqkR
         HoddFL2fOr54FKpcRYZzcb//tSZXbgohEG9DJJFenYRMymUytedCM67GQtsdvKgpE8Sr
         zN9YASR+Ako77qHf0zkdHPSTu2BAlHEr0k2JTvela1wbnEu30dmFgZOyKpYbejoW2iGv
         tR7Qwrz+Gf5XbNNN3ECnJqtWnBa/W5r5SaIga5n9y31XWV47MFF668u5CMIsh70Y4Zaw
         yH6EPuFgXrQCxD1Lc0BvD8HwK1ifUIX2KP8zn09Sx5eoBhM2EIAur3xbnBW9U5fZUesQ
         s0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g0CHHJRFLkJgpWDc0kWpwLPadBEpgRbUEt1rTCDH2OM=;
        b=jTdGLiP38WZN63CgI99FyRW26b47ClqiDCXOtHTcM9CdVHUej61FbnNHPRvjic99cq
         U+0VCzgSP76xuoRS5FrBXCQYt9fKlOx8vNL797IHPqaV/pAAz2h+7Plx6aZWmA6gdLKc
         PGY3a2Mo69KG5Lr7MyReXXyfqWZvkGPjqDBqzzXJQ5HFPj9c2vngKCYNJ0uqU1cWjH8R
         bWHgRGdHqXz0V1xznpoldkLtxnnB0GYW2VC+v8+Do0dcvYfmoLH1APasblNGLVSrJ1qC
         saYen5+K944xL1uIfcBUltKCJq07p9aVZsk8WFR5OehWZ+/GN6NAMSbAd6YWO5reUDc6
         A+Fg==
X-Gm-Message-State: AOAM531bWmxGsOAUnc0Mu7XBNKNs8YRdlo8ta8Msi1fAepMY175B3SDd
        rkS9SKWec7tzdSark6HFRhQ=
X-Google-Smtp-Source: ABdhPJz9j68J/Z6s0zkPSGiUQMUc6/sZUF+65tbax/nZ6bjF8k29PJm5B+vvORjHAu8OtqGiGTUuXA==
X-Received: by 2002:adf:f083:: with SMTP id n3mr4231239wro.391.1605282401419;
        Fri, 13 Nov 2020 07:46:41 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id n15sm11727978wrq.48.2020.11.13.07.46.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 07:46:40 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name
Subject: [PATCH v3 5/5] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Fri, 13 Nov 2020 16:46:32 +0100
Message-Id: <20201113154632.24973-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113154632.24973-1-sergio.paracuellos@gmail.com>
References: <20201113154632.24973-1-sergio.paracuellos@gmail.com>
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
index f1f088a29bc2..30822ad6837c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11142,6 +11142,12 @@ L:	linux-wireless@vger.kernel.org
 S:	Maintained
 F:	drivers/net/wireless/mediatek/mt7601u/
 
+MEDIATEK MT7621 CLOCK DRIVER
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
+F:	drivers/clk/ralink/clk-mt7621.c
+
 MEDIATEK MT7621/28/88 I2C DRIVER
 M:	Stefan Roese <sr@denx.de>
 L:	linux-i2c@vger.kernel.org
-- 
2.25.1

