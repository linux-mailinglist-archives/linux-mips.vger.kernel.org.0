Return-Path: <linux-mips+bounces-7526-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A3DA163A5
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 19:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74DE23A5D68
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 18:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE2E1DFE16;
	Sun, 19 Jan 2025 18:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="QYGLCx39"
X-Original-To: linux-mips@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9321DFD94
	for <linux-mips@vger.kernel.org>; Sun, 19 Jan 2025 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737312270; cv=none; b=Js6cnAQ/PvPMTVtAgguGCfJ1G9A9tD/vZpX2lBLZhxB4oWfRh83A5w8Jbmgj68tTlvgPB8uIQdXzsq6cLZy+pXYmIeyoA0zvgXaqcoceQstsuEHCe32+NLhVvieMR53Z7g2+CcQWIcomYAIHakr3268psXh91+6YeHhKhqzbKrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737312270; c=relaxed/simple;
	bh=vBUI1WTwvwlq9hWbSW/h3vK5gits9GeBFSD50wq7OPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGPeTzWHismqJLiC2efNQJ5ReQaxqtPCWB1ahsvM1obUN9tVylbi/h41pSsDavZTZEhH9jBwgS2nQCHcj4KKDIiiNXCWvxwq6FpGduNMVOHHIgkX4kszhdoUqX28225vzMjw4eyBV+KcQU5tY2zsOlM1sj6b8kWOtUQMRJtqhtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=QYGLCx39; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 11B855A7E4E;
	Sun, 19 Jan 2025 19:34:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1737311691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6WJoRzWJ8gqvs1EYgx8tUmkbjMY4RQ2licgvVNYBIGw=;
	b=QYGLCx391dnjsLRTTXtb4dwrAWUL54EmMRBkASD6R9Yzy6yeN6SZ0wbfLbJppQ1/olHcT6
	QM5rLg08C2NhCro0GL/hw47GcApOYzMxf6FZ6u//sqpbi4gL9xqxcOrgOb4Lg1TpkjRgDH
	UOq34J4ltZ3MRdkxE1rCozwnk7HJgtJ43Tfr47DKZdjUrLyBPRsdrJqAfEDhGgPFHYgooO
	WjYRyiLvzGs9Q3NNHndmN9AQwQDLyZtNhu7sasn2wrl4t5XuX5gC01XFXlIuTgdh1yVKl3
	Zeuf2WvYWg3bD524AE7i3c+jcQD9BPhdzPSvmvEo/CVmytaHUc/UITQlywGstA==
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
Subject: [PATCH 3/9] mips: dts: realtek: Add address to SoC node name
Date: Sun, 19 Jan 2025 19:34:18 +0100
Message-ID: <20250119183424.259353-4-sander@svanheule.net>
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

Although not strictly required by the simple-bus binding, add the bus
offset to the node name to be consistent with other nodes. Also drop the
node label as it is not referenced anywhere.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 arch/mips/boot/dts/realtek/rtl83xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/realtek/rtl83xx.dtsi b/arch/mips/boot/dts/realtek/rtl83xx.dtsi
index 03ddc61f7c9e..1039cb50c7da 100644
--- a/arch/mips/boot/dts/realtek/rtl83xx.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl83xx.dtsi
@@ -16,7 +16,7 @@ cpuintc: cpuintc {
 		interrupt-controller;
 	};
 
-	soc: soc {
+	soc@18000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.48.1


