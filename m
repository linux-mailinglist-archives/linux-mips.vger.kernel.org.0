Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D8A2A940A
	for <lists+linux-mips@lfdr.de>; Fri,  6 Nov 2020 11:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgKFKVd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Nov 2020 05:21:33 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:39002 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgKFKVc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Nov 2020 05:21:32 -0500
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 4A52F3A1802
        for <linux-mips@vger.kernel.org>; Fri,  6 Nov 2020 10:09:20 +0000 (UTC)
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id AF75F1BF20E;
        Fri,  6 Nov 2020 10:08:57 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <Steen.Hegelund@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 2/9] dt-bindings: mips: Add Serval and Jaguar2
Date:   Fri,  6 Nov 2020 11:08:42 +0100
Message-Id: <20201106100849.969240-4-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106100849.969240-1-gregory.clement@bootlin.com>
References: <20201106100849.969240-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Serval and Jaguar2 SoCs belong to the same family as Ocelot and Luton.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 Documentation/devicetree/bindings/mips/mscc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mips/mscc.txt b/Documentation/devicetree/bindings/mips/mscc.txt
index cc93fd302553..bdbebb525393 100644
--- a/Documentation/devicetree/bindings/mips/mscc.txt
+++ b/Documentation/devicetree/bindings/mips/mscc.txt
@@ -4,7 +4,7 @@ Boards with a SoC of the Microsemi MIPS family shall have the following
 properties:
 
 Required properties:
-- compatible: "mscc,ocelot" or "mscc,luton"
+- compatible: "mscc,ocelot", "mscc,luton", "mscc,serval" or "mscc,jaguar2"
 
 
 * Other peripherals:
-- 
2.28.0

