Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53C80138565
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 09:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732370AbgALIPw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 03:15:52 -0500
Received: from forward104j.mail.yandex.net ([5.45.198.247]:47744 "EHLO
        forward104j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732367AbgALIPw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 03:15:52 -0500
Received: from forward101q.mail.yandex.net (forward101q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb98])
        by forward104j.mail.yandex.net (Yandex) with ESMTP id 6B99E4A0BDD;
        Sun, 12 Jan 2020 11:15:49 +0300 (MSK)
Received: from mxback7q.mail.yandex.net (mxback7q.mail.yandex.net [IPv6:2a02:6b8:c0e:41:0:640:cbbf:d618])
        by forward101q.mail.yandex.net (Yandex) with ESMTP id 63D0FCF40009;
        Sun, 12 Jan 2020 11:15:49 +0300 (MSK)
Received: from vla1-ee05250d997a.qloud-c.yandex.net (vla1-ee05250d997a.qloud-c.yandex.net [2a02:6b8:c0d:3495:0:640:ee05:250d])
        by mxback7q.mail.yandex.net (mxback/Yandex) with ESMTP id l0SQQ7Tt4H-FnSSPSmi;
        Sun, 12 Jan 2020 11:15:49 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578816949;
        bh=QIhdMgkkaehQmJ687iqyXti//3kLmXOE11eL6TIK7AQ=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=IxgJmRr+QopwRG702kawUvX1jf9hWuq4wEEpXZzJ55cq1WaVPwhjv/HKcxriCqJrP
         YXB5zHGEMhjnFGJ6tyAQldJCdBy7aQGE8PPNJtwM36ep7msn/FBjL21riRig+edWc+
         IenDLdqlONv0aUqDH64rBTC658julr1zS0xyr6eU=
Authentication-Results: mxback7q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla1-ee05250d997a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 3jM5RHRYtF-FgV4VGmv;
        Sun, 12 Jan 2020 11:15:47 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 08/10] dt-bindings: mips: Add loongson boards
Date:   Sun, 12 Jan 2020 16:14:14 +0800
Message-Id: <20200112081416.722218-9-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
References: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Prepare for later dts.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../bindings/mips/loongson/devices.yaml       | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml

diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
new file mode 100644
index 000000000000..3c7c59a29c1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
@@ -0,0 +1,29 @@
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
+  Note that generic device is used for built-in dtbs and will be
+  patched during boot on firmware without OF support.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Generic Loongson3 4Core + RS780E
+        items:
+          - const: loongson,loongson3-4core-780e
+
+      - description: Generic Loongson3 8Core + RS780E
+        items:
+          - const: loongson,loongson3-8core-780e
+...
-- 
2.24.1

