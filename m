Return-Path: <linux-mips+bounces-4824-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4E94D1D8
	for <lists+linux-mips@lfdr.de>; Fri,  9 Aug 2024 16:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45B2A281C2B
	for <lists+linux-mips@lfdr.de>; Fri,  9 Aug 2024 14:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53373196C67;
	Fri,  9 Aug 2024 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nGkVC6hx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F29C196DA2
	for <linux-mips@vger.kernel.org>; Fri,  9 Aug 2024 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723212651; cv=none; b=K9sus57+8h+c7El7SjWbZeZS93XzPfDwT1PK6oTRPjB5t3huSmwPnbR5Jwr+XJvbMba/DKNtuFHDZ7pNFtZtNTzfhIx/yxyWRMtlq6lfV/lVXoNpfueGczuJ8xNTGWfzODhFLjjnliQUH2Gk06iHRGTvULNCZ5WtH/gH4XBTSUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723212651; c=relaxed/simple;
	bh=pB3wkCjy5BE4htN+Z4c0bK/ig1XSKbZvFviaBIbuCvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMViLz68/FFRyYnv9hMitDuk2OpArjI9STduxHVSdUfEDYI4CtaQ2aEyLy7z+PcwoouqwdaHCMG+zdj2Kt44mv9meiG+Nv7DeJ1y9EaQs+hFPSMiWsQnFuLuG6xKY+7Lzrw4U9ocYCes/qHEjojBhWX564FbIO9YZ7BO1VSqy1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nGkVC6hx; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6b7a4668f07so11694186d6.1
        for <linux-mips@vger.kernel.org>; Fri, 09 Aug 2024 07:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723212648; x=1723817448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAq+1P/w8tI0/3HVArG8ZV5u6VZadlBPolUAhgI5gl8=;
        b=nGkVC6hxQ9S94WAmAtW1FrPD+sAJjm1t7W7DWwmib99g2VOp5oTHDqQ2+68I0/eYEp
         8eXTYe57hgcorkTI0JKHeahl4P1an0OMTZJyKUgIk/fnniE8fpC2PA8fRhBa8WE7BGS7
         H6kaid+22SIrTnql0Fd5G0ajp25ihNBSedmRiVL8yvZbAgJlHstkcnxGnQidLwuoJoxv
         jE10ts1fOpJY6oTcNJnhYJqnSpKGwBgdJjrcov8NiuS9zokXBd11N3junnsVVJK/+G7A
         OCeem5nn2uPObKCluMe/lty6tymkNrEoW+CwVVQiwF50Y2F/2uuTESyNfQw5rFhgwlSP
         Hhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723212648; x=1723817448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAq+1P/w8tI0/3HVArG8ZV5u6VZadlBPolUAhgI5gl8=;
        b=c3K3jIxDdVaUmZf+bz2cko3yRXDk9hVsif7ixlvlMliJy9ceAHl7rOQpHcneoHgTgx
         4aleat9PDnw462GxQJQbt9kAnC1a7+NHxTojET46+MCJ6wmXeAngN6EOwEqj0tYBjGDi
         /Wvmn7TVxGpxbu8EJNbX1U4F/iSoxqfl21KKGa2ty3qb7BDvllxp+2sRNDdb8TlHhsZ+
         c2+RUZ+M+U4Xx+v0cW6jadWOM5R+to3UckPTDb9IsQexv8Hd5aRZLsilb3eYj5vtyS2j
         u7aFqrd1/5iNUOt+Ksik9ChjWNup9FaZNzWrhlgM2MNly6a6Hcq+Dqaea4VdE1irTDol
         EDsw==
X-Forwarded-Encrypted: i=1; AJvYcCU/WWk0A8qo7bQo5T6OcwHNQJJmgLbImdzXu7lmTH0OyoYnlb/VLb2QoHS0iJukrx85lbp2jUmMCHAqqAPNWR7kbsJP1meJB3ZN6Q==
X-Gm-Message-State: AOJu0Yz1igvmnIAQF8lloxm5maokDQfE65DYxczwaMDp4AQPDwa+h2K0
	bKRDhVdVo2aP/uKriUKwVHmo1DRtZ6hEv7cpBtaBldeLOd88/AnQa7J66xNGk7NPYp9eOyP9Mx5
	pgfLf2GtMRIBsbcjINiYg6pgjAu4uxQbtlvuF
