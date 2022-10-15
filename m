Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A83C5FF977
	for <lists+linux-mips@lfdr.de>; Sat, 15 Oct 2022 11:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiJOJaA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Oct 2022 05:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiJOJ36 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Oct 2022 05:29:58 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D497613D14;
        Sat, 15 Oct 2022 02:29:56 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id g27so9743563edf.11;
        Sat, 15 Oct 2022 02:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YdzYzQPczOob4IO3pFuC56rrjAxpW/32RTAW6DZMbmw=;
        b=ScPcjlScG/12Dzm1gMutsJyhlbXrRHcQe5LoFTVzEPNAlIgbKfw9jTLOOJjsoXYvxt
         cPdraLACd90IvK/7cIXd1ehw6DDI9lqLttV27FM/coh5tUDubXuvdft3QygshnghsPJk
         NVmk56mAzQr5l4+f58oxFwggXQ0xeRI0Bo72u9UZqNjJ4J+ClZWT6t1SW89xKXm8wiLm
         IatFqAJvlBq2UiVl0pBZwvdJ9h7m0Xlgs7YYIlbKPlrv36WyK1uHFO06fRt0pl94zZ8Y
         AxtdlX0heYM5nbTOQvRzd0Z8PcDYY+LZCwtuPz7wGwiwJUw3xmc4tWQM8tPLCaXApzkQ
         nEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdzYzQPczOob4IO3pFuC56rrjAxpW/32RTAW6DZMbmw=;
        b=PHr30eK6U8Q7nEamgm6oYdv959uq1H2rEQu7ej+SiM3Vfq/4pL4kyrXpT3KoSEOC+G
         x1O6rWFwO5h4lurtCqcCiX1gW4bze1N3DiyS1/Uo/37eohFe0PwXoGMLsFU6ydBERHTA
         jukGxpEb+e+4fUEEj6D7HVuWp3AQAYD+J66v1iLpc7XTN+3z3cidAD5Ao4XPegpxPTAU
         aTQXvkeuvNjfvAbF5lWQa6ipRrbk3iwvUv1/EPFWAzHc0XB8LpuVXw00vnFRgca5oSbY
         m80W7AFdMBmr2cZWQQAkcDYo0D4Ta1V0csxMT7E3Rpc0E0L4gnlhDoXZDNaEifwePGPP
         XvXg==
X-Gm-Message-State: ACrzQf3PRoVJKvTSJJ5wJElE2Oo/kbHTI/eSMDGguSXgMqz/iVpjsNMO
        nCDB1k1dG83fnPCivYheEvzHfXhO6P9+Rw==
X-Google-Smtp-Source: AMsMyM72A/OQ5F+l11gRXWkiD/asNwXE5n0HCwpwa1VFlMvtIR/rNH0GO5v33NsnX6lqLOgY95iJVQ==
X-Received: by 2002:aa7:c40b:0:b0:45d:4492:a8cb with SMTP id j11-20020aa7c40b000000b0045d4492a8cbmr1575750edq.217.1665826195174;
        Sat, 15 Oct 2022 02:29:55 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id v5-20020a1709060b4500b0073d6093ac93sm2919033ejg.16.2022.10.15.02.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Oct 2022 02:29:54 -0700 (PDT)
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
Subject: [PATCH V3 1/2] dt-bindings: mtd: partitions: add TP-Link SafeLoader layout
Date:   Sat, 15 Oct 2022 11:29:49 +0200
Message-Id: <20221015092950.27467-1-zajec5@gmail.com>
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
it was ported to other bootloaders but it seems the name sticked.

Add binding for describing flashes with SafeLoader partitions table. It
allows operating systems to parse it properly and register proper flash
layout.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Fix typo in commit: s/same/name/
V3: Drop quotes from $ref
    Describe flash space coverage & partitions types in the binding
    See commit body of PATCH 2/2 for real life example
---
 .../tplink,safeloader-partitions.yaml         | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
new file mode 100644
index 000000000000..63e596aa0ca3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
@@ -0,0 +1,49 @@
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
+  Partitions specified in partitions table cover whole flash space. Some
+  contain static data that shouldn't get modified (device's MAC or WiFi
+  calibration data). Others are semi-static (like kernel). Finally some
+  partitions contain fully changeable content (like rootfs).
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
+    $ref: /schemas/types.yaml#/definitions/uint32
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

