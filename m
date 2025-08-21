Return-Path: <linux-mips+bounces-10432-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB453B30536
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 22:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 977FC16D679
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 20:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF2437D5BE;
	Thu, 21 Aug 2025 20:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QkL2JzeM"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DEC37CCB1
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 20:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755806914; cv=none; b=XHA1P3/NhMdpanK202dT+hCTIyy/5NEugiXSf3jTMN6/25kEy9IcpogZAnldZTdSrfQHDFDYWi2Sh7qh+LU+voRdNGXO5eEedB7YwSUrAnGvl6rcEWva8yP92Q+OVdj4bjgBA/7yQd9BEwUoaFRoigECkyqPgQWPb+WsbUr00+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755806914; c=relaxed/simple;
	bh=SsQg42O77qinr7crb+JX5LkctmenW7x9L4AwEMidQkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhkUJ93Ydi0pGpWAMpbOYgZb70lIVsXOPzmogDbagZgL3cDfEVuOuPg76k0eNAUo5JSXxCYtRrPJdrWjdVzF+mW0dfoiAIUzAEtM20+EhdCqxusu8DrYNWiHBUrLa4c4Vh4nYAPw0VE/ZmThS68N65qCbth3GnzXdIw5IgVeIsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QkL2JzeM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yKmA6ti8X8/YIeKKq4I8EEiHVsObQn302mzSXytdc/A=;
	b=QkL2JzeMZdLWQ1PS+G1Vztu/y4a0upLbmTuCqzhhx7o2FSJmaUDzYWV3qhMlHfs+G1qBYj
	76Srl3ighlpUErqczLCegkrX4irc1Vh/CV7Xd/EvIzliqj3rddh4emmOwXh+A9cZpXkBzV
	3GITgp5rNX/sBTfbufi4u/B2eSTUT3E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-8Ikp1lpWNb657gQc3xQmTw-1; Thu, 21 Aug 2025 16:08:29 -0400
X-MC-Unique: 8Ikp1lpWNb657gQc3xQmTw-1
X-Mimecast-MFC-AGG-ID: 8Ikp1lpWNb657gQc3xQmTw_1755806907
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3b9e4f039ecso759941f8f.2
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806907; x=1756411707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKmA6ti8X8/YIeKKq4I8EEiHVsObQn302mzSXytdc/A=;
        b=qZtT6gRyiRM86iftKqsSeeFnSW6Gy8ANmNujdw0Z3j6yWdMMyJqtzvaIETEgTrpzvb
         hslxHoN0prKA8siulo+qz/63AGlTLRmXK2K7ntFT0QaYtJQhnXShaGW4lwTlRXzGit5a
         s+fa1L1jqFpR0iy4U1hGruCC/eofYB5nGZf/SJqszdI4FD8v0X5Ab+Z4gckMPDksbZJt
         MSDhIZ6l5lVJ/7vcejM3aeTnZukTi8cIFON4WopeMT7ebivkigmX5x34MTv7fLymbKLK
         sjaGZr5LQWtYs+/vaBr7shv3NAaV1xL6GmmNHCGNsDEbRPRdEgZ3uZu1QJUYE6jsMHMv
         RcHg==
X-Forwarded-Encrypted: i=1; AJvYcCX036bEKkM/4r92XjoEC13H50bkIQgH+FpDlljrvQU4Dw4jzIlQ7tQibSAlTExR0YlIC+qw6NE+mvER@vger.kernel.org
X-Gm-Message-State: AOJu0YwkuqxWnB9D5Ukw6JYOR2XLYMTMGr4HmDWp9F36adHIJqIkpEXY
	leZxeUOO5l2aEdnzejOQrJ3f+YiUMorX2T/VfnXCTkA7Z2YreAy6Mz00bAa1N2KCeY81SuXwjq+
	YDT1qYSqYYaDExV5HUEN2TOdDw2dX3h5aclZKwMagoXnbTQumNeSgo3LrVm7yY2U=
