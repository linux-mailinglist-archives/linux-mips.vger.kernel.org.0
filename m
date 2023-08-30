Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D51D78DDE5
	for <lists+linux-mips@lfdr.de>; Wed, 30 Aug 2023 20:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244546AbjH3Sz5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Aug 2023 14:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245418AbjH3PMC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Aug 2023 11:12:02 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F187B1A2
        for <linux-mips@vger.kernel.org>; Wed, 30 Aug 2023 08:11:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
        by michel.telenet-ops.be with bizsmtp
        id frBy2A0043874jb06rByNY; Wed, 30 Aug 2023 17:11:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbMrC-0023oY-5R;
        Wed, 30 Aug 2023 17:11:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbMrO-005Lst-1O;
        Wed, 30 Aug 2023 17:11:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mips: dts: ingenic: Remove unneeded probe-type properties
Date:   Wed, 30 Aug 2023 17:11:55 +0200
Message-Id: <75d57f5e6dd25d5e8eff1260d289e905bb5cfad2.1693408196.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The "probe-type" property was only needed when used with the
(long obsolete) "direct-mapped" compatible value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/mips/boot/dts/ingenic/jz4725b.dtsi | 1 -
 arch/mips/boot/dts/ingenic/jz4770.dtsi  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4725b.dtsi b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
index acbbe8c4664c110e..c5c5a094c37d2e08 100644
--- a/arch/mips/boot/dts/ingenic/jz4725b.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
@@ -366,7 +366,6 @@ bch: ecc-controller@130d0000 {
 
 	rom: memory@1fc00000 {
 		compatible = "mtd-rom";
-		probe-type = "map_rom";
 		reg = <0x1fc00000 0x2000>;
 
 		bank-width = <4>;
diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index 9c0099919db7aba9..504e895e916e57bf 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -461,7 +461,6 @@ usb_otg: usb@13440000 {
 
 	rom: memory@1fc00000 {
 		compatible = "mtd-rom";
-		probe-type = "map_rom";
 		reg = <0x1fc00000 0x2000>;
 
 		bank-width = <4>;
-- 
2.34.1

