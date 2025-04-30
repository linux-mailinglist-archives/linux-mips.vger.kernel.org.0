Return-Path: <linux-mips+bounces-8882-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00765AA4D9E
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 15:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB96D9C6D83
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 13:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168A125DCE4;
	Wed, 30 Apr 2025 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="O1KHwqtz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4251DFE09;
	Wed, 30 Apr 2025 13:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746020106; cv=none; b=KxoQau0d561nncwO/OUKtO3OHkV92AGdb6xwX8FKPrFezCXSLP+N5jrlieR9ziFP3C/6YPistJLi0HyrFvjxZ0olEUmrG48zToQhp9qwXDWR3eBCk0ZKaIyYT4SMiTIL/TnEkyIMv2Rai9DC1SapN3RTb4ZOY22UpxQwglzMih4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746020106; c=relaxed/simple;
	bh=niMPINOkFVx5bXWZLyuB/RR3KMFa3n8V8mFU5pt9skY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ir4/t7zwO7hqMXebBjo+uXR0kzlwHC9XGs1Khw6RSzWVAOFfEee+0jil7+eiAL2T/iazOJJCwDgwBWDyWKwc0xpbyY464jvZjdM8zi8ADHLNIwqB2/cOWCls5+TM/YfTfvoHUhW5dCIB1wr9vQwWkebh2jTSHRHhEmw48qLROXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=O1KHwqtz; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A60FD91928;
	Wed, 30 Apr 2025 15:35:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746020102; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FgYHCHNLZhXHkXFDQAs/9vHqNNNImu0dpU/ViiHu3Sk=;
	b=O1KHwqtzBzVsh4YZgbK6l8bchX+RcA5MVsBWE45rn/FP2Z/x90x07aCMMOQFG2LXPYylIL
	snm+O+KhLnHu5ShUyhoCrTgFElls+9kRdAgrQrJNs2XBzMcHqrucoRpSq+5iVwgJ9wAjTM
	RezYGU1OzDVFdCauZPKdcTFNouhp5KKly9Ac7dN/fJXuod9S+Nj/XY+q5Kwt23MjrjsI5z
	pSIec3Z4MIkVdpW8eh1hbQbAFK0/TGoKooWL4ggTxlUPINNzLsT53ANm+2xoQXkfSn2M9X
	wxsDSG9WhIry64KlEzGGf9O3x+wEFPqfOQUiD9ILuBgsLKtq50hMk57XsyJ+cA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	cjd@cjdns.fr
Subject: [PATCH v4 7/7] MAINTAINERS: Add entry for newly added EcoNet platform.
Date: Wed, 30 Apr 2025 13:34:33 +0000
Message-Id: <20250430133433.22222-8-cjd@cjdns.fr>
In-Reply-To: <20250430133433.22222-1-cjd@cjdns.fr>
References: <20250430133433.22222-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add a MAINTAINERS entry as part of integration of the EcoNet MIPS platform.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..5b2536150996 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8352,6 +8352,18 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/ec100*
 
+ECONET MIPS PLATFORM
+M:	Caleb James DeLisle <cjd@cjdns.fr>
+L:	linux-mips@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
+F:	Documentation/devicetree/bindings/mips/econet.yaml
+F:	Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
+F:	arch/mips/boot/dts/econet/
+F:	arch/mips/econet/
+F:	drivers/clocksource/timer-econet-en751221.c
+F:	drivers/irqchip/irq-econet-en751221.c
+
 ECRYPT FILE SYSTEM
 M:	Tyler Hicks <code@tyhicks.com>
 L:	ecryptfs@vger.kernel.org
-- 
2.39.5


