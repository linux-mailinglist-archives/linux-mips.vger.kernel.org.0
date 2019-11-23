Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F140A107C80
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2019 03:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbfKWChD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 21:37:03 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25837 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfKWChD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 21:37:03 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574476592; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=MAXN1P8wIeS/M7c38yYoZNBR2tjU0qe0f4CiRJjmBc3QFq7B88rGTedmnmKqgNpjpR/Xjbw+7Mm9GdpHtdz0cXU933RYCVSaIFfXlf+nKiwzeegMhMqPgnh25CiQKQBm77SrWQi1yLmVOhu8vaFNhDZiYIvlo4DloNZT9FblwD8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574476592; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=qtJ6lnSWIWAfL+5O9V+QUv9o2a/qG10qRCCYquNB/C8=; 
        b=azT7HF0Fu6pWmyXaoVhA7VXBqUPOAHy3buoKwIbzF2kX/2/XGf1tRTFBCEVvHZVSY+1DLr1QOw9SU7himDGQJUHX4pmXoc9Cwb9iZxy7o8EHzpDz17uyQG4DWZI602I59naGNcvyfUwkOmOjTY2LhjS/e4DFPKJmXakI3aA3KZk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=MBlDHfUmrkcZYUTwtYdOaGayWoo+Xo5XObiBTOx2++BLNS6C9lxfwhm7xYKrZMlFuNvN0Ek3vURe
    fWuN0WkKHD6BS2iCgsnR2OBZqr4lqJQP83S3VIpY11/3SnUnfIOG  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574476592;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=qtJ6lnSWIWAfL+5O9V+QUv9o2a/qG10qRCCYquNB/C8=;
        b=I75MkvoDMk0CjfYOIfBM9pIMqtUXJBmKUbF+hX3KpjBIMHhfHZMiXCVVYiZ1RABd
        SnF1vedBhEI2nBoXPwaFCgbl6iUfGtKgv7MrEoAopGN+BLKseczGaVu84jgiM7coB+j
        4PzyjTmzSzWChjP1g2NUsEI1RadL/9hyACMzjt78=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.48.217 [182.148.48.217]) by mx.zohomail.com
        with SMTPS id 1574476592535859.1133491862032; Fri, 22 Nov 2019 18:36:32 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: [PATCH v2 3/4] dt-bindings: MIPS: Add Ingenic XBurst based boards.
Date:   Sat, 23 Nov 2019 10:32:23 +0800
Message-Id: <1574476344-62631-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574476344-62631-1-git-send-email-zhouyanjie@zoho.com>
References: <1574476344-62631-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add Ingenic XBurst based boards, prepare for later dts.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v1->v2:
    No change.

 .../devicetree/bindings/mips/ingenic/devices.yaml  | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/devices.yaml

diff --git a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
new file mode 100644
index 00000000..8bb4b5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/ingenic/devices.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic XBurst based Platforms Device Tree Bindings
+
+maintainers:
+  - Zhou Yanjie <zhouyanjie@zoho.com>
+description: |
+  Devices with a Ingenic XBurst CPU shall have the following properties.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Qi Hardware Ben NanoNote
+        items:
+          - const: qi,lb60
+
+      - description: Game Consoles Worldwide GCW Zero
+        items:
+          - const: gcw,zero
+
+      - description: MIPS Creator CI20
+        items:
+          - const: img,ci20
+
+      - description: YSH & ATIL General Module CU Neo
+        items:
+          - const: yna,cu1000
+...
-- 
2.7.4


