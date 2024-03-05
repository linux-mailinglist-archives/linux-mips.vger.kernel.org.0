Return-Path: <linux-mips+bounces-2047-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A888712A4
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 03:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1E0B1F22CAF
	for <lists+linux-mips@lfdr.de>; Tue,  5 Mar 2024 02:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A04018AEE;
	Tue,  5 Mar 2024 02:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VI6+zijl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B758E18042
	for <linux-mips@vger.kernel.org>; Tue,  5 Mar 2024 02:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709604123; cv=none; b=oVPz0OLRGVCFHdCP/1NkAOympAWLAE6tKHxvajP9sYheEq38DzkVunO+W9HHP/ZderJ9yljZa1rtfaiHtm0z8f6xRT2gMmiTEYLzlU8J2D3EZFWI3qCrOuZ5ZOGHw/evXXt57b+mh3cLk5ZszIa0hjRJBxtpRXMHkyWwOJ1lV/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709604123; c=relaxed/simple;
	bh=VcAq+8sPLS5iB4yXv3NBRB5uIgbi5Zb5VcGf/lhRiGs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GVWP8Hk9++/XbdtT9k8wAhReiBwOCAa8sE3NHLMFpaj22fp8b0I/1qb1UVPRANvdfRRdn3WNJsvLj2yIbmIRXT3iYC3edzC6YvpolZy5iFjvL4Xn/E0bZPE3MwhVsDiCCy+6KlLArbmzCuUP2rt+HVz2427AayjpiWTxiIZ1sLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VI6+zijl; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-608e88ca078so81039017b3.1
        for <linux-mips@vger.kernel.org>; Mon, 04 Mar 2024 18:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709604119; x=1710208919; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Na1UZEy/GVYcP9OgTRpAH79YV4s5dC/8SJ0CqP6QkUQ=;
        b=VI6+zijlMWFPNIRtJUKlLNpxzccMFnH10j7gRmwN7u9DrZXxO8AbpNbb1OBWNNkNBs
         0c/d9PSACvG7cH3t8cZ/Yn5qJWS5hIOOMSd64qCiO9xS39/NhmeZtJT6ETp3vrOQWYkD
         0oJ7L3En2YzujfF8o/4utN7jN7UwdIag4Gop0VLG5w4L08ivBIGAgvzLkMwhn5OOf9k6
         nCUqxxarryKZveuao43r/g6cmEzhIaIRRAJMXrCNJtVS55NdP/AYfubm+0UkDzKHihU0
         nYYws27yeW05QSCorN1cqx9+Rfv/iGhEhrLnYTQkAisYrqte9HgUwpy5t3Joh2oH3d8/
         16rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709604120; x=1710208920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Na1UZEy/GVYcP9OgTRpAH79YV4s5dC/8SJ0CqP6QkUQ=;
        b=u7v81ReyzZVw1NaMYpCfQkPjgW5wWC+e1NZ7xYfReyh7jo9WdZ3dv0+JYwhJ+PUZ9z
         cqlpndVM5/sCGhbst6q77JtSymRHSmY2z/8GLH/bARWviIZzozqAHs8OTZua2RlOlaCD
         0SmLqARiKTkfuDwmSUaGawoVY0QfMPtqPUtyqblD1HB/Vg/5e3xAD30JQ1tyL0pue3TF
         n4gQTdeXZPUe7aiUtBDmPtjGnHzSc3YnWY7Cpjt4m9/Aad6gtDiHPjqixLcf33IPeFGK
         pJ2fkCIMZ0FUqmjhVPCBntFF0tPTB4RwrXJxe7dyBJ75WCCXucIN05uhwmBtw3aD1Ol8
         cuBA==
X-Forwarded-Encrypted: i=1; AJvYcCV2xD3TaA6wtX2p2uQO5dYlfuhQlbCjUBgkn494Rc+eXK1aAzs94KnP4aQ+V78EX/fyoOPyqjVsqgcWNqTLleHpW5HSsQf3CglpTA==
X-Gm-Message-State: AOJu0YwD/MZ2d6a4RukQDCQX5dwK6PSB/9rIQB91IvKmzzf7cj7hmebY
	9TYEGBq5HR9wU9rM3Nbsqc0oTc4EQNGJegRdeARVhLTCMH4ShrfcMC+vWUevf6jeUuNp8ovepma
	Lw2qZewP/l6yEQK0oNpoFSw==
X-Google-Smtp-Source: AGHT+IGpPTZKtcPN8U9sdm9ezESJ/sJ5oiNSY59vHDkx0uXjzdGQiK9QV6X9ugUC+YOriupaZX7copF8kyJbbuA8Ug==
X-Received: from almasrymina.svl.corp.google.com ([2620:15c:2c4:200:b614:914c:63cd:3830])
 (user=almasrymina job=sendgmr) by 2002:a05:6902:1004:b0:dc2:3441:897f with
 SMTP id w4-20020a056902100400b00dc23441897fmr2713866ybt.6.1709604119594; Mon,
 04 Mar 2024 18:01:59 -0800 (PST)
Date: Mon,  4 Mar 2024 18:01:36 -0800
In-Reply-To: <20240305020153.2787423-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240305020153.2787423-2-almasrymina@google.com>
Subject: [RFC PATCH net-next v6 01/15] queue_api: define queue api
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"

This API enables the net stack to reset the queues used for devmem.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---
 include/linux/netdevice.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index c41019f34179..3105c586355d 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1435,6 +1435,20 @@ struct netdev_net_notifier {
  *			   struct kernel_hwtstamp_config *kernel_config,
  *			   struct netlink_ext_ack *extack);
  *	Change the hardware timestamping parameters for NIC device.
+ *
+ * void *(*ndo_queue_mem_alloc)(struct net_device *dev, int idx);
+ *	Allocate memory for an RX queue. The memory returned in the form of
+ *	a void * can be passed to ndo_queue_mem_free() for freeing or to
+ *	ndo_queue_start to create an RX queue with this memory.
+ *
+ * void	(*ndo_queue_mem_free)(struct net_device *dev, void *);
+ *	Free memory from an RX queue.
+ *
+ * int (*ndo_queue_start)(struct net_device *dev, int idx, void *);
+ *	Start an RX queue at the specified index.
+ *
+ * int (*ndo_queue_stop)(struct net_device *dev, int idx, void **);
+ *	Stop the RX queue at the specified index.
  */
 struct net_device_ops {
 	int			(*ndo_init)(struct net_device *dev);
@@ -1679,6 +1693,16 @@ struct net_device_ops {
 	int			(*ndo_hwtstamp_set)(struct net_device *dev,
 						    struct kernel_hwtstamp_config *kernel_config,
 						    struct netlink_ext_ack *extack);
+	void *			(*ndo_queue_mem_alloc)(struct net_device *dev,
+						       int idx);
+	void			(*ndo_queue_mem_free)(struct net_device *dev,
+						      void *queue_mem);
+	int			(*ndo_queue_start)(struct net_device *dev,
+						   int idx,
+						   void *queue_mem);
+	int			(*ndo_queue_stop)(struct net_device *dev,
+						  int idx,
+						  void **out_queue_mem);
 };
 
 /**
-- 
2.44.0.rc1.240.g4c46232300-goog


