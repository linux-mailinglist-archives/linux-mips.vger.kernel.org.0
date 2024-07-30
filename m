Return-Path: <linux-mips+bounces-4575-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E39A9404CD
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2024 04:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 434BF2828D5
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2024 02:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5736EB5B;
	Tue, 30 Jul 2024 02:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IMDsJUwK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210EF16132B
	for <linux-mips@vger.kernel.org>; Tue, 30 Jul 2024 02:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722306403; cv=none; b=uWfmptV2QsX9woyQP5JIYGp/q2LZ2tLwLzkavvWqasZSJo5tDtnl92oW0STHAKUilJUvEcctcn2Pz5n2KA3XwuDlRg7TkwwffcBeVZtL9TSUb9P/m7gAVFJlFHE8mcVfIsx0jupCUHLBEm7hvec5ph5WyryirgQ7NgZrHLCS7lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722306403; c=relaxed/simple;
	bh=EujhD2n1Ke7lPZKkibOLBAZurseJRlXkSsBCc47I7oE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nZHJJRIrE1X6xFY2VzGVg5gGQ5l9KelPw+Eh+oZ33cu8eSk4Fh5/U4TpkL1BVFRhTnA6lc1nNABU/NwGaEcz1Eynbx92MHfenu+Z2+OqPgWl++jgsgoHQFBeMLijcO3Aqhz8PRHeETNFAdoZdapkF9pKoaAD/aSk5Kgz0vWqbgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IMDsJUwK; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-66af35f84a3so86272717b3.1
        for <linux-mips@vger.kernel.org>; Mon, 29 Jul 2024 19:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722306398; x=1722911198; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qpjJDC2/7eGvs2TUXo8T6/AXlUgH8srqN9C/rVg09l8=;
        b=IMDsJUwKVGL1LKeXesdgNv138J0NM5gmlOVlb1jRRsdJdJmP+n80epkmZLDx9ZxlVJ
         BwaINy3SAVEQQkc6noTnuFqUnRtvruDcCQk20g57fxHFbVdx4Z1+ZKWWcxSIrccufl8I
         aYs7ZxqdhZPtN0KBzsfiQupTTaCdBwUNhyDvPu9j2VkRgF9zPbVVIPORJRiniyA8eNuj
         pceUr/DqLBVI5ZjqvKUKkm2ArZKMIAom3pHPC+AZ8bt+i0N3tYdALRaYvK75bQ4vHDFa
         N6/fAbIqULStWLJRxdQQ5pWUIqJMTOxLE/TiUTOPpb2n14NevwwUk+ZBrgjtxnVQKJ+z
         W7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722306398; x=1722911198;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qpjJDC2/7eGvs2TUXo8T6/AXlUgH8srqN9C/rVg09l8=;
        b=iB4rLIowd97aZjelBQahKVEkhppf8/I7PnP5t3MN9Aap1FCIufu+6ReIK6le9/AhtN
         ANGedsSPTj+gSi5XR6uwOZ3/jm+BOlFPDMNhxvJ6ftny6lpBIsSio30I4+y1ya5L9ZbF
         oqBqNLVz5dtd6gigq8uc5fuue4veX9qFhk/c38NgVEQyJUJe4abbOvJbZcwDE4wVj/Mm
         vWyy6RF5PAkUFujTSH2KRcYVkOij8x9VBFP8fHW+T/pY71Kbj2Lr37GSVDT1d96GjFVi
         RMRWNZh15vwiPKzBfjxGPMq0nMMGcoH1ZHcmWIx2nTnAKyA4og4nf6ubqE8irsmgvgnn
         dkMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1xyLzlXzvVKLyrWOCAhMYPvHtJebGM6q2UplUXnFO6oFEya6pf4y+F1yRDw/QzGiiUQybbPjeO4RZpoMCIyvfMkcYZdpUl2Z58g==
X-Gm-Message-State: AOJu0YzDUPTnMM2PjaWCKo1o8m0dZ7d9sAMe2JDzztpfJc4NjJMS9Xt5
	1vDMnoEpN279kYaVNKctz0KwAsDTKwb8N23knkG+q/6aIQLCXRAbGi3tgjVC2ZrqkAoKAH/XF80
	mX4pIgSPK5TK9GLVkKJaLNA==
X-Google-Smtp-Source: AGHT+IHxQctUGKYgd5oy7kYkF4T9KZlsamRVSF7Lno+W8mdbELZDi6ZWUht6vp6IR2OIsIspamJFWs+eE7Qt6tSYEw==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a05:6902:154d:b0:e03:589b:cbe1 with
 SMTP id 3f1490d57ef6-e0b545431eamr671930276.7.1722306398655; Mon, 29 Jul 2024
 19:26:38 -0700 (PDT)
Date: Tue, 30 Jul 2024 02:26:09 +0000
In-Reply-To: <20240730022623.98909-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240730022623.98909-1-almasrymina@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240730022623.98909-6-almasrymina@google.com>
Subject: [PATCH net-next v17 05/14] page_pool: move dmaddr helpers to .c file
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
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
2.46.0.rc1.232.g9752f9e123-goog


