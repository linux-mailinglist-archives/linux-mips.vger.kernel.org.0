Return-Path: <linux-mips+bounces-183-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9469A7F4F6A
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 19:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A5C928139E
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 18:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AFB5D481;
	Wed, 22 Nov 2023 18:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IruV7NVz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D2410D5;
	Wed, 22 Nov 2023 10:24:36 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so984031fa.2;
        Wed, 22 Nov 2023 10:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700677475; x=1701282275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Du+BFHRvMyqAEjBg6RSkcIbKkpwDLrCm/CbvmyChoXU=;
        b=IruV7NVzKskCqLWX31NWw9KJ9LqADYT1YUG7em2E7u+vp2MnnDrDoh3jelpnQ8/msS
         U88F8/4RrHwgb5T3JtdPF55JsyCNkRgtMVut6OkXz1etB28E3uRGn5TBFoFuZWGbvHj3
         gWcAJRFML2huyZwMEjfT0twK6ywZiomuf+KqQ996BBqLeL8XtgfaRFIWl9k6unXC4O3E
         awP16Xxb/Zpkl/MN7Tsxu9j1OZMrF5GB/sVrjA1uNXkxhYzATM1mlfHeRXAMZiv9vqiC
         Bg2qBY1hOVJCV6cGdnPjYhWhhSI7EaREIpTWSpE52aqiXrLoNa5SL/QfG4W3m72z1295
         8Y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677475; x=1701282275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Du+BFHRvMyqAEjBg6RSkcIbKkpwDLrCm/CbvmyChoXU=;
        b=r5UGVCWDXia5Cxcn/XYt2I+3Bg5HCluctM2GC44d9b2+2beT0iXur15RrylE3+NKkL
         h5ArGAnXUE80zmzEh3iAiCOSP2VEafcgrmQcQE9sB7QkboxsOj2MiMznC3EqDtOLGFc3
         ijrpYlql91rrLS+t6Qg3VbXFrCckcBLyUL8Wic7xE/Iadam/hQEeKevU6CuipTHotcyv
         Pn3PKyw1fxSG/kvaY/h8hsuDT3td8YlN8VICaA7xpVTXdMgSUPlx5tZWbthQysO2cxyr
         2eKYOU8+/E3upAb03bB9dRxM/mbVTMhQYA4/Nb75zFnmOGFsdKgOJT7gwIfOtayWrfk3
         V4Yw==
X-Gm-Message-State: AOJu0YxkrCviWh0Nf1RQ0oGj+yYfG9VRCeFrgXafXwR4+nPpljwDB1wb
	W6nVBRGYY5kUj42jc9nT6z8=
X-Google-Smtp-Source: AGHT+IFKWUisXZgCOFxFmnquMptaMMQFLtq166qNTXQ2pfa0VVlheCvm7EXFGBwSINIn8btqNBHhmQ==
X-Received: by 2002:a2e:86d5:0:b0:2c8:73b7:5a1c with SMTP id n21-20020a2e86d5000000b002c873b75a1cmr2181439ljj.3.1700677474971;
        Wed, 22 Nov 2023 10:24:34 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id n16-20020a05651c001000b002c884919bdfsm12238lja.10.2023.11.22.10.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 10:24:34 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: Serge Semin <fancer.lancer@gmail.com>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yinglu Yang <yangyinglu@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Marc Zyngier <maz@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] mm/mm_init.c: Append '\n' to the unavailable ranges log-message
Date: Wed, 22 Nov 2023 21:24:04 +0300
Message-ID: <20231122182419.30633-7-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231122182419.30633-1-fancer.lancer@gmail.com>
References: <20231122182419.30633-1-fancer.lancer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on the init_unavailable_range() method and it's callee semantics no
multi-line info messages are intended to be printed to the console. Thus
append the '\n' symbol to the respective info string.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 mm/mm_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 3fa33e2d32ba..db8b91175834 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -827,7 +827,7 @@ static void __init init_unavailable_range(unsigned long spfn,
 	}
 
 	if (pgcnt)
-		pr_info("On node %d, zone %s: %lld pages in unavailable ranges",
+		pr_info("On node %d, zone %s: %lld pages in unavailable ranges\n",
 			node, zone_names[zone], pgcnt);
 }
 
-- 
2.42.1


