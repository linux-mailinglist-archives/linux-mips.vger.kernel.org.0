Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595961F3CF1
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 15:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbgFINoG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 09:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728799AbgFINmj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 09:42:39 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E711FC05BD1E;
        Tue,  9 Jun 2020 06:42:37 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h5so21380191wrc.7;
        Tue, 09 Jun 2020 06:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7jeqUuW0hGtHPFhc2sVBu1AoQmVlpxLyTbacgMXEdX8=;
        b=DUxWZBBN41gINwscR0RJwH3sDfQ73hrqc60FamwT1QU+qcaJdFFeOjtT0lDFDXjLnR
         UCrXQhXwupNRKmfLWhbppejjSFykqXRAArndCJx8U6ls1ewIpQMHe4usSv7j3P5sdNxW
         x5MlacZfwW72THPYVaszYh7Q47IE8EJ0foNehUlK7yFIEN2MRRPUQN4msrAa33w35WKf
         idL3NwzxLnWaWXYsIKW2MS4tKOcNYar5rU6Uw0HugiAoDCw1qfm1N7xDzKTmCg/egdAt
         itgqaFL/dUkvkkztpc6SS1zpgL3zrn4FOHed6ay53Cc1oOLtD4LE6DSYc27tJa2axjba
         q52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7jeqUuW0hGtHPFhc2sVBu1AoQmVlpxLyTbacgMXEdX8=;
        b=cux2ybRaZi7qimFdL78CCbTxSI9stm7X/GA1EFRPY5d4JvXD1pN51YlYJ1qtNDv64h
         5c4zA8J+JGiX6G+H5cpI2VYYjPxO19QDUIZ0Av5P/iCRDd9tX4ekSRfce3XRFZDBcgNc
         DsTZON5P6xoJSxG7PFadb/NtXmmI+38Uq9BBGkukj8KnlbBNbZXbdop4d07OkxuMOaB/
         FiwLmqg7FqisTB9MSerjwoda2hd3rCzHQIwG9OKGDhgE/BXPNN7ClzclBHtzPlB9b5TO
         T9uD5A+6S6W41RqDywql1H1E6Kbhq+M0w6UHeuhRvHLLOhDrssCZbrA5tt4RRHCXlg/H
         bOHw==
X-Gm-Message-State: AOAM5332KLQNszlCf1u8F+JwlWZk533gCvhbMw514TH/0r34MJXNfXuW
        WuB5rqrS6g+CUaqqbJAGr2o=
X-Google-Smtp-Source: ABdhPJwPWGTDddUotMb53Rhg2Yvrr3ctp7WMj2Ax1vaav/7/tRHGwVX6cXlRWB+Hrx9fuPrUWXuxmw==
X-Received: by 2002:adf:fd4f:: with SMTP id h15mr4471967wrs.397.1591710156590;
        Tue, 09 Jun 2020 06:42:36 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id w17sm3454067wra.71.2020.06.09.06.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 06:42:36 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 2/7] dt-bindings: reset: add BCM6345 reset controller bindings
Date:   Tue,  9 Jun 2020 15:42:27 +0200
Message-Id: <20200609134232.4084718-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609134232.4084718-1-noltari@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for resetting blocks through the Linux reset controller
subsystem for BCM63xx SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 .../bindings/reset/brcm,bcm6345-reset.yaml    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
new file mode 100644
index 000000000000..eb3f2182e631
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
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
+    maxItems: 2
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
2.26.2

