Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0181767DEE
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2019 09:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbfGNHKk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jul 2019 03:10:40 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25546 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfGNHKk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jul 2019 03:10:40 -0400
X-Greylist: delayed 753 seconds by postgrey-1.27 at vger.kernel.org; Sun, 14 Jul 2019 03:10:39 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1563087330; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=gHfazKbY3bxTbzBwtnkG5zaen4Usc5jwgYdOlSbeTMLnZfRYWmYfozIfXmCcSrmYWXP+qEtCAFiD/EIKjyG2Azm+fn6Kxwi+M41qimgWgX7UdaEz3mP83TN9hhSbDDvWyspGUIENx2HNYcoq2RGeZSanf1tuJj1UWa9hhHetdOM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563087330; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=hfnVfnh/vca8VDGXpOWZyOyDkom6iR+mQuHJWBcZOjY=; 
        b=mJw93LBVvCy8P2JCcQjyhO11ml1/SUuRdBwrz7fEbByu80HGHxGCOxQLZA2NOpOZf7TRKA4+oiJsS1C1yzcm8cFSC/gcDaY9rt3IkgCKzZjFBftPiZsjb0VOAHp8Gbw2nYgWKfqOYfkaCqDIrtJGUPlaTxnp38p9/Sv285irkvQ=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=lvp+l4RPYUJv2MqMaz/yM9GofQyG7YNGo15EHJCAN5BEoG05gnwzn2lZl0yVocIHM53h84b2SzC3
    +6VNjJzcvpmjXBTy/VFrMm3JdKVrJlHrzuPqQ+GL5pVWN0jx8pns  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563087330;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1709; bh=hfnVfnh/vca8VDGXpOWZyOyDkom6iR+mQuHJWBcZOjY=;
        b=hC4i2tS9Pvopxxl1QUFjQwgEhXRIuxk/bFv4K9+zjtzz4VPFEoc0j7suK6/4bXXB
        7+gx1Fi5HpcYX3bd3j4Rx5gsENOpQ3OXACJMlqg5uOT7Xq5QCmnCa6HRMvxIfCQVX83
        wWvgtcpGMV6k6MRNyQbsP9RjsUP8wwth21vtOLdc=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1563087330429598.9787410686005; Sat, 13 Jul 2019 23:55:30 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, paul.burton@mips.com,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH 1/6] dt-bindings: pinctrl: Add JZ4760 and JZ4760B bindings.
Date:   Sun, 14 Jul 2019 11:53:51 +0800
Message-Id: <1563076436-5338-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
References: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the pinctrl bindings for the JZ4760 Soc and
the JZ4760B Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
index af20b0e..a80ff68 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
@@ -11,8 +11,8 @@ naming scheme "PxN" where x is a character identifying the GPIO port with
 which the pin is associated and N is an integer from 0 to 31 identifying the
 pin within that GPIO port. For example PA0 is the first pin in GPIO port A, and
 PB31 is the last pin in GPIO port B. The jz4740 contains 4 GPIO ports, PA to
-PD, for a total of 128 pins. The jz4780 contains 6 GPIO ports, PA to PF, for a
-total of 192 pins.
+PD, for a total of 128 pins. The jz4760, the jz4770 and the jz4780 contains 6
+GPIO ports, PA to PF, for a total of 192 pins.
 
 
 Required properties:
@@ -21,6 +21,8 @@ Required properties:
  - compatible: One of:
     - "ingenic,jz4740-pinctrl"
     - "ingenic,jz4725b-pinctrl"
+    - "ingenic,jz4760-pinctrl"
+    - "ingenic,jz4760b-pinctrl"
     - "ingenic,jz4770-pinctrl"
     - "ingenic,jz4780-pinctrl"
  - reg: Address range of the pinctrl registers.
@@ -31,6 +33,7 @@ Required properties for sub-nodes (GPIO chips):
 
  - compatible: Must contain one of:
     - "ingenic,jz4740-gpio"
+    - "ingenic,jz4760-gpio"
     - "ingenic,jz4770-gpio"
     - "ingenic,jz4780-gpio"
  - reg: The GPIO bank number.
-- 
2.7.4


