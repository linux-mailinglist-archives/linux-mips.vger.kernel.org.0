Return-Path: <linux-mips+bounces-3251-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A78358C36B1
	for <lists+linux-mips@lfdr.de>; Sun, 12 May 2024 15:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E23051C2111F
	for <lists+linux-mips@lfdr.de>; Sun, 12 May 2024 13:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B46F46557;
	Sun, 12 May 2024 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N29LfkAs"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED4B383A9;
	Sun, 12 May 2024 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715520332; cv=none; b=luiZU7+6+CIuxgLXm5JU/KyGuqE++0XSjlPvKDu2vVlwmYzZz0BAMkUiy08CaE9DQAjwFGRtYeqVCUlGx6LpkEh8r6HS++aqiGppnI0nulbqLs+Yoo00w1gEM8j5YxH+jgiySjY8qD0hmbv29rx6Hu/NgsZ5rZKpuUQlQUA/MGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715520332; c=relaxed/simple;
	bh=J+g8IFFwy/vjVlcPhULbDtQ2VliUzl+7eSs2atsxppo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBDECtxzE4A7Lqe9aKvLOC7RgS0UL9h828Cw7jJQXfuxULvpYroIQBjlMgULXPzWmI0+elJjDRHVn0OLgoVCWn1O3d+gvmhiaPSJHaVSHaEek660YBJsSh5GA9wkH78CDp8GX5KZ1CK4xBilHpqyEAsr4pQJeO/rv185SWZHivo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N29LfkAs; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-34da4d6f543so2474888f8f.3;
        Sun, 12 May 2024 06:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715520329; x=1716125129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVMmxV0x3lE9AAJXo4i0SZvZEcFwdqyDwVz0Ae897gs=;
        b=N29LfkAsr/kAgpVCsgMQ7dMoFKgENWriyGYCSxUIWoRkyahowO9gnJqf2V/HuJstH6
         /1xnaEZ2IDJ4eLp1a5PKUmPoX42MLwxUET1hvP/KIO5W4HJVFnm+uCqPmxml9XuASWGl
         wCOx4aeRfBzDvJhnKfLyYwc8Md/y6Z25ftaBeCinc9KWLv0fbSYPzQvU/F/8+2zHXFkn
         1srgbp2FvsyK5J9qPkWrm2n+bmhEZTynlEoF1W0LDcC/TquHM3iHRwmkd0O9G/OnVjLa
         4I8ebT1lLNLPRWYoUgKkbtJ85C3JwwbspblA5UwhBtHmWxcbMWmq4Mv/mHFLw/21VGtx
         sZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715520329; x=1716125129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVMmxV0x3lE9AAJXo4i0SZvZEcFwdqyDwVz0Ae897gs=;
        b=teKfkUNBtMOWYYLK/a4SHwbkcybFmQ17LsZDGrQPRIHX+50TGWZpvIiZ3Jtamky7Tn
         K+pZ2XOW2iKGYdx7H3lVf507wYsOX4Zgfn1g7WmPqFyiav3a3N3HuuSb+RbfFgXYyPmp
         sKwSCu5Dsfobs1TBKpa3Vo4oEEgGEd+T9tuZ4WKCQgD2DefSXGAcvOzi9OjffV7Vd7+B
         iDPosJpMh4wQo5zvTNSmTfuXjzgcEnIeslfzbppDKEZaD7mW7QvRpaRo425Q+YRG4vrO
         B0RvKVataEhot1yvcJqhldqTJuYo3poVsA4uMMhTVb6y3ztKQ6ROFzoethyOvzhUhMhh
         kIRg==
X-Forwarded-Encrypted: i=1; AJvYcCX1PIDf54oKbuFex7hwmcOSiNzMbij543ZhHTLtaRUOtus4LSXxmHJeh/lClbS9GZFwIMbzMzUcbukAloViJ+Tv2nMzqzKgNPtS1Bp9B+Uw+wLGPzNf2C5mDvmEcVKYiC/AlIMIWPuQoG5J0eBiRa3dHnxgWiWVEdZvewrKDPB1OliimGc=
X-Gm-Message-State: AOJu0Yz6JBG+63mReXg2mWty4IC2OHBYU5GcMVcDy+BOGDLVGAGqrTyW
	/qEQAeCIOCBnyvAyyCy/0UUPiKx/DteLRxcolnqHoHE2CO+eqjsm
X-Google-Smtp-Source: AGHT+IGPgmj9+HFj7ZmEj4HsMNnaUpkxl+HBirbu9OeF3UbYZa3LMM4sHMUqN7Itsxvn58XENpHmLg==
X-Received: by 2002:a05:6000:12d0:b0:34d:bbaf:27cf with SMTP id ffacd0b85a97d-3504a96a4b7mr5028390f8f.51.1715520328598;
        Sun, 12 May 2024 06:25:28 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3502b79bd09sm8822468f8f.14.2024.05.12.06.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 06:25:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Saravana Kannan <saravanak@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Helge Deller <deller@gmx.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Baoquan He <bhe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Bauer <mail@david-bauer.net>,
	Liviu Dudau <liviu@dudau.co.uk>,
	Serge Semin <fancer.lancer@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 4/4] MIPS: add bootargs-override property
Date: Sun, 12 May 2024 15:25:11 +0200
Message-ID: <20240512132513.2831-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240512132513.2831-1-ansuelsmth@gmail.com>
References: <20240512132513.2831-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Bauer <mail@david-bauer.net>

Add support for the bootargs-override and bootargs-append property
to the chosen node similar to the one used on ipq806x or mpc85xx.

This is necessary, as the U-Boot used on some boards, notably the
Ubiquiti UniFi 6 Lite, overwrite the bootargs property of the chosen
node leading to a kernel panic on kernel loading (hardcoded root path or
other not compatible thing).

Signed-off-by: David Bauer <mail@david-bauer.net>
[ rework and simplify implementation, add support for bootargs-append ]
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/mips/kernel/setup.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 12a1a4ffb602..725e3f19f342 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -538,11 +538,23 @@ static int __init bootcmdline_scan_chosen(unsigned long node, const char *uname,
 	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
 		return 0;
 
-	p = of_get_flat_dt_prop(node, "bootargs", &l);
+	/*
+	 * Retrieve command line
+	 * bootargs might be hardcoded and overwrite by bootloader on
+	 * kernel load.
+	 * Check if alternative bootargs-override is present instead
+	 * first.
+	 */
+	p = of_get_flat_dt_prop(node, "bootargs-override", &l);
+	if (p == NULL || l == 0)
+		p = of_get_flat_dt_prop(node, "bootargs", &l);
 	if (p != NULL && l > 0) {
 		bootcmdline_append(p, min(l, COMMAND_LINE_SIZE));
 		*dt_bootargs = true;
 	}
+	p = of_get_flat_dt_prop(node, "bootargs-append", &l);
+	if (p != NULL && l > 0)
+		bootcmdline_append(p, min_t(int, strlen(boot_command_line) + l, COMMAND_LINE_SIZE));
 
 	return 1;
 }
-- 
2.43.0


