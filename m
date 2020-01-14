Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AAA213A34C
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2020 09:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbgANIzw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jan 2020 03:55:52 -0500
Received: from mx2a.mailbox.org ([80.241.60.219]:52291 "EHLO mx2a.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbgANIzv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Jan 2020 03:55:51 -0500
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id DC9F4A1C36;
        Tue, 14 Jan 2020 09:48:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id msqc2AWC1Acq; Tue, 14 Jan 2020 09:48:09 +0100 (CET)
From:   Stefan Roese <sr@denx.de>
To:     linux-mips@vger.kernel.org
Cc:     Reto Schneider <reto.schneider@husqvarnagroup.com>,
        Paul Burton <paul.burton@mips.com>,
        John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 2/3] MIPS: ralink: dts: gardena_smart_gateway_mt7688: Enable WMAC
Date:   Tue, 14 Jan 2020 09:48:05 +0100
Message-Id: <20200114084806.2420-2-sr@denx.de>
In-Reply-To: <20200114084806.2420-1-sr@denx.de>
References: <20200114084806.2420-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

This patch enables the WMAC controller on the GARDENA smart Gateway and
configures the board specific factory EEPROM setting for this driver.

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Paul Burton <paul.burton@mips.com>
Cc: John Crispin <john@phrozen.org>
Cc: Felix Fietkau <nbd@nbd.name>
---
 arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
index aa5caaa31104..2d979eb744dc 100644
--- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
+++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
@@ -195,3 +195,8 @@ &uart2 {
 &watchdog {
 	status = "okay";
 };
+
+&wmac {
+	status = "okay";
+	mediatek,mtd-eeprom = <&factory 0x0000>;
+};
-- 
2.25.0

