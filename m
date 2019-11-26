Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D29B910A30B
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2019 18:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbfKZRJE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 12:09:04 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25820 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbfKZRJE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 12:09:04 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574788036; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=QK7pbJO1Ne/E4pwdjS9AExdTRN2pTWfSdKXCPItt5C2avHPzxLa9yUI7t0S2hhhOTS8uXVqNqHIvl5KUqRJ1hcqjN/bTZd3hXNmXuM8MolgCvKJOXxkO2rO6RKQphzMbi9wlXZvlPFLO0HyqXIhtYID8iMw/DR+7Hs/2WZOOYNY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574788036; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=+bwMuYTaEcOpuJOWhY2SWQ2bbePhtqOfnXH4gaS8oyk=; 
        b=ihKb4k/nR3iDkGLIOinwL8AxWKqUz8G4iGeu8I2xEqXqQS4tq97Z0wX4wRpnP3d1Nwkzo+iRs64zGXuFbQ9yrilu69CQvTo58jl9nWjDJw/AjpRmPHxjerQq6hwNbE4GegpgMi/IW8bygWy4yqriFvrYFuivvMGQEvyMZGqChbg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=dCTEbCaHfzZXUq+xbgv9hW9vIIc25xUrSBKlKAHKc0PasNi3ntbHg7in6/XYt2b9USILYnzZ7bB6
    bLMztT4NcNiP/csCNaFmFH6Tb93iSTGHjsEv8CqJeyqmGhS5Pw+9  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574788036;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=+bwMuYTaEcOpuJOWhY2SWQ2bbePhtqOfnXH4gaS8oyk=;
        b=o1ZuI51iyZkWoqdlGnMRjIyOESjCsP+1ZYfVXXo0nl1Q8K2t8akGudmupqlADsEt
        tdRnSkxyCS7ex8ImrlWAJGOX9br/oDLwRrTmjuJ3sGfAJgYx5kFblEAvTi3BW+EeccK
        71NhsQutCdRlc850GlotkfFpTmjXzGfOgjlbZPHM=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.112.214 [171.221.112.214]) by mx.zohomail.com
        with SMTPS id 1574788035230260.8063431722685; Tue, 26 Nov 2019 09:07:15 -0800 (PST)
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
Subject: [PATCH v4 3/6] dt-bindings: MIPS: Add Ingenic XBurst based boards.
Date:   Wed, 27 Nov 2019 01:06:11 +0800
Message-Id: <1574787974-58040-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574787974-58040-1-git-send-email-zhouyanjie@zoho.com>
References: <1574787974-58040-1-git-send-email-zhouyanjie@zoho.com>
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

 .../devicetree/bindings/mips/ingenic/devices.yaml  | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/devices.yaml

diff --git a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
new file mode 100644
index 00000000..a6f5056
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
+          - const: yna,cu1000
+...
-- 
2.7.4


