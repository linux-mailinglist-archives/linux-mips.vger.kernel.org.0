Return-Path: <linux-mips+bounces-2366-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E60338871FC
	for <lists+linux-mips@lfdr.de>; Fri, 22 Mar 2024 18:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2776AB223A5
	for <lists+linux-mips@lfdr.de>; Fri, 22 Mar 2024 17:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4E15FDDD;
	Fri, 22 Mar 2024 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NuAiMh/M"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C241B5FDA6
	for <linux-mips@vger.kernel.org>; Fri, 22 Mar 2024 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711129243; cv=none; b=hfw/mkT5UlVpJekqi8xIONHQqPVQBleImrk87Vt5yiKLFgG/xhmvbVhS3la/dvNHnZfjk0jD0NoFO4b4yPnQJ8b17Zj0Pvv7UGa13IuTHtl3mrjIjYULa/DP4zXxZHDuZ3P6EF8z8dFXEyT3G6DqadaXJu3m2gDDLt2MzVzHRHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711129243; c=relaxed/simple;
	bh=7T0QYgj6Z0QWJ7WZghtr6Q0zZ77ROAwtyZEJQAtnJrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8FI7NXMr68e7sdpmDWAJjuCRtjZsOMfTE0XEMO4dxd9CCgsQ82NGEYJ/s+HsMqTIwr088rcABgZDsipBdcJFM+TtnDvhQpfEFVe10PMIth0+RdkXPs8Zt/h/Abfd8HwVanliuTqm1eRlajeoyPkSApL1xgCO+cGxGaKKJSypbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NuAiMh/M; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a468004667aso340702166b.2
        for <linux-mips@vger.kernel.org>; Fri, 22 Mar 2024 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711129239; x=1711734039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YM4J2ObtCNq8IqrJeUkrlLZCafy3cmXh0Ri66R+dm4=;
        b=NuAiMh/MosGpuJph6/CXhnqgtnF7qTB4wgozIjMxlP7xwIMTBUkxGp7jiLeBJeNUA8
         uf3RbWvwApbMZFE+1zAiSE/rUFH1AmO4Inn/LeR4eLLIyJhCb6kAZF5e/IqWygoVbAS0
         YNddRISS5xPN/6moDsAN0RJLCFP7BYfwoyTBXRz81dPr4VwAGpuAx4kKX1ddy3i+i8J0
         GW8CtvhZyNMxHOAbds+zU9+r9Ux6hPYEAFI7Xi+I0b4x9bRWTLPNpPCI2wo9BHwHpm54
         90xv2NndkuSs6tCPxxNLMeQMMbA9UkVREUUY00h8sSJNFZUydz03W+30nass1/Zv6OwQ
         wtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711129239; x=1711734039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YM4J2ObtCNq8IqrJeUkrlLZCafy3cmXh0Ri66R+dm4=;
        b=Vm67vOTN51asl4cfEwzU5I39ZLtHaKtcH6JIaVG6bZdj1A+c9AJba8gOsd7Q5ys5u3
         P5JoDze1xTIIOkFRrtysTIk1AKmu1h+Gyr6AXEjYJeUMGPgoiNcU7Mz7OU/wQmCELYbs
         d+0tZ+VO3WRkbdtSSCbsrTGrrb7xm7H5M75XXg0TzlcEm2N6dGktW1hZeHX3y08N8cSv
         I1f57cDjowI5K7DA5UCLQvZJ7ITNEr4qLS8gTnegsXg7i178xtL+OipnJ0U+h8F0M2O+
         YBzOP4soR7NHZIJtRelz2maK/gqtm7cEcnOHeGGMF07Q4385rhald2z0YhzZ3ZvCq33F
         TrrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE6Mxrkz9Q0E+dvKfPCptKFGbn8sg1jAH4MVNagbErPy2VUWV0xbj1fTHNJd3Tzbn8VNvg8+JJDOW937RF+Ewr81NrLRrfDJAtEQ==
X-Gm-Message-State: AOJu0Yz5ToKsm9WAIuLRdcvAXd2tA78K7Luuj7H44ZMXmxw529zGbgjx
	eVGkJFiq/JgDsEbzJrTBxQ0xfki74r834dbphS56qWqm5lAk2mCWG45Rc9r682BeKOqNYFR3dor
	RRzu9i0+L4uge7wrMkBtmKI2z03CK7wM7/jog
X-Google-Smtp-Source: AGHT+IH25NX6qQBoFnVnA4psBCYCRYBaiXOTPUtbfU8ggcYNeDelzQNuP6wH36Jj0kmkf8kYIMZ+vwfa54Dm4tCqR3s=
X-Received: by 2002:a17:906:c2d4:b0:a46:befa:f0b0 with SMTP id
 ch20-20020a170906c2d400b00a46befaf0b0mr293662ejb.45.1711129238808; Fri, 22
 Mar 2024 10:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com> <ZfegzB341oNc_Ocz@infradead.org>
 <b938514c-61cc-41e6-b592-1003b8deccae@davidwei.uk> <ZfjMopBl27-7asBc@infradead.org>
In-Reply-To: <ZfjMopBl27-7asBc@infradead.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 22 Mar 2024 10:40:26 -0700
Message-ID: <CAHS8izMT1Smz6UWu2uwAQRqgZPU7jTfS3GKiA_sDw9KLqoP-JA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>
Cc: David Wei <dw@davidwei.uk>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
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
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

Sorry for the late reply, I've been out for a few days.

On Mon, Mar 18, 2024 at 4:22=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Sun, Mar 17, 2024 at 07:49:43PM -0700, David Wei wrote:
> > I'm working on a similar proposal for zero copy Rx but to host memory
> > and depend on this memory provider API.
>
> How do you need a different provider for that vs just udmabuf?
>

This was discussed on the io_uring ZC RFC in one of the earliest RFCs.
Here is a link to Pavel's response:

https://patchwork.kernel.org/project/netdevbpf/patch/20231106024413.2801438=
-6-almasrymina@google.com/#25589471

The UAPI of wrapping io_uring memory into a udmabuf just to use it
with devmem TCP only for the user to have to unwrap it is undesirable
to him.

> > Jakub also designed this API for hugepages too IIRC. Basically there's
> > going to be at least three fancy ways of providing pages (one of which
> > isn't actually pages, hence the merged netmem_t series) to drivers.
>
> How do hugepages different from a normal page allocation?  They should
> just a different ordered passed to the page allocator.
>

Yes, that's more-or-less what's what the hugepage memory provider
Jakub proposed does. The memory provider would allocate a hugepage and
hold a reference to it. Then when the page_pool needs a page, it would
allocate a PAGE_SIZE page from said hugepage region and provide it to
the page_pool, and the pool back to the driver. This allows the
hugepages to work without the page_pool and driver to be hugepage
aware and to insert huge page specific processing in it.

Other designs for this hugepage use case are possible, I'm just
describing Jakub's idea for it as a potential use-case for these
hooks. For example technically the page_pool at the moment does
support non-0 order allocations, but most drivers simply set the order
to 0 and use the page pool only for PAGE_SIZE allocations. An
alternative design could be to use this support in the page pool, but
that requires every driver to adopt this rather than a core networking
change that can apply transparently (to a large extent) to all
page_pool drivers.

--=20
Thanks,
Mina

