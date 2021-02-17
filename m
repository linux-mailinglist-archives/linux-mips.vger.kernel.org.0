Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB2731D8AE
	for <lists+linux-mips@lfdr.de>; Wed, 17 Feb 2021 12:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbhBQLnr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Feb 2021 06:43:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231538AbhBQLnc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Feb 2021 06:43:32 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136A6C06178B;
        Wed, 17 Feb 2021 03:40:11 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id v62so3333194wmg.4;
        Wed, 17 Feb 2021 03:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jiX7X0M+t1Zm8HAFufsMGCFO60ftU2nIQxPg0v/LgAc=;
        b=Ss506/A9nt5EKOBvaSCczz2B78J4fjW/sVk668oJ+QuvY95oROp0eklSyg9pr7JfKV
         Mj7Hbwnd6wykfTZbiW1X70hvA4E+2/yCHGJIAcSu8539zp9rl42W0sFy7UpRb5IFzQkw
         AK3rgwAq3LrU7FUCg7abR4XIE66up10sLZM+SGhcBBTCLGpKinGYHRq8goMmv+1yURqm
         XaKHI9rVsnTw+4+nUXNDMALxNIWR2djiPa/6fWXNJIBDmPQ1JHYNuEgw9BJPZOIhN6Zu
         8Wd9J29cCjg90v+a3nmb23HtngIW0mrVcf5TqZCmSz6MYCkoHYn20VMifX3Zwl4hwR92
         73Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jiX7X0M+t1Zm8HAFufsMGCFO60ftU2nIQxPg0v/LgAc=;
        b=O4j37b/zkktBf3h5XtAmHPUs3dmneZTpwv4cm+c7PJ9W8ORqPt+SCSndUolH7gH5LR
         4LhH6svtPwFpyPyormmKpCAKulu0R72CiSkVsymlmAjZKZl8Ocqz5XJC1Id58fGkHgny
         siOcd1/IgfMIVcyXuF0blQx4/8o7GlK2JlIWJRtJWJQhXRk1D+pBXOZ2Xv+cntEYDPJc
         alYA+mLYjovMLTirjzRbEffLQLBjbT1tEPkQU9g2ZQQUqq/Yzj8VEMUflZeqQuP++46d
         VtQP0UQl+T29bhTKYkBO10XLlnxWl6tUmwjqVFhJ8aWAAvlo9LtLDqt+/G6KTAl13vyD
         HWzQ==
X-Gm-Message-State: AOAM5315jGMCPMVz/jbi5dtNXwb4thUT0yLwHKb8zJx8Uw+Y7QTKP41X
        BdgDfs1fbOXEtI+UsB+tgV8=
X-Google-Smtp-Source: ABdhPJzuePG01HjKt42jOlK+RehB6tXeB77Vpegn7SuiLtjx93WLKQvzB1N6h//7lhj7llHgXFcT8w==
X-Received: by 2002:a1c:4903:: with SMTP id w3mr1982855wma.143.1613562009880;
        Wed, 17 Feb 2021 03:40:09 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id q140sm3600813wme.0.2021.02.17.03.40.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 03:40:09 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        neil@brown.name
Subject: [PATCH v7 6/6] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Wed, 17 Feb 2021 12:40:00 +0100
Message-Id: <20210217114000.19571-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217114000.19571-1-sergio.paracuellos@gmail.com>
References: <20210217114000.19571-1-sergio.paracuellos@gmail.com>
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
index 809a68af5efd..be5ada6b4309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11288,6 +11288,12 @@ L:	linux-wireless@vger.kernel.org
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

