Return-Path: <linux-mips+bounces-6757-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 399B79CF06E
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 16:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCAA4B380BD
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 15:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7891D5AB7;
	Fri, 15 Nov 2024 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GiV48AWL"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F0D1D5174;
	Fri, 15 Nov 2024 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731684617; cv=none; b=KqmzquBBvRO/edZ4OBTxkHRi6glhXRK3tmXi66iFEMK91ALgMaNPDnTfrOURnTfQaDJ2DRlxwW59a4jzYsXgR5Xpbo0FNg2ZVQsGYyqSjNcVtSrZ+lz62aT7Arcke1NCAxRb2AM2IgORFF1KIrkxFpuuuqd3uNbIO7F5P7o/7Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731684617; c=relaxed/simple;
	bh=EwgqmloDuLpbEetG726pgbQgC18wy4SV4k5ZQGINcjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZEH1oT7SnCI8lk1L+b+pRpPV/ntjI2gj9SM0+Oy56mKoB3Ys0PonqW9IvrZE5n607SYTr2uwyNHZBFsN6OmpkFtl3+UPm7XWmAK8I1I1BbmbHZAz3aN6Ys8GOrAoy49QpJNFJfeTi5eQSIi0VHTGaGvLQY9D00eOS6707salco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GiV48AWL; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F145240014;
	Fri, 15 Nov 2024 15:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731684612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSEqBmSqmyvDs47D4eD55kQ405suvhvrk4+/jN9RG4w=;
	b=GiV48AWL4UuUGjZnNMrBERZFtXYN3VZV7kgBvPwVQQM18y8IKnDaJmqMaOjMKxfTfJrGv/
	OIaiwBZNOi8TgcmFOduZ3xhkbs33GurZpBYQgsrESiwyRaFNXIu6JKuTWk6AIK3Pq7su/p
	aMVaMFanaWND/kwX0os+CXekclk4zs8ycJYvaT7YSu2Kxra7Mar1CZ+h14vNx9+QIb/iN/
	kpUJXBe0uawMFFwikFC1GrkimJEkWr2s5OCiFTG7RSuo1/ydN2MMrbmW7V1lFyL4l+We9t
	epV/T4jBTtAImkWmmJ1jeJe1OUgc5ZziDGO5QgazIf+6VoBAsP6KqUTOWlgcBg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 15 Nov 2024 16:29:57 +0100
Subject: [PATCH 4/5] MIPS: CPS: Support broken HCI for multicluster
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-cluster-hci-broken-v1-4-00636800611d@bootlin.com>
References: <20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com>
In-Reply-To: <20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com>
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


