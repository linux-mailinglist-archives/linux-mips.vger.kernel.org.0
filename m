Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C57439524C
	for <lists+linux-mips@lfdr.de>; Sun, 30 May 2021 19:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhE3RUo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 May 2021 13:20:44 -0400
Received: from aposti.net ([89.234.176.197]:37872 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229783AbhE3RUo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 13:20:44 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, list@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 7/8] MIPS: ingenic: gcw0: Set codec to cap-less mode for FM radio
Date:   Sun, 30 May 2021 18:18:01 +0100
Message-Id: <20210530171802.23649-8-paul@crapouillou.net>
In-Reply-To: <20210530171802.23649-1-paul@crapouillou.net>
References: <20210530171802.23649-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When using the FM radio, we must not have capacitors on the headphones
line, since it is used as the antenna.

The "FM Radio" widget is removed so that the cap-less mode can be
enabled dynamically through DAPM when the line input is used.
This widget was useless anyway.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/gcw0.dts | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts b/arch/mips/boot/dts/ingenic/gcw0.dts
index f4c04f2263ea..4abb0318416c 100644
--- a/arch/mips/boot/dts/ingenic/gcw0.dts
+++ b/arch/mips/boot/dts/ingenic/gcw0.dts
@@ -74,7 +74,6 @@ sound {
 		simple-audio-card,widgets =
 			"Speaker", "Speaker",
 			"Headphone", "Headphones",
-			"Line", "FM Radio",
 			"Microphone", "Built-in Mic";
 		simple-audio-card,routing =
 			"Headphones Amp INL", "LHPOUT",
@@ -85,8 +84,8 @@ sound {
 			"Speaker Amp INR", "ROUT",
 			"Speaker", "Speaker Amp OUTL",
 			"Speaker", "Speaker Amp OUTR",
-			"LLINEIN", "FM Radio",
-			"RLINEIN", "FM Radio",
+			"LLINEIN", "Cap-less",
+			"RLINEIN", "Cap-less",
 			"Built-in Mic", "MICBIAS",
 			"MIC1P", "Built-in Mic",
 			"MIC1N", "Built-in Mic";
-- 
2.30.2

