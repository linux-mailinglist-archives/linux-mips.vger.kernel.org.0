Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F164932D59B
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 15:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbhCDOnA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 09:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232278AbhCDOmf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 09:42:35 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0628C061756;
        Thu,  4 Mar 2021 06:41:54 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id m11so32772980lji.10;
        Thu, 04 Mar 2021 06:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FpcwYQmI/lKBKHdSQPNb+1D36/BM9oOnf1w3DpKpMkg=;
        b=jQ+Ey2tH/MuMgfd8CXvjrXuoo6ALqf9EtobLv4HCxR31631DlYZazL9DW5M13cycz2
         Pp38JJMjkkpAN69SZqIRHLpTBV8U8TO+8ZGlio14du8Ofl+w8YPBT9M/R430NgSYmiOA
         Ne2MUDbzq4NWL/TLYpInEh971tvE6X7Tt36NQtEUxg6mIU45c3d5/nFO8JMt0w5LsZC5
         HhjZ0RXSIpiuHE6wxF+ndMkYJYLeiFZuRg2UNeF86v89QKLdscrN7fxb0GzSO6Or49QF
         0dues1KkX7xUGs7t9fCxsG8dpOhFvfq5tT289tV47hGfobkydloIbM9Q4NL0WzTZbI8Y
         ho6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FpcwYQmI/lKBKHdSQPNb+1D36/BM9oOnf1w3DpKpMkg=;
        b=ucfOPc+jmfb34SSuGu8VrhEBwwx+5l24d9HifFKVGSCmDvQsENVhyqOXvFimdrltLy
         Cqx/PkzxzfFG6JgE0ehoxkzvU72V44tHsg4C20PKo3iByVhS/6nDeGe0h92Yb1pd1qHi
         Inp00zbl+wIYiCUYQ9SwmLTodg9EwB5t5ztTz7oqnQuxtkBRx6VV3dlG2a7A+JiIYvZ4
         /3GVL1+mBQ4cBO7QcsyNitAZVU5UcvLs1ROOaYquAkMzWiSfsb++rDzcv8hOqrmMH3/x
         /tz2mbF6KLfPy2vsQlHbBr8pSqAegXmG9f/hkttyEubHmHVNBhGU2NPHTjiTMPcNCUun
         AITQ==
X-Gm-Message-State: AOAM5318gXg8hzL/ZsxBk3Pl8dKUWM7yHQXh5WS/6NuVM2GlsoTmalxh
        +nOCWGk9rPQJHqaMczfv9yIy1P6NBhA=
X-Google-Smtp-Source: ABdhPJya984/mYknU+zboD+nnBmFKvUw2Py1czSP15A8ynWdG0zvYYco3ueeNacxRE6ptzgVxV5Rnw==
X-Received: by 2002:a2e:3608:: with SMTP id d8mr2393855lja.21.1614868913549;
        Thu, 04 Mar 2021 06:41:53 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t17sm1396694lft.224.2021.03.04.06.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 06:41:52 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: nvmem: add binding for I/O mapped NVMEM
Date:   Thu,  4 Mar 2021 15:41:31 +0100
Message-Id: <20210304144132.24098-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

NVMEM on some devices can be accessed using I/O mapping. For example on
Broadcom MIPS and ARM Northstar platforms NVRAM can be accessed that
way.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/nvmem/iomap.yaml      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/iomap.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/iomap.yaml b/Documentation/devicetree/bindings/nvmem/iomap.yaml
new file mode 100644
index 000000000000..ec8764598061
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/iomap.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/iomap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I/O mapped NVMEM
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+allOf:
+  - $ref: "nvmem.yaml#"
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - brcm,nvram
+      - const: nvmem-iomap
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nvram@1eff0000 {
+            compatible = "brcm,nvram", "nvmem-iomap";
+            reg = <0x1eff0000 0x10000>;
+    };
-- 
2.26.2

