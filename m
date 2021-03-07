Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF87330447
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 20:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbhCGT3I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 14:29:08 -0500
Received: from aposti.net ([89.234.176.197]:36808 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229754AbhCGT2x (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 14:28:53 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] dt-bindings: panel/kingdisplay,kd035g6-54nt: Remove spi-cs-high
Date:   Sun,  7 Mar 2021 19:28:29 +0000
Message-Id: <20210307192830.208245-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The NT39016 panel is a fun beast, even though the documentation states
that the CS line is active-low, it will work just fine if the CS line is
configured as active-high, but it won't work if the CS line is forced
low or forced high.

Since it did actually work with the spi-cs-high property, this is not a
bugfix, but we should nonetheless remove that property from the example
to match the documentation.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/display/panel/kingdisplay,kd035g6-54nt.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
index 6960036975fa..c45c92a3d41f 100644
--- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
@@ -47,7 +47,6 @@ examples:
 
             spi-max-frequency = <3125000>;
             spi-3wire;
-            spi-cs-high;
 
             reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
 
-- 
2.30.1

