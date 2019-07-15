Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B800688B3
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 14:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730103AbfGOMLu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 08:11:50 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25438 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbfGOMLu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jul 2019 08:11:50 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563192644; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=Ck+JhCc78eCB4MBJ+hTfzanl5NcJEMiRB+W97lDzy9OAvo+uryqO7ONpYzACPB2qqVVdiiovcxygmdv9sllVvjwSJOMZehgkbNC2eqQYTHUfOgD1aW1N81MdCfdyPYiMWgsAswPnMlkt7vY2U2+0+msJy6Sgv1QidcgqHdnDSBc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563192644; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=22YCFOhKRTFrYOiFhr4G7iUUrDYesJcWcxMzpuivFoY=; 
        b=iDum9LOhXe6OAiZ0fpKVJ7LRPr5CqhkvlBRuJfTOL+9WDEvpktf8MF9UwBuAzkg0pXz5SI9OmXfEMIAUvm8cHvq55tSMr5OP6PWh9Rqrx/E1JJ82bBtRAWHFyV8Wzot+Xkl0ko1XWWHC/qKQfWFdKI+3PkxK1JwcdhmgouyCF5Q=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=v6dujRRWpvMI4myZA23glfA0GfxhcZSmvbMHEVJODyzLtS6CJyZhpQDnUsp4DO//0WN7Sc40X71W
    6PQjh9n5N2CWvaxLcbwu4kJZQJ0eb2OKzWEfzRMP1tKhkSDt9ryh  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563192644;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=947;
        bh=22YCFOhKRTFrYOiFhr4G7iUUrDYesJcWcxMzpuivFoY=;
        b=UwngKfyQWGRs874nCzw4ljqh6Z0qfc8RcUVg+vIwovYY3YqtThQOg5FBn1MiIljU
        SKXg3ofAmZV1yJXoG9CP9lSfnceUuRMtq/6AhBxMAX5eq9MEvtKZoFXg/6mWakpX0AD
        GtR7YNYUA6iYQPPtpHhGuhvrZYXqQsWr3IKvkw1c=
Received: from zhouyanjie-virtual-machine.localdomain (117.136.70.36 [117.136.70.36]) by mx.zohomail.com
        with SMTPS id 1563192644211466.98840686216624; Mon, 15 Jul 2019 05:10:44 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul.burton@mips.com, tglx@linutronix.de, robh+dt@kernel.org,
        mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
Subject: [PATCH v3 7/8] dt-bindings: interrupt-controller: Add X1500 bindings.
Date:   Mon, 15 Jul 2019 20:09:54 +0800
Message-Id: <1563192595-53546-8-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the interrupt-controller bindings for the
X1500 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
index 4f91bda..a96e120 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
@@ -12,6 +12,7 @@ Required properties:
     ingenic,jz4780-intc
     ingenic,x1000-intc
     ingenic,x1000e-intc
+    ingenic,x1500-intc
 - reg : Specifies base physical address and size of the registers.
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Specifies the number of cells needed to encode an
-- 
2.7.4


