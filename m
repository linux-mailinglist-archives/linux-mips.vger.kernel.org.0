Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B16943FEE5
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 17:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhJ2PEA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 11:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhJ2PD7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 11:03:59 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00D6C061570;
        Fri, 29 Oct 2021 08:01:30 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bi35so21576537lfb.9;
        Fri, 29 Oct 2021 08:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/b6PWU4w9zfHkPuFekl03q6QFFhlLfi6J3e36CAbEU4=;
        b=KiT99wrnLwyighneCh50CJxR2QlXoeyAf0CiTbvF2rxvr4PHwzVHZLvBnKZIo9Qbc7
         qMB07U5lvDCWWzZELItjPJn/jznnGiC3XLlW/3vOjanNsZZ55BnBNnAEDqv5MbMcw30m
         ppIQThDvg5JAmYSEr01nTIyH9H0Dip5/3YeDks7brGrwkMJt5uFqM0hFFbqucPk72z0l
         tZKfZ68byHRm/AdbXwrGclfYhHmCBN0fzHDm/mKdTavVHKVFB0/yvic14SddtkncHM14
         wJMl/0F3QalbG8poR0NOJS8UEiHsFsNQaQ0ylO9VigEsxqsbcJLVzd2wViJwqZoeh7vA
         thuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/b6PWU4w9zfHkPuFekl03q6QFFhlLfi6J3e36CAbEU4=;
        b=qBLWXoGWYUqvSDQ16zJvkpLbDVm/PLdWB66J2y8FtCg784aE13P3UX0Y2jQsFsOX4/
         WUScNM8Ssqg2QstY1wxU2jlPaNHU13QTtjJngr3Ah1oFLixy+TJXo2nSqFdFNmguaXDE
         JlSG/fgMSZpwXySnScaia7wDTGObskCXdiI/MjwzVe1URdQbEIeAGWspkkcyCNrVRK/j
         6aw6M1wrAtrLvIhPJ+bbRquR97eNKPdrwpuWKe0ta7ssJWqjL95uyFdtZdKJ9vRW2v3T
         KpvtZJl/snsVelocSJcr+kLcTcEl+jHBrFLxdpc4mecofEQkCwAsERrOLRwQc5++0piV
         aPQA==
X-Gm-Message-State: AOAM530viK1m5ncoAD+7PRhMEm0QJQ//ZPqWSaXB57B9ttiwVujEZViK
        PkL0EZvLBEGDe/ktk3oNktg=
X-Google-Smtp-Source: ABdhPJyXAHxrcnvcJx8j3JPa3hhAhyTW05c9/UTEe6lOkHKwFqt7867BHDPZLafVJJ2huDGHKh/vvQ==
X-Received: by 2002:a05:6512:38c4:: with SMTP id p4mr10654504lft.27.1635519687844;
        Fri, 29 Oct 2021 08:01:27 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id s13sm90358ljo.56.2021.10.29.08.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 08:01:27 -0700 (PDT)
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
Subject: [PATCH V2 2/3] dt-bindings: watchdog: brcm,bcm63xx-wdt: add BCM4908 compatibility
Date:   Fri, 29 Oct 2021 17:00:50 +0200
Message-Id: <20211029150051.3955-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029150051.3955-1-zajec5@gmail.com>
References: <20211029150051.3955-1-zajec5@gmail.com>
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
V2: Update title
---
 .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
index 69e5a1ef6a1f..5e37bf47efe8 100644
--- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/watchdog/brcm,bcm63xx-wdt.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: BCM7038 watchdog timer
+title: BCM4908 and BCM7038 watchdog timer
 
 allOf:
   - $ref: "watchdog.yaml#"
@@ -16,7 +16,9 @@ maintainers:
 
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