X-Gm-Gg: ASbGncudxK/Wv95V3sGlGccV9w7kpNP8MrExv1AEYURYOVzW/C6PrUp99J7oy5xosr9
	UqLdo2lg7ymgQGhShrW6aK0aawvt9XIcTtVmCkWfV6YDVO4708cH7XVK2ASjY7i3l668QO/Lzlw
	Gr0Npow78EeAvDt7APe+Tf7gYAojcsEU58po54kspa7cKW9vTJ++zHLeFHwFxSxS/f3Tg54SpO6
	qNCm1178LhtN8o9KZAFm5uI+oziZqUso9nBiHhWfe0xVIWNtl0NbhSBOZMTa21YiuTJ80pAHVUO
	EI6BAM52gZOFjqYiJdDdrLZ0/GGe6a1nTIVfOXkZexcYTBpry8L1p4VwDfCVjhohxp+MUvaQ1yM
	ioPCEyRAssxC2dM2HnfIv+A==
X-Received: by 2002:a05:6000:288a:b0:3c3:f134:28ba with SMTP id ffacd0b85a97d-3c5db2dcc73mr210113f8f.28.1755806906744;
        Thu, 21 Aug 2025 13:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFquQDwTQ7641wc0kBtooMvxSzqNfE3+XbhkCNDvunKpGE2abRVQ6uRBkb0Dc/grDWRh0uIiA==
X-Received: by 2002:a05:6000:288a:b0:3c3:f134:28ba with SMTP id ffacd0b85a97d-3c5db2dcc73mr210077f8f.28.1755806906301;
        Thu, 21 Aug 2025 13:08:26 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c077789d12sm12702699f8f.54.2025.08.21.13.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:25 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
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
Subject: [PATCH RFC 28/35] mmc: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:54 +0200
Message-ID: <20250821200701.1329277-29-david@redhat.com>
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

It's no longer required to use nth_page() when iterating pages within a
single SG entry, so let's drop the nth_page() usage.

Cc: Alex Dubov <oakad@yahoo.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Lars Persson <lars.persson@axis.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/mmc/host/tifm_sd.c    | 4 ++--
 drivers/mmc/host/usdhi6rol0.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/tifm_sd.c b/drivers/mmc/host/tifm_sd.c
index ac636efd911d3..f1ede2b39b505 100644
--- a/drivers/mmc/host/tifm_sd.c
+++ b/drivers/mmc/host/tifm_sd.c
@@ -191,7 +191,7 @@ static void tifm_sd_transfer_data(struct tifm_sd *host)
 		}
 		off = sg[host->sg_pos].offset + host->block_pos;
 
-		pg = nth_page(sg_page(&sg[host->sg_pos]), off >> PAGE_SHIFT);
+		pg = sg_page(&sg[host->sg_pos]) + off / PAGE_SIZE;
 		p_off = offset_in_page(off);
 		p_cnt = PAGE_SIZE - p_off;
 		p_cnt = min(p_cnt, cnt);
@@ -240,7 +240,7 @@ static void tifm_sd_bounce_block(struct tifm_sd *host, struct mmc_data *r_data)
 		}
 		off = sg[host->sg_pos].offset + host->block_pos;
 
-		pg = nth_page(sg_page(&sg[host->sg_pos]), off >> PAGE_SHIFT);
+		pg = sg_page(&sg[host->sg_pos]) + off / PAGE_SIZE;
 		p_off = offset_in_page(off);
 		p_cnt = PAGE_SIZE - p_off;
 		p_cnt = min(p_cnt, cnt);
diff --git a/drivers/mmc/host/usdhi6rol0.c b/drivers/mmc/host/usdhi6rol0.c
index 85b49c07918b3..3bccf800339ba 100644
--- a/drivers/mmc/host/usdhi6rol0.c
+++ b/drivers/mmc/host/usdhi6rol0.c
@@ -323,7 +323,7 @@ static void usdhi6_blk_bounce(struct usdhi6_host *host,
 
 	host->head_pg.page	= host->pg.page;
 	host->head_pg.mapped	= host->pg.mapped;
-	host->pg.page		= nth_page(host->pg.page, 1);
+	host->pg.page		= host->pg.page + 1;
 	host->pg.mapped		= kmap(host->pg.page);
 
 	host->blk_page = host->bounce_buf;
@@ -503,7 +503,7 @@ static void usdhi6_sg_advance(struct usdhi6_host *host)
 	/* We cannot get here after crossing a page border */
 
 	/* Next page in the same SG */
-	host->pg.page = nth_page(sg_page(host->sg), host->page_idx);
+	host->pg.page = sg_page(host->sg) + host->page_idx;
 	host->pg.mapped = kmap(host->pg.page);
 	host->blk_page = host->pg.mapped;
 
-- 
2.50.1


