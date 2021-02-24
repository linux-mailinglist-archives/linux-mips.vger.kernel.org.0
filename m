Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 296613239AC
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 10:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbhBXJjv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 04:39:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234682AbhBXJjo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 04:39:44 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068BBC06178B;
        Wed, 24 Feb 2021 01:39:04 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id f137so1218154wmf.3;
        Wed, 24 Feb 2021 01:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=trQPgYOyii8s2BvWdiWhLT50g607rLG7EDemXs+w3BQ=;
        b=fgjWIn9jFmAzaICAlnOUBKnXr1O3poghNsLjreb26ciJRgYSTkvBxqaw3GXwxrxRm/
         vdx/4HZIeCpqxNxzv8w1OFRNqyw8HjtMUgs6nZYHeUHn5R9/gl4b/ZFdQMz3e3nrXtwp
         Y8jRBavhva90zajoPmABiL7DhSBmE4yb9t3V2KKzl5jdszV9t5ZxJwrtPURREBRe8k9t
         31n7MneKzro3LXtUmotGoBja6iIGM053BqMdYHHIe/kHbF9uPtF7bqDbRqycDwY5+th/
         poN6x9xz8z9hfi9OUKlB0bhR5/Q/3D0QQbgu7WuYTKh3yj9XbQaWusRKkw33BZ0BTr0z
         5XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=trQPgYOyii8s2BvWdiWhLT50g607rLG7EDemXs+w3BQ=;
        b=ir0iHmZbWNud9WoxOjlCSRPQMoG+XoZXJcYJtFUc+55DFYuc77BZXxkDGeP3k37BlG
         H65CxDzHuL3IQH+XrZwU9tTD3OvQqq+RMOjAUIahE/KMUAcAiHz96LRk4+TVVR5vPIUb
         UK/tY16LyNAMGSgGeAyZmNabExL6LYD0F3re/nShYccYTeWjz9+5ANfO8fgYGsoC96Rr
         auoZToxS438L/dxPKIcoysmGC/fQbfVThp1bYFTaSvWTbWM7BZGd0PCUywml/3ZyqLeP
         o7jycIBq9e2YGGZ2tEXOjK3iOfaIm2Pr2Mj1Mnxn/ksVKMOU2fqaUiinCEhP7PnAgstR
         Jz6g==
X-Gm-Message-State: AOAM532r1vVPfofHBeT0JB+Il2INT/MSxXV3m6vwkDBJY6mv3RXyp5rz
        weF/ZPQ+xKDxhpBcGgqCEAI=
X-Google-Smtp-Source: ABdhPJzzSqQXRgWRUgmq+sEDqwOHekKWXBIhhhaqz4jNvYGGPOWaSmrepLxPUbz8UmEiwP6PfUT3jg==
X-Received: by 2002:a05:600c:3546:: with SMTP id i6mr2975822wmq.24.1614159542752;
        Wed, 24 Feb 2021 01:39:02 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id y18sm2223919wrq.61.2021.02.24.01.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 01:39:02 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 3/7] mips: bmips: bcm6328: include dt-bindings
Date:   Wed, 24 Feb 2021 10:38:52 +0100
Message-Id: <20210224093856.2021-4-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224093856.2021-1-noltari@gmail.com>
References: <20200812063129.361862-1-noltari@gmail.com>
 <20210224093856.2021-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that there are proper device tree bindings we can start using them.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v2: remove irqs header, add more bindings.

 arch/mips/boot/dts/brcm/bcm6328.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6328.dtsi b/arch/mips/boot/dts/brcm/bcm6328.dtsi
index 9dc558763c46..fe93f2692281 100644
--- a/arch/mips/boot/dts/brcm/bcm6328.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6328.dtsi
@@ -1,4 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include "dt-bindings/clock/bcm6328-clock.h"
+#include "dt-bindings/reset/bcm6328-reset.h"
+#include "dt-bindings/soc/bcm6328-pm.h"
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
-- 
2.20.1

