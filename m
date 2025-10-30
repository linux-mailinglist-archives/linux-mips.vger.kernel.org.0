Return-Path: <linux-mips+bounces-11964-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03663C2272A
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 22:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C64B14E8EA4
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 21:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E8A31A05E;
	Thu, 30 Oct 2025 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njcQdhzn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF8C30F534
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860614; cv=none; b=J7sEOQTDsyqW7menSWP3adZ+6xiJDRBMrziA/GH8f/DQAv/oHbqbSvDu/Zpf4ocbXwYeei7ctMqMumFOIiJsRTeMQ/gTVh3alc+nraig6e8zpPd2f9fDwumx3XzDeRf3XsGo2QeMZWntuwuPonl5xRmtOZlthsN3wII+X+5MQoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860614; c=relaxed/simple;
	bh=726SBCQ2p6EtS2laU45uEz8m/+eOynHeRtx/IHLwsK4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mgr/LzncdAEB0+z6645DOt0BoAWYjsio2+pCjEn3A9cTqfVjQ58F8uRMtEkqBhf7kiqvGpsp9wIrAiQm6+2PzDPvbyy1tu/JOoC8uuxeB/0l3SO2AsDUZ5oXDk+nZfD/WJSHMlFYWU+8u3QTeqtQqcKSZbk6TVq7iyfcO9QBvIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njcQdhzn; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso2963441a12.1
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 14:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860611; x=1762465411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ir8AQa1wMUOcSt+/a7sUYtl8GxEW4QEfEGayOfnmqow=;
        b=njcQdhzn4gq5hmxZNuBiZGZ7b9rXap/huUyaUKHrKLgwJcJQKyMydTvV7a7iRuVCsk
         c117nsdaxZYXUHBaAQjvwdNDe+bZlySt9vgMzanxUD0EYpwCz24PM56BB4KsvcqJjG5i
         9A3ZdcvY11YtNJ4SIcH5ck06en/5yu8NwdqvYWanZT1v9Xr6+z/Z59YK+7fod3UhQECv
         Shhc+B19K+vpsHPu1bBPsTPgypDK85wrFu3ytGhm9HhLSxXkZ66f0QBq9BkmG6zaYlV8
         OnRhig0ZeoZg8o7qFui8GCTYLIdpFAuretlyGsuwYDvkLCCKsU3rQ+IPFmU2oSa6Yt0r
         ek2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860611; x=1762465411;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir8AQa1wMUOcSt+/a7sUYtl8GxEW4QEfEGayOfnmqow=;
        b=Sv8j6ueZL42sD8IH57hNqqiRtynFhigCSRXz2T9cpwDfhQ/V7iTNoVLSvrbh3Aww5f
         OPiGKfXwlrgJQ9wlynp9JWHHtK4tT0i6UdHitA2h+N88fTnmpTJ1YyDrdPxCmU+8Vthd
         cjBuiwl3k01uEgic0f3agh4a1uL9H0SOr0rPHh6VlGrm+hluTWNzNvmv/poRWtnCPwG4
         M9E2TnmWTV8yhUI9WJET+UxbAweUN79Fm59be7rVM/YlzL8ZG2M7ZxBLYafI2NfkSI+C
         MBd4Jv1REpuKjUsA1RrF1bTd19dQqHIE+NKVX75WgR5WMVylYLQ6GDaX4L8oUiNRx/8k
         uc8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLT1fbGjd8BuXRuIdvFzXHF/wfb4ycEnpbLyp9n6FrfO1AQLk45X02GJGstom4PrGIqmOD5NLCik/Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxARY4m6RtQCYuKKellBiqiafVIPck8zmAp5WTlaZ/Ga2t4MFE8
	ZSs2fgBfsuHiLIHSyFiG0HZnF75UrQhIfjX3CpLdrSrpdFPoxhKYijAW
X-Gm-Gg: ASbGncss6VjVsvN5syTZqpzn6InYDaMOQ5OLTAJ2ihYABegV9rAzTOmJ2WVwz6uRWDk
	NLtH14cpYDdOEtvje8+/u3p+AlWHY5NjaUG45du/qHvdQBI3C7N7IfjE8TF2BfXXU4itolYDeSe
	luVKv9MPBZmxkYU0jbcu85sj+4+avpw5cko1wo1eseJb6DjdFu/sSRb8pEjzVesvlpMeZYlYtdp
	fW2tCShFSCDnDvMrdp76PdD+E2dvzcEx8TZ08FnpChWtGqBL+5a/KpVrZLpVIxn2Ygz/QzXtjWk
	0LQomVhlHKEMTRm2sKhhoVhQhveEZiROPU03LWz+r3HKs5wnz8/ZcQ5WUiroOTrnvZSL4Yd4gb1
	upmSMZWuYFw7QZDRzR3yIIQbXYznAI6Wd/ZB3/SjrSUGuN+G92D6UVW/Y/tw4+7j8HL7X/DDo2b
	ejoDAzBRNC+sgNz3Y7Ui1PQ5UZ/b8pDYGUZ5LH5K4aw7pTRWkbcMlcLCwzjjA1v8b+fOFSK+/1C
	Z1fjZkiMgwmEckUr1J5Qwf7+3dLU6SQWPDRQIFikvI=
X-Google-Smtp-Source: AGHT+IFin9LuBkbb0AYlwQbtnRdbrtyDgRJm0skxN5mswL3VB45tj8ToOhRdUQJToapuvAyVdWHmfg==
X-Received: by 2002:aa7:cb83:0:b0:634:bff4:524c with SMTP id 4fb4d7f45d1cf-6405efcc89dmr3248794a12.9.1761860610802;
        Thu, 30 Oct 2025 14:43:30 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b34a03asm14294a12.3.2025.10.30.14.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:43:30 -0700 (PDT)
Message-ID: <212e0cb5-a2f5-460f-8e03-3c3369d0acf1@gmail.com>
Date: Thu, 30 Oct 2025 22:43:36 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 3/6] m68k: coldfire: remove creating a fixed phy
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Language: en-US
In-Reply-To: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that the fec ethernet driver creates a fixed phy if needed,
we can remove this here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/m68k/coldfire/m5272.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
index 918e2a323..28b3ffa25 100644
--- a/arch/m68k/coldfire/m5272.c
+++ b/arch/m68k/coldfire/m5272.c
@@ -16,7 +16,6 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/phy.h>
-#include <linux/phy_fixed.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
@@ -103,23 +102,9 @@ void __init config_BSP(char *commandp, int size)
 
 /***************************************************************************/
 
-/*
- * Some 5272 based boards have the FEC ethernet directly connected to
- * an ethernet switch. In this case we need to use the fixed phy type,
- * and we need to declare it early in boot.
- */
-static const struct fixed_phy_status nettel_fixed_phy_status __initconst = {
-	.link	= 1,
-	.speed	= 100,
-	.duplex	= 0,
-};
-
-/***************************************************************************/
-
 static int __init init_BSP(void)
 {
 	m5272_uarts_init();
-	fixed_phy_add(&nettel_fixed_phy_status);
 	clkdev_add_table(m5272_clk_lookup, ARRAY_SIZE(m5272_clk_lookup));
 	return 0;
 }
-- 
2.51.1



