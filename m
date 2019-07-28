Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D281E780B4
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2019 19:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbfG1Rfc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Jul 2019 13:35:32 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25548 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfG1Rfb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Jul 2019 13:35:31 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564335299; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=UD16/ho51libGqtc8voTuj7bQJ0O9184gcQerzY6yWlGg8pPugfDDZFdcHPfZwge6v2Eg+i+16LACO6DIdIpLQzxwc0LU+y2S/LTcuzwcL3vB2QVBcabsGnbOoe22L1A3FbnzmEX6A9PdNUGQAhExXnRuAj4Qf9IJSN9cnCn7VY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564335299; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=S+ASoNlvKJWLTR3Wk8l1E1SjJMD3YOkWjRfxdE+eCO8=; 
        b=U1kB1m+gy5hmWdCZeJ5MON5F60ytCw0IbBFlSBhbn59h3gXoB/Hw1GCUd/YDNX318DEcFY/5m9M1JaW8175HnPnqIy9FwxkclaKmlQDDvdiSVQKjW0UcCUW5avCLOLkNkF9zWZ+8zu7mL9PhKpUYeSTb4oVtLfz4IudAeRkH2Xk=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=hxeyvEBIJpOuXIRs/Z6ryC8X07tlbnq7DZZ8XsZXQhDMedNXaXQ7x2ZurUX439RGEzo2WQPcqyG0
    f8Sdy2O9SQ+K3QSCKO6tC8jCxPDTLk7TcYFhFq2LdxBnnppSGt/0  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564335299;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1196; bh=S+ASoNlvKJWLTR3Wk8l1E1SjJMD3YOkWjRfxdE+eCO8=;
        b=kxdqj+oVt6J/Ox5t8xRSMu3LYhaGRyTOcNXCNtAG2GnHyjDIuFXwch5zuMwr92HV
        qUsFJAq/lwRcPYxistKTCt8gYYMrz8wHBDvBWm9j6dGWPlFAhtqIBwmnpR2NywNKtoN
        5EpONpvYkQZfCZTyaSrs+h6Uqgc9ZNcyTM705aBs=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 1564335296996986.6903597740522; Sun, 28 Jul 2019 10:34:56 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, tglx@linutronix.de,
        mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
Subject: [PATCH 3/4 v4] dt-bindings: interrupt-controller: Add new Ingenic Socs bindings.
Date:   Mon, 29 Jul 2019 01:34:32 +0800
Message-Id: <1564335273-22931-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the interrupt-controller bindings for the JZ4760/JZ4760B and
the X1000/X1000E and the X1500 Socs from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 .../devicetree/bindings/interrupt-controller/ingenic,intc.txt        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
index d4373d0..a96e120 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
@@ -5,9 +5,14 @@ Required properties:
 - compatible : should be "ingenic,<socname>-intc". Valid strings are:
     ingenic,jz4740-intc
     ingenic,jz4725b-intc
+    ingenic,jz4760-intc
+    ingenic,jz4760b-intc
     ingenic,jz4770-intc
     ingenic,jz4775-intc
     ingenic,jz4780-intc
+    ingenic,x1000-intc
+    ingenic,x1000e-intc
+    ingenic,x1500-intc
 - reg : Specifies base physical address and size of the registers.
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Specifies the number of cells needed to encode an
-- 
2.7.4


