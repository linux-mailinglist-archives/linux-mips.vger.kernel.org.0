Return-Path: <linux-mips+bounces-468-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D5D801C61
	for <lists+linux-mips@lfdr.de>; Sat,  2 Dec 2023 12:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A08351F211AE
	for <lists+linux-mips@lfdr.de>; Sat,  2 Dec 2023 11:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104DC16412;
	Sat,  2 Dec 2023 11:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLWynJYZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4184198;
	Sat,  2 Dec 2023 03:14:52 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50be9e6427dso261994e87.1;
        Sat, 02 Dec 2023 03:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701515691; x=1702120491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1T4NHCKaEUJcD00hRH2cGzkJVzfRK4nR9CtS9DswDWw=;
        b=ZLWynJYZqs1lHeaNgkBKy4vWVZ0nmHjrnx/qKSxjxNzIdYwgwg/Xxz6lM/+WbrtVi2
         OFnCFdmhD0bjMvM0WR8Rc2+Fl4/OlHz4Jcb3NCq0XEq41xU6/U0vDQIAqpSAJLlOKwyo
         p445N2Kv/3o8zgsLSBMtp1rt08G+fR56EBssOxmkjEieKKG2ESFkX1g2P3jaDwKl8fEj
         p3YZnw0jdlSET/DBPIwcQPkvmFTG0Jb0um45otdW2qP70I5hIG2lyCiaqiHMqHiFHLUx
         qJkKykUY+gzslby3cUyamaBYRixsq5DSJT23rh2W6LKBRA2VqRl7El6H5TwODuM7p4W/
         HMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701515691; x=1702120491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1T4NHCKaEUJcD00hRH2cGzkJVzfRK4nR9CtS9DswDWw=;
        b=CRxRjgZhO+qDHjKueDqgjcT7/dy9HS/DNz0clSwnllVCdSNHwYhlxC7dl4JjubvUcP
         gqn/aRHiCthu5IfgbMA5PqLENX3shSaEReMK6WqVYoSIvoP98td7A5hljDey5ovfGdDn
         3L46RyJgiq/tcFqRVkFeIMG0aTTwZefhenDBJ2AaZyCvoC0WUbXtvdA9pjSWbi/to8vy
         aL0U7EotBwB8i4pUSJ46r/leDjTaAGD8A4QB8G71weZ1aTySYwq4yNqQf/Y5H3TxA5Ai
         D9IEIuCd8GpW7Bji7TyqOcZ3sYZUDZYNKT+h4IPswqy9uEFJWLHPBx9KtoLHdnrM3i+g
         rxRQ==
X-Gm-Message-State: AOJu0YyNqEGM7IsVnMCK3X79HkNk8oN0UNwmmsHOrFKJYlWUVGhgX8r8
	ntUZUIsE/l8LmJEVpGbwea0=
X-Google-Smtp-Source: AGHT+IGCOXEU6dk6EGZWe/MP0XMGJO+yiD5xEQj5BjaTp5rOtf5nyoi67HG1zxO63b1IPn8ZI6EKlA==
X-Received: by 2002:a05:6512:2316:b0:50b:d764:801d with SMTP id o22-20020a056512231600b0050bd764801dmr1888678lfu.80.1701515691032;
        Sat, 02 Dec 2023 03:14:51 -0800 (PST)
Received: from localhost ([95.79.203.166])
        by smtp.gmail.com with ESMTPSA id b27-20020a0565120b9b00b0050aab07eb9fsm200142lfv.139.2023.12.02.03.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 03:14:50 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Serge Semin <fancer.lancer@gmail.com>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Baoquan He <bhe@redhat.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Yinglu Yang <yangyinglu@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Mike Rapoport <rppt@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] mips: mm: add slab availability checking in ioremap_prot
Date: Sat,  2 Dec 2023 14:14:22 +0300
Message-ID: <20231202111430.18059-6-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231202111430.18059-1-fancer.lancer@gmail.com>
References: <20231202111430.18059-1-fancer.lancer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent commit a5f616483110 ("mm/ioremap: add slab availability checking in
ioremap_prot") added the slab availability check to the generic
ioremap_prot() implementation. It is reasonable to be done for the
MIPS32-specific method too since it also relies on the
get_vm_area_caller() function (by means of get_vm_area()) which requires
the slab allocator being up and running before being called.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/mm/ioremap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/mm/ioremap.c b/arch/mips/mm/ioremap.c
index b6dad2fd5575..d8243d61ef32 100644
--- a/arch/mips/mm/ioremap.c
+++ b/arch/mips/mm/ioremap.c
@@ -72,6 +72,10 @@ void __iomem *ioremap_prot(phys_addr_t phys_addr, unsigned long size,
 	    flags == _CACHE_UNCACHED)
 		return (void __iomem *) CKSEG1ADDR(phys_addr);
 
+	/* Early remaps should use the unmapped regions til' VM is available */
+	if (WARN_ON_ONCE(!slab_is_available()))
+		return NULL;
+
 	/*
 	 * Don't allow anybody to remap RAM that may be allocated by the page
 	 * allocator, since that could lead to races & data clobbering.
-- 
2.42.1


