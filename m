Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D46D108D37
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2019 12:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfKYLtc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Nov 2019 06:49:32 -0500
Received: from sender4-pp-o97.zoho.com ([136.143.188.97]:25706 "EHLO
        sender4-pp-o97.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbfKYLtc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Nov 2019 06:49:32 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574682315; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=UblOdukF+Vekc/zvqCG232ULawK56JaGfrti0ujHJ+EA4/SiJux6a5zZUdCIYRwRK7qA9h9o8NUCEkEY6GIkLqFcCLEurdbLmjwS9SR4dNJoVTwSQdPy+WrKLPu/3W3X2wIG/Bt5V3Po2PgyDmK4tteb4LWxmHBLUABrhNJXwIU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574682315; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=6zlg2ilNphupc3b+tUwm+vRll6vDv9KRf4Bp0pR2ce0=; 
        b=AxcZ0272L07yF04CrJBE0FtFA3cvBSeA1EDT9rCkoHbkRAb3ATbjMPO/ZvJf8sLKx+rimHb2p3ZEIkCZh+JaSg3KzOReVWlZGPXYp6J93FBuZNtOyfZa1Z6Cf7j7o7FWnJ3pK+HHAon45VR0Sm7LcN3kQ8xxL9D1vw+32bpjZXs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=fEvLIOQAITb+fs9u2TkPudZKya9atvbbqDjsahA8pkWJlQYS8/WhMYu14kJMagX8zfhanxm+KlLS
    C+GGjG7IwCWGcv6opYs+QJzm5LzsZSUKNzwfYd/BkUTRR2wpRFys  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574682315;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=6zlg2ilNphupc3b+tUwm+vRll6vDv9KRf4Bp0pR2ce0=;
        b=DjOSonDx7i1FY214nJQmRvTdrNfBe+t8I1fkoabUiDPi18+0bIcjSSzpwCkW6YJU
        s83nCsHm9fVDQTx8VFN5GuJzQVhnJFmTka7kHdAlKTupFYdQsWXHB8RmlnRk2qK7Qf5
        v2SlOb1IXWrPklH+uzwJEEAIpnVsCvE0DabZ8MOU=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.185 [171.221.113.185]) by mx.zohomail.com
        with SMTPS id 1574682314258407.32038693633206; Mon, 25 Nov 2019 03:45:14 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mark.rutland@arm.com, syq@debian.org
Subject: [PATCH v5 3/4] dt-bindings: pinctrl: Add bindings for Ingenic X1830.
Date:   Mon, 25 Nov 2019 19:44:42 +0800
Message-Id: <1574682283-87655-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574682283-87655-1-git-send-email-zhouyanjie@zoho.com>
References: <1574682283-87655-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the pinctrl bindings for the X1830 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    No change.
    
    v3->v4:
    No change.
    
    v4->v5:
    No change.

 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
index 0014d98..d9b2100 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
@@ -10,9 +10,9 @@ GPIO port configuration registers and it is typical to refer to pins using the
 naming scheme "PxN" where x is a character identifying the GPIO port with
 which the pin is associated and N is an integer from 0 to 31 identifying the
 pin within that GPIO port. For example PA0 is the first pin in GPIO port A, and
-PB31 is the last pin in GPIO port B. The jz4740 and the x1000 contains 4 GPIO
-ports, PA to PD, for a total of 128 pins. The jz4760, the jz4770 and the jz4780
-contains 6 GPIO ports, PA to PF, for a total of 192 pins.
+PB31 is the last pin in GPIO port B. The jz4740, the x1000 and the x1830
+contains 4 GPIO ports, PA to PD, for a total of 128 pins. The jz4760, the
+jz4770 and the jz4780 contains 6 GPIO ports, PA to PF, for a total of 192 pins.
 
 
 Required properties:
@@ -28,6 +28,7 @@ Required properties:
     - "ingenic,x1000-pinctrl"
     - "ingenic,x1000e-pinctrl"
     - "ingenic,x1500-pinctrl"
+    - "ingenic,x1830-pinctrl"
  - reg: Address range of the pinctrl registers.
 
 
@@ -40,6 +41,7 @@ Required properties for sub-nodes (GPIO chips):
     - "ingenic,jz4770-gpio"
     - "ingenic,jz4780-gpio"
     - "ingenic,x1000-gpio"
+    - "ingenic,x1830-gpio"
  - reg: The GPIO bank number.
  - interrupt-controller: Marks the device node as an interrupt controller.
  - interrupts: Interrupt specifier for the controllers interrupt.
-- 
2.7.4


