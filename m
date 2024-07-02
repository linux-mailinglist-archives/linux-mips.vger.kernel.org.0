Return-Path: <linux-mips+bounces-4080-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BB9923E96
	for <lists+linux-mips@lfdr.de>; Tue,  2 Jul 2024 15:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D87CB1F250E9
	for <lists+linux-mips@lfdr.de>; Tue,  2 Jul 2024 13:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BF419EEC0;
	Tue,  2 Jul 2024 13:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P2e3SWN+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713DF19DF98
	for <linux-mips@vger.kernel.org>; Tue,  2 Jul 2024 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719926082; cv=none; b=eiY5Egcwem6W76MO/CRq+UJcnVGBn+62R2T56CbUOduqxsrUNfvU3p+2RO7/22XMuFHxVf3BieUXINHxtb9ZjlNzV1KkLUqctL7QWgbfvhUqxwJWWFtlsEyjTNo4PVwgoJ0djVyRLX3aal3yrhwBNcuymeW3mCsAKcaE18Zv0qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719926082; c=relaxed/simple;
	bh=qcbSk1txeKGjtUgrI5TEa2OFa9eUbMFBvTxpismD3E0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPgHDJNXH3Mf/sXIM1cWRz0eozcKt/omjZlPwSSgC+FN/i2c9G8eUMwI5TahwLh6nowsgI2k1nKvgKylnQon4xxJ1sPiBGLr7QTi5JUfyPU2/JC61S5D0PV4vTb9Q7f2JSIoynDBysTaJe4oXXBSRCKuIIO0WIIbyCcuJXslFIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P2e3SWN+; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57d119fddd9so21829a12.1
        for <linux-mips@vger.kernel.org>; Tue, 02 Jul 2024 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719926078; x=1720530878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcbSk1txeKGjtUgrI5TEa2OFa9eUbMFBvTxpismD3E0=;
        b=P2e3SWN+yseDMp90p9VEzZHdkGUJX9Ld0Lj6dP8ekUsLe8WFMUvAkLLe78MDS5i4EN
         tR404H/0eeBkXwqz6cEs0wa8kKW0z3UTY4UZ/Z2VHDf9iA94POb9ISGx+gxT15YkEzv/
         WmZ3qHVASbx8qKTwDFYpM8WY0IUd7M0XZYIHHxmOLGp3HsBz1gJM+bvXXvIKLLEq51UY
         UK2jscCD6GaFo29bpNziVw68wgEtOjjhlNCcjACm1kB3mVAzPq17QH7ewZq15jN4VR3Q
         SxTV1baqz7uqrV15hW4+z0toLL/X1R4jw8Cgsc0bmvj2xTdgtrRgIRz5fH/9T2GwHcum
         MWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719926078; x=1720530878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcbSk1txeKGjtUgrI5TEa2OFa9eUbMFBvTxpismD3E0=;
        b=vyXdKA0KsqZHOuc/Cbto3fV0Y7NnoqF8jporGA4a/7YmYC7BElYTk3Gub//8w6+7Wu
         0QQjkq/wOJtFicxpNXRu2YkgmZ8SysTVG0bXTCZo9mlgWfqebywe01bK+7sKSBS4+qVI
         gNwldiYL2F9qKttCPJKZKiN6I+0SuDuwDTsDtqrMATGyQuzaCZf99LmgbZQVhgDaeZul
         1H1uPD7Cv1M2mHngXM86hQEX97u7plSLFT6U+qqVGKi/EPgcDWNOsbFeYz8arHkGj1SI
         YpVlMkp8/LZ4rWXUi+lKKQLgufTz19DoCnjdo/U92o7Dz0d9xShjP3P781ZvROjwjgyz
         iQmw==
X-Forwarded-Encrypted: i=1; AJvYcCVVGY2wQ+WM34Hm9L0udJszXH5RL/7cvckh6R5yhpfACQF1GA4a2OanjmBI5nGP/wM0yx9cUtIm5n/k5QAhDO/DrK7YluKff22i2w==
X-Gm-Message-State: AOJu0Yw5PxC1qeyL0hnHLkCUyFvcz2dquOhE6KeN0uqx1AxDan0FlW2u
	c57vNJ0yOrbLluYKJlpdO8EGj3G/lX8rOIxHxV9bqb75k9v3DNTp6XaD+MIznX8pWcX2JUHPEq3
	gt7dO/YCqCioarezAEhgF50jMu2qQ9z6+6+EC
X-Google-Smtp-Source: AGHT+IERKkCVpVomNRYr8KNFI5e5JCBWRQ7HMLMgDv1aOW++vU+Fu31VZ6RrRqWEtIXBu1Sq7l+LYKSRxYEU9Pq/83U=
X-Received: by 2002:a50:9308:0:b0:57d:32ff:73ef with SMTP id
 4fb4d7f45d1cf-5872f79a720mr634350a12.6.1719926077342; Tue, 02 Jul 2024
 06:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com> <20240628003253.1694510-9-almasrymina@google.com>
In-Reply-To: <20240628003253.1694510-9-almasrymina@google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 2 Jul 2024 15:14:22 +0200
Message-ID: <CANn89iJ1ys-eNyM3BGQ1PuLKsbo+Kcj78wfoAtaFPygQdYawkg@mail.gmail.com>
Subject: Re: [PATCH net-next v15 08/14] net: support non paged skb frags
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 2:33=E2=80=AFAM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> Make skb_frag_page() fail in the case where the frag is not backed
> by a page, and fix its relevant callers to handle this case.
>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
>

Reviewed-by: Eric Dumazet <edumazet@google.com>

