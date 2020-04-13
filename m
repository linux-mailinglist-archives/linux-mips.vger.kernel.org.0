Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C442B1A68C3
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 17:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731013AbgDMP15 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 11:27:57 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:40342 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730200AbgDMP14 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 11:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1586791634; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bMEAd6S1IG8QI20sMOViP1ddtpNITkwlQQgKMtzLIpc=;
        b=ctXzhIRACbf3D0BeUFmAu5iQrjdMOj0mIPgCujAodL0fwc4Xlt/S9YPmSdvupodKpxK1ec
        IVKEO5zYsAZblQwrSAEW3SGGfCKw8xNd9qkP10k5esmjQp2ND7KguZcnzQW7u1AnEoY1iY
        FKIcv8VNTcb3fn8fpaCspWFG2rNekLQ=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 06/13] MIPS: ingenic: DTS: Fix invalid value in #dma-cells
Date:   Mon, 13 Apr 2020 17:26:26 +0200
Message-Id: <20200413152633.198301-6-paul@crapouillou.net>
In-Reply-To: <20200413152633.198301-1-paul@crapouillou.net>
References: <20200413152633.198301-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The driver requires two cells and not just one.

Since these nodes are both disabled as no hardware currently use them,
this fix does not really requires a Fixes: tag.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/jz4770.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index 0bfb9edff3d0..3805816cea2e 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -222,7 +222,7 @@ dmac0: dma-controller@13420000 {
 		reg = <0x13420000 0xC0
 		       0x13420300 0x20>;
 
-		#dma-cells = <1>;
+		#dma-cells = <2>;
 
 		clocks = <&cgu JZ4770_CLK_DMA>;
 		interrupt-parent = <&intc>;
@@ -237,7 +237,7 @@ dmac1: dma-controller@13420100 {
 		reg = <0x13420100 0xC0
 		       0x13420400 0x20>;
 
-		#dma-cells = <1>;
+		#dma-cells = <2>;
 
 		clocks = <&cgu JZ4770_CLK_DMA>;
 		interrupt-parent = <&intc>;
-- 
2.25.1

