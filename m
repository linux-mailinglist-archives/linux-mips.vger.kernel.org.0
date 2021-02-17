Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6922A31DB3B
	for <lists+linux-mips@lfdr.de>; Wed, 17 Feb 2021 15:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbhBQOJl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Feb 2021 09:09:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbhBQOJS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Feb 2021 09:09:18 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18572C06178B;
        Wed, 17 Feb 2021 06:08:03 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id o15so2220363wmq.5;
        Wed, 17 Feb 2021 06:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jiX7X0M+t1Zm8HAFufsMGCFO60ftU2nIQxPg0v/LgAc=;
        b=S7/rTx9uAE7nU43FzuKk4H4CEBU2du4dQVIjNNGuhZzRe3ta2fmRfgVY2JwNELBVpc
         nmjY59xfSPvmggrQQdhyHjLb69F900As5dBIdVkRCvc6YSfCi49sZ2t/gWGpJtPr6Z61
         dFRBkLrEK8go2QKkf4qpt6cO//DDHepKvQrFMTPSmqziYTbOauD4H8R5q/GfcQpMVQYz
         5m+OeZUokF7aPHrKSTArIryuaMAUH3YxlJAP7JcnODmEc+7lbi3p7Fm6gBxWJD80yIV6
         Smh32aTK51ql+vCZzFyXfNZB6GgBCmgvG64iLeYBC7lsJ3lqn4949MsLRVsC5s/4oklG
         /5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jiX7X0M+t1Zm8HAFufsMGCFO60ftU2nIQxPg0v/LgAc=;
        b=TXj48SoHhQ3EBog0Y1NtiJf46Lih4x0iMgn9q6Z1QSREtNEl6rf1O4sWokZm8gxLmv
         t0KUfzZMMllhl9eXOX76fsKPJ8rUVpZabmXr9pDfZKVCDsWOgS+WfT+O1ZYB5qzNVlnH
         whWqL0pzrzM3AU+hOUPsm7lkEKSW3BO2NTagStqAkYBzipHVdhlmJIKmVqFkk2XQ5YK5
         tFAyh/gnPUrWrRwLJySYHARK+KcSAcnVy7tbDcTEcA8pAckXIFYwI2hL6xBiZ5s74TI4
         Ar7xMjE0dPsG3YohWqtVYAH3RL+pqss8kvJqTrgvw/cthuqGLLBUPxvlx4d4IwrgWXYY
         NMUQ==
X-Gm-Message-State: AOAM5331XSpcrT84PfzzjjBm+r0U/D/Yqx1n5F+VOGcaWTHZH/v0L70B
        fuTXD8iPiJwqJL3qj5GZ4l8aj+onw4Ming==
X-Google-Smtp-Source: ABdhPJxXd+xHoijDXHWXCpESq3QScnr52RJTaYoIeNrrPXha9fSumedEDetlZ8LG7s+FBw7CiQ3N9Q==
X-Received: by 2002:a05:600c:2351:: with SMTP id 17mr7340043wmq.2.1613570881854;
        Wed, 17 Feb 2021 06:08:01 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id n66sm3274099wmn.25.2021.02.17.06.08.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 06:08:01 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/6] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Wed, 17 Feb 2021 15:07:52 +0100
Message-Id: <20210217140752.15712-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217140752.15712-1-sergio.paracuellos@gmail.com>
References: <20210217140752.15712-1-sergio.paracuellos@gmail.com>
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

