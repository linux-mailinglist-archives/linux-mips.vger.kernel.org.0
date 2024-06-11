Return-Path: <linux-mips+bounces-3566-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3875E903A24
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5AA61F23253
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F39517B509;
	Tue, 11 Jun 2024 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAc5JQ78"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A3C17545;
	Tue, 11 Jun 2024 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105538; cv=none; b=OOetfJeuBNr5sCU3q1ej+2FzCnClaDwmomtt/qCkdzH26Yn9anJX4NWHkAj9TeBQNGGkGL5p6U+vM9tJEbQWFPKIP9HzweFaMLadxD5CGdbigsJy+XlbyrdNKrWWLgHg3WHF7/vmLWA+fKekrzHf6ZoYnp2IP3Khuym+WJKcF1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105538; c=relaxed/simple;
	bh=KYM3RpgXB+bRDfX9kBzzB6kmbYZ7NlFFZJ/83yFFCno=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AiEaRW1W58WOyWvL22E8itiBBO7/lNifl/JnFlsB0F2H9yS9xOXvq6jYSwVXzC5GpAikQybFRsBiIiB2fObLeza3CCsK+EbJtRHt8Dt/BXu8DWc1j4yl7sx0dLOSkN7pUvhqnxk/JYky6wCKBrFpjyS4cNNlW9aAjNuwzcn2ZcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAc5JQ78; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42133f8432aso6788635e9.3;
        Tue, 11 Jun 2024 04:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105535; x=1718710335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clrALCvP0Lnnrc9ChxXlKIuUYraQmBIpiwyzFSMJ4E0=;
        b=FAc5JQ78H4IKd4zPPq9+X3TuRBwduBAW9SHyNpMbDJN9ddmePRBb4YCfkj7P/rT5Mj
         J0gwqOEnHidAJ2edTh69YPac0DyE+sCUoNtGTYWpc0VVF1UNsBdiZDyBoW1PX+3uTZCh
         RXAAqeqC/HSBraBA/8h4DeigXQXYJjCnnMKgFbrlQLzz0N0W4RJQHwLIzNrJJGMTnAWq
         3jfBq6T0r26vXl9H4AFtPx1x6BJFB7am8lu0pySqpEvl1gFn0lUCB9VeqFKN4ksPbKlp
         oLjPnPp0FIbJxvmv1b1pWdtxdlBTLHKSzw3LzJ0mr5w6py7+YeyyA4ymmiGaD+l7A1OV
         Md8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105535; x=1718710335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clrALCvP0Lnnrc9ChxXlKIuUYraQmBIpiwyzFSMJ4E0=;
        b=u0BvGVKqn8d2l1mPKBMeDrhCx+u/2WkcnFnKT+5SHEEIlcy1RseC30wyEjWi19IU1J
         J/JZBd49Zqj02CFHXMwfLR4XRRKDPAEbvth4m8zMycSrzneyOSbF6B826IbbEdHFYZJd
         ZWZ3gJQYv0iUprQt6RlSTpcJ0kuSh5DAqJAv5UZ6T1OaFlTS1OEkBga51GCCegMVOlAM
         aB0C0J+8Be4GpF/zK/hwQouOxxN48we1riak2sEzFUGCXItvgl5pR5+xcMAIZkNwcvYv
         4X8Hhsj3FZ/o/5Egwa5s+G+ymmeGK+ehuZoyegs94N5NZRqsVrH80oqM1UNhpLDj6KE9
         qrng==
X-Forwarded-Encrypted: i=1; AJvYcCXwiiZvkkSbfABQSYV9vXVou0wSlvSUf1TXNr63MUJNVmrV3RzBMY/SgQa/KT2vbnBPDg4K7jMRu7PfvuVgxQZfFCh8NrRdyrQIP+DBOyW3p7a0EPNs5UKEvUdFQWQqgAVqwEq2DQ/0PUX6OKKHvxvXG5hwYh4SkaA/NbqYVqqVCFHF2Zg=
X-Gm-Message-State: AOJu0YxHS7Y4UYb8K7WDvnw5++Qa2zv6KGFjj9H79KwjdXrvjWcko1Lu
	r1XoeFhbafVq4ZxP543ANS0VKPsOb5tRxUBHCys/DNbsIZ9ecqiG
X-Google-Smtp-Source: AGHT+IF+Sk9O/o2G+14IsflJT/qS0GW5V1JplYzYscWpyvFgu3n0dSPLYPpPIR8X135O1QOsOuxJ4Q==
X-Received: by 2002:a05:600c:500e:b0:421:81b8:13e5 with SMTP id 5b1f17b1804b1-42218313ademr34350675e9.3.1718105535244;
        Tue, 11 Jun 2024 04:32:15 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4227467990csm2473505e9.1.2024.06.11.04.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:32:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/5] mips: bmips: BCM6358: make sure CBR is correctly set
Date: Tue, 11 Jun 2024 13:32:04 +0200
Message-ID: <20240611113209.8142-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611113209.8142-1-ansuelsmth@gmail.com>
References: <20240611113209.8142-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was discovered that some device have CBR address set to 0 causing
kernel panic when arch_sync_dma_for_cpu_all is called.

This was notice in situation where the system is booted from TP1 and
BMIPS_GET_CBR() returns 0 instead of a valid address and
!!(read_c0_brcm_cmt_local() & (1 << 31)); not failing.

The current check whether RAC flush should be disabled or not are not
enough hence lets check if CBR is a valid address or not.

Fixes: ab327f8acdf8 ("mips: bmips: BCM6358: disable RAC flush for TP1")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/mips/bmips/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index ec180ab92eaa..66a8ba19c287 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -110,7 +110,8 @@ static void bcm6358_quirks(void)
 	 * RAC flush causes kernel panics on BCM6358 when booting from TP1
 	 * because the bootloader is not initializing it properly.
 	 */
-	bmips_rac_flush_disable = !!(read_c0_brcm_cmt_local() & (1 << 31));
+	bmips_rac_flush_disable = !!(read_c0_brcm_cmt_local() & (1 << 31)) ||
+				  !!BMIPS_GET_CBR();
 }
 
 static void bcm6368_quirks(void)
-- 
2.43.0


