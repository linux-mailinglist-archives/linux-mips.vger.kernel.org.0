Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC6DE43DDC6
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 11:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhJ1Jdm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 05:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbhJ1Jdl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 05:33:41 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76E97C061570;
        Thu, 28 Oct 2021 02:31:14 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 205so9551379ljf.9;
        Thu, 28 Oct 2021 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xmZKVrMbuwj9PIbfM/9dtEHCrT9YdEntWT50WYrakpc=;
        b=DXQgOR1Ay9+kyvZHUoTPZJHgETrMcIxpg0h44kk8X0jTJ9GMEVXs9bMmOi9XSvbq1Z
         OWDXluKsLUyPFGePPWBmndcBenJNipPhr25okQKChxd6Jyn05ZQathAM7pyBVsHYyhji
         yw0/+rFLWN+8SrFWABKfba+Jj702WosTGW3gX8h2yHJ5xL7tbPLrzed0SE9yGWRAObfo
         vWAz6iNMR4UeMUfomJfXYc3wBx7PdqTnVGQJ3TcE5GYXk7P+4/mhE/OBd098NlSNA+JA
         +P5JoWxgA++KMoaYZXrHY6Kfo71ABJKc5ef7WTGdlQWq+JiY2TzE1qhVr68d8IDKgSZ3
         Bfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xmZKVrMbuwj9PIbfM/9dtEHCrT9YdEntWT50WYrakpc=;
        b=zhWTUlSDNSvkXUgYOZprD5LS5F2wSX6uQKggPMVNfqGcM3KtkQrkjVhCHOie4zFYdA
         ++g5oqw5uukasoQK8as9/YhD7KUrOfgkoYk7QWVw/MK9kaKpBR7HA58uXSyhi4e9EtdJ
         8di8eVS5kisoyjU1u0ex1/82mxZsJpGbATUC5caz0kqPP5qoNWPa8vY2czKcGWP7R1YB
         W9Bsz5bRRg7I03gH+zb39RZE3UheaczAnfPvHRPF0C6QL4Fk2OcZS9LQMa68OP2PC7mS
         237kdhAGVBksYZ4BcLkDyxRDRBQC/Woph85GfubhWr8IFxOKKYpHZPYye7yq2xLPGiZ8
         NUoA==
X-Gm-Message-State: AOAM533znCcQZCvGYo3P4hVXJ12FzHh0JXOSc68EF3GHXa/aVRaBv0Hv
        IWkDBWzI+QHZjGS/dMNMG8OUdfit8pM=
X-Google-Smtp-Source: ABdhPJwV3txWjWJsSgBLiFcV1rPPej4Z2ZiHKIEFlNkZKv83v+j7ie1EZ2FtWOdloVZMG8EBx4IhkQ==
X-Received: by 2002:a05:651c:1194:: with SMTP id w20mr3533842ljo.303.1635413472870;
        Thu, 28 Oct 2021 02:31:12 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id o26sm231548ljg.92.2021.10.28.02.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 02:31:12 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/3] dt-bindings: watchdog: brcm,bcm63xx-wdt: add BCM4908 compatibility
Date:   Thu, 28 Oct 2021 11:30:58 +0200
Message-Id: <20211028093059.32535-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028093059.32535-1-zajec5@gmail.com>
References: <20211028093059.32535-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

BCM4908 is another SoC with the same hardware block. It just uses a
slightly different registers layout.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml
index 9d468026550f..4391af0c9698 100644
--- a/Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml
@@ -14,7 +14,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm7038-wdt
+    enum:
+      - brcm,bcm4908-wdt
+      - brcm,bcm7038-wdt
 
   reg:
     maxItems: 1
-- 
2.31.1

