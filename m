Return-Path: <linux-mips+bounces-12873-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD417D159F5
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 153D63033B9C
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C460129E113;
	Mon, 12 Jan 2026 22:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T+Ma2Kac";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e+094r/x"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A45E29D294
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258143; cv=none; b=Dgge5MnXQZwsasUZ5uyCZf+D9LwtJP43Mf4r3+bYG9Z+hMS15RBOfRCuzUa2VKkMlafRQuuiT+DUpGqZo69oKIEfAWLrXOcFyITDARxgmAS8PX04ApDlvL74Jd/yOHicUwqvMzGG/I3tyEDk2cuBak5PaRXkxsxK6Ng/A91lZAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258143; c=relaxed/simple;
	bh=A4IyjiuETdtKqekO7CrVMzxJYv+C5eM8OE3bwQ5VTqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IYuHBzAy/NBaoTAdsoWJfk7pPx9H9PSLJGsR6O14ZSTN7oIG7PjkcXqYPtYFS63tg/DOIqt3Cnk3gBOCV3SfWiarMDvntIUBHE8v1L2D/GzGybJFVpHNbl7UtlucEa6zJH5jzFegaiY5FPGiW85w5zzzBUGQgsa+riouSZ9npg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T+Ma2Kac; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e+094r/x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUeF2oJGFj/TVxz7XlmmyJLItFmPD8ejdDLxRDE0rIE=;
	b=T+Ma2KacjnLPZ3mg8QaFkGtwuvSXkuFeApstgMLKEmr6Dn+ZayIGlJOq1JBKWPBj3+RmKV
	5UnTAITnv7jH+E45mxXQS7EBDMKBd4rECMbTcP0SGxV55kRGtZyA2KpNMmzI0e/4uk8K2m
	hVtpHIFMtAUCUtcNZgmh65zzQd97YnY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-1t9xW7DSNICUYRAJvawBBQ-1; Mon, 12 Jan 2026 17:48:57 -0500
X-MC-Unique: 1t9xW7DSNICUYRAJvawBBQ-1
X-Mimecast-MFC-AGG-ID: 1t9xW7DSNICUYRAJvawBBQ_1768258137
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e2342803so1824439985a.3
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258136; x=1768862936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUeF2oJGFj/TVxz7XlmmyJLItFmPD8ejdDLxRDE0rIE=;
        b=e+094r/xaaPDXsB+05+vBY5ehqTPmSB4pcNyVSoe20Rz0BAIbj8/t6Vsz556KHZ5qG
         Im/yjWQNr3Y8Xacv+dRu4cTOXJImnI1Vk9EthVKHTF275QtjdibY0lpBqDkweSNnRnvu
         Sf1JFiA6YhUurXvCsR212PcKbftUBLdCLNMbW7XjbvlYgsucMKxdI6GY2hI3mf9yD9Z+
         72USPWD+GWXy117zHFhOQViQe3j3CPdzqck2fg1jzira4ihcVKHZqMDKZtLwYXPhDdEG
         c6j6c6BYio80cVhDrL4A8cGgOBV1tFKjTzSwuOKyM2nVo3QAhAGspLSes3MWgbN8W+bC
         mXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258136; x=1768862936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BUeF2oJGFj/TVxz7XlmmyJLItFmPD8ejdDLxRDE0rIE=;
        b=su7sk603Zh1NIPOMuSYY38SQb2uinBG6OEmdJBa+cz9Sf7+WxwyCIcyHrMzGrz4ltS
         /ezRae7VqSOdV5T9QH2o/zyatXSe5CINAaJ0+wAcwZfJJ6WhT2n5p3dyo3v3VE26rS6u
         jG517BkLrT+S7ZcNuw7COX83ZJasM8lB88HQcg5w6J4CWJL62PT7HPMqfMzxqfpETdQ0
         2kPA7jlP+sUJ+ynNfRKQQGk3P11ptoLMTMYD1+dt5niJ8rqPDFHlSS6yyLnvtsctLz+W
         M2XHLOhRWqZFRR6H4udViPXFcdoB65gCUTjh+C/CFuqki+y2mfr5hr/UIk3AYXoP8n7/
         rmsw==
X-Gm-Message-State: AOJu0YwLhlb7XanKTX29oNuLw1+LO9NrtX7IAo6JhiHUDpPnI8k4LCWg
	P7k9Z7nK2hUjUju5xNIMEzv4uxbetf1LYeLJD5tQW/czuGM/y2tV+1D+6oWMr7qG4BDvNdBIz3e
	TypqoNhe7l6q+9xgLcFxsFUZoUW0qkPhsBb9VvCY+qUFsiLqR5v7Snz6nXp2+NgI=
X-Gm-Gg: AY/fxX70+vXoqyDv+QBmDsr+hx5fuiQHkvxy/K2L5+/m5C2uZE+6k3T/KhllCfkyK1R
	6k3hnJ/Zan9rt2jFFIGZIucLpxHJLz3Yt7C5PcUJB5vFQW8YTycux/qENYZu2AT9MfqbEjnIqC2
	KA00lYdqzuVR4pdxfRDHeesMLSKYzw/NjcuOC/8a4G5tBpWaJVUJPWivEs7PunTFRgHyrfy96WL
	pYpT7pymCUMdKn/SsPHkijdPMZB3+C5xsPLIKpoTa3xi6oOBC0912QWvS2iOvzxoIxMRGhvwo7V
	2e3lugOtePpAtKZalDqLWrcoKgi3l31VFDK6qLW+/sVkixAIqANTEJpgJ+ckULAU93rAgyOzzUL
	A2jGk9DAx1ZTCiigsi3UQ9oIfhhaGbN0LtuvaoOEx3oJjKlt00A==
X-Received: by 2002:a05:620a:450d:b0:8b2:598d:6e89 with SMTP id af79cd13be357-8c3893dc9f3mr2464851785a.45.1768258136654;
        Mon, 12 Jan 2026 14:48:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0wQgWJRwo4rzB06Ir+fzlFg0TJaA4jFMPlwq5Ti1+HjjBZ9IGkEaAmczGXthgM7DGDfRSZA==
X-Received: by 2002:a05:620a:450d:b0:8b2:598d:6e89 with SMTP id af79cd13be357-8c3893dc9f3mr2464849385a.45.1768258136261;
        Mon, 12 Jan 2026 14:48:56 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:48:55 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:01 -0500
Subject: [PATCH v2 07/16] clk: microchip: core: update include to use
 pic32.h from platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-7-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=A4IyjiuETdtKqekO7CrVMzxJYv+C5eM8OE3bwQ5VTqU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq7yvFD+XZz74dHZSu+vUN/v+t4QdZ3/2WPal7r+F4
 VFJpvoGHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykYRbDP61tiz4GGv5yEahd
 EVXxgD9owjR/vvfsKTbCPuvc3zFwz2ZkmP6uSzco1SzLtcJ3X0bix7dad/ccurdgGuPUixeW1b5
 X4wQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/microchip/clk-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index b34348d491f3e1b576b2b9a8a66bfddd8c2296ea..891bec5fe1bedea826ff9c3bd4099c90e2528ff9 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -9,7 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-#include <asm/mach-pic32/pic32.h>
+#include <linux/platform_data/pic32.h>
 #include <asm/traps.h>
 
 #include "clk-core.h"

-- 
2.52.0


