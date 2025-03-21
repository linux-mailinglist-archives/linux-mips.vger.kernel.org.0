Return-Path: <linux-mips+bounces-8259-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B130DA6BBFA
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 14:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B202D1893AD0
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 13:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9295114601C;
	Fri, 21 Mar 2025 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="bDbDSjid"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BDD1411EB;
	Fri, 21 Mar 2025 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742564833; cv=none; b=LTI+Dwl4FH9rF5APSRlHlL9lXleBMc+6N7gCR6Ana4RqaMXAKN0D7fb1tjHg7+qR7eVQliaAOhjmOp5grT4ii3wK4AZc6TeGxEbfkTzW9jTjo+zgDNeF4zNS37e3H8g4aDAdPdLVB6r8s0giXMI1SpN/KsQf+50I9WmOxXJYfog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742564833; c=relaxed/simple;
	bh=osWE5O1iRBWe7qclvdbCFGuXogiHJ5z7z7iF7pq+164=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HKVtpT1CXu0vrph4b8VXWnhma3n5uU9NTwaYlC8KPElseaRnjW14+nEhE3azwqdbv8f878Xf/aDFfvLEnyZ95ylrey9R49KS3VQl4V31c98CT5Fh+PVvOtC07yE81QAdNmwkJmcnx5h6izLj8LwxWazWWM8WoZ5lfeNcqCvxbBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=bDbDSjid; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E4102A46C6;
	Fri, 21 Mar 2025 14:47:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742564828; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=z5J7Cym/+UR5PPjai7DjLogajBOo4PPQLYr4IkBxyls=;
	b=bDbDSjidark7vzWvNcXyhJXZVQMoElRVrqgZ9PivQUdxt0eUNVeK/A6iaHDnS7H8OSKxBX
	z1hXCLIlzeROVJdjKj8oLN3PFjhuy5lfVwoJt80ds5jxX9Xpo6t+0x0V74oTQhgQTmC2dc
	WIfZ4IgWHnYsrjwMASZZT77fNlnhfhE5y0SwY225B1UDI1GdIwckuVGvavO7YqmbJA8Ft/
	bnEl0yokZ7TCywI9vQ5fU2wQBYWCnnSfWjXLMfkhfu9LBjFNKb4iwZb0KWEet9dGV9Q9rM
	FtawgE1r93//SP9bqTdd6GQg+7BeTHfyB0MyI4SMa1YIIuQEM1b+KX+7k+I06g==
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
Subject: [PATCH v1 8/8] MAINTAINERS: Add EcoNet MIPS platform entry
Date: Fri, 21 Mar 2025 13:46:33 +0000
Message-Id: <20250321134633.2155141-9-cjd@cjdns.fr>
In-Reply-To: <20250321134633.2155141-1-cjd@cjdns.fr>
References: <20250321134633.2155141-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add a MAINTAINERS entry for the EcoNet EN751221 platform, covering its
device tree bindings, platform code, interrupt controller, and timer
drivers.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea589f..fcb1c49ee54e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8182,6 +8182,18 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/ec100*
 
+ECONET MIPS PLATFORM
+M:	Caleb James DeLisle <cjd@cjdns.fr>
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
+F:	Documentation/devicetree/bindings/mips/econet.yaml
+F:	Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml
+F:	Documentation/devicetree/bindings/vendor-prefixes.yaml
+F:	arch/mips/boot/dts/econet/
+F:	arch/mips/econet/
+F:	drivers/clocksource/timer-econet-hpt.c
+F:	drivers/irqchip/irq-econet-en751221.c
+
 ECRYPT FILE SYSTEM
 M:	Tyler Hicks <code@tyhicks.com>
 L:	ecryptfs@vger.kernel.org
-- 
2.30.2


