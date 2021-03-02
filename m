Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5763332AF77
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237521AbhCCAYB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:24:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376386AbhCBH4G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Mar 2021 02:56:06 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2AAC061788;
        Mon,  1 Mar 2021 23:44:41 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id r25so21736735ljk.11;
        Mon, 01 Mar 2021 23:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3TtSrnXBguUPTi71hdOlnm4h8qMyGVSuM0R08lOrQW4=;
        b=uots3Sxm9SoiIi+QE2AQP6TZSdeyhTt/s5Xh/05aX+PTwfgq0Mm1+r1XygmqDKXg1v
         aidObKrhOU7m/gSqHRqUjOcBYCbjrn8SQUlhIRKPehAaZmxR7phXvLt3XAYGwhciak5m
         3rrbNzKEDtMxygnR+Nao6WjEd9Z3xyW8eQXz9oLuE0NGqphifmyVF2jd6fcT2Usom8kB
         mYhRpgnGbB4oanr4KvJdBRxA/yoprN29gi7c8H3tMJRw20ONETkNSjRBeff/Inke4jWl
         o5XpzcwvReYXJ0sjZmIjb1FermlSQX4tAdZ/b7CcyxlxgnGJwC30JCXMPKyWXcAZdsDA
         gkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3TtSrnXBguUPTi71hdOlnm4h8qMyGVSuM0R08lOrQW4=;
        b=af7RAlnBp01/VPfLscy+GShMwDdCsAZKN4+H+xQcR1oF09EUInV4BARFoGvf6ViDDh
         xJ0iK90s6MedkjWBqPE0vDSTg5DNPCEorl9EwkCxE+gzDv/Y1IxZpPlD6/E79HfFFO/A
         G1vCi95XYVi0dA4O3mIzm1zzN3RO1VvCofqeGao9Xes69HN9YhZKnEviiZzCngr/Rcqj
         BrsgMsr4eeiu009VD8nXgmcXV1dzIM7q6cuQm2hI96AKSYIa3C5IPX5chMARb0/FhfDo
         8D/YcbeazpogLnfLP4PUPXEiYpNRZLNMocBVlrNCsefP7kVqXaB5uonJN0hDw/P6T+La
         2W6A==
X-Gm-Message-State: AOAM531DuDhuF20TXX33+zCj0Na17c6m+qpji2/rP9jTQ1e9ovI9ad5s
        t2B8LO6i9F6wyZQQVXHLT4U=
X-Google-Smtp-Source: ABdhPJzj5bJtO4TF9wl6Qz1I7getHrofm1x9Oh+YQo5fkpbR6AtYw3Jw8p0DBAzHIs5abIwxraiWwQ==
X-Received: by 2002:a05:651c:1022:: with SMTP id w2mr10340293ljm.455.1614671080079;
        Mon, 01 Mar 2021 23:44:40 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id e15sm2552600lfs.83.2021.03.01.23.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 23:44:39 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Vivek Unune <npcomplete13@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH stblinux.git 1/2] dt-bindings: firmware: add Broadcom's NVRAM memory mapping
Date:   Tue,  2 Mar 2021 08:44:04 +0100
Message-Id: <20210302074405.18998-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

NVRAM structure contains device data and can be accessed using MMIO.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/firmware/brcm,nvram.yaml         | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/brcm,nvram.yaml

diff --git a/Documentation/devicetree/bindings/firmware/brcm,nvram.yaml b/Documentation/devicetree/bindings/firmware/brcm,nvram.yaml
new file mode 100644
index 000000000000..12af8e2e7c9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/brcm,nvram.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/firmware/brcm,nvram.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Broadcom's NVRAM
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+description: |
+  NVRAM is a structure containing device specific environment variables.
+  It is used for storing device configuration, booting parameters and
+  calibration data.
+
+  It's required very early in booting process and so is made available
+  using memory mapping.
+
+  NVRAM can be found on Broadcom BCM47xx MIPS, Northstar ARM Cortex-A9
+  and some more devices.
+
+properties:
+  compatible:
+    const: brcm,nvram
+
+  reg:
+    description: memory region with NVRAM data
+    maxItems: 1
+
+required:
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    nvram@1e000000 {
+         compatible = "brcm,nvram";
+         reg = <0x1e000000 0x10000>;
+    };
-- 
2.26.2

