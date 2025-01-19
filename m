Return-Path: <linux-mips+bounces-7518-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABCA16386
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 19:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 568803A5BD7
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 18:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0F21DF970;
	Sun, 19 Jan 2025 18:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="OmuIyI2Z"
X-Original-To: linux-mips@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0250E3CF58
	for <linux-mips@vger.kernel.org>; Sun, 19 Jan 2025 18:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737311701; cv=none; b=SybHEPRFHSadCnaqIL669NshV0IPIZ9mrptP4UEmG3G24rC/hN1p7fkRV6Rc+zWdWcgifrdemnfxXsn6PBjYM4EKOk61FrCKhvsOkDWpHgxnA8tyP1nwhSuEH2mZZraSR5DRv6F2XOLoZHbdTaCjoFlreHtWHTNA5AQtzPElQNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737311701; c=relaxed/simple;
	bh=cjsQEclftogcoUImqiTSjFpCqk9cVRJspoOpzsilchI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPih/17+UKVSuwyjd4Ygw2oCXNzf2dxk/+7CMKTmNP0+CSkVRvyql7Hf2COukwivbqXNnAJHGuCbJlGHVe9DjwzXqJkGD24fCsYzGyO05zvUG+9UzUmDv7e1SwsKNc97IxNcUb8eh+0MLYFhdAXyKl7O7ovrp2IlyiR7XV6kuGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=OmuIyI2Z; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 12FA25A7E51;
	Sun, 19 Jan 2025 19:34:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1737311692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9btHGkf//kk288NthFQi5y2bA1UgkbfCEvqEoL+nsJI=;
	b=OmuIyI2Zmymp1dIVn9oF6C9buUlDlqRs+mPF/9qZ6qt90o+oUVedzTT1GTWTnlvFXStb0f
	4sIfhC2oFPTTrfskifg8LE1zOJF+IHjWYzdXnDCKtr0CT4lF961HMzaHRBb5EvcZCCKnXW
	OD/Pl0CXjA5RbfZbA8mvSISfKe3Fs6kFr1sHbHwhxtGd0FdBZVwx5B0jTiNVdfnI53HzKE
	9UoTR90EQe5JM9nLoI/DGWCdY2/XIc5Dx11QgMU1Kh+fGRKLfGhFA8baDYJI4auUFaMuBB
	dLit+mNzFbD+1BxFjEO1RxtesxSO2T4f3ia6w2fz91N2wYM0Rif/o65LiSYg2Q==
From: Sander Vanheule <sander@svanheule.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 5/9] mips: dts: realtek: Add SoC IRQ node for RTL838x
Date: Sun, 19 Jan 2025 19:34:20 +0100
Message-ID: <20250119183424.259353-6-sander@svanheule.net>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119183424.259353-1-sander@svanheule.net>
References: <20250119183424.259353-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SoC interrupt controller so other components can link to it.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 arch/mips/boot/dts/realtek/rtl838x.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/rtl838x.dtsi b/arch/mips/boot/dts/realtek/rtl838x.dtsi
index 907449094536..21fb584e6383 100644
--- a/arch/mips/boot/dts/realtek/rtl838x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl838x.dtsi
@@ -73,5 +73,15 @@ uart1: serial@2100 {
 
 			status = "disabled";
 		};
+
+		intc: interrupt-controller@3000 {
+			compatible = "realtek,rtl8380-intc", "realtek,rtl-intc";
+			reg = <0x3000 0x20>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>, <3>, <4>, <5>, <6>;
+		};
 	};
 };
-- 
2.48.1


