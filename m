Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0EC1F87D1
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 10:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgFNI67 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 04:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgFNI66 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 04:58:58 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5954AC03E969;
        Sun, 14 Jun 2020 01:58:58 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h5so14071779wrc.7;
        Sun, 14 Jun 2020 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kXhtPxyPMj9hJdJOhUgGWvj6GVSUU4BdjzU2bJ8gwjs=;
        b=q0MEkioP0ms4O5ng9B1nEOkvj1dJQyU1BAJ2pwKXblymK4TO82BKTpNhYKeawKfR+9
         7rOp0WA0f772iLvCSpkXTrpRFfooCeylgKtu884ibozVNDvlmGlCc8QBJAHc9ggRoGk9
         tMlwa63KfiU1KhqwJHXxupLsUBQmHVPdTQO8/1OJ+9xGIH2EYfK+b7DVDbxTpSjCO33Q
         rYGqyqm1gZy1iR2XUAOnOF6yKFwsIVjU9QXDFAX0/cJwHkobekaTAKanmYVEyMlZuEvw
         s3YwBeoRb8xIlIlKi6n9fesfm2UzvSLXw4B2gBnzN7J2wSjrdvOTAw7BePL3aEo6ZQNB
         10/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kXhtPxyPMj9hJdJOhUgGWvj6GVSUU4BdjzU2bJ8gwjs=;
        b=bLGljRFUOTCYHBqrE/AE0IC/2uLy4nUwMv3235g4lu/nwLuM4fkmFiK7wZcGiQzq9Z
         K3+Sx1f4ProDZ0cy3OX9df8NSnwcV9CMqAaYGdCwvDsOIEKGvESK71OxnolhQ//OCTjc
         lULz4+LEw3J3rny4iEZVqYtHQIofgV2DI7BEHM9jl/XbralMyVtiQ/WLzr1s5x9TzGrY
         emSulqpUpHZLFf26rEMSqadwvIi+WFedQHco7jwB9Azo9/TYskA8ycRPvQcw6vXF5vOn
         M9IxISDFG0cPGS8nWvB0p/5fCpO0DR4wbkG5RS1lFWa+DXFrxDO/xVKLu0yFpLL7FUrf
         4XCA==
X-Gm-Message-State: AOAM532sBg1/IQF0z6zvW2PWtwxYyw8YRuxHWMK6KCenkSs6CLKKtnNw
        RwC7IKIgD9x7NpSwgMXoC8o=
X-Google-Smtp-Source: ABdhPJzjko+Tl9fB5gdlxBjzagRYEkwYLlElHidyLJ/SG6+grz9XlKc01XUKG+W6SIGArwcWOBGymQ==
X-Received: by 2002:adf:db4c:: with SMTP id f12mr22552225wrj.387.1592125136998;
        Sun, 14 Jun 2020 01:58:56 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id u4sm17174043wmb.48.2020.06.14.01.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 01:58:56 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v5 2/9] dt-bindings: reset: add BCM6345 reset controller bindings
Date:   Sun, 14 Jun 2020 10:58:45 +0200
Message-Id: <20200614085852.2130147-3-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614085852.2130147-1-noltari@gmail.com>
References: <20200613083813.2027186-1-noltari@gmail.com>
 <20200614085852.2130147-1-noltari@gmail.com>
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
 v5: no changes
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

