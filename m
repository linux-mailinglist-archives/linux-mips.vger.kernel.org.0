Return-Path: <linux-mips+bounces-7484-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40604A13876
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 12:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0F617A2CCF
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 11:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467791DE4F9;
	Thu, 16 Jan 2025 10:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LPF9jOl3"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D8E1DE3AD;
	Thu, 16 Jan 2025 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737025176; cv=none; b=XwKeaH5XveTYZxsmT9tsDpXVkfpgSbCl4qiambRBW9SwjjoAg3TYgBl8D2MCeZpbGAjMXmB+uQdwfr6ajQf2tu3nA0uzSoYtBQaurSOU/SieF5tT/tyEveRtbIyhsbFo7LgesMENw5RjDSz1F0g82FdTwzYpgSpN3LwWtnhV1Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737025176; c=relaxed/simple;
	bh=EwgqmloDuLpbEetG726pgbQgC18wy4SV4k5ZQGINcjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pkROTM+SHSnKBfZvuv1LIxuUyOvjEo2mpUmd9TM7Ha8DTlF1yyhvU3eeblqIDjc8wU916W6tJ0L/E38k0WphsPDDIR+cAzLfQVbcudX64KewSDkfsEWBHQLsFaGaH6E/I6o/ZFoWlTwtspVjJ5UYgSFta/Z5D3i0GeaUr71/AFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LPF9jOl3; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F1C160011;
	Thu, 16 Jan 2025 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737025172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSEqBmSqmyvDs47D4eD55kQ405suvhvrk4+/jN9RG4w=;
	b=LPF9jOl3ww12c9qiMIDHmdbf72jLs6K62/XNt64WsQ07o6earpn6z6WVsSzMEOdFrQ3iqq
	BzLrdDFYRYHVAjMzOBK+9mfoZER0J2H+LWpkz4b/9nTP05btS9iAtfwaNiyvn7h5PPJeBy
	gGcY9MYZJhoowI1wjB5/PDloBwnPsubjv5Nl/gc+Iv2XQon7eu90zbJXIbn+AGHlPgDrB0
	dsBfyk7NBXQ1G4vrjW+KyEPcQzj87Q/yDjlVltuGySJcGB0pPVUhgEj//9mDMDjbqWLM/Q
	2QmMsDacNXnaRIWot0PQmOIQxIDv69YG9iAerOB1OOCCCoMftjYAjtnoOipLxw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 16 Jan 2025 11:59:22 +0100
Subject: [PATCH v2 4/5] MIPS: CPS: Support broken HCI for multicluster
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-cluster-hci-broken-v2-4-fc52cfb7a19e@bootlin.com>
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


