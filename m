Return-Path: <linux-mips+bounces-4292-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066992F084
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 22:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96A301F235DB
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 20:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D3319EED0;
	Thu, 11 Jul 2024 20:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LWDNmZ1A"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5871819E83C
	for <linux-mips@vger.kernel.org>; Thu, 11 Jul 2024 20:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720731439; cv=none; b=lyCYgJo4bXTnvmH7xZ2U4c9wYU3AgiW5gwV5rL84Bmc5A2rpCDRpaJAZ9TKRnrdYbbq0DGTj1ugaBe2t3axBLGNSZPxJP5xn3vZFzvrjCjWwXoTJDlQDR0f/59Sl7qp6xOUWcQS7rUrsz2GwlpI8FsxY3wk9suvaPhQk88yBGC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720731439; c=relaxed/simple;
	bh=yspC+57ohBKj+IE3NEA9/ct7ABkwKPmz0e+zIn1KONg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbF7tOlQulecIK6XxliAYiIrjNgZrNBW0gPdp5AjGLgIFN9F1Forw1bVn/cqrccqgvMpqarAJP6uZf6XcX43QYRbLas64sGDEtHqwEQc8sbzGfw+GYt7NIBtjzhqS82gOChT1mdQD/vjfQZqosscZ14qA7nGMGuRXlTHUOw4xpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LWDNmZ1A; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso1446359276.2
        for <linux-mips@vger.kernel.org>; Thu, 11 Jul 2024 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720731436; x=1721336236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qR1w6TGwRPRKUblfK+cvVsJQzW84NzZB6wHL2Wt2c14=;
        b=LWDNmZ1AmXcyPkFEkz3scc4/444fdYHtXFWe9NH/bsP4G1jEoizC1hc9xBmCBhZ/R4
         Fb9ihPW6kqZ9OGcnnZYLpOrySPdZDXWfMjZm7AwYS4xMDhw9+GLSKREbHyBaLTMvhvvy
         NFJpjZ0nK7TZJbuKKtFq1jDlF4WIgGHmDKJBtFIWnkcz/iv9BKoensGhQEIl3w9ofku3
         yjsYlQJdVTsHmWOrcoI4WTEN/9fXRVTvI2QMcNB+lD24UHMU01bUZk71tjXonzPxYKzy
         lom7LBYj+xTEq5BhCJtsn938NwqsXycqrZ0fHe5nX4mIx6BWzHyVACBTKx61h4A5xoTv
         verA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720731436; x=1721336236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qR1w6TGwRPRKUblfK+cvVsJQzW84NzZB6wHL2Wt2c14=;
        b=npJLmgz8IOAharFXDdYqRvzMlzVZGI+H+uILZxnKAButB1MRBF2PU8r7suAGMyePke
         qb0hbq++KKnuKgTkI/b4dlGLa/TzrP6aiqW3hABMiynRxJSMLWyDXi+KZZZ+VPf/glcA
         EYjA7x5TEMouU2TdYzSRffhSrMfvZAH+sbI1JifkkxFwDS34aLFSmcRlKV1wcIayT2LU
         OOCfL/r9zs+mHIDDvSGbGHxYkN6JuUayQO/kEj7+v+L0l7Ack0j5MhSzGrEHaxScH+4/
         MXukVR3uYD3uCZqfmZ2gdQYBjfMtms+PJENaBLrFJEzfZTdowNN4w5j3kKvY8yTCZoM+
         SqNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsL2P97e7aDsYcH82eG524usGFQqGvvxLI4v4gUS/HIe/qoQL1Z+sHWPlkj+SOFwCTeP2efg7huMZnaN5p/Wr8DP4ktxqVKSdcjQ==
X-Gm-Message-State: AOJu0YzTNJH3BqSYeb+OhoUUsz05TX6KJS8qEUqhADGuV3fil7DdViDY
	wI1gc1tPJnf5oDRB2g45lxCvlga2xmOsBq23jzQ+RLxsyVULufGXwrf+hC3QU3vo4fK0zOP9IrS
	Be56m1FO0Y+AxOG+MHoHvMazAsHR+A4BHCnaN
X-Google-Smtp-Source: AGHT+IEYLltipW2y2jpNMjV5kpiHBN8xdsLzBdnyK43dhH65oHO3BC27aVEWQpPKMVw7hLbmYOjCnlcdqKg1G5wqhvg=
X-Received: by 2002:a25:d3cf:0:b0:dfb:c6a:643 with SMTP id 3f1490d57ef6-e041b070a46mr11240607276.7.1720731436062;
 Thu, 11 Jul 2024 13:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-6-almasrymina@google.com> <20240710094900.0f808684@kernel.org>
 <CAHS8izPTqsNQnQWKpDPTxULTFL4vr4k6j9Zw8TQzJVDBMXWMaA@mail.gmail.com> <20240710182322.667f0108@kernel.org>
In-Reply-To: <20240710182322.667f0108@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 11 Jul 2024 13:57:01 -0700
Message-ID: <CAHS8izNMsCHhJM4hf7pf2p98sp9-3gxL6o7sC6JQnqThxiWjYw@mail.gmail.com>
Subject: Re: [PATCH net-next v16 05/13] page_pool: devmem support
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
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, linux-mm@kvack.org, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 6:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 10 Jul 2024 16:42:04 -0700 Mina Almasry wrote:
> > > > +static inline void netmem_set_pp(netmem_ref netmem, struct page_po=
ol *pool)
> > > > +{
> > > > +     __netmem_clear_lsb(netmem)->pp =3D pool;
> > > > +}
> > >
> > > Why is all this stuff in the main header? It's really low level.
> > > Please put helpers which are only used by the core in a header
> > > under net/core/, like net/core/dev.h
> >
> > Sorry none of those are only used by net/core/*. Pretty much all of
> > these are used by include/net/page_pool/helpers.h, and some have
> > callers in net/core/devmem.c or net/core/skbuff.c
> >
> > Would you like me to move these pp specific looking ones to
> > include/net/page_pool/netmem.h or something similar?
>
> That's because some things already in helpers have no real business
> being there either. Why is page_pool_set_pp_info() in helpers.h?

OK, I looked into this a bit. It looks like I can trivially move
page_pool_set/clear_pp_info() to page_pool_priv.h, and that lets me
move out a few of these netmem helpers to a header under net/core.

However, to move more of these netmem helpers to a private header, I
think I need to move all the page pool dma helpers and reffing helpers
to a private header or the .c file, which I think will uninline them
as they're eventually called from drivers.

I had guessed the previous authors put those dma and ref helpers in
the .h file to inline them as they're used in fast paths. Do you think
the refactor and the uninling is desirable? Or should I just do with
the trivial moving of the page_pool_set/clear_pp_info() to the private
file?

--=20
Thanks,
Mina

