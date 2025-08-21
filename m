Return-Path: <linux-mips+bounces-10406-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B819B303E1
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 22:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B92D601E06
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 20:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC27C34F474;
	Thu, 21 Aug 2025 20:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LlYcNvG0"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BEF350839
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 20:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806840; cv=none; b=byIvaljT9smHvFh8r6qOebQIQi1jTRUs5Po1mGbbghMGrI1y8kOfrmfi+3KgcPzcSkoMl7UWXVgrR131jE43fyowoyFMiz4x56UJ4dnjBp5tjszdGNW82Z/K4/zYq8RQVjW6ESM8psKuuYawQyjjzD9dBGwsKquHJ0Gfgb4tM94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806840; c=relaxed/simple;
	bh=3FOM28sJXvbUF2Tn/5jLCVekviR1dLu1+OtM4m//AQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXZyQnLN+bskkavXphByUnpF/8HOk1C/+0sn+h3XWAVvVGuvcUzhg5G545P7y4ktpI7tjjgHsf/iGseQngALNp7V/S1lGxHYdPh1HOzn16kK5TqSpYC1ryeJuDG8s6PQBxwq9/Ukhq680/xrpMCiZiLLeAYnoEdv/q4/VbtyPCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LlYcNvG0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7sWLap5u4LkaWlbSo2T/W3JLtp2tuveUv2Z9sucaeo0=;
	b=LlYcNvG0ydVhuIdTc4cwT4QFmqxdNzApweG+MDPAmVTB3PDeJzHsu6i8rolvAksXy21lNw
	TSd/YTUJOj50Pv620MtxDelingZZ7MdGCy/+v1RphPyKy/i31EyaR7D1LGHvNSFQgra+uw
	m+APHSYmz/xNgAh/dN7d698YOR4NckY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-I_ezqwyxOXuOJNBpR2Fn2w-1; Thu, 21 Aug 2025 16:07:15 -0400
X-MC-Unique: I_ezqwyxOXuOJNBpR2Fn2w-1
X-Mimecast-MFC-AGG-ID: I_ezqwyxOXuOJNBpR2Fn2w_1755806833
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45a1b05d251so7730665e9.1
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806833; x=1756411633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sWLap5u4LkaWlbSo2T/W3JLtp2tuveUv2Z9sucaeo0=;
        b=GREHfA3wAGWyYinpEr8D40f/mChQPPY6HksAGP0qN1qOhFhAZLC3ljaf2lEDUhBpJC
         MKFOC1VoC+dCiaDwxYfcS0dlJUOu4CND3OEbTpT4sx6OP+2zfZY6JnuTQUEkHHU0aqjX
         Xgg3IlkK8Cgoy0u+6CsasI7ippniRRkyozSe2oEdlrBAIsQpSXvxmu5UWJsLoheQNEJ9
         3RelppB8x8VldLC+n1YMFJO2iLm2asxvzjAfepSh0D1dGjpDQG+VzWCGrUS6TScmhuvy
         tCSo3YHFdVg0YZux8lxznxSTtXGLasKagAhgLEwHxGOIw6NQOHugM5BSBuLgsHMqViP0
         /GOg==
X-Forwarded-Encrypted: i=1; AJvYcCXGi78O9YBytDXG5V7wqOkk1Rjb5ZLZq6FDX9WSPQDMjDsBW0vWf/bvoQw4KhwJAm5Yenfx4zdeQiVk@vger.kernel.org
X-Gm-Message-State: AOJu0YwtfuMqoTdxji6Nc3nIyPJDDrENyi4+cmNVh7oRJEK08V0Iq802
	Fbo5E0f5KSo+gD+8YqSJLhfYhPhtFAYFGHXiSlGHHPPewhrxxGC87lly+hkKvVKWbD6G6hrelsY
	+X210sWWBGBwFuv7pZy878nDVHcsaMnYMK2kHt11KWSYUSVLJZP6o3VOvbABQClo=
X-Gm-Gg: ASbGncv3YUk6GXdyu8Xgea0DKyD/DG7SLxAS7r+4zOzjJnWVH0qSV0rSRH23+fXG5UD
	4Pe2+bVOH6LjW+moITCScsueTP4A6EtKrY1ITafykmVDv+N2B1EqVtj1q5+7NPXNuZdxycq1Qzq
	hHDn+CXpwcJ2ljuRMgogFHG0hGcXRvhhGk+nbugVfW76OE3JXik+bAVUBD+TujlHd163pNYcHb/
	Zxek5cpug7AdILRHAbHcEfe7jrDKD/hmb3uM4arN4bz+xKJcxvOXneQpEQ8kq+p0PqxpDPGQU4R
	gsWFVIw1y0zpnQJD1fH7V0XA3jL6lEkEeez25hGhF4myn3p+VYCCym/vlluY+PIBY5Mdj9jIlBU
	jg2V2i74SNgy4k9hGBlrTew==
X-Received: by 2002:a05:600c:1d06:b0:455:ed48:144f with SMTP id 5b1f17b1804b1-45b5179669dmr2598285e9.14.1755806833350;
        Thu, 21 Aug 2025 13:07:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSutx6qbatKffMJ28UfT2ZDXFlSv+vNq81oYks3KAGI73zxxTWKo8ClwQ/mmPq6W0wDfVQow==
X-Received: by 2002:a05:600c:1d06:b0:455:ed48:144f with SMTP id 5b1f17b1804b1-45b5179669dmr2597955e9.14.1755806832889;
        Thu, 21 Aug 2025 13:07:12 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c0771c166bsm12916801f8f.33.2025.08.21.13.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:11 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 02/35] arm64: Kconfig: drop superfluous "select SPARSEMEM_VMEMMAP"
Date: Thu, 21 Aug 2025 22:06:28 +0200
Message-ID: <20250821200701.1329277-3-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now handled by the core automatically once SPARSEMEM_VMEMMAP_ENABLE
is selected.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arm64/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a64..b1d1f2ff2493b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1570,7 +1570,6 @@ source "kernel/Kconfig.hz"
 config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	select SPARSEMEM_VMEMMAP_ENABLE
-	select SPARSEMEM_VMEMMAP
 
 config HW_PERF_EVENTS
 	def_bool y
-- 
2.50.1


