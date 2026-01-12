Return-Path: <linux-mips+bounces-12877-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE7DD15A10
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EBA9302E30E
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8436B30FF03;
	Mon, 12 Jan 2026 22:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YliSGf9f";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SpyAJq8L"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4711285068
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258152; cv=none; b=fmX6BtSvMXbeJXsJ6vc/93nx2xLr22K9Pe632mqHnTm8YAIZcpHxVYYYayv7CK6uwbcRPbYUrN47ezQFD0JxdnYaIP1nyIsnZdlFBBqDBsJha16eBTuvfeyh1ghh2NQ6gFE+CpDxJR56pBrJWdZEIuPgJOzGc5aAzyW4HWeyV6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258152; c=relaxed/simple;
	bh=mbJVZxZKVBmjDnZTaCwa/PwjxMQDsuqJGVoOq4paXbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=feludtefV/oWUjMGUM+mRwSxBaHKdXkY8+eMY1rG0k8TTL3l8s8sKZNidl8SIlAXOLTGu8AwMX0KgvmFLSuuVeGDNrdS5lD6lw0h7V36o22aIleTIxkAUa4uJPr+T/Jd75fW4MggARh19fwz0almu5IKLQT6cMm++Z8mcfRc3iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YliSGf9f; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SpyAJq8L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PN5GmDLXcSG6MviXs9j1fDYcLJyVYu1IRtnI338h+pM=;
	b=YliSGf9ffQxFKH25Gs5GkztBAkUjymqN/oumQjWEQMCZdvf3aI7qleXfxz9h8chbSiiOoj
	FHoq9E/I1Xr8BMo3oJ1ElLx2GfvMk+7KaM4EQvCdTHjLcuFSMvtCUmGmEQ8/piDKk4mt9Z
	BkCvNIY8jsWs5UEbQk1DO1Pg+Zfo4yM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-VUT0RmQKMwWaJ2BeGrPRyA-1; Mon, 12 Jan 2026 17:49:02 -0500
X-MC-Unique: VUT0RmQKMwWaJ2BeGrPRyA-1
X-Mimecast-MFC-AGG-ID: VUT0RmQKMwWaJ2BeGrPRyA_1768258141
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a47331c39so192858506d6.2
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258141; x=1768862941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PN5GmDLXcSG6MviXs9j1fDYcLJyVYu1IRtnI338h+pM=;
        b=SpyAJq8L61xaBVpk5O30y7I2XVA9Kjx3kPPeo3fUiTqsx1bVcXzhmj2hRNmSMsr5Nj
         wK2p2HlRwEwUEJs/Q3RPdsd64pTkcOXdAl8Z62rUr2TdSaHW3obONtfG6zixIXcGlQX5
         1ungoYHjfEfy0KQhGSJMkaFOB+pGrbmuhjtgwx0HbdDoW7tfUjzqqP/iEfolbk8Rjfdm
         rTKldmgQIwyN72NPsLgRh6mrqaaEh8Oa/E3rKwhTpD54jH0QPWGcqHIz6EqTcm+8sXtn
         Le10qL+OqAoaVAiWY4TgL9lcbOA4z0u/6PSLZr97UoBmvDMLp66eV5NGbs84AMAwWZEX
         9ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258141; x=1768862941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PN5GmDLXcSG6MviXs9j1fDYcLJyVYu1IRtnI338h+pM=;
        b=JiQ0Is1N8DVvh65qsKoK03mnLzBufpPxKQnxgsIn2owE8cCxblRJJBLJP3eSqygiCu
         z5XuEW4TdcK94piEneM6Yp1LuUZfmTyBaq/I2H7ZMhCEMT8R3ER4iezPCIkPyLMRnuY2
         CtLsKJyHbvnhko7TonfNU33QC5uSCpkwU/cFlLFjIwEwcUKbdSf8lJpgUMPawKHmTMD5
         cNaWutrhTOQ8NRb9+T1xl1cM20pswm7IIsceyEGm1qaTzK9fpfB9oMxoY4rzhygO/Fib
         +T3s7q8Nwlv7gAX+gox5q2CIH9OwBLpTpzY4tH0mnO01thYPDvztu9jc6U8hBBFTpDtm
         85xQ==
X-Gm-Message-State: AOJu0YwT8IS4euQ7gLLVZrhVituedVzr6LRsi1Y8wg/A2knhsOoIaLX5
	x0/K2n1r9/l5GMn2d7khJG1cLy7lXVCqyYXYX5H0uUglDJFk+wdAoeZNqg5Gb+y/AQXsnM6ofuC
	XhFPcMPPU1AITMfzRfYF6b1Ec8MNnUux/Gv7W0VQzUht5UR+zF7Wj3Wk0WsLrb8A=
X-Gm-Gg: AY/fxX7Do4bYG0VBIQ4gweLEIltEIHf3W3d5uYEPZwFp4W4gceYvfq9VZIHg/bCZhQE
	n8WpfQRLzVSAFK+n/1p+biHKSHgFz/tukjmgcF6o7Q+G+NH/UE3VSP224LExQfj2rg0PZ24PezF
	5f1YpxCnUcRygwJXNOPUy1UHQf7inbs9ypxeGUPA6yDp+gs0ZLUAvsFcP8REMOPK/kutt0SVdno
	meF4fiHUqsT6ETzzhIYW7DxXFhJGAoe3wAzh3kkhCzKtnWiEfM5oXDv7tNjz/HMNYvi0XZ5IbqN
	ZboGEq1FSW3HmskEcUz8j8RcJnvrfo1QTRm0K+Lpdoeyjf4PGTvS9qOcPEoK+jIywH45Bcyf8O3
	yX/hBiD334OhuqXseQxobEyoeZh21ff/SUINVKy167ZvgzrXAtQ==
X-Received: by 2002:a05:6214:4286:b0:88a:22fb:38f5 with SMTP id 6a1803df08f44-890841e3eadmr316772786d6.13.1768258141586;
        Mon, 12 Jan 2026 14:49:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDNHLeM7CJCyKDHhlsKT0hefto+HmPl2QKwgH62DvR/9bvznHo5QEQ2CBu8Y5MB0btSe9Bbw==
X-Received: by 2002:a05:6214:4286:b0:88a:22fb:38f5 with SMTP id 6a1803df08f44-890841e3eadmr316772596d6.13.1768258141180;
        Mon, 12 Jan 2026 14:49:01 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:49:00 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:04 -0500
Subject: [PATCH v2 10/16] pinctrl: pic32: update include to use pic32.h
 from platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-10-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=mbJVZxZKVBmjDnZTaCwa/PwjxMQDsuqJGVoOq4paXbQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq7yXcrXJmDkmKZ/5p/YkQI7jVOAtgc4jrzyb9UV8H
 FRvxV3qKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCJ9HowMm40yb8QeeKDOkimQ
 yhn4JPj85/8M4aImXvet7nSJJWqzMvzh6a/5kSacWTl57fbFccVRz9ytDh8SS+0Wd7tRtPKG5gI
 WAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Acked-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/pinctrl/pinctrl-pic32.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index e8b481e87c779291a69490de1892fbb7ec9c45f1..16bbbcf7206288df5f91870e6233970582f7ef80 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -15,13 +15,12 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/platform_data/pic32.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
-#include <asm/mach-pic32/pic32.h>
-
 #include "pinctrl-utils.h"
 #include "pinctrl-pic32.h"
 

-- 
2.52.0


