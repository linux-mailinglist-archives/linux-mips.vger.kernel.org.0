Return-Path: <linux-mips+bounces-5153-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D65FC9620D6
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 09:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B0328532F
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 07:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F07915B570;
	Wed, 28 Aug 2024 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iXiG2zT1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54A415B13C
	for <linux-mips@vger.kernel.org>; Wed, 28 Aug 2024 07:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829640; cv=none; b=BUd1lXVmuQPIh1QCTAQlniDN6EmJ0VlSCtfiuRd8S3zVxRH5YS9syESF3zrPXsXhjYIH1wB1fkG97YK5Fo0s+/4xJvk8B8T+oHqdHmz5ZGKMMp4HxvCcdgtejOM3S3hGdG7kX1S6eoW1eVUj8icJBXQus5tPKFRLeOE0ulKVzes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829640; c=relaxed/simple;
	bh=hY0rdkFxlOJ73INaytL9GxG6uDuQeptdtje3tcWXF+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PgGWlITnFmqpjjdJpaayDmKI72xJ4V+tuVqL0n+bFdiDaPAXXKFeKDodtc3Uv+GGsrLPK7WiUSjYappxrmkjFTOu/RZ0tvGsd/0JGZHwqXy2yQ0o2OaHJ+U113Wyw1g8EI4W1JhnvpYjGdmlreKEnJqj6bZvAXIV5yXwgtV1KRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iXiG2zT1; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4518d9fa2f4so190561cf.0
        for <linux-mips@vger.kernel.org>; Wed, 28 Aug 2024 00:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724829636; x=1725434436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaKkxTlZTeNsK8i9Bxn3PWY1aY/BLsT89GdUnPxSzCs=;
        b=iXiG2zT1LZYmRlQ14gRZynyy8LwteaYwvbXkKGk5hnY0hWAZjMr8whQjsAqKYp6nIP
         XLnbQMYBrYHBNu2sGcwa411HH/mMlVF0VBicIn18IOgiBOcMj7TzkZBN5rg7K/Yp9zac
         R4aJXx9G57xEL9LbZaFy70W55jvCQSwc1bpuGqMWGM3uz93nKfBiK3V6jDEh2jPTaxEM
         ohJQqGdPdB4R2lsc7JjJsg2tfPWD/feF/rI2J35mNcyrE53PQxNmaeKZ+1xv3hFDVUjb
         cdTv7zi2Ctk8Iohq3E3vtTNIz1joqkAMQVGFaQBTDLqcJ+jeTne9UjwOa8Bge8CxHv3Z
         0R5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724829636; x=1725434436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WaKkxTlZTeNsK8i9Bxn3PWY1aY/BLsT89GdUnPxSzCs=;
        b=RBYVtCaHwcD33r9NUOY52YqUM0LU1nEPZo4eg1UhJZIHdpmTaaHkZ96zmYc0PRiW4x
         W2T7hm2b55iUaDoOgwbZdBULbdhESNVsbx3Tpfy7wTBOQg5/Dx3gZ9I8VQRVk96AXaF1
         FKqPf4JVKSeRL+pgJulyaPn4GNqts9vdUOGwprALXm07a8UG646VtQsRoFzg/7INtSmL
         4EmiOcgk1kanE82Qu4a0wm8xpOgjhI0CLN0RsWtnr9CdmbeYkW1icqB6KX2Rki+1cm8F
         dSYUt9eQswcIKqDIMDke/WDZI1hDX8M298Dq5r22kiOwJt33iUaBTvcuF8zQdYps+T9H
         9tDA==
X-Forwarded-Encrypted: i=1; AJvYcCWHOj6U4e2mCPijx96mLkEygC3RnPMMnqaAqSuuwINhvgAPUCr3wTS9zM0HEj6NP5ZAb2YQuMxyEh06@vger.kernel.org
X-Gm-Message-State: AOJu0YyXU6p4hPsPE5It5ofwpceR3/Za7SJBa+9hYrtC7O1F7M3079pE
	bw7FQDIxbgrMMCXyf09z8zpWQD5VS67gKtpqKM3FijBeToYUvNlRgdOcJd2g5bBpW+jgxUf6co2
	c7gYjFbMWaVGm+5TK02/zXR/hiTic26eWGrwW
X-Google-Smtp-Source: AGHT+IHyMD+4xnusQLwuQ5h6kBQmR1VYMf6lXqEwBGB2U8vCgE7ervQyk/rNIf69lWKuYbdIUKJLj3Yofx+zROPan7c=
X-Received: by 2002:a05:622a:1211:b0:451:cd18:84c3 with SMTP id
 d75a77b69052e-4566cb29dc2mr2435821cf.12.1724829636084; Wed, 28 Aug 2024
 00:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240825041511.324452-1-almasrymina@google.com>
 <20240825041511.324452-5-almasrymina@google.com> <20240827191519.5464a0b2@kernel.org>
In-Reply-To: <20240827191519.5464a0b2@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 28 Aug 2024 00:20:23 -0700
Message-ID: <CAHS8izP8T5Xj97M7efecBmCrG9z8E0PYTxWCYZ0ym0hv13-DKg@mail.gmail.com>
Subject: Re: [PATCH net-next v22 04/13] netdev: netdevice devmem allocator
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 7:15=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun, 25 Aug 2024 04:15:02 +0000 Mina Almasry wrote:
> > +void net_devmem_free_dmabuf(struct net_iov *niov)
> > +{
> > +     struct net_devmem_dmabuf_binding *binding =3D net_iov_binding(nio=
v);
> > +     unsigned long dma_addr =3D net_devmem_get_dma_addr(niov);
> > +
> > +     if (gen_pool_has_addr(binding->chunk_pool, dma_addr, PAGE_SIZE))
> > +             gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
>
> Is the check necessary for correctness? Should it perhaps be a WARN
> under DEBUG_NET instead? The rest LGTM:
>

Not really necessary for correctness per se, but if we try to free a
dma_addr that is not in a gen_pool (due to some other bug in the
code), then gen_pool_free ends up BUG_ON, crashing the kernel.

Arguably gen_pool_free should not BUG_ON, but I think that's an old
API, and existing call sites have worked around the BUG_ON by doing a
gen_pool_has_addr check like I do here, for example kernel/dma/pool.c.
So I did not seek to change this established behavior.

I think WARN seems fine to me, but maybe not under DEBUG_NET. I don't
want production code crashing due to this error, if it's OK with you.

Unless I hear otherwise I'll add a WARN without debug here.

> Reviewed-by: Jakub Kicinski <kuba@kernel.org>
>

Thanks!

--=20
Thanks,
Mina

