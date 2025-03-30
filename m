Return-Path: <linux-mips+bounces-8416-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB351A75B3C
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 19:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38AEB188C1EA
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 17:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FB51E1C09;
	Sun, 30 Mar 2025 17:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="djwo9TLa"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47FA1E1022;
	Sun, 30 Mar 2025 17:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354240; cv=none; b=H9kjF4ULwGFSSbEdPPxdywmqVmXC23bbARTo9R9qp9ftZvq1bltNeSbMDOyTAEMyCAn1RbXdSohvFI05R3B11pR8N2JSKrj0L8rI3CxLXW/dEMDU5rvc1yQEwO4qwAoERFQXHzaALVb+X7qIHV6IRmiXtm9cbW8Uu4yHStGV8L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354240; c=relaxed/simple;
	bh=/w190+E2yNUMb/HQLj6HQ64fNAaTeI4WKdIBqNfX5j8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i1EizLohp4l/fXKN1jt+yXALO4WHEE0wD7Afbt3nnOHFKBW9xYryCnanfYIKhVPc4i63/Ebb4wG9b8EXwdBlzPGUnMHN5nZ0bWfBt5LpXtQQjbSQaF/MZxn1Xz3gfEmq7votdAOoewl72RRCYh09XWXdh5QNfJutHAIOJGNC348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=djwo9TLa; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06BA32FC992;
	Sun, 30 Mar 2025 19:03:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354236; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qHZQubt93g9flz+cf8eKxXCG1pfT8X6EDn96rb+XNGk=;
	b=djwo9TLalKWPFeyjbCMXIUYElxqlZR2dYKbX8DHr97Ssgl5G585a9LiPFwg7qZlIAQYrYH
	dUCTWitaVDKwz9/ZS0yQbggLdCDk1lTzI/7UZhz7N2K6G/qRgOiodxxiwjpW26R16D2ld1
	ByIalCe8EX2CmpoLCikJjd2L+l+ZtEaBWV+yWaxpp2zNeECOBEcBb2PNV7HcQmZeXmwy16
	QFVNyQdzlignSG9P7iFgHu2ayuY+RKexc0UOXsueaxp14jVIr+OZVUUNHHDhQYD+h0uVEO
	ARlY2tionybOr19NbUAN2Hdp/D3J2nWWpc0f6WaOod9RCyv6LSMCHjsLr82CmQ==
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
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 10/10] MAINTAINERS: Add entry for newly added EcoNet platform.
Date: Sun, 30 Mar 2025 17:03:06 +0000
Message-Id: <20250330170306.2584136-11-cjd@cjdns.fr>
In-Reply-To: <20250330170306.2584136-1-cjd@cjdns.fr>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
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
index efee40ea589f..ed5329762584 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8182,6 +8182,18 @@ W:	https://linuxtv.org
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


