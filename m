Return-Path: <linux-mips+bounces-8522-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64466A7F7DC
	for <lists+linux-mips@lfdr.de>; Tue,  8 Apr 2025 10:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 702EA3A99B2
	for <lists+linux-mips@lfdr.de>; Tue,  8 Apr 2025 08:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD5421ADC3;
	Tue,  8 Apr 2025 08:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kIcIYVV8"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17502641C0
	for <linux-mips@vger.kernel.org>; Tue,  8 Apr 2025 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101010; cv=none; b=tvpCrJ1AUpjoKVM5fYVvJ0uAwoGdv8Ut+B417r2iXOMhZyZPwkY4qfwekTATvxVpvZWhNxjgO/vsBSYev3934Z0qYjZpdGWSGayQbAI8ycgSVqwTZrVDxxQRtfZ6oOuhlPRObRhQgF0UbPFynLax9z723bhXB2qQGlwcuKWg8hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101010; c=relaxed/simple;
	bh=eY6QmS/jMMqraLWISElVxM2ddsk83dVnwANCMNtp9uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lDDr0AATjreD/ONKG1NS2kPNEixNuAYWnKGQw29rbhymndLCpEvHe45xOc7o+gTrJPwxHhsgQ9DNIeCwjevZZ9wQvrerePalBYNmg1drYPXYnW8f8K69d+VcAJlQNWyzLr1Zglyp0+nUnOMHFLA13LRRL/ZMFO9FqW3sTMvMXBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kIcIYVV8; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744100995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZAi+cp3bu3ospaZa9MvxjpPUoJTJl/dvPd0ysKpUEWY=;
	b=kIcIYVV82pkDXHaHXO8f9LiB8+PaqvcZT16J72nItbLFQ+PtENESMa8wZZIuTf0aKYGcmR
	wnYdfqJ+VRZiS/U4KR7Wa3vcP39lBfX5BW24sbmCTcAhJ5esp3M6Z5USqO0Gc//8XrY7rf
	4gfamVWMUwWTRqo7s7x42oh6/KIvfyA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	David Laight <david.laight.linux@gmail.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: ralink: Avoid x/x division in rt_timer_config()
Date: Tue,  8 Apr 2025 10:28:05 +0200
Message-ID: <20250408082804.796515-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Avoid the 'rt->timer_freq / rt->timer_freq' division when the divisor is
larger than the timer frequency and use '1' directly.

No functional changes intended.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/mips/ralink/timer.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/ralink/timer.c b/arch/mips/ralink/timer.c
index 54094f6e033e..5d8286603584 100644
--- a/arch/mips/ralink/timer.c
+++ b/arch/mips/ralink/timer.c
@@ -75,12 +75,16 @@ static int rt_timer_request(struct rt_timer *rt)
 
 static int rt_timer_config(struct rt_timer *rt, unsigned long divisor)
 {
-	if (rt->timer_freq < divisor)
+	u32 t;
+
+	if (rt->timer_freq < divisor) {
 		rt->timer_div = rt->timer_freq;
-	else
+		t = 1;
+	} else {
 		rt->timer_div = divisor;
-
-	rt_timer_w32(rt, TIMER_REG_TMR0LOAD, rt->timer_freq / rt->timer_div);
+		t = rt->timer_freq / rt->timer_div;
+	}
+	rt_timer_w32(rt, TIMER_REG_TMR0LOAD, t);
 
 	return 0;
 }
-- 
2.49.0


