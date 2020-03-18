Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 940D91895C8
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2020 07:26:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbgCRG02 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Mar 2020 02:26:28 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17861 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726553AbgCRG01 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Mar 2020 02:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1584512690;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=E/CDBNU+aewp384Is9lCotWMZ2d44U0Yi1EUlnLXSc8=;
        b=NDHL1DuRbVjKdU7/gqwRedY9i5x8fl/cUHXoFZVDQCwlCghVoyqWJM9Z7rtzm/D8
        VwoGLxd5vbrDNClsZps/0K5Ftp2hi3P2MuG1ANZG53k0aip+jNifUmdmkcPgo5Q6WJA
        t84bnAS3ijCYS2RVHHbh0KD8uyHBamF+lvnZupws=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 158451268925219.555381759680813; Wed, 18 Mar 2020 14:24:49 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200318062102.8145-9-jiaxun.yang@flygoat.com>
Subject: [PATCH v5 08/11] dt-bindings: mips: Add loongson boards
Date:   Wed, 18 Mar 2020 14:20:36 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200318062102.8145-1-jiaxun.yang@flygoat.com>
References: <20200318062102.8145-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Prepare for later dts.

Co-developed-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

--
v4-v5:
=09Remove unnecessary kernel details.
---
 .../bindings/mips/loongson/devices.yaml       | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices=
.yaml

diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b=
/Documentation/devicetree/bindings/mips/loongson/devices.yaml
new file mode 100644
index 000000000000..b1f811e251f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/loongson/devices.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson based Platforms Device Tree Bindings
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+description: |
+  Devices with a Loongson CPU shall have the following properties.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Generic Loongson3 4Core + RS780E
+        items:
+          - const: loongson,loongson3-4core-rs780e
+
+      - description: Generic Loongson3 8Core + RS780E
+        items:
+          - const: loongson,loongson3-8core-rs780e
+...
--=20
2.26.0.rc2


