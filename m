Return-Path: <linux-mips+bounces-10345-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC22B28E1D
	for <lists+linux-mips@lfdr.de>; Sat, 16 Aug 2025 15:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 153871CE0E7B
	for <lists+linux-mips@lfdr.de>; Sat, 16 Aug 2025 13:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007092E9EAD;
	Sat, 16 Aug 2025 13:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="QvaapAyW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298F42E7F10
	for <linux-mips@vger.kernel.org>; Sat, 16 Aug 2025 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755350415; cv=none; b=siilQYVLn9ikA7MX1gtFVpvCujWel8gvuGXTVpfIPe01JV89MnkT+nNyKmolWV7OVgb5gvuMSw06NnxaDqHfGQfj9l81P8OEcDW4g8V7aItQ7o1mAYb8eK16/mGTB/hZNa4rrk5x4SecE3ckTrdwxhsbm/PNWzfu32ZRFC1RM/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755350415; c=relaxed/simple;
	bh=3PbhZqHEi4vaBFsYSL0yw+zK3kFanY9DMQDt5CbV03c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AhBAsbUkQu74B2IbqeYmHSZkEhgQqSALQGpzvDtmBI1riDDyNq0wcniN3F8blepxyitcR9hK7wRYAKhoynZTxpZYfNe6a33I67R520fYZTeJkptw9uNpTBFUuNYfXzyIF9oPEagEpoeUYMmblSSltt93lj5zlZmWB0k0pUElfwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=QvaapAyW; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 27459 invoked from network); 16 Aug 2025 15:20:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755350411; bh=9YJ1lPO0WvMR//31eSCB17Ig95szVlmjfIv6jeugCes=;
          h=From:To:Subject;
          b=QvaapAyWVdZv9EA4BRBTkmumg5DQM8mK3BIFBiq+6dfKeKwGoENJYclkZTxd14jB6
           X7wte6kU8LYm9X2jEQc0Kz8REuLwpoyccG8Y5l9Ss2oj1ih3JnlFHlird4oCaDMmgV
           SNtgbwkbCaYKGoWRf6emq/ojbIibhVmjAiH0ivfS8C0aGwvUt19TBA8N3UtfflX0Vc
           T0NWxAfLGnzDK1x0u8wYIB7YqjYpNOZpJI5VEyGSmzsHaYt8cgA3mzKXOfWNv891fX
           sfMiylAkEqGk9hhKf6Oct/oy4lxhihnGGsuhpDF0byX68QthtJVePhKqLDGG9dqthM
           Bz2jjydkJRovg==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <robh@kernel.org>; 16 Aug 2025 15:20:11 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	olek2@wp.pl,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] mips: lantiq: danube: add device-specified compatible in GPTU node
Date: Sat, 16 Aug 2025 15:16:24 +0200
Message-ID: <20250816132002.3632343-4-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250816132002.3632343-1-olek2@wp.pl>
References: <20250816132002.3632343-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 88a931d89730847405752da1b9d15df0
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [kSIx]                               

This patch adds device-specific compatibility in the GPTU node.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/mips/boot/dts/lantiq/danube.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/lantiq/danube.dtsi b/arch/mips/boot/dts/lantiq/danube.dtsi
index 8e92573aaf75..d09276b31718 100644
--- a/arch/mips/boot/dts/lantiq/danube.dtsi
+++ b/arch/mips/boot/dts/lantiq/danube.dtsi
@@ -69,7 +69,7 @@ fpi@10000000 {
 		reg = <0x10000000 0xef00000>;
 
 		gptu@e100a00 {
-			compatible = "lantiq,gptu-xway";
+			compatible = "lantiq,danube-gptu", "lantiq,gptu-xway";
 			reg = <0xe100a00 0x100>;
 			interrupt-parent = <&icu0>;
 			interrupts = <126 127 128 129 130 131>;
-- 
2.47.2


