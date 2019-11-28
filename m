Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6C310C6E3
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 11:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfK1KlL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 05:41:11 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25827 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK1KlL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 05:41:11 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574937513; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=DH73icHtHhi/8UC1QveAvMl7JjcKLskVhITM9/GAKzBly5xOvXE5cOTSDyLHjF+bsmOFmFp/KizduYlScQOkni8oduuZdw6wYW5u9PMnH/kcLo/pP6f/fr9l3LZOvz7J2ONHBTmVoRmfVrpwJVqHWF/5JFwFsmKoMS18wLS8jSM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574937513; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=SqOYudplFWvZ/5ZXnq2JTAVlpS00RitY+5jG/MVlgCc=; 
        b=YoRaq0cuGpx1e/HvsAU3uRqaaxli5ybSkaOm87ZcKL67bnKjwsK4q7qOhV/paN5n8nsPS+KnrXM1lOlyTKYxPMiWir5/I8OgCxwBDAZxSpB6ojs382tK3Zd86nIGZ0gGDEafijn2rIszPTpdBpaSwkmIC8wxQ1DxlRtJSjpHqao=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=ej4OTkP91O+2WkyB3TN9/R7iiccDI+rpjAgSk4u84ez3X1qQXiRInNa12Fc2fB0v3zhCSXH3fCBl
    QytRj2SCiWj7Zo8MYgaOfccslWWKrs7R73u4uYnNTfC0ABvrKW1T  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574937513;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=SqOYudplFWvZ/5ZXnq2JTAVlpS00RitY+5jG/MVlgCc=;
        b=YkzQ68NAy9ziDBvlAbx1ADsgO6ZlW3UAshdecOr9Q9/EAK44LvYfCHqdZAnPW4Y6
        Fp8+T8tKdLICqeIUX4HzjSaMYJetY1jggh4m6stETA0KYbsP9Pu8LD6DBglpUFZETvu
        5x7mQGEim998i0sn959kw56aCrt/H5ulNoSSjy0w=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1574937511205992.4444873585879; Thu, 28 Nov 2019 02:38:31 -0800 (PST)
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
        zhenwenjin@gmail.com
Subject: [PATCH v5 03/10] dt-bindings: MIPS: Add Ingenic XBurst based boards.
Date:   Thu, 28 Nov 2019 18:37:40 +0800
Message-Id: <1574937467-101907-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
References: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
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
    
    v2->v3:
    No change.
    
    v3->v4:
    Adjust the description to make it more reasonable.
    
    v4->v5:
    Adjust item naming to prevent conflicts with
    subsequent "CU Geo" boards.

 .../devicetree/bindings/mips/ingenic/devices.yaml  | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/devices.yaml

diff --git a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
new file mode 100644
index 00000000..6bba181
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
+      - description: YSH & ATIL General Board CU Neo
+        items:
+          - const: yna,cu1000-neo
+...
-- 
2.7.4


