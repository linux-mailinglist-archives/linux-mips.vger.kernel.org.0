Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D29B05FB01C
	for <lists+linux-mips@lfdr.de>; Tue, 11 Oct 2022 12:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiJKKEM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Oct 2022 06:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiJKKEC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Oct 2022 06:04:02 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005838C44A;
        Tue, 11 Oct 2022 03:03:48 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id a67so10020322edf.12;
        Tue, 11 Oct 2022 03:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lBTq8juooIuTyFEgcmEOyFqiiRaMLuXlIjzIJ8KmLsg=;
        b=aO0GB03LHXSuLYJGS55fnpkD2vkTt9JCLtPGOIoCVfhsLwESgpJ8TF392ivbhl1UN+
         ThHtE59bPTEM1CF8WTIjdMG/59+hWeoFpJlftp40fpQhKZc84ix5kiWAWLNY3UyXOKsW
         CHwh2C6PlDWk3xTLRQd+A0WIUwxiiVMoh4Ojg9qNMkxfYbBxdvWyFNNKYE6JtB+SGQKf
         35091AOyYmVzYX2i3F/OIlYt30uLedwCbEKgZSHHVefZC7GF0WQ8omDb1YnqfUICED4y
         IHXfqnjhf+Dnbikgl2la4mqKdpiV/1yCpz5RVqiw707zZIIbk3swbMJEbSo9sVGHI+Vv
         pTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBTq8juooIuTyFEgcmEOyFqiiRaMLuXlIjzIJ8KmLsg=;
        b=H/oxoeOuKz7GEpjFr4x66ESZv9Ih2DaxIq1Uh5+W5tlWU+hUH/ZQesES0mIO9JN1Jf
         POlrDqsswxavzd7Hj6awi1xc4g3NWDmVGbBBFvWwVBCon1EdhcJQAA3eyP/H/6z0Rm1s
         jZNfNhv9p0PDn0W3l5Pf+C7Df4S3Qn2k41jeXav8cGDeKaKf/og73a9xpDJheeu8uQ8l
         6okjNJGdaguLDe9zYz8lxnGBsUvEt+lXbRtgHeEoFIaBkQC0AI0aOWmquMfD2OFsiMmi
         9VwdcAIR5QsohjoH8uIkrZQjZafbmRNvZGOecSi6VOxFs7AifZdilcfkHw06dQJPL/S0
         7RcA==
X-Gm-Message-State: ACrzQf2tfcXOawlHbTEnPQ9EBYeRO8nGENmfYSwJgY+cPPi7ZvB22loF
        wvEn+t/a06UT6o7vx9bNw48=
X-Google-Smtp-Source: AMsMyM55d8xMOD3wN0672qkNZ4P9Yy7UfT7+bZky+xgDImbk2OZtM06DaBFO+uQYWYEX6NMLgQakVQ==
X-Received: by 2002:a05:6402:2146:b0:458:15d7:b99a with SMTP id bq6-20020a056402214600b0045815d7b99amr22290831edb.24.1665482626964;
        Tue, 11 Oct 2022 03:03:46 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id o8-20020a170906768800b00780ab5a9116sm4597749ejm.211.2022.10.11.03.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 03:03:46 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        bcm-kernel-feedback-list@broadcom.com,
        John Crispin <john@phrozen.org>,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: mtd: partitions: add TP-Link SafeLoader layout
Date:   Tue, 11 Oct 2022 12:03:32 +0200
Message-Id: <20221011100333.32536-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Most TP-Link home routers use the same partitioning system based on a
custom ASCII table.

It doesn't seem to have any official name. GPL sources contain tool
named simply "make_flash" and Makefile target "FlashMaker".

This partitions table format was first found in devices with a custom
SafeLoader bootloader so it was called SafeLoader by a community. Later
it was ported to other bootloaders but it seems the same sticked.

Add binding for describing flashes with SafeLoader partitions table. It
allows operating systems to parse it properly and register proper flash
layout.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../tplink,safeloader-partitions.yaml         | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
new file mode 100644
index 000000000000..e38aaea5aa11
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/tplink,safeloader-partitions.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TP-Link SafeLoader partitions
+
+description: |
+  TP-Link home routers store various data on flash (e.g. bootloader,
+  flash layout, firmware, product info, configuration, calibration
+  data). That requires flash partitioning.
+
+  Flash space layout of TP-Link devices is stored on flash itself using
+  a custom ASCII-based format. That format was first found in TP-Link
+  devices with a custom SafeLoader bootloader. Later it was adapted to
+  CFE and U-Boot bootloaders.
+
+  This binding describes partitioning method and defines offset of ASCII
+  based partitions table. That offset is picked at manufacturing process
+  and doesn't change.
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+properties:
+  compatible:
+    const: tplink,safeloader-partitions
+
+  partitions-table-offset:
+    description: Flash offset of partitions table
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+required:
+  - partitions-table-offset
+
+additionalProperties: false
+
+examples:
+  - |
+    partitions {
+        compatible = "tplink,safeloader-partitions";
+        partitions-table-offset = <0x100000>;
+    };
-- 
2.34.1

