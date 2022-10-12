Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23D565FC009
	for <lists+linux-mips@lfdr.de>; Wed, 12 Oct 2022 07:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiJLFEz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Oct 2022 01:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiJLFEy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Oct 2022 01:04:54 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B398E15FE1;
        Tue, 11 Oct 2022 22:04:51 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id ot12so35649394ejb.1;
        Tue, 11 Oct 2022 22:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b4gqOMlbs92RCL0Ysa0hqvx+eg7bHJri4dGP4mEDs80=;
        b=cJUhVLawvPYnZ9EBQKO2ZunzswCUf0WgRMNrdFYyJSDxGMvjCa/g8En72Mpfq9/NLJ
         43+7hdQs2dYfAoY6UVpPNe6B88XhsXdl3+MfRmv63MbgMv9Db3CnfYdot3NItEt7QIgr
         jlRUbWsGVsFJqWySvdK7RsvxeCobwKrsOp79o+meRag767brfRUjYSGLPFA+Xk7JE2tv
         4n8ZutrzXMjR4NPqoVVUSfBYaH/Iz7zHIgKQmKw+W0u7GO4HkuMDqTCwc7OlccFljX39
         Ju2S0+fy9trH/lcATN8gznvLBX4eDkt4CmMU3taHDqxrgP9jmXJx0VmfC9p2FdJYSip6
         9l0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4gqOMlbs92RCL0Ysa0hqvx+eg7bHJri4dGP4mEDs80=;
        b=uw0vYZqwBTV2Tj+d44ia8qlOlxuXts1px/SG1jxHwgMfVoqlzsNa8ikk4W8Epx7QLW
         q+2jEk6050yQ3da8wsUWi/0/UVpWK+np9Qjy7blMUtanDRbuoqhBedKIACKNkzOwcL8B
         mS2rpII3jlwW+6GeYfu6o7N5SRtSNjcPHv8YJd6vngee20yfmIAGpE9W0bSiX2cLWeGz
         LZCT2hhIH0KPfU/id6WWhL0jzizguc/Y59f+7rOGRAcDBCrWDTblFatQsovqPQ7RuDO/
         bPrbWpc4fWuj7hJpDnqRrl3YPZDXfn9QKvusJ+/nPURSZjWfH7mAgBECajH3sW6DecIm
         PCnQ==
X-Gm-Message-State: ACrzQf3ZTRKBY7jKZNZahwaJgsHt1jY64pISW1nD0J/OU8a1xyJIZK9Z
        Dh66DDmX2uKdXQ4yjQxwgk4=
X-Google-Smtp-Source: AMsMyM7Lv6eqNKd0zzmTCV0Vwpt7bAhdY4jQSyF4I6uECSsPSAvnrM2zb69LyIb7/S7cGh1DCosPfw==
X-Received: by 2002:a17:907:3d9f:b0:787:8706:6885 with SMTP id he31-20020a1709073d9f00b0078787066885mr21163698ejc.280.1665551090072;
        Tue, 11 Oct 2022 22:04:50 -0700 (PDT)
Received: from localhost.lan ([194.187.74.233])
        by smtp.gmail.com with ESMTPSA id e11-20020a170906314b00b0073ddb2eff27sm573916eje.167.2022.10.11.22.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 22:04:49 -0700 (PDT)
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
Subject: [PATCH V2 1/2] dt-bindings: mtd: partitions: add TP-Link SafeLoader layout
Date:   Wed, 12 Oct 2022 07:04:41 +0200
Message-Id: <20221012050442.6815-1-zajec5@gmail.com>
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

