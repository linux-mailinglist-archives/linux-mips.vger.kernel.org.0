Return-Path: <linux-mips+bounces-7584-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 202B3A1A276
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 12:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2E1816DD6A
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 11:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF77320E71B;
	Thu, 23 Jan 2025 11:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AtvC1NNH"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6700320E312;
	Thu, 23 Jan 2025 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630131; cv=none; b=cesfMxlXLFWro4ckHg9kks9WsXjEW+82grPzIKa03Ktc6eH0LyQapZVT1XfkKnw0q5B3epRsOQUS30Bs4/jdBNc01XHDkqs56cJNlEPWd9W6ntGyNpL2bRSlyViHUUwkV2epZF+JgdbsMlvDuN10yvQkgMIUJJ3NjNxLFM0CBGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630131; c=relaxed/simple;
	bh=EwgqmloDuLpbEetG726pgbQgC18wy4SV4k5ZQGINcjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qpjjsKBARUalj6/cUmpj8FTH7P2I0QgH62+EQQF1m/5d2OwqnIBWKWP986P5aqrMdMcgBheguuuJ2KgiFPxJDfgITpYPC+IQ/Yb+wD4QwX2ZE1ajST0RU0Kx5Wq8/hE7b9dwoU3IFpb3OSmX873yZzi/uOltoZlXAdut9I6vKUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AtvC1NNH; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 122A0C0005;
	Thu, 23 Jan 2025 11:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737630127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSEqBmSqmyvDs47D4eD55kQ405suvhvrk4+/jN9RG4w=;
	b=AtvC1NNHDsmnuNkreBztRc/o3xLGLTrouKh/l+MfxhFUB+vYCa8PfySP4ANvopUjnHzeiw
	rwdukG9eawxvf2VrKIF0TRpq8jGV2ib4cwCrnWTiq8PrLLUh4rvKOTCw/u77zI0Wq1W5dJ
	yZKNX6ZOqP/43gTk4yrBLmyQN06gghdfj7jKTPVXEeZ7rpGMvKwBg0+1wTnopQ9ZgJJAb5
	uj1usJoXKaqniGBj4J5w4/QqnsUvvAXRpSUhOD0r1s2H8exmQKbHqY6BTXKVGiwhjkyX5L
	c1KHw8m6tP6+prL9fbYPQovmBKR1+EKADpCaZYJo2hMrx6G32xSD/DRO+0sO9A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 23 Jan 2025 12:01:57 +0100
Subject: [PATCH v3 4/5] MIPS: CPS: Support broken HCI for multicluster
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-cluster-hci-broken-v3-4-8a7ec57cbf68@bootlin.com>
References: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
In-Reply-To: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
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

Some CM3.5 devices incorrectly report that hardware cache
initialization has completed, and also claim to support hardware cache
initialization when they don't actually do so. This commit fixes this
issue by retrieving the correct information from the device tree and
allowing the system to bypass the hardware cache initialization
step. Instead, it relies on manual operation. As a result, multi-user
support is now possible for these CPUs.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/kernel/smp-cps.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index b20ea4048429e1aab2bffbada793ee594bee1e05..e85bd087467e8caf0640ad247ee5f8eb65107591 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -333,6 +333,9 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 					   sizeof(*mips_cps_cluster_bootcfg),
 					   GFP_KERNEL);
 
+	if (nclusters > 1)
+		mips_cm_update_property();
+
 	for (cl = 0; cl < nclusters; cl++) {
 		/* Allocate core boot configuration structs */
 		ncores = mips_cps_numcores(cl);
@@ -394,7 +397,7 @@ static void init_cluster_l2(void)
 {
 	u32 l2_cfg, l2sm_cop, result;
 
-	while (1) {
+	while (!mips_cm_is_l2_hci_broken) {
 		l2_cfg = read_gcr_redir_l2_ram_config();
 
 		/* If HCI is not supported, use the state machine below */

-- 
2.45.2


