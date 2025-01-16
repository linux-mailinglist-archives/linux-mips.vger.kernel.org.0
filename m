Return-Path: <linux-mips+bounces-7485-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D09A13879
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 12:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7788D18873E5
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 11:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC69C1DE2D8;
	Thu, 16 Jan 2025 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gkHTM8bo"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1A21DE2CA;
	Thu, 16 Jan 2025 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737025182; cv=none; b=g/z4KCgomuC5R27OjgxWBhEPDf9jA/CYbR14xmfC9apPhvVKk6/hO3JMlP5wgbymiNXtqv3SJZcVdj0R4boYThjOI0yGI480PlvU+GlETBUTKrqGGl7G1uPF8kFDCxa7fJdTHV1JCb6yJ786y9yF59OexDm/MEo4AzlhQfXkuu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737025182; c=relaxed/simple;
	bh=4LLaji94/zDql4kTm2OUq0W66jZ32dACgZFNmMKsKrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HnfUewOkfCyvLRwMIv4lfLu4+pdI5V+DsT9wvH9Gr1bkKuCqMqwzc1P9qGrDr2jU/v29P8fdPkUpoeMfpzrFQuAYFelE3uzC3GbizLPn9yWPme1oAchGmHVMMGzwnVL+AFUNM0ur8Hh5UfzDZZf5OFi5hDjQpKVJLfZpgBbUWSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gkHTM8bo; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46665240003;
	Thu, 16 Jan 2025 10:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737025172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R58vwryAbcD6lTOxG6wnCelBT0nf+2drh0W3NGHpLag=;
	b=gkHTM8boO/wW0IdgQ3Oi/eI1IJMo1JdB3d+3B0NrqKGT7CGP/TKfo/x2+yiSA9BzMdSoQ3
	MTa7aXUyD+W7BBFrDseqIgjvcqgHkSVxd/91QPI3fSjGBeNWhfs+jQd3A77/MWE1RoDCgl
	pT16dEsTZM95mP8XK/PwRZTTvVfHnO/GUv97/XP9nlGBZpNaDls/wwRozIYKfNdQi4xmWN
	V5AuYVEqmkWFKKStH0NeU+q+NoyoOs5BTWfMZ09rOy5M4klLfWwik/oJppkrfx7ebTBqFa
	RcGxDGhJ5rJ+KKUnprInOvbuDeQKLbL0cxwoWBcOBmmZqik8DRglX0fF7tcglQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 16 Jan 2025 11:59:23 +0100
Subject: [PATCH v2 5/5] MIPS: mobileye: dts: eyeq6h: Enable cluster support
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-cluster-hci-broken-v2-5-fc52cfb7a19e@bootlin.com>
References: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
In-Reply-To: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
To: Aleksandar Rikalo <arikalo@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: gregory.clement@bootlin.com

The CM3.5 device used in EyeQ6H SoCs incorrectly reports the status
for Hardware Cache Initialization (HCI). This commit adds the
compatible string for the CM to acknowledge this issue, which enables
the use of the second CPU cluster.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
index 1db3c3cda2e395025075387bcb66ea0737fd37f6..c6087bd8ca1d47855b8d93aa7e75e1fed219587b 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -32,6 +32,10 @@ cpu_intc: interrupt-controller {
 		#interrupt-cells = <1>;
 	};
 
+	coherency-manager {
+		compatible = "mti,eyeq6-cm";
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.45.2


