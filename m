Return-Path: <linux-mips+bounces-4715-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F18C7948462
	for <lists+linux-mips@lfdr.de>; Mon,  5 Aug 2024 23:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 756D11F2288A
	for <lists+linux-mips@lfdr.de>; Mon,  5 Aug 2024 21:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146FC175548;
	Mon,  5 Aug 2024 21:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N26J2b1B"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2654170A35
	for <linux-mips@vger.kernel.org>; Mon,  5 Aug 2024 21:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722893152; cv=none; b=ULrfOlf+RYZKY/OsLZdM0+Yk6ORy3ew+3DXcEvEuWDB08B/NRI7OlkQUqNJpxJWQyXCzpNvjbvChkgikpiDGa+WGRfLPZuXoAsfdIeE8Gi8zbgdPalY+saZ6uEUKrTILT3tQ0oDFjfdqz2ct1nSd20O+O79XGj8wmN3RGaGIiYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722893152; c=relaxed/simple;
	bh=SEtUnK8+OM0gH2BEoVfPNmeqZZM4a6RSsugC4rHdHVk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WjBRCYqk1IsnnbtcCt0TlISEwEgL7z6z9t0vaGDOZ1uND6ADEuX9ExXiBzhKsxJJCOd1lYO0eN22YoSYMT9dBOJQiJbjeQH+oAyV11RpIzWvKx0lKiJVV3WYNjyjBP3n5rqm4y24kQWijk4wDlXdldNUHOdhje+9k/VQz5/UpyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N26J2b1B; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e0bfd36cda0so4129956276.0
        for <linux-mips@vger.kernel.org>; Mon, 05 Aug 2024 14:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722893148; x=1723497948; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QW6znr6cHM2mLazuqMq5oZLiE4imdB81XfOOoj9JCCA=;
        b=N26J2b1BNxGeUfJNA9NH4EXOPLLrTH+ZzQQk9ss/0XrG0KmwM3jodq3rYSlyxXX6Bh
         Z80RIu/NPK/3QmhX0xgzeyFbGFPAH5vZTFsVCYDeDQ5kkSHa6S4ZNZxIoIWDI9NIuMVn
         yvLO/RH9xkYs8JeRDaIUydQAohrn6yOVz8fOblreBnNkPUydLjFaJcuu5Gx9fAVNviTn
         2qreSp6kwsGfz+yvOSx9SgBf7Fv8ZX+5L3ufzp+ttciOuY9ATsrAuOVxPvigiWKqL4Ed
         pCIEHi8NySaqMaA7egfcqlaZZ2AxMVzMivvtqB349edeOmjR/Z5hY4LnuF3E24Dp/ump
         KryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722893148; x=1723497948;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QW6znr6cHM2mLazuqMq5oZLiE4imdB81XfOOoj9JCCA=;
        b=tdwaMIZE6GzQja+8CRPCrszhMbImeDkcsOefSoHqQYc3Q5f0gJqpOtvxDG88/XnKwe
         xtB2ZBcn7kooK1sglhLUa3HacO9O1VrMJ3dEqiThMOcylhTmfIedbDrOmI+zjxeK6J8u
         TRxjdocfPYqNOFytAybNnYoL0ouHf0rZAx0x6IyrSIHYeUnepNWrnVDJY20cFGF+djkS
         Vr/OF84iIeB50nM18aZabVqBX5gMo3WYlOjWkiONFyOj3ykhLAOvKt2Np+qMQk8pFqQ7
         Q49QNGO6ckLtNi+uVebc0G3uv+JC9bQPo36EgR8x/6vB29Xa3xrbzWLEPcdKjFErkwdK
         jaWw==
X-Forwarded-Encrypted: i=1; AJvYcCXkkDYumFLz+wnoDhLPvq33nXgJ/D/6qEGmnjSMwpfWV3nwBur691RkVjbGv6vCd8aipGqT2PHa4jsz6OP8Ed4eWqkjPs2dB+AN0A==
X-Gm-Message-State: AOJu0YwZRBWotj1yACnqs1IkDppghWlSNcuaZOtEJcO+OrdRtJtaEob+
	F1wKOSE52iZ3pKH7YZpPL0Zt8n1NaNACoMYJoqWYPDXrw73Z4B5Q0nvVvm6vUq11hwsiR81T7S4
	ycCgi2qpH7uN4r87gqljBgA==
