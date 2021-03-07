Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C97C0330340
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 18:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhCGRU4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 12:20:56 -0500
Received: from aposti.net ([89.234.176.197]:41420 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232629AbhCGRUY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 12:20:24 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] dt-bindings/irq: Add compatible string for the JZ4760B
Date:   Sun,  7 Mar 2021 17:20:13 +0000
Message-Id: <20210307172014.73481-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the ingenic,jz4760b-intc compatible string with a fallback to the
ingenic,jz4760-intc compatible string.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../devicetree/bindings/interrupt-controller/ingenic,intc.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
index 0a046be8d1cd..0358a7739c8e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
@@ -23,6 +23,7 @@ properties:
           - enum:
               - ingenic,jz4775-intc
               - ingenic,jz4770-intc
+              - ingenic,jz4760b-intc
           - const: ingenic,jz4760-intc
       - items:
           - const: ingenic,x1000-intc
-- 
2.30.1

