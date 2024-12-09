Return-Path: <linux-mips+bounces-6907-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2249E9B1D
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 17:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BF8A1888C7C
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 16:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B94F14D430;
	Mon,  9 Dec 2024 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ErIC4RNU"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187FA13D897;
	Mon,  9 Dec 2024 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733759984; cv=none; b=Ily2CV7DjYrvjO0kQ7CUH+nrmU6jLqhB05GmUYlf5QUa7HSOvZFrpaDQwpkjIK9DIXwwwzNA1xAkZs9VI7S28ktMm8De83x4U5gB1O9oyQtujta0+CBEExhKq5xhX0QSWzkniRcgIucdXOVah6S5tP+jQ0TmRO8xWPUNlcyLPaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733759984; c=relaxed/simple;
	bh=pVnB3J68SJ5ZbxJrKUNajMzxZzFavA5FR2dTH5pwM0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j5sQ9uMg62kue1UI8DN4/WxfqmCjFC72sUem1LDkA2Bv6Oe78XSr6kJqM2lGFpd3Dvo5SEP+zFjtvBhvQHfcjjq47vny2L3v/DHaR4b/gYCMGkYqTJaZGT46YVg3he0eMrg/b1HDN4nYiw6QmE55WAR9UGAte8lfNnEeCYuwhnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ErIC4RNU; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E89DC2000D;
	Mon,  9 Dec 2024 15:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733759980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o69Mz00pbhAuPCU0BiftNOE1d7MIT8r8LNe86G5wyqg=;
	b=ErIC4RNUSyyVT6gZ+EQwmUpuNvrFvDhI/tUxqaO29yHADBhhuR6jX61xiK+jJa6rPKUiPU
	OTVg51JP84jw1eecIUmyXosGZhnhCA7KYVaio/9rhLxyqx6XSduYqnRZOpeyeJyPmmh7wo
	HL4m2SQlr48RWsDei+6hh4gL592F5b7ilS+iFn8R6HI9s7RfSl4zYGH/Hq2xbSjc5RL8Qu
	Bny6aSCS3+wLnwHhXRpFO7ajeJbMNOAG+wFyiDjZh+3W1CUP+vDM0nX80gIfASDPBh1wTv
	jCBMAcdpgW7tW0JUfKHEf91n5G71aHfjAe9G6W+/qSrcMgOfIEfBSeC4eXKjVw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 09 Dec 2024 16:59:40 +0100
Subject: [PATCH v2 6/6] MIPS: mobileye: eyeq5: add bootloader config
 reserved memory
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241209-rmem-v2-6-cbc0e8c08a21@bootlin.com>
References: <20241209-rmem-v2-0-cbc0e8c08a21@bootlin.com>
In-Reply-To: <20241209-rmem-v2-0-cbc0e8c08a21@bootlin.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Add a new reserved-memory node, containing bootloader config with MAC
addresses for both ethernet instances of the SoC.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index 5d73e8320b8efc1b4f68923482bf188c4345f1cb..a84e6e720619ef99e1405ae6296d8bad1aa3fa23 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -49,6 +49,28 @@ mini_coredump0_reserved: mini-coredump0@806200000 {
 		mhm_reserved_0: the-mhm-reserved-0@0 {
 			reg = <0x8 0x00000000 0x0 0x0000800>;
 		};
+
+		nvram@461fe00 {
+			compatible = "mobileye,eyeq5-bootloader-config", "nvmem-rmem";
+			reg = <0x0 0x0461fe00 0x0 0x200>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			no-map;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				eth0_mac: mac@7c {
+					reg = <0x7c 0x6>;
+				};
+
+				eth1_mac: mac@82 {
+					reg = <0x82 0x6>;
+				};
+			};
+		};
 	};
 
 	aliases {

-- 
2.47.1


