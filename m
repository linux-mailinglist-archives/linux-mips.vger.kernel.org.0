Return-Path: <linux-mips+bounces-4862-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3BC94EDEA
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2024 15:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C98BA284740
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2024 13:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F62A17C217;
	Mon, 12 Aug 2024 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0VHpvIB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DFD17BB3A;
	Mon, 12 Aug 2024 13:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723468692; cv=none; b=I9qolU1WWwaw816wZH6jx39NDY+ZJ8Vce660VO4Lhw70M9OITQzodym2ddedbMcXpG24TbhJN7D3APSSEJwYs188dotG5ZzmH8RiC94SRQ71W0ZsCSmlRLqMpvM36C+986AsSowUjR6FGLcnPuP+1vgjNxf7IBZUjcWDOeXXhz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723468692; c=relaxed/simple;
	bh=NI6LtaRghqgFJSmuW6L70kqVt04izoqeBM0TyxN93y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQQyt1krdbKtMbJFU4b7h1TxjbuAL9GiVtx9xG3JeqETR+nPj0hXick0UdnM7z5ni6p/hTkSgr6gxHxzLmy7fSJPWgfWc2L0XPNTgEr4dWBTC7/2MTsVXT5bBOZi4EDHjSrPJeIQMg4oS3rdkA1FEnaHMeYEty8djUF6UfH1cJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0VHpvIB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42803bbf842so42947425e9.1;
        Mon, 12 Aug 2024 06:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723468689; x=1724073489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MvIitLDZQkM4PvZBj3seM1r80RXoD13zcpjAFfQ4S8=;
        b=C0VHpvIBjHiRzS0lF3H2fvXimQ6o2gj5KIH/r8B/JJm7EQL70zP4tkKyZATUA9TwlC
         zCCUMvtNOVr8QjJZXwkxoQ6qVtEEtyQWvdWoosRK6uQd3kOHTdXAHm+f1Ic/mRwV5eIt
         /cVlTC9B3T41+AqHhobFbH5XCsBtoxXIwXh+MMUxb9suud8zOhFntENgQ0E7eyDmcy3K
         TTK+OnwzyUcVRY1cY6kP64W810rJAJLSTWOOgis9KKolZh7I7xhLu3y2wG1hdOMv4gyA
         /Yi9mZg88OtcTGSKxCLh+IfwPi6TQ8gyD7GUuiMh1UOVoOKaGwGDLTMAY/xRaGnxkPim
         zQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723468689; x=1724073489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MvIitLDZQkM4PvZBj3seM1r80RXoD13zcpjAFfQ4S8=;
        b=NeMWvb7gSDANnzXEC7Kk6iGtPoFIYnRxLRuQ+07w2wWYE/Myk6Q4G5iZ2nUka+KxA6
         /gBkSJh/zE0rNCLogvpbDlrZiocsXIIXzdzGW9mHWtwiItAme/6lk14Xox9DATrGei+W
         SOFOq0jv0u9NQG5CkslVotDRHrGyf/q8/SHzF+h+5+XaV97/YBKeBdPelMdNKaROfta4
         ssRWUmPS2zzQ61d1KK+Ax5ZtPX/lF4M27imMbdi2tOoVdfpFkUxxuuJsCgE4tKa01oUv
         JW3dmVSFQCXBMyPXoYUCjsaCHeaMkKCMvDuhNKmKZJ+UuL8brAjv7d3hDfmF8dr1bWbP
         m38Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7zyTtO3pmZo0boH8/XRBgKHynMRbOgJ4aAZexTZrWikO+s9Odj0MX6AuY3/Khi/qjJF43/siJWv3lfSFm+uwok5wHVi6oZqUV/yRn
X-Gm-Message-State: AOJu0Yy0A5D9KhSNJUQ8vK5MvFu81E8ftUCfW7qtGyTJlkwIYaAEwU7b
	uD//ujN11zh7pWaIGlldyr1ijVakuVtSxKYCGaa3AOmrJxrPL42b
X-Google-Smtp-Source: AGHT+IF9xwAUhuthWRuib5nvy4k9Qilx+0XLiWx1/YKRD9lFTzj/gvudnqRdleAkzxiKAkFawklQTg==
X-Received: by 2002:a7b:c310:0:b0:427:f196:c549 with SMTP id 5b1f17b1804b1-429d486efdbmr3870715e9.23.1723468688706;
        Mon, 12 Aug 2024 06:18:08 -0700 (PDT)
Received: from ryzen.lan (82-65-243-93.subs.proxad.net. [82.65.243.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c7bc8c3sm191105975e9.47.2024.08.12.06.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:18:08 -0700 (PDT)
From: Vincent Legoll <vincent.legoll@gmail.com>
To: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vincent Legoll <vincent.legoll@gmail.com>
Subject: [PATCH 1/2] MIPS: ralink: Fix missing `plat_time_init` prototype
Date: Mon, 12 Aug 2024 15:17:42 +0200
Message-ID: <20240812131803.16475-2-vincent.legoll@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812131803.16475-1-vincent.legoll@gmail.com>
References: <20240812131803.16475-1-vincent.legoll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following warning:

  CC      arch/mips/ralink/timer-gic.o
arch/mips/ralink/timer-gic.c:18:13: warning: no previous prototype for 'plat_time_init' [-Wmissing-prototypes]
   18 | void __init plat_time_init(void)
      |             ^~~~~~~~~~~~~~

Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
---
 arch/mips/ralink/timer-gic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/ralink/timer-gic.c b/arch/mips/ralink/timer-gic.c
index dcf2a44ac51e..926082655a78 100644
--- a/arch/mips/ralink/timer-gic.c
+++ b/arch/mips/ralink/timer-gic.c
@@ -11,6 +11,8 @@
 #include <linux/of_clk.h>
 #include <linux/clocksource.h>
 
+#include <asm/time.h>
+
 #include "common.h"
 
 void __init plat_time_init(void)
-- 
2.46.0


