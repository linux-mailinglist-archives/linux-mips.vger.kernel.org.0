Return-Path: <linux-mips+bounces-5063-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1DF95E13A
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 06:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0464A1F21E32
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 04:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B916F2E0;
	Sun, 25 Aug 2024 04:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QiCnD/sV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5FC17C61
	for <linux-mips@vger.kernel.org>; Sun, 25 Aug 2024 04:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724559333; cv=none; b=GmTLR/E4SsPfohrK7Ek0KL456+5AwrxR9aUsoKRY/eH3QHAxKOpYaL9MfJpNvYAw5+9wRY8sAZAI+wlh6oKiOMJJGdpz+8kyxJxAUFGtHSIef2cFS6FZv2gYROm/5PTSWxTv1qo5ACWHFqFqB3lme0/reA/dM/Ffln3nzqEJz58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724559333; c=relaxed/simple;
	bh=6n7vgNaQA5VbZnYe1tlSXfeyTcxf7vl+pBlHZC1ER3E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G1PDtgquVzrQlza4qgAOA9CLdSLdjHqLXm//++dYXgzCwofvLIegE26+5kBqawcdA0tnOxePSj3iPgbgxTCP+iqct6RFWJQNh+ddlqkno5XFVGdKjcfDrjQF/eyZhrpepEJOJhdKMiRuZi/ZPpUp3DlV2tmpBBRW9cp6p/0OPvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QiCnD/sV; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e117c61d98cso4449757276.0
        for <linux-mips@vger.kernel.org>; Sat, 24 Aug 2024 21:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724559325; x=1725164125; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gC14bSn9nIk/1KhOXZdVWzArlPoGrShi4ykhdecJBd0=;
        b=QiCnD/sVhACklN0eV+s9deIRGTURe0lVIMYDOO8hjHWOl3kYKVRNuV3PyFgKOf0WLJ
         g9zm6ptPVbcMX1BJWYS2aRUgO1YDWRpmhTrDJQyBPQS06NWJCOvWTbCFnxBErbmdZzFj
         pVhcYB2a6o/Y6MOkcWYQkm1R+hJ1+bILD+mHCjPufnnXvDVKr8roqNOe2qgx95Kh07+d
         q7A43PRkEwpGlFDMO00VFYAO2eSjciKVVB1RbZ7z0GMqVxCrveTNj2hEfQQc/unq7s8U
         ChgH9uNbNh2IHEZO6Mb0Q7nBaYVttDjk+w/rQDrI3OeidrF/bepoa7ZwPwk5TeXQHMAQ
         rEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724559325; x=1725164125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gC14bSn9nIk/1KhOXZdVWzArlPoGrShi4ykhdecJBd0=;
        b=NneFnF5uplE6YziYjrRDlbVchl1qLFcAdUiUqRX1ZUQAJYE4wpZbGB3Oz6lmwkxzAN
         HK3sOm//W3sxyml6WYHzmLUv82dRbB+yma9wJ4B7XaK/V2lW08cAVx9zlRg+HY4cztEV
         ytmxUH12QF1a35pDQVJ8RC1RYfamHsaFcqFqVPTP4hKNYrPrPe3+3H+IcRD72DfOoqwH
         jibyMZW5oB4iCmSCq4xA/kombFA4ww2QeZ5T6bbycog/GtfeMq7a5nSLLufTtTUORajT
         a7H+x468oukkW4x+vuVuEQCgvhWsQhMxLDPH63j/1ldpx7lou/m6mP4oNa47K0txCYnu
         D9Og==
X-Forwarded-Encrypted: i=1; AJvYcCXL1VtDO+xvjxgInwqg9/gqZiZCUtiCv2rN2rZ7NB7mIZZw+nRgw4ZUixDArpZF0EgIX2zatSDVx7xO@vger.kernel.org
X-Gm-Message-State: AOJu0YwUIQ+sc8Fmu6jKD+2oyq9bKYjneHN7xQ9dMYxUh1bQvcunxN0o
	mFGy4ajLt6ZbeqcN0zOhvj0GpNdwsK6d6X8QjcFWn5gfwwlYyk4G1l7ZmsunTO7aVsfvWfPkZ/D
	37yj2j7vj7YKVFOLCZYTq6A==
X-Google-Smtp-Source: AGHT+IEDMKIOfGJ0be5cWCI5w9NxExZ8m0XUevK+c8zt4MfO1KNEHjWjMcWb1LKaVDudbtIl83DEZ3okh3SojTFoSA==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a25:3617:0:b0:e13:c772:5c18 with SMTP
 id 3f1490d57ef6-e17a866a769mr11053276.12.1724559325345; Sat, 24 Aug 2024
 21:15:25 -0700 (PDT)
