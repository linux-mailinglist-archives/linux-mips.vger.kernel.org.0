Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B7F4465F6
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 16:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbhKEPo5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 11:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233284AbhKEPo4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 11:44:56 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AD0C061208;
        Fri,  5 Nov 2021 08:42:16 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id g18so4432125pfk.5;
        Fri, 05 Nov 2021 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uTdOngd4VPhSH8+CK4C2/rriyaWWsAeUfDRBKTnaPrc=;
        b=lMXA4V5YruSMWY+Yn3B2bniXF/Fvp8Ks7iWYK3lg8d5WQ/rrpjMg9VUYJhV0OsyXal
         YwAY+OjvTUviJCdMtpz8s3euXvj9mHcpZmiNkRNgfVG5RnuI3Dr/ZyVgqnu5XvgKg86l
         jGAmVUhfrIqe8FrrJ0BmKtRfCCu4xwmqdNupRfw+eMDYBXNUStxlV5Jf7SqUhUxKpvLf
         lbE/LbFCvVEjIuwsv9i21EDzxHXuBdyNNGW8Ut1kwIcJbDqtmwct93BVjxkesmU9y0l/
         YTt+OJnKGuMtBztr7mZJlG2U2S5KB51EJ5A0DFBK5tqUY+pzK1JjFvRtXYLfQhbkHREC
         tFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uTdOngd4VPhSH8+CK4C2/rriyaWWsAeUfDRBKTnaPrc=;
        b=TWe6FmM7hVePt8F+qcFMmTr0RzzRBoUXm6+0i1RJHs5QmyjNZ0gfQdOYJ29uPFuO1i
         Sg9djb+yLNCZRgwdS+jwqsbj0gnIfjp+ksFN8zpjwyKJXWxgnR7ADsxmYZro2VKP7FMu
         pcDVqRZX/Uc8ZPHqP7Znj7eJaFlmvHWGjNQMj4c7uqdNCz1gUOzpHikY52dN6ZnRtrcm
         6POE0HGQOVfeSLkAhhmaaRY/gecA675Tq0NCgicWZz35zpsesJb7om2tm3KnFRBOppCA
         ZcEiIfMiBiFGJK+gwnWj2g+SVkf1LCZgtbZXg/4m/iVJYCLA0PgbJngA4RbVScjKt4yx
         bCpA==
X-Gm-Message-State: AOAM532fnbcprtTJqxw1aee8J8ATbfuY5NFkgOTsw1j5WbbhNC88ysqG
        A3BTs60lEVoYoRf1JWRnNkFf+bPMyg8=
X-Google-Smtp-Source: ABdhPJxMtkAwnjarTY/wEqrdiCa7GppqqKy/JLgbr3UmGvjYxRMyndkPk/2s1xVJI/f2wfuLRRVixA==
X-Received: by 2002:a63:c115:: with SMTP id w21mr26533958pgf.435.1636126935910;
        Fri, 05 Nov 2021 08:42:15 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id b8sm7547097pfi.103.2021.11.05.08.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 08:42:15 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM63XX ARM
        ARCHITECTURE), Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-mips@vger.kernel.org (open list:MIPS),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM63XX
        ARM ARCHITECTURE)
Subject: [PATCH v4 2/7] dt-bindings: watchdog: Add BCM6345 compatible to BCM7038 binding
Date:   Fri,  5 Nov 2021 08:42:03 -0700
Message-Id: <20211105154208.614260-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105154208.614260-1-f.fainelli@gmail.com>
References: <20211105154208.614260-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The BCM7038 watchdog binding is updated to include a "brcm,bcm6345-wdt"
compatible string which is the first instance of a DSL (BCM63xx) SoC
seeing the integration of such a watchdog timer block.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
index 53a3245a6193..b123a3c3a847 100644
--- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: BCM7038 watchdog timer
+title: BCM63xx and BCM7038 watchdog timer
 
 allOf:
   - $ref: "watchdog.yaml#"
@@ -16,7 +16,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm7038-wdt
+    enum:
+      - brcm,bcm6345-wdt
+      - brcm,bcm7038-wdt
 
   reg:
     maxItems: 1
-- 
2.25.1

