Return-Path: <linux-mips+bounces-182-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D83B97F4F6C
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 19:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71B2BB20D45
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 18:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAAE25D495;
	Wed, 22 Nov 2023 18:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dn2gSdh0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A6610C2;
	Wed, 22 Nov 2023 10:24:34 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c8879a1570so1049281fa.1;
        Wed, 22 Nov 2023 10:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700677473; x=1701282273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrrDffuKyIXgLjHrahGVH1z8qYKZoBaB1/UsWeUkuOI=;
        b=Dn2gSdh0Ed7bGir0riAhxGH/5IKZkgRJFxHezNMqJQdxieVQIJm24ZA9o2rzMJQkq3
         fSkraeyEoy5BQHZClfbqCeuJz5L43JLIDDR3KcnuVZFLYyTt+to5o4U6GoI5yVJbaVlM
         eaCAXTyp6lM2gZt/JQFRYjUh1o3+ckjO6oFpGt0c22BzjkSgasKDH/kDUrAiHEh5oe4k
         l5wPmwozXrPtODp+iytZj1KPSNAoRw+ikoOamBFWbEExaGk7LjZRK6A0iZjNzl+LtG92
         LAqmw1mEtTa1dUwWKvE/UBD47CQs/V9AZnoUsSpi+hEB+YMoqEOMc/GR0yarVMDaazTr
         s6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677473; x=1701282273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrrDffuKyIXgLjHrahGVH1z8qYKZoBaB1/UsWeUkuOI=;
        b=IisMH87luUvOD+zg0ObK5aBCH4HlTW7WsgE/LxEZq3teOcI34K3xulHpO3qZECi548
         qpG184PhqTdg0EM23NrhGxCxzmrWDExpaqNm+7VInfXnfsHikvLEm8me4dGdz/4J0t00
         kMbgQ3IPfTHOBblIcQ3osOjXAmLJuK6yST6hPlRj4YzN3hOOext2bzJOEV3eJb7APMIn
         TA9oOrapGyENg1iFNVksb/OwfruJMXIlG/wgWiSp0gaz6GLP3e+74jvmoqLZpCR/ozyw
         J0qd+Sv1sQKvzQQsohLv8AHPKv9FJV8lNn82MhE6cfcTk4uFSCFFY2RfYXPqC1oOfw+1
         C5vA==
X-Gm-Message-State: AOJu0Yx0QTtSIluDZfJAwQWy6vAZ8t7VH4fMIXak/ZCTIkWFJ1W135LC
	hgsjorPOQLBTQ5p/9rIoE/M=
X-Google-Smtp-Source: AGHT+IHlyJFYDUK09NiVpLzUjfThYPAyTd5SkNxX1GDZ7WAcgUV7PWYzLSbmzPwSJEKgWLIIXW4sAQ==
X-Received: by 2002:a2e:2a83:0:b0:2c7:4220:56f3 with SMTP id q125-20020a2e2a83000000b002c7422056f3mr2440133ljq.42.1700677473058;
        Wed, 22 Nov 2023 10:24:33 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id i19-20020a2e8653000000b002bfec05a693sm12343ljj.22.2023.11.22.10.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 10:24:32 -0800 (PST)
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
Subject: [PATCH 5/7] mm/mm_init.c: Extend init unavailable range doc info
Date: Wed, 22 Nov 2023 21:24:03 +0300
Message-ID: <20231122182419.30633-6-fancer.lancer@gmail.com>
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

Besides of the already described reasons the pages backended memory holes
might be persistent due to having memory mapped IO spaces behind those
ranges in the framework of flatmem kernel config. Add such note to the
init_unavailable_range() method kdoc in order to point out to one more
reason of having the function executed for such regions.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Please let me know if the IO-space pages must be initialized somehow
differently rather relying on free_area_init() executing the
init_unavailable_range() method.
---
 mm/mm_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 077bfe393b5e..3fa33e2d32ba 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -796,6 +796,7 @@ overlap_memmap_init(unsigned long zone, unsigned long *pfn)
  * - physical memory bank size is not necessarily the exact multiple of the
  *   arbitrary section size
  * - early reserved memory may not be listed in memblock.memory
+ * - memory mapped IO space
  * - memory layouts defined with memmap= kernel parameter may not align
  *   nicely with memmap sections
  *
-- 
2.42.1


