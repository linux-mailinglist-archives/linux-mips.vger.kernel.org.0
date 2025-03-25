Return-Path: <linux-mips+bounces-8354-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B01E7A702C9
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 14:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DA4C1892A9F
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 13:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1C325BABA;
	Tue, 25 Mar 2025 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="qqSS3yj4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878AB25B66F;
	Tue, 25 Mar 2025 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910275; cv=none; b=Msnkwsn5qCIQRx88ee0YyqCd4m/+d2ug8+6zKCz/oH1wMpavjP3LgpB7YvmuN/Nr+Sd7N6c5NvSahxS2/3gk/x61QW+ftERAVhEIwF+PjkF2tCfjp7J5Eqz3NU8NFvCehR7GJZ55iaw/5gmogexP1RmP4NjWuWH0mn6kg1U6ptQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910275; c=relaxed/simple;
	bh=/w190+E2yNUMb/HQLj6HQ64fNAaTeI4WKdIBqNfX5j8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IaPU6XTQXZ0NBuvOBq7EetVnoe2/e+h6He1AZTni5qxffB8w9xINMoFA5XsYJg7g2EI1NO4Ad8o3SWWgH/VzTPWb7QnnA7H3zmsrUVn+hgzjoqgEBy9ny9S+AuGs+AyZQRuJ1iPP846rMqhd5OWp/7u5MsMLaGba7z1pJLD3f5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=qqSS3yj4; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 218C52CE2FD;
	Tue, 25 Mar 2025 14:44:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742910271; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qHZQubt93g9flz+cf8eKxXCG1pfT8X6EDn96rb+XNGk=;
	b=qqSS3yj4ysq7eDQGfD6HmYI5y7whMUHEnMlghbZiTGHgKSaMBQCrDf1R+QcdUtQsC44fZs
	fyLmkyT43xkzVeZqCBMPgd1VV+3KlYItucSEIrbQTwpNSDsEip2eFGkwDSO50+uLqzsvxv
	/B4XoDRyMlhaa85n5/QlBKtMqjRoVsbS8pfHNa6Lf7ZecKiMdQON/OAD/NgM65tqRO/TiN
	KZx8sHLMp+rEx+hVX4et6wNScA6iFCJ4TkDEXiyTjl2TzH18Ifor87e3FmC6XDBSfmR6HT
	gp+gxND15k0e0Ke8jWcOP1PzGQXtK4idJtjprcXsflGVsA7hf1tldFmFh/jBSw==
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
Subject: [PATCH v2 10/10] MAINTAINERS: Add entry for newly added EcoNet platform.
Date: Tue, 25 Mar 2025 13:43:49 +0000
Message-Id: <20250325134349.2476458-11-cjd@cjdns.fr>
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