X-Google-Smtp-Source: AGHT+IHtXT623FzOsQrwA3QF53Omar/D5N9kMqOW264VduXGeLM8mfJ22+dFZ2QyvytnqYSwbN8pGocgZbvLtoABiDw=
X-Received: by 2002:a05:6214:459a:b0:6b7:a947:18ea with SMTP id
 6a1803df08f44-6bd78dcb419mr20493616d6.34.1723212647651; Fri, 09 Aug 2024
 07:10:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805212536.2172174-1-almasrymina@google.com>
 <20240805212536.2172174-8-almasrymina@google.com> <20240806135924.5bb65ec7@kernel.org>
 <CAHS8izOA80dxpB9rzOwv7Oe_1w4A7vo5S3c3=uCES8TSnjyzpg@mail.gmail.com> <20240808192410.37a49724@kernel.org>
In-Reply-To: <20240808192410.37a49724@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 9 Aug 2024 10:10:35 -0400
Message-ID: <CAHS8izMH4UhD+UDYqMjt9d=gu-wpGPQBLyewzVrCWRyoVtQcgA@mail.gmail.com>
Subject: Re: [PATCH net-next v18 07/14] memory-provider: dmabuf devmem memory provider
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
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
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 10:24=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 8 Aug 2024 16:36:24 -0400 Mina Almasry wrote:
> > > How do you know that the driver:
> > >  - supports net_iov at all (let's not make implicit assumptions based
> > >    on presence of queue API);
> > >  - supports net_iov in current configuration (eg header-data split is
> > >    enabled)
> > >  - supports net_iov for _this_ pool (all drivers must have separate
> > >    buffer pools for headers and data for this to work, some will use
> > >    page pool for both)
> > >
> > > What comes to mind is adding an "I can gobble up net_iovs from this
> > > pool" flag in page pool params (the struct that comes from the driver=
),
> >
> > This already sorta exists in the current iteration, although maybe in
> > an implicit way. As written, drivers need to set params.queue,
> > otherwise core will not attempt to grab the mp information from
> > params.queue. A driver can set params.queue for its data pages pool
> > and not set it for the headers pool. AFAICT that deals with all 3
> > issues you present above.
> >
> > The awkward part is if params.queue starts getting used for other
> > reasons rather than passing mp configuration, but as of today that's
> > not the case so I didn't add the secondary flag. If you want a second
> > flag to be added preemptively, I can do that, no problem. Can you
> > confirm params.queue is not good enough?
>
> I'd prefer a flag. The setting queue in a param struct is not a good
> API for conveying that the page pool is for netmem payloads only.
>
> > > and then on the installation path we can check if after queue reset
> > > the refcount of the binding has increased. If it did - driver has
> > > created a pool as we expected, otherwise - fail, something must be of=
f.
> > > Maybe that's a bit hacky?
> >
> > What's missing is for core to check at binding time that the driver
> > supports net_iov. I had relied on the implicit presence of the
> > queue-API.
> >
> > What you're proposing works, but AFAICT it's quite hacky, yes. I
> > basically need to ASSERT_RTNL in net_devmem_binding_get() to ensure
> > nothing can increment the refcount while the binding is happening so
> > that the refcount check is valid.
>
> True. Shooting from the hip, but we could walk the page pools of the
> netdev and find the one that has the right mp installed, and matches
> queue? The page pools are on a list hooked up to the netdev, trivial
> to walk.
>

I think this is good, and it doesn't seem hacky to me, because we can
check the page_pools of the netdev while we hold rtnl, so we can be
sure nothing is messing with the pp configuration in the meantime.
Like you say below it does validate the driver rather than rely on the
driver saying it's doing the right thing. I'll look into putting this
in the next version.


--
Thanks,
Mina

