Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9D4205A75
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 20:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733125AbgFWSZC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 14:25:02 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:51872 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732549AbgFWSZB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Jun 2020 14:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1592936685; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=abmRLAwiNoQr6F48QZbrxbR8G+uP7eYeNw6ktpMn+xE=;
        b=UNH02mzoo311dDHpn5/HLq1d4bSdF2wc7xA6ISYIVMgv3nEqroY9O75VlmYM5IhpPbjT+j
        z1k+0kJZWglC+RT3ausIllPlj7dPFmksk5NMq7fCZGO8+xK/7Ze78FUmcTeTNSl7/1XUQL
        Ur2kQUtbBISlv2GtBJO4By+aQmwR+tk=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/7] dt-bindings: timer/ingenic,tcu: Add compatible strings for JZ4725B SoC
Date:   Tue, 23 Jun 2020 20:24:28 +0200
Message-Id: <20200623182432.187843-3-paul@crapouillou.net>
In-Reply-To: <20200623182432.187843-1-paul@crapouillou.net>
References: <20200623182432.187843-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add compatible strings for the PWM and watchdog IPs on the Ingenic
JZ4725B SoC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 Documentation/devicetree/bindings/timer/ingenic,tcu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/ingenic,tcu.yaml b/Documentation/devicetree/bindings/timer/ingenic,tcu.yaml
index 03893e6a2f57..371fb02a4351 100644
--- a/Documentation/devicetree/bindings/timer/ingenic,tcu.yaml
+++ b/Documentation/devicetree/bindings/timer/ingenic,tcu.yaml
@@ -116,7 +116,9 @@ patternProperties:
             - ingenic,jz4740-watchdog
             - ingenic,jz4780-watchdog
           - items:
-            - const: ingenic,jz4770-watchdog
+            - enum:
+              - ingenic,jz4770-watchdog
+              - ingenic,jz4725b-watchdog
             - const: ingenic,jz4740-watchdog
 
       reg:
@@ -142,6 +144,7 @@ patternProperties:
         oneOf:
           - enum:
             - ingenic,jz4740-pwm
+            - ingenic,jz4725b-pwm
           - items:
             - enum:
               - ingenic,jz4770-pwm
-- 
2.27.0

