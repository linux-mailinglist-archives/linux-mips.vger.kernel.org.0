Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2675205A6D
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 20:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733045AbgFWSYr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 14:24:47 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:51528 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732549AbgFWSYr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Jun 2020 14:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1592936683; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=Jo5zwpfouXsdEQg4LUVTZQR1ueuE0Fx3LvAue7M9EQ8=;
        b=mqZMYW9VYrZe19z9Q+dxIxDGXqv6ddNt52vw1OzNL0gGmFCB08lL40OA3WN/MvKKbNCECI
        qxGVz1hJX423gZJEdQOFoWmEN+IJGQ4KyaPT0yKU+9RuXeauS/a1J74UL1G386WqR8vYQN
        +vyVWHGvm/OhQrutUvzOrdQAzc+xYUM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/7] dt-bindings: vendor-prefixes: Add YLM
Date:   Tue, 23 Jun 2020 20:24:26 +0200
Message-Id: <20200623182432.187843-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Shenzhen Yangliming Electronic Technology Co., Ltd., abbreviated YLM or
YLMChina, and known as Anbernic in the rest of the world, is a Chinese
manufacturer of handheld game consoles, some of which are known to be
running Linux.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9aeab66be85f..d24ecc7614fa 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1167,6 +1167,8 @@ patternProperties:
     description: Shenzhen Xunlong Software CO.,Limited
   "^xylon,.*":
     description: Xylon
+  "^ylm,.*":
+    description: Shenzhen Yangliming Electronic Technology Co., Ltd.
   "^yna,.*":
     description: YSH & ATIL
   "^yones-toptech,.*":
-- 
2.27.0

