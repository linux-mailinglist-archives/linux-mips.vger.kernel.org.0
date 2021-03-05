Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5D132F2B8
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 19:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhCESfr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 13:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbhCESfV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Mar 2021 13:35:21 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F21C061763;
        Fri,  5 Mar 2021 10:32:53 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id q14so4001725ljp.4;
        Fri, 05 Mar 2021 10:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yCWtEFyrceH7BJ6AukIJ81DQ9V6t6R7qk/KayCrGAnE=;
        b=IwjMsHqY0DBH5/GX0MF09rd8LLvvJZArlEX+lXLd7JDgWs4ZfESNowujUiqKdWwPu0
         PglTOEeijYt0rq+5tBZ8LDE2oW06KcKOlmBffkhibSn9eS/CFqKU/knEbnAdoP0sqKNH
         0+w4647siaUVFtvf5FX4VZNzEgtOR4Yc6/DSHYfdtxrXq1hTilZP/tTuOD4VVhMIWKPv
         0yOzKeQJ3IVXJM5XjwgZL81gNZO9UGjZcns2DDW9ikyl3NdiNuS12ebbAyrXpMJWzqKT
         GKrKOdcWVYq37VmUdfFyLb1itwQvtPaqRIjsAeeGRY5KsaPNgNyvjmXLdFMaSR1NpHxI
         wNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yCWtEFyrceH7BJ6AukIJ81DQ9V6t6R7qk/KayCrGAnE=;
        b=GwMmGgEErNh8kmka/G4MhN7rDxk/uK4sYK6LrjTyJuhba00x2h5WLFmElEyweyokGx
         ax3jYRy3C5ls9a4lFJKGsEzO6JQIkxILUKTsP1nh2cE3BE2DZFIDhTMwNHypcKqTekNp
         SkK2ioQbJ0Jo/p+AuKAPI7/D4O/JTrNZB3ouYosLyFLSwcWx94Qa5oFAmiQ/nlHGADi+
         3qI9/b4LARJjwqIhe34HZkyaZ0oTPo2QT+wIFT2gR1LDX2JT3uzjXNlqYVUiWEIAdl4B
         6vIXO+Kw/ZazRvMAU2qboxKmvkJGzS45kKztffTb7jXDPynSEjo5brB7j3ja2OCxulg5
         Du1w==
X-Gm-Message-State: AOAM532XDcPogS8n5XxF99VFOozoquSYvil9kSKCIPn9Ird5SxObSZvo
        9Gw0FJWDKiw8ACRJiZZhWI4=
X-Google-Smtp-Source: ABdhPJyxr9PnPzpKcN7Pkw/wsx3UbzX9kFmZsLiHylfTvjTD1rjrTAiozInXXb3SfwdQIijlVCvKPw==
X-Received: by 2002:a2e:a48f:: with SMTP id h15mr6002521lji.234.1614969172315;
        Fri, 05 Mar 2021 10:32:52 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id a10sm396571lfu.263.2021.03.05.10.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 10:32:51 -0800 (PST)
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
Subject: [PATCH V2 1/2] dt-bindings: nvmem: add Broadcom's NVRAM
Date:   Fri,  5 Mar 2021 19:32:35 +0100
Message-Id: <20210305183236.11784-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Broadcom's NVRAM structure contains device data and can be accessed
using I/O mapping.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Use Broadcom's NVRAM specific binding. Generic "nvmem-iomap" binding
    didn't make much sense. Thanks Srinivas!
---
 .../devicetree/bindings/nvmem/brcm,nvram.yaml | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml b/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml
new file mode 100644
index 000000000000..58ff6b0bdb1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/brcm,nvram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom's NVRAM
+
+description: |
+  Broadcom's NVRAM is a structure containing device specific environment
+  variables. It is used for storing device configuration, booting parameters
+  and calibration data.
+
+  NVRAM can be accessed on Broadcom BCM47xx MIPS and Northstar ARM Cortex-A9
+  devices usiong I/O mapped memory.
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+allOf:
+  - $ref: "nvmem.yaml#"
+
+properties:
+  compatible:
+    const: brcm,nvram
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nvram@1eff0000 {
+            compatible = "brcm,nvram";
+            reg = <0x1eff0000 0x10000>;
+    };
-- 
2.26.2