X-Google-Smtp-Source: AGHT+IGM0VQldIgmGiiNcNzkJRa+4J5mNVfUsyPhF6k6J1KRuCnYcR6TSrWhZH6dNRSaQlr0Wgsdage9M4NVq4x2xw==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a05:6902:154e:b0:e0b:acc7:b1fd with
 SMTP id 3f1490d57ef6-e0bdeb3e00bmr340566276.4.1722893147755; Mon, 05 Aug 2024
 14:25:47 -0700 (PDT)
Date: Mon,  5 Aug 2024 21:25:18 +0000
In-Reply-To: <20240805212536.2172174-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240805212536.2172174-1-almasrymina@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805212536.2172174-6-almasrymina@google.com>
Subject: [PATCH net-next v18 05/14] page_pool: move dmaddr helpers to .c file
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"

These helpers are used for setup and init of buffers, and their
implementation need not be static inline in the header file.

Moving the implementation to the .c file allows us to hide netmem
implementation details in internal header files rather than the public
file.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---
 include/net/page_pool/helpers.h | 30 ++----------------------------
 net/core/page_pool.c            | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
index 2b43a893c619d..8f27ecc00bb16 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -399,17 +399,7 @@ static inline void page_pool_free_va(struct page_pool *pool, void *va,
 	page_pool_put_page(pool, virt_to_head_page(va), -1, allow_direct);
 }
 
-static inline dma_addr_t page_pool_get_dma_addr_netmem(netmem_ref netmem)
-{
-	struct page *page = netmem_to_page(netmem);
-
-	dma_addr_t ret = page->dma_addr;
-
-	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA)
-		ret <<= PAGE_SHIFT;
-
-	return ret;
-}
+dma_addr_t page_pool_get_dma_addr_netmem(netmem_ref netmem);
 
 /**
  * page_pool_get_dma_addr() - Retrieve the stored DMA address.
@@ -423,23 +413,7 @@ static inline dma_addr_t page_pool_get_dma_addr(const struct page *page)
 	return page_pool_get_dma_addr_netmem(page_to_netmem((struct page *)page));
 }
 
-static inline bool page_pool_set_dma_addr_netmem(netmem_ref netmem,
-						 dma_addr_t addr)
-{
-	struct page *page = netmem_to_page(netmem);
-
-	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA) {
-		page->dma_addr = addr >> PAGE_SHIFT;
-
-		/* We assume page alignment to shave off bottom bits,
-		 * if this "compression" doesn't work we need to drop.
-		 */
-		return addr != (dma_addr_t)page->dma_addr << PAGE_SHIFT;
-	}
-
-	page->dma_addr = addr;
-	return false;
-}
+bool page_pool_set_dma_addr_netmem(netmem_ref netmem, dma_addr_t addr);
 
 /**
  * page_pool_dma_sync_for_cpu - sync Rx page for CPU after it's written by HW
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 2abe6e919224d..a032f731d4146 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -1099,3 +1099,34 @@ void page_pool_update_nid(struct page_pool *pool, int new_nid)
 	}
 }
 EXPORT_SYMBOL(page_pool_update_nid);
+
+dma_addr_t page_pool_get_dma_addr_netmem(netmem_ref netmem)
+{
+	struct page *page = netmem_to_page(netmem);
+
+	dma_addr_t ret = page->dma_addr;
+
+	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA)
+		ret <<= PAGE_SHIFT;
+
+	return ret;
+}
+EXPORT_SYMBOL(page_pool_get_dma_addr_netmem);
+
+bool page_pool_set_dma_addr_netmem(netmem_ref netmem, dma_addr_t addr)
+{
+	struct page *page = netmem_to_page(netmem);
+
+	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA) {
+		page->dma_addr = addr >> PAGE_SHIFT;
+
+		/* We assume page alignment to shave off bottom bits,
+		 * if this "compression" doesn't work we need to drop.
+		 */
+		return addr != (dma_addr_t)page->dma_addr << PAGE_SHIFT;
+	}
+
+	page->dma_addr = addr;
+	return false;
+}
+EXPORT_SYMBOL(page_pool_set_dma_addr_netmem);
-- 
2.46.0.rc2.264.g509ed76dc8-goog