Date: Sun, 25 Aug 2024 04:15:02 +0000
In-Reply-To: <20240825041511.324452-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240825041511.324452-1-almasrymina@google.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240825041511.324452-5-almasrymina@google.com>
Subject: [PATCH net-next v22 04/13] netdev: netdevice devmem allocator
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
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
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"

Implement netdev devmem allocator. The allocator takes a given struct
netdev_dmabuf_binding as input and allocates net_iov from that
binding.

The allocation simply delegates to the binding's genpool for the
allocation logic and wraps the returned memory region in a net_iov
struct.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

---

v20:
- Removed dma_addr field in dmabuf_genpool_chunk_owner not used in this
  patch (moved to later patch where it's used).

v19:
- Don't reset dma_addr on allocation/free (Jakub)

v17:
- Don't acquire a binding ref for every allocation (Jakub).

v11:
- Fix extraneous inline directive (Paolo)

v8:
- Rename netdev_dmabuf_binding -> net_devmem_dmabuf_binding to avoid
  patch-by-patch build error.
- Move niov->pp_magic/pp/pp_ref_counter usage to later patch to avoid
  patch-by-patch build error.

v7:
- netdev_ -> net_devmem_* naming (Yunsheng).

v6:
- Add comment on net_iov_dma_addr to explain why we don't use
  niov->dma_addr (Pavel)
- Refactor new functions into net/core/devmem.c (Pavel)

v1:
- Rename devmem -> dmabuf (David).

---
 include/net/devmem.h | 13 +++++++++++++
 include/net/netmem.h | 17 +++++++++++++++++
 net/core/devmem.c    | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/include/net/devmem.h b/include/net/devmem.h
index 02925d897aa6..7b856a3540a9 100644
--- a/include/net/devmem.h
+++ b/include/net/devmem.h
@@ -72,7 +72,20 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding);
 int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				    struct net_devmem_dmabuf_binding *binding);
 void dev_dmabuf_uninstall(struct net_device *dev);
+struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding);
+void net_devmem_free_dmabuf(struct net_iov *ppiov);
 #else
+static inline struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
+{
+	return NULL;
+}
+
+static inline void net_devmem_free_dmabuf(struct net_iov *ppiov)
+{
+}
+
 static inline void
 __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 {
diff --git a/include/net/netmem.h b/include/net/netmem.h
index 41e96c2f94b5..0fbc0999091a 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -16,6 +16,23 @@ struct net_iov {
 	struct dmabuf_genpool_chunk_owner *owner;
 };
 
+static inline struct dmabuf_genpool_chunk_owner *
+net_iov_owner(const struct net_iov *niov)
+{
+	return niov->owner;
+}
+
+static inline unsigned int net_iov_idx(const struct net_iov *niov)
+{
+	return niov - net_iov_owner(niov)->niovs;
+}
+
+static inline struct net_devmem_dmabuf_binding *
+net_iov_binding(const struct net_iov *niov)
+{
+	return net_iov_owner(niov)->binding;
+}
+
 /* netmem */
 
 /**
diff --git a/net/core/devmem.c b/net/core/devmem.c
index b2b271a921c1..d636a8b34215 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -35,6 +35,14 @@ static void net_devmem_dmabuf_free_chunk_owner(struct gen_pool *genpool,
 	kfree(owner);
 }
 
+static dma_addr_t net_devmem_get_dma_addr(const struct net_iov *niov)
+{
+	struct dmabuf_genpool_chunk_owner *owner = net_iov_owner(niov);
+
+	return owner->base_dma_addr +
+	       ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);
+}
+
 void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 {
 	size_t size, avail;
@@ -57,6 +65,36 @@ void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
 	kfree(binding);
 }
 
+struct net_iov *
+net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
+{
+	struct dmabuf_genpool_chunk_owner *owner;
+	unsigned long dma_addr;
+	struct net_iov *niov;
+	ssize_t offset;
+	ssize_t index;
+
+	dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
+					(void **)&owner);
+	if (!dma_addr)
+		return NULL;
+
+	offset = dma_addr - owner->base_dma_addr;
+	index = offset / PAGE_SIZE;
+	niov = &owner->niovs[index];
+
+	return niov;
+}
+
+void net_devmem_free_dmabuf(struct net_iov *niov)
+{
+	struct net_devmem_dmabuf_binding *binding = net_iov_binding(niov);
+	unsigned long dma_addr = net_devmem_get_dma_addr(niov);
+
+	if (gen_pool_has_addr(binding->chunk_pool, dma_addr, PAGE_SIZE))
+		gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
+}
+
 void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 {
 	struct netdev_rx_queue *rxq;
-- 
2.46.0.295.g3b9ea8a38a-goog


