Return-Path: <linux-mips+bounces-8346-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20049A702BD
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 14:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B09B7A2E13
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 13:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518A7256C7D;
	Tue, 25 Mar 2025 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="pg2vhKAq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF721DC9A2;
	Tue, 25 Mar 2025 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910266; cv=none; b=rAlmJjVskPQgFuXb/Ejf3fix5jghwyu+oqp6zLY06brXLx6J7DSTs6IE9GhEH3rYEMgM3Wd28bb0FbVVttCxvb5PC1df/WIQfz/E9xIc6DbTgvVqLtvFalNqDYnF1sVYX7BJrsJGtzWE6KCYYhyYGoVRfRMpgB5x8iygw6VO3X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910266; c=relaxed/simple;
	bh=JsY8GJn6bZZf+icEIVNJ51OUbwzM8tzgSoE/BNxzNuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NHgZuIGLiFlpvrrOD5H0tn7LmNMTQlUHF74F8jjEiY9wBGge4Hu4IKJYnS6xSHESYtp4rsIBo7yfStHR8DciHxy1vClkdWB+0a2T4inaSLWhjvWwKSx1MEkYzwBHL8OgXpk/COAGzkWAw0zrdJHBqK7NoRyqvZ2NXhs5CfvhhiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=pg2vhKAq; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 108372CF506;
	Tue, 25 Mar 2025 14:44:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742910256; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3xlqYrdwVIoxKJxq2zl6oaHe09zk9ky4+vOcfNIHNf4=;
	b=pg2vhKAqWzvLeE/mvyNlhaXiEBUnfQMzfk3gKUL5ICPUPvSsABPrQnX8+5mnXroO44X6BP
	3dhFvBHtEno608UHM/npYLhsX1GX25xdUSktWXTPT0Uc1x5GRoxwAVinWHhbfNIE8uBIpt
	rpVahc+HfGX16pWS8UUTjzQMkxyj6uJkSu/iZM3vMfvnqJPhhlITzkldep9QKrrHtp2S+4
	I8EgpA6xDMNLeqncWmHYADf0uvsxaGXUsKwdcPhDuL4ONStg8hklVnsVY29oyievzqrcTU
	WDbVApVZq63pf1W5ROsnzodehTEcFAU0s8VYzCA5BW7PGK0iXVhiPWxWkRfnoQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2 01/10] dt-bindings: vendor-prefixes: Add EcoNet
Date: Tue, 25 Mar 2025 13:43:40 +0000
Message-Id: <20250325134349.2476458-2-cjd@cjdns.fr>
In-Reply-To: <20250325134349.2476458-1-cjd@cjdns.fr>
References: <20250325134349.2476458-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add the "econet" vendor prefix for SoC maker

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1..4cd050e50743 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -416,6 +416,8 @@ patternProperties:
     description: dServe Technology B.V.
   "^dynaimage,.*":
     description: Dyna-Image
+  "^econet,.*":
+    description: EcoNet (HK) Limited
   "^ea,.*":
     description: Embedded Artists AB
   "^ebang,.*":
-- 
2.39.5


