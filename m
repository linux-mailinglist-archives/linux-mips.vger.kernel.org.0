Return-Path: <linux-mips+bounces-11913-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 34556C1BC00
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 16:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B99BC5C60E2
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 15:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9778C2D29A9;
	Wed, 29 Oct 2025 15:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtATPkDR"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFC71EEE6
	for <linux-mips@vger.kernel.org>; Wed, 29 Oct 2025 15:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761750213; cv=none; b=IyedET0wNCsBsxG+14r/Kp0YoQYfasGE9SIHgNox5K/zHeOBvcGvhsDU4gmWJgCdGJ1CDGisHcLAcfCzcWFr9lbMQFL0azjAStS1ghAnu8iP/Rlbdkt1cdnklM/ILJ00uZPioZ3pwC0nNI7FMbNuC1/9yXdU+l5tS2dVYl6IA+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761750213; c=relaxed/simple;
	bh=HtevJgoFY9ZJXXVp62LsRv3QeAdG1uCJ5U+JMpp3nXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FPGl1OplYHioFVDsf48j+5m8WnCnEUIgSTBBEuxkrsFPsT3UzRvsrquK2gkPzwv7sJI9cSkzBdwDV5p8bjADb7leK1gY4+Scl75xJgwiqinPu1Pcc2DrtTykqYrfEAslqVurjg6JrRy+5W/FrJmVGlFU6IVrSR8VvCPPwVBH/eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtATPkDR; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42557c5cedcso4671098f8f.0
        for <linux-mips@vger.kernel.org>; Wed, 29 Oct 2025 08:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761750210; x=1762355010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/eGw/S9fL+3KMXolbixXBawr0Cg0kdkrfB1puX5CgEw=;
        b=HtATPkDRD16WYM+c8sCGicuRseWqyOcy6fwW5iEbeXKUFs5RqXA1Ak0vRF52uJCLgt
         ilp/4YbwnNVtJ6ktheLDCn47+5d2sNWidRZv6ZBO+zloiaVb53oWQlwEhNj/CjMB8reP
         AlVJPaFODTq1JkgGPzuzWbWlnc97HUiwFaHRFqStK9OnMyhVBzv6YOrV//BuzKJKX3/v
         BasqqH/CIwX9B2YsJzMz6eGGz8mBl4wELJXsrkXaR+KLjV1sLK9yoEKBOek4PFrXcxlY
         xCF7Y/sd6YxTsYHfOL47mR9xqFCIEnWcUZIftn+svHMJn7PSUVvKX/rC8bU6GGeRxIcN
         Ll6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761750210; x=1762355010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eGw/S9fL+3KMXolbixXBawr0Cg0kdkrfB1puX5CgEw=;
        b=PaztBvrUiL+oFUveapWw0+xbVyhjbMxJvwpYwwhr8dvOp0f/gCmbdKFOxaTihMDOSD
         /Os+vo31L9cvL7i/LbnQr8cLXBgchj4+Zc1EdbLyekqevP5n6z+5tnRvKXDZVylRaSn7
         XWG0QPs4bdxmFChxxWMmM4c5TDuEmRFOg/bx01C3Bi+Vv4qa2LDAaR4z4QMRIMu/vTvO
         vCxRoDBqbb5ZTqHUbHQCgl1MCHOg7QOtv9Jv2L3VcPhr8PTQNiyzFqWFTxegGLgZd8bb
         +/AqiZSS8h1QdBS7ziUWvoaErjVfLeVYFx1WRQ6lnpV5mOjTKQ4/Mz7agYMpj7WCXzAP
         uAJg==
X-Forwarded-Encrypted: i=1; AJvYcCVsZuajZG4mUs/pEhtoBpOCH9XB/tjdNmStBDcIqMI5f4omQqgNx7KtWzGdMvdOvC9kwucU7YHvOgPp@vger.kernel.org
X-Gm-Message-State: AOJu0YyyRHj+UvOkYZ7VKqvkTh9Vefx1ZxXQvWDjpnDKq6oYxq8lynFw
	zL1/NeSBWbUD5zkm+nTPwVHy9gtOPpW/Y5M3PWHbqFUBrZ7jLzvohYrJ
X-Gm-Gg: ASbGncudK6D/r1Q7Lg9Mwj0isjVkJTtPGDXE2btbxnkf11b26IpZ0pKjh1Lk9S6z5nb
	EQ5eOAeHNgcRlf5v7d2zgl2HQS3kbnj30JDC9sy3CFQHBJCZKIUq3naUEQ3nx8zEQL73aEdHcS0
	1pj5y4mfMl1w31NJGgVUuLMqPC8k3J30aZVOFE/MPr+6f37AsEPrDtlWZmeomiVy2LcxRZFA9RY
	/HtFLgVd+THoUKORcg0TeWZubBq/OXsAXd1K9KPLtutrkTRjq3+1AG8FLOGbIxtcSp28p1/umX1
	JNmcQrgdRpJdVxFaXP/RtlYxZNoSjDcbaTfVyF+VJ2yVD0Hs3nHhrf/B/ET/h5ZGHaRlXNOQSU9
	MlOhshj47Fc4tndiCqEYqvpwH96C2bmNmJyiBpa42DD7X6W9wI1j50phMFuUkxhMhyL7V3rXahM
	3STOYqeI79kvcJj51BzD9LXTyOr9C3ADQH7eJyrrjVqnKHYxeLDF6Y1Nqzjh6BAi0NbASm
X-Google-Smtp-Source: AGHT+IFngucxs3wXaIkWr4nm+xkyYTCdQFAZf74Vaxa80PQbOMHFlSoSvJ3gwKBogd+WW/i490lUNw==
X-Received: by 2002:a05:6000:25c8:b0:426:ee84:259e with SMTP id ffacd0b85a97d-429aef83047mr2790964f8f.24.1761750209837;
        Wed, 29 Oct 2025 08:03:29 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4771843eabfsm46254015e9.2.2025.10.29.08.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:03:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Alchemy: Remove bogus static/inline specifiers
Date: Wed, 29 Oct 2025 16:03:16 +0100
Message-ID: <20251029150316.2522555-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The recent io_remap_pfn_range() rework applied the static and inline
specifiers to the implementation of io_remap_pfn_range_pfn() on MIPS
Alchemy, mirroring the same change on other platforms. However, this
function is defined in a source file and that definition causes a
conflict with its declaration. Fix this by dropping the specifiers.

Fixes: 8efb51ad1b05 ("mm: abstract io_remap_pfn_range() based on PFN")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/mips/alchemy/common/setup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/alchemy/common/setup.c b/arch/mips/alchemy/common/setup.c
index c35b4f809d51..992134a8c23a 100644
--- a/arch/mips/alchemy/common/setup.c
+++ b/arch/mips/alchemy/common/setup.c
@@ -94,8 +94,7 @@ phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
 	return phys_addr;
 }
 
-static inline unsigned long io_remap_pfn_range_pfn(unsigned long pfn,
-		unsigned long size)
+unsigned long io_remap_pfn_range_pfn(unsigned long pfn, unsigned long size)
 {
 	phys_addr_t phys_addr = fixup_bigphys_addr(pfn << PAGE_SHIFT, size);
 
-- 
2.51.0


