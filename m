Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1447467DF6
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2019 09:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbfGNHLo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jul 2019 03:11:44 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25557 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfGNHLo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jul 2019 03:11:44 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563087394; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=BCpHCA5wo5z5nzUNp9SGvMTYO48B6vv4zvpjYqyywOgT7hGylaq9jF7hxblQqNhzSQ6BOeIXdUvUTNPeDpsr1QfRdmsMUuUT6kBb+PA2C50bOYavarQazvOqDwnqBTIpcCi7uqM8sEZszscwqdtNEiQygd50q5bVrLM1WiMDgwc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563087394; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=iiMvhbTTX9+gS3xxepq+r5OQUY/fuvtJIF+KG5TROMc=; 
        b=ARkBgkG6J1BFSpnEWFlYy9J+B93js6uataGq0jpsf203I2faFUibzRMv6Mo9+GNrDd6GeD6VTCWWnktjTpqiCSWULIsBfqb7h6NozYl8pe2r/CIi8w2NWKeo+T/xKLGemvW9yJmlp6S4QMFjuNx22dGlF0T47q4hk77g/rD+SZM=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=B2vSbOKrnXPfdkzQ+Px1psIq1t5rE70gUas1N5Q+O4fTODIcz1mhXV3MJUaoyorlLigQ5BzwTnWR
    arn1Aj7Tov5vm1PJ05X5zhAsnrURI0Ujl5Zu7lVRPiUF6uDQpBaH  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563087394;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2456; bh=iiMvhbTTX9+gS3xxepq+r5OQUY/fuvtJIF+KG5TROMc=;
        b=Uduj8TqhQK6hHx6iaYgEv39PWzWSCadM6MQG/MOb6ul3JTGA0v2XvUoTSj63RQET
        bbQ+WAnoILwCEWihMSrfNwl8F0JupnfnW0L04Cg/cGIxAq6HvX72Mx+qhgdloSEVD31
        EIEunJ478TrecmEeiy9RcGBWzD2nlEuxVlF/bVtQ=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1563087394688413.43827450011634; Sat, 13 Jul 2019 23:56:34 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, paul.burton@mips.com,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH 3/6] dt-bindings: pinctrl: Add X1000 and X1000E bindings.
Date:   Sun, 14 Jul 2019 11:53:53 +0800
Message-Id: <1563076436-5338-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
References: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the pinctrl bindings for the X1000 Soc and
the X1000E Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 .../devicetree/bindings/pinctrl/ingenic,pinctrl.txt         | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
index a80ff68..7e2ee46 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
@@ -1,18 +1,18 @@
-Ingenic jz47xx pin controller
+Ingenic XBurst pin controller
 
 Please refer to pinctrl-bindings.txt in this directory for details of the
 common pinctrl bindings used by client devices, including the meaning of the
 phrase "pin configuration node".
 
-For the jz47xx SoCs, pin control is tightly bound with GPIO ports. All pins may
+For the XBurst SoCs, pin control is tightly bound with GPIO ports. All pins may
 be used as GPIOs, multiplexed device functions are configured within the
 GPIO port configuration registers and it is typical to refer to pins using the
 naming scheme "PxN" where x is a character identifying the GPIO port with
 which the pin is associated and N is an integer from 0 to 31 identifying the
 pin within that GPIO port. For example PA0 is the first pin in GPIO port A, and
-PB31 is the last pin in GPIO port B. The jz4740 contains 4 GPIO ports, PA to
-PD, for a total of 128 pins. The jz4760, the jz4770 and the jz4780 contains 6
-GPIO ports, PA to PF, for a total of 192 pins.
+PB31 is the last pin in GPIO port B. The jz4740 and the x1000 contains 4 GPIO
+ports, PA to PD, for a total of 128 pins. The jz4760, the jz4770 and the jz4780
+contains 6 GPIO ports, PA to PF, for a total of 192 pins.
 
 
 Required properties:
@@ -25,6 +25,8 @@ Required properties:
     - "ingenic,jz4760b-pinctrl"
     - "ingenic,jz4770-pinctrl"
     - "ingenic,jz4780-pinctrl"
+    - "ingenic,x1000-pinctrl"
+    - "ingenic,x1000e-pinctrl"
  - reg: Address range of the pinctrl registers.
 
 
@@ -36,6 +38,7 @@ Required properties for sub-nodes (GPIO chips):
     - "ingenic,jz4760-gpio"
     - "ingenic,jz4770-gpio"
     - "ingenic,jz4780-gpio"
+    - "ingenic,x1000-gpio"
  - reg: The GPIO bank number.
  - interrupt-controller: Marks the device node as an interrupt controller.
  - interrupts: Interrupt specifier for the controllers interrupt.
-- 
2.7.4


