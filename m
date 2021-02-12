Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88641319AD4
	for <lists+linux-mips@lfdr.de>; Fri, 12 Feb 2021 08:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhBLHp0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Feb 2021 02:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbhBLHpD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Feb 2021 02:45:03 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E28AC06178C;
        Thu, 11 Feb 2021 23:43:38 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id b3so6819733wrj.5;
        Thu, 11 Feb 2021 23:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m10UBKJBthWio+4ksO5Z9Dkd3ZlCqAP161BEeEUt8Io=;
        b=f6wLsGMhI6Z139SNVZQLqJAe8av558XjZ9b+fCIV8LGKgJGDIqEm/JBW0XvqPUOZqY
         KhoNVH7rL5FKgf2ucb74TDsPs/quFx54Kr0Dq2UzfLiCg+0lOjNHXjpaZe7sx+b+fZ9H
         Tm/r0EslGIH59r/DifvnA9QSqMz80zjReZb0wN80MvJSxhPHB6ZIB5vYogw/pQZQpgm7
         IaHaDDj1A5KZUfBi8cnC8mfOJpN3k/FAfyTfjQjPLse9Tq9/8qLtzPq4L+oqw0E8g5Mj
         ulStsPewdShNTd3s87dSx5RnTLeU3Zpgxm1jfmIESHh5HXNmyiieSAisFkOqRNqMMGUX
         Me3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m10UBKJBthWio+4ksO5Z9Dkd3ZlCqAP161BEeEUt8Io=;
        b=kT9IjvJ68V73xufwMOfuKw3GXMTJu3wHQUgF+o8irndQQvaSK3UTaS8SQRdCkjAeEK
         3kXHBwus4tTaTqjhJWLz12j0hWuBu2Gke2sjTKZw8JrbO1gRV0FXtQzeoB0XtLIINtNH
         kajeckpPklqlahJ+LY+fKNlrZxyEXySFV/BfiPL4guVX+EaqxEjOGl6UI/HPiFzdOnnR
         xywcGOFB/CRyRTwxsAzB9GUWFhFOOYuoqypGcyZe2+Mft+xGBCesxRouuU32PWlJZH8r
         +1wu37rKG3Fa+lGY2QTQC7JaJy9dZVHaT+GFeUgWJVGBYhlMXBpOZ1Sw6E4R3BfckC2B
         1kzQ==
X-Gm-Message-State: AOAM533mbz1qTekqHDaTqQ4vX2EUtfN4MsyN1UTzg4vBlkiGXv/UgHVL
        MoDFzRzaHD9wEOun7o6xGlI=
X-Google-Smtp-Source: ABdhPJwaIyU5WDqbb7ACB6YCXWk2H6LmrqTYmJsjC1DVjAHVYfNpHIqezw+x0S7+W3tzYbES0hVX0Q==
X-Received: by 2002:a5d:6807:: with SMTP id w7mr1921499wru.0.1613115817029;
        Thu, 11 Feb 2021 23:43:37 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id a17sm9663858wrx.63.2021.02.11.23.43.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Feb 2021 23:43:36 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [RESEND PATCH v5 6/6] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Fri, 12 Feb 2021 08:43:30 +0100
Message-Id: <20210212074330.4650-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212074330.4650-1-sergio.paracuellos@gmail.com>
References: <20210212074330.4650-1-sergio.paracuellos@gmail.com>
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
index f5eafee83bc6..f0c51d9760ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11247,6 +11247,12 @@ L:	linux-wireless@vger.kernel.org
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

