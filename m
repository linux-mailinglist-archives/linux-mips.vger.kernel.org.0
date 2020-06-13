Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2E41F81F9
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgFMIi0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgFMIiT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:38:19 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E5DC08C5C1;
        Sat, 13 Jun 2020 01:38:18 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id l10so12141353wrr.10;
        Sat, 13 Jun 2020 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CX1RIcH3HdMjMnLFfkKPZsJHlG2/s8A7XrV4W8n9VPI=;
        b=CFNp8ETd9NAmbscrrN+YWTmQ2KNIFm2RxB6atk62gux18g68TZP/SAJRDqP7d9MI/k
         /7Ff4vvA+dkpTIRyPpl4y4uy8pUI/BzO66kpq6W7MdTbhj6Zprm4zMSxpodpUHPBDVz+
         2bp9nA6Vr7bSqZOv7M+fC+S6iuNTLFCEX0Gii4o8cfbha15jEWqZA2whV8/X7Sy7kqSu
         bdjA2t0PWfcB0TQdCnalvRhY27fWVUmi0ndvknDeHk4SdZFwSF1e8sCNjd1kk2pmhbGE
         ULUOJWkjtZDFLdK/dClEgbC9WH0h7RhtuqeIZtVtxfEBGsoBrPZOEHW1h+PHVVZuGLQQ
         Pgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CX1RIcH3HdMjMnLFfkKPZsJHlG2/s8A7XrV4W8n9VPI=;
        b=L1wDH/yNVydfOcIrII/nJxcJAMngZSJEbHLi8dopGc7vCNn39YcoUqps4rPbZSfm3M
         RqMCXHVN0RuTc4A0rrgnbuZHb788KM8onnUr6ShJ8/R66NEgjc3vu4jAA9ZikBdmA6D8
         u8rddHKDCGFEIlJ4fzJyH1t+4pwdrNc9rR/eaob17cfiY1qsz0+4UcLtmk8s2p5vu4IL
         NxepWmaaNqL8ikFO+K0OnKt5iEMbobsDQd6kTeIUX4lNqT2LKvPWQvnStmZp32ILHfnU
         WxHAjZ6h3jp2eHJKIgwddzhYn/eHUvzDxpRM4pT5Veo48dXMBgOxTu9Z72bYOpP0rCaz
         5Pmw==
X-Gm-Message-State: AOAM531ZOA24QAsP77/+Ptf25fzUwXhP6u19wGOqZGRlH05STmRfDqsI
        uiQFfoAyyWwDdGRZh8zffVk=
X-Google-Smtp-Source: ABdhPJyUh98iuiJKtdU+KImpPrZCEOEPu/mQk5U44H+jrNGXTJfiCEfRJq4uhdPVv+aUe34Esus9MA==
X-Received: by 2002:adf:a491:: with SMTP id g17mr20087920wrb.132.1592037497537;
        Sat, 13 Jun 2020 01:38:17 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id l17sm11622704wmi.3.2020.06.13.01.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:38:17 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 2/9] dt-bindings: reset: add BCM6345 reset controller bindings
Date:   Sat, 13 Jun 2020 10:38:06 +0200
Message-Id: <20200613083813.2027186-3-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200613083813.2027186-1-noltari@gmail.com>
References: <20200610172859.466334-1-noltari@gmail.com>
 <20200613083813.2027186-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add device tree binding documentation for BCM6345 reset controller.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v4: change license and fix maxItems.
 v3: no changes
 v2: no changes

 .../bindings/reset/brcm,bcm6345-reset.yaml    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
new file mode 100644
index 000000000000..560cf6522cb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/reset/brcm,bcm6345-reset.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: BCM6345 reset controller
+
+description: This document describes the BCM6345 reset controller.
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+
+properties:
+  compatible:
+    const: brcm,bcm6345-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@10000010 {
+      compatible = "brcm,bcm6345-reset";
+      reg = <0x10000010 0x4>;
+      #reset-cells = <1>;
+    };
-- 
2.27.0

