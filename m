Return-Path: <linux-mips+bounces-12879-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7224AD15A8B
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 622EE30BEA7C
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2B9315D49;
	Mon, 12 Jan 2026 22:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ti4x+IOH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rSFRBu1r"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FB030275E
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258152; cv=none; b=aAlrhvbLP7il5D6cnRBcKdEKUCavfsS29XqiLOJ9BmUK+G7yGNQfE4LZjLWjNXDTO6jzK8HV244QbYRvxv06Z+slhPtk4VHJziJKVEi2U4hkuMMEIG/3LYziXCW73d8z+Ua+cCxg5FfPZJNgIRvIlnWDgelIYBVoNu9B5bl0fAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258152; c=relaxed/simple;
	bh=jDvVXSSYmYY5XbBAXdDjQNYvUv13RPN7GrnhNgOvnfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJSkAfhdly0EwbKfkjhZLpfEEhJxWqFJRNAw13lTB0EPazTJ+PwZ3tm4ZudKBKF0R4IX0U4Iq/5b4c6pXy5RVPFUKWMF0I4WuCnqstrcHWNNealsJrVxNTIafWJ4jmZnbU4y+E1tXBMnQRfuCR1/lEgQekUwmWT6FoI/cJZ+qAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ti4x+IOH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rSFRBu1r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sbiGv+reyMnQdH2O1qQewjRpN3GWgkonjoh4yy3MW50=;
	b=Ti4x+IOHRHAwMeZt0u5Z5z+lpvMbe1N42dBbZrnB3llJATNnzNqQzB6SqaDNG8ZsgmR1sM
	JzA+b+MjrBGaH2kpch/vyBBiG9Fov6lQiOtK8z465cG2/sTKJ4lSFDlN0c1orHFDh5kH3w
	AQvmhBN+aX/XK/7NCSzeH8LlsVnG3Zk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-7JEDb9lTOvigz80Z49WaZA-1; Mon, 12 Jan 2026 17:49:07 -0500
X-MC-Unique: 7JEDb9lTOvigz80Z49WaZA-1
X-Mimecast-MFC-AGG-ID: 7JEDb9lTOvigz80Z49WaZA_1768258147
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb3388703dso2830403485a.1
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258147; x=1768862947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbiGv+reyMnQdH2O1qQewjRpN3GWgkonjoh4yy3MW50=;
        b=rSFRBu1r7ftin3VBarixNYQnoZfc8soa9E1VsOT9VfEisIDQr7Gmy3ZTGdkUFxS1Z5
         fqdMCbVoAIzZOapg42besHZTMADN9i85uvZOYPXIBd8dFOoShzaZ0u6Euyc/r8IcIyoY
         SHLRWl19wfe2gtYfWTCoEQ+zOaDMTbbtJcCM7CVEhsnvjVWY+wTmDmn9eiZinji1Paid
         Mh7g9lkkQFawLBhiEsguzv+cawIOUWVZ04F8NZc54JdIb57/9OQT2CWNtpVJk2u6xOJv
         NSV574V3NSu+lPO5pJ1HFmnxcqcuOc3b40q/Cw58jmuyBZFpPsXysBAte62UYqcMW1LV
         V9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258147; x=1768862947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sbiGv+reyMnQdH2O1qQewjRpN3GWgkonjoh4yy3MW50=;
        b=ZTH00RUhEaB3xdFVspICM6n3nZrg2k++nRJX27tjqXikDLhtg7CB3MXF0xr8Atj6gJ
         mx1etGdheFzJhdmi11sDrJKm9yDIdDGnaBGl1yvImtdd0Uj5/CyIg/BgyWD1Y1V2oYBV
         CHaZrybb4N3I6rYswNuQI5UHePDkQ4M6CgG7iiJHhRPF9wbYRG7To0ZcFvBVAgGV0xje
         o6eLgY1BRvo+vfmb2VA3p0IslISE6utFamBccLTJN+96hDxEzl8dhLPqv4iVutJzec2O
         yMTTtY9wmxh5selIhjhZzZg4o2+3Y+S/UCq56TUWsF42+iN1U+HtCloOnfTq9+7rN8qG
         FjUw==
X-Gm-Message-State: AOJu0Yxs/Lx27Ckx+0fi2oph0ddnd9npZYkqzAhqOghQo7uywBKakFIQ
	S5lL75GQg9IJocQBH/oz7eTkDnzMs6bNaBfP8RBZFkLo8Mv+vBt4Fb4gBQpPXhbpKTPGtb/uvjt
	bF34tK+DiM09NgcM2UKL4DjKKl/IDVYm95WFbm22oicTUP72PF2ceP4Qoc0zxxTk=
X-Gm-Gg: AY/fxX75lZNA5HBzsnv8aVA3ftqDV5OyolGZ/ardo6Wltwu8GCH0LW5LF+vyqc93Spd
	EE6he3U/Nu4K1CaKJA4JmzjmJae58YoJYntmzqi0qXnr1kie647YES1GqIHmUx7M1JlMDDgAMED
	2T0sOUpDK3LRYJIwkvdiuLRzaRJQ7hncJRDJOODOPX67KtVdXfuzGuhbqght5v/x/j9gQFsB1Sl
	gCYnxOnIoUr5fuPcsvZIBvus1Oq8mXws87Qkd/4sDQe3ok6XlxcD9Ub8wVsisVBS2T5OxCltRTK
	RPR/eE7Cv8hVm3BIkN1u2QJ6uXeyR3FRkE8VzNuEB5JBhquindl4uWEaj3cWJAZQ2OJkIo2ZeiD
	tZOKbi+FLXBD0Tw5k52KKbU/oQ6U9G5b3oLWEEW/RqaDvLaaCWw==
X-Received: by 2002:a05:620a:2849:b0:8c2:abd6:7989 with SMTP id af79cd13be357-8c3893954f6mr2846510485a.21.1768258147158;
        Mon, 12 Jan 2026 14:49:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2QMZfasqirquZQl0aq8kRklcAK1MQkRiLj9HJXc63TYc5eVk604ns1tal8hrYsKitUu5O6Q==
X-Received: by 2002:a05:620a:2849:b0:8c2:abd6:7989 with SMTP id af79cd13be357-8c3893954f6mr2846508585a.21.1768258146813;
        Mon, 12 Jan 2026 14:49:06 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:49:05 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:07 -0500
Subject: [PATCH v2 13/16] watchdog: pic32-dmt: update include to use
 pic32.h from platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-13-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Guenter Roeck <linux@roeck-us.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=jDvVXSSYmYY5XbBAXdDjQNYvUv13RPN7GrnhNgOvnfE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq3wyoja0inbxvTs3JX911hufmEqd61f0rI6yH4ntO
 2A7NYajo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgInITWZk+PapT9duw38JBb6Z
 QXUHb3a+z1h4tGiq9BHLt57p3cd3OzMyvJo7MfFnhEZTykFd69zzEqLVq4TOa+7fL5i85KB/mZ4
 uPwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/pic32-dmt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/pic32-dmt.c b/drivers/watchdog/pic32-dmt.c
index ab0682492c85ad63160bb7da61cc74336698a4e9..12e3a8f63589862e3ed674ffb71ee4798755e56f 100644
--- a/drivers/watchdog/pic32-dmt.c
+++ b/drivers/watchdog/pic32-dmt.c
@@ -12,12 +12,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/platform_data/pic32.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/watchdog.h>
 
-#include <asm/mach-pic32/pic32.h>
-
 /* Deadman Timer Regs */
 #define DMTCON_REG	0x00
 #define DMTPRECLR_REG	0x10

-- 
2.52.0


