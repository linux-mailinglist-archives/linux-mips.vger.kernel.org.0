Return-Path: <linux-mips+bounces-2650-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E91E89DF65
	for <lists+linux-mips@lfdr.de>; Tue,  9 Apr 2024 17:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1284282C53
	for <lists+linux-mips@lfdr.de>; Tue,  9 Apr 2024 15:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1358136E1D;
	Tue,  9 Apr 2024 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="ldJj2zY8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DCE136E17
	for <linux-mips@vger.kernel.org>; Tue,  9 Apr 2024 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712676988; cv=none; b=GWyq+2xGEKKrAL4/m8+FaBHL8xp02xQ7+zlR4xt0XUMmEOuJbNxD3KtsSPgw/Rc0JNgLNp33Xun/FipY8nFHwuEoxsv7/eAbPWYYvvJTIVIg5aYh9PJqMSV9F6qB/szBahE5PI1igTY64SEMmRSx7XdFVUyD3QTm1rq6H2lG1IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712676988; c=relaxed/simple;
	bh=0quX4igVUBv0PjMU/FXlfx9DZgCOO6LJrjDtLL6paP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fvPwtr3Odh0aPaTRcPjOlnO7qaylelN61yKf8XmSbzkLc54dMStmhNLuV+Qqbo4ATa8h2WP64qS/lqPXql1LJ5Vvm93v2WrBDetBM1dHby05ZfXRww/gcJsPhN5c3pVk1Mnc90rxn71o/ToMeJ1fhZ91NCXbqKQbDJ+nOdnW1vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=ldJj2zY8; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e6f4ee104so1614422a12.2
        for <linux-mips@vger.kernel.org>; Tue, 09 Apr 2024 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1712676985; x=1713281785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOph0FaIWn1WLk74ILFxXXN8KiIBmlIobvlKfK86XFk=;
        b=ldJj2zY8DuAuD989VdUOp+44AYSjj6WZCLsytjTumhz9I3rGGY9rCNDvcmKPqYTSa4
         zY4qZk2gJ4fB0GjDirSPfpMqwoqli7iFtdlB7jQNDzKzX5WFQ2wz7xKWKBTueSjZ2RM0
         J3DXOuu3D/tYuazQRj8ZXSlSC76QV0gu0ERKR2+9jtv/4KNKZuKOnZhIelZV9Vp3Xv8A
         YTUj60yL5zAeFruFJK5zjnIOBwOnNqv8Qf/ZmEMVgP7eTR+PEzBMbLqWXEPhodPBSOxa
         q71h9vj2fOYP8kfB8PcCmK0y47TkSz4c1ZWtxI1O3ukaSazdefn0w1upgR2hNycZQXvg
         Voug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676985; x=1713281785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOph0FaIWn1WLk74ILFxXXN8KiIBmlIobvlKfK86XFk=;
        b=dZjb7W5g38zcfPrxND5R4sMVD3LjmlGl8UCTkNvUX8zw1IvaLNlHgfc9PsOMX531Rr
         Y3DZf2se/b9svtJ4adKZvHG0IJtF3F+qiEpwmYPbRkkSrNUOrAxcyXAyFlWC0wOexOZs
         9Lwbra+RmF4qQQVCGUcNnGFVxOW/YLA3ovZdpPTqVI0lwp245tQBQyx6E8IMFVrWJRVo
         x6Whn2zueDO6MHnU+nf5C/twW+wsXbKPV4p1OhqoyNJDBliKaKgFhjTf3lpA5qX0DCAm
         S49XxIfMoRl831t5Q+drwRuj9/6AGm3jCyE2f59tajFOtXHRISNbcZCsjde5KsceJpii
         MVdw==
X-Gm-Message-State: AOJu0Yz2z3+6pOS9Vorzo82V4zV/6fLGSrE2k5//dpcsyIXbAPa6cTzZ
	T85rckP5ZPIhL758aWB6fojlQBJiLqjAInci2+bgYLLQ5gpx5pQ2yhtgfcB5o3Q=
X-Google-Smtp-Source: AGHT+IEjc6dYjz2VkqbE4sv+esMTP2o8UAMrIoQVAD1/6yseAStzbyBLZZBf89n2JUrtgOdfCYDWNA==
X-Received: by 2002:a50:c348:0:b0:56d:c6e9:ca01 with SMTP id q8-20020a50c348000000b0056dc6e9ca01mr8509919edb.15.1712676985086;
        Tue, 09 Apr 2024 08:36:25 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-212.dynamic.mnet-online.de. [82.135.80.212])
        by smtp.gmail.com with ESMTPSA id r8-20020aa7c148000000b0056e78e90a1dsm320344edp.49.2024.04.09.08.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 08:36:24 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] MIPS: ralink: Use min() to fix Coccinelle warning
Date: Tue,  9 Apr 2024 17:35:20 +0200
Message-ID: <20240409153519.291205-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following Coccinelle/coccicheck warning reported by
minmax.cocci:

	WARNING opportunity for min()

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 arch/mips/ralink/timer.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/mips/ralink/timer.c b/arch/mips/ralink/timer.c
index 54094f6e033e..d271ac98312a 100644
--- a/arch/mips/ralink/timer.c
+++ b/arch/mips/ralink/timer.c
@@ -75,11 +75,7 @@ static int rt_timer_request(struct rt_timer *rt)
 
 static int rt_timer_config(struct rt_timer *rt, unsigned long divisor)
 {
-	if (rt->timer_freq < divisor)
-		rt->timer_div = rt->timer_freq;
-	else
-		rt->timer_div = divisor;
-
+	rt->timer_div = min(rt->timer_freq, divisor);
 	rt_timer_w32(rt, TIMER_REG_TMR0LOAD, rt->timer_freq / rt->timer_div);
 
 	return 0;
-- 
2.44.0


