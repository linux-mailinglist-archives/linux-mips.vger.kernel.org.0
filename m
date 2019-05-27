Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA472B122
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2019 11:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbfE0JNp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 May 2019 05:13:45 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:44008 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726560AbfE0JNo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 May 2019 05:13:44 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id DB36BA1045;
        Mon, 27 May 2019 11:13:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id VLDhtMSpDxzh; Mon, 27 May 2019 11:13:26 +0200 (CEST)
From:   Stefan Roese <sr@denx.de>
To:     linux-mips@vger.kernel.org
Cc:     Paul Burton <paul.burton@mips.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>
Subject: [PATCH 7/8 v2] MIPS: ralink: mt7628a.dtsi: Add watchdog controller DT node
Date:   Mon, 27 May 2019 11:13:22 +0200
Message-Id: <20190527091323.4582-7-sr@denx.de>
In-Reply-To: <20190527091323.4582-1-sr@denx.de>
References: <20190527091323.4582-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch adds the watchdog controller description to the MT7628A dtsi
file.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: John Crispin <john@phrozen.org>
---
v2:
- Use Harvey's new email address (not at imgtec)
- Use correct linux-mips list address

 arch/mips/boot/dts/ralink/mt7628a.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index 0895ae62782a..2f601b9e6e52 100644
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -134,6 +134,19 @@
 			};
 		};
 
+		watchdog: watchdog@100 {
+			compatible = "mediatek,mt7621-wdt";
+			reg = <0x100 0x30>;
+
+			resets = <&resetc 8>;
+			reset-names = "wdt";
+
+			interrupt-parent = <&intc>;
+			interrupts = <24>;
+
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@200 {
 			compatible = "ralink,rt2880-intc";
 			reg = <0x200 0x100>;
-- 
2.21.0

