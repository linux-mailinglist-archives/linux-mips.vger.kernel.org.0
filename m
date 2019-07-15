Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C540688AB
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 14:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbfGOML2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 08:11:28 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25420 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbfGOML2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jul 2019 08:11:28 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563192636; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=IpHk2Zkc9x2NGWdb7wUR49e/vdmfGsgEr7JOMR7wkszhfut5RoXxhOSf+mFbNU1C4ecAXUsFA4ofWykoACfVj4F1n5yWaXKFjSJWWchLVOMJ7OmIuyWIqdBg4PDE+dsAANdfTDkUQI3WGNroVir72/oDwwVOL/78Xon3+u4ZXK4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563192636; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=FJzUoL5Iw3P1QMYzxG6/XhuZFWeCAzmeluzTKNcT4Ag=; 
        b=kI5n+GMtxACg7pYIOpGyI+Xnc5UWFiP+VcKuMAHNXQu225if2ms88ZP75/3CRO5aaYyPLWVGCAHmiv8xDp2sbdOh3uboNMSI2EjvTki+vK5d0Qm8IdLsVtYzlkEr7oEW3RwMJ8ySaeOGoRzb4twQRCRqti0PTi5c0paf2xzguuI=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=LXgxHE+FTMMFsj45IHCn3iE6VohVP4jiAyGTEO4PpQPO2eEESRDmydW73zf5GwTdBr+8wxxDYk63
    I+JZ5wNYVz4w7JGk4uDnsRC4QvTlMDvtbH6VxVYXvyW4keYlR9r6  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563192636;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=992;
        bh=FJzUoL5Iw3P1QMYzxG6/XhuZFWeCAzmeluzTKNcT4Ag=;
        b=tdLta2ey0vqPMLKAp/W3yaPSt8TsBBdhAfRlqJqrY3vuzDubjzdidmU/Gf3+tv7E
        uvDktPxBz7kAWAHMuVgV/sjngI4IKi4dPyXIsjfR5v9v/R273Qv60fxF5G2vkA3RaFZ
        6km7HJmGcQU+M+8X311UUNZAhnDVFDcZbRpv11gs=
Received: from zhouyanjie-virtual-machine.localdomain (117.136.70.36 [117.136.70.36]) by mx.zohomail.com
        with SMTPS id 1563192635206914.792968517065; Mon, 15 Jul 2019 05:10:35 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul.burton@mips.com, tglx@linutronix.de, robh+dt@kernel.org,
        mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
Subject: [PATCH v3 5/8] dt-bindings: interrupt-controller: Add X1000 and X1000E bindings.
Date:   Mon, 15 Jul 2019 20:09:52 +0800
Message-Id: <1563192595-53546-6-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the interrupt-controller bindings for the X1000 Soc and
the X1000E Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
index fa1ad54..4f91bda 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
@@ -10,6 +10,8 @@ Required properties:
     ingenic,jz4770-intc
     ingenic,jz4775-intc
     ingenic,jz4780-intc
+    ingenic,x1000-intc
+    ingenic,x1000e-intc
 - reg : Specifies base physical address and size of the registers.
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Specifies the number of cells needed to encode an
-- 
2.7.4


