Return-Path: <linux-mips+bounces-8961-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 856AAAAE169
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 15:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27F04165285
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 13:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C22128D831;
	Wed,  7 May 2025 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="YfrfliAf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3576928CF45;
	Wed,  7 May 2025 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625534; cv=none; b=acPyryi91h4cWkebGpRAx9SfYVJ3u5yR2Z2CGpVtl+vAA3x8hX38hC3/aAvZ4Fj8yxp0MKA+dSOUxj2deM+TaVR/EXIKziLQGE2VRMG6TgIehdS8r4U49dDTW/PuVD9F/UCp1HJu2RKh13DAN1sWDUtRlzbLy4Ql9g2BSkXGMUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625534; c=relaxed/simple;
	bh=UyLSGrPjMNhTJSLUqGX4FZHiCmrxwwb/RNLZ4loGzhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oO2ySaQ1kPtBRlC/y441o6mFrnIDtHAaEsWKpHuJi0i3SRInHd1CK3hnVwt5mQaXExB34ha9LwLw7ctuK6jZB+TsRWDGjAoGbV+bt7nVxdzBEeyzjd9YvsCdbkCtveCR4BmWFDgC2vO5tPuWCx8mMcF+M0+DsONAPWWUaIVKleI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=YfrfliAf; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A800DCC5F;
	Wed,  7 May 2025 15:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746625531; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lrjxiKt7lKLcOgSH2fhDYWG/J++M1ZtRLxV3n+zZByw=;
	b=YfrfliAfVwmRInkw0wX0s6Jq9OXbEAZINo2ysDegfPFdv4uK0AqxMe8kfOOXOaLb01U8tc
	ReDRmpGvanRTAOttouvbfsg7nzBGhGKHGOnpVNmXBzVlgyPHl/Na1UvwKcFmmNoX/JsPqD
	i8s1+1RPjxmfCBGfgZBf0OF5vvYst0tr9BQelpz4CuumzyWAkCeBD64gaulNfuSyImHZn4
	dycayg7KB2OIxaryaaygJwefQ/WZRRPUP/95KiCwWwxQrWfiNFlbSf2iEt+70Au7q4AYHp
	luS+TyeK7tIQE8qGVQ7LKpGWgEe1EhEPG546aSysgjsIxF02Z+zdQ58XU5txpg==
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
	cjd@cjdns.fr,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 7/7] MAINTAINERS: Add entry for newly added EcoNet platform.
Date: Wed,  7 May 2025 13:45:00 +0000
Message-Id: <20250507134500.390547-8-cjd@cjdns.fr>
In-Reply-To: <20250507134500.390547-1-cjd@cjdns.fr>
References: <20250507134500.390547-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add a MAINTAINERS entry as part of integration of the EcoNet MIPS platform.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


