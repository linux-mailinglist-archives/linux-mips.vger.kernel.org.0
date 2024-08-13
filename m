Return-Path: <linux-mips+bounces-4873-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DB295000D
	for <lists+linux-mips@lfdr.de>; Tue, 13 Aug 2024 10:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1359BB23E42
	for <lists+linux-mips@lfdr.de>; Tue, 13 Aug 2024 08:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5578166F3C;
	Tue, 13 Aug 2024 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZHsKWfs7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000EF13C3CD
	for <linux-mips@vger.kernel.org>; Tue, 13 Aug 2024 08:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723538405; cv=none; b=UXyS94TRRQ/1uZyyYvJb9UfPJ0T7qW8zxMTwOYhAd3kFu3fHvko7u52HZ2kv+WPGKekevngA1Wd9mqe2cwx09c3wRYtLZQN7nhQ5/nKefvGBLxrswd45mdATMF8CICanFZ8v3DjpXzJe47UAPMLkQHjt6N6mEyYpzzxUYI+TcYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723538405; c=relaxed/simple;
	bh=h+dDRWN8jV1nwMrGh+WAeD+/RlJnf+Y+F73/jQ+w7EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evjJ09te3JMYQzJJ99UDor2yBfmhYpT2shXKboXLejXEdH4qPVoE69NMO5kGLfQ9/zWF2oRJVxq5WrH+Qp6PmL0Do3ktvEJaogHYS/kgXES270kKt+Pi0dE0CF1xwvThN6cwrHMeJYeCI+rd9HdgcC9kjGI7wWrOWaDSpszHNPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZHsKWfs7; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6b7a3e468a9so35720486d6.1
        for <linux-mips@vger.kernel.org>; Tue, 13 Aug 2024 01:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723538402; x=1724143202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfIvxCWgLL4atIJlIA0PqbGSOJqgAf1LTciUfWWJUn8=;
        b=ZHsKWfs7XtacxS/e4HWnhLfpJeF1dQI15r6Gs+SssFzW1ORp9CSZbLkX+hPNmtz1dI
         V/lKHrB3TsgX8KaIlDbgXULOr+QMVyve7FGhCEdOpMzW50ZHiBDmeqtCdpCfKixVqWD5
         5LWzxX4XqIisrqFfOshRHqnT26ZngO/8W9Ofc2CqNzF8YR2uslGYCV7JWJ13iJRSywjP
         IxsvzFhdPlhFF/JnUoJzWVYzIdQVNb2KxpFfMSwvEFXT2sZ9przycdnLBZyTnjglCt4/
         aAnWg8QyMuVtxMlIa3PyPKlJROi745DjcQvbz/HiBkixIKxV/AxIC7aBz/jcE0tM9gvZ
         cwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723538402; x=1724143202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfIvxCWgLL4atIJlIA0PqbGSOJqgAf1LTciUfWWJUn8=;
        b=muriVNxfBWeoRSnXMLgKDK1NX1TqieO9JyfgxSxsJrkvzdhidt0Y92pBFekoC7OIW1
         sEFCXRSLk9l37C69WP4phDTpt9kBeOLh4smKOV3Wdn705gM/9YRnzgkU6OaL3J7o4PsY
         +VXORArrbEjyf0Zrl3U5tjQdEkke/YHlw55811vF62SPz7QiRCqaoB0+K+k0t/67pUdv
         ZW/ric9aaYhUmrSQAx4eIA2BmG2ywO9mHJS+AbkpuHLZuCuoHH92tmhC6xSgkt2ka+sK
         QQY/4r2kRG3eHurvH+tvNslxS/b4y2aVI0LkvWQ/na3UWv1so/mx+/a7CQDOUPNDV6mD
         Gxyg==
X-Forwarded-Encrypted: i=1; AJvYcCUfo7v8QQV0YjUdONZJcPVvnMrXtj+SybArbEHHkzWnguVWG5bKg4seqnEtZXU+r1Hyl0Dgin9XXi+YU4NZMLj/7HmnNhIBDjf8Ig==
X-Gm-Message-State: AOJu0Yxaad+qvjrmSTUIxFc7a9kXy/dOfUA6EFbk2Xx4skeWylHk41b2
	fz91WNPkrRR5jTWvNspriyvrki0QxfK8hEBwNMAy34aSvwipy2cqpMfwLNZ6Ah6C4ijcDI7qHWz
	29GJYoErYnXvHB5hYt43oPeKU6hR12JzPJGxs
X-Google-Smtp-Source: AGHT+IF5vZpwMEwyKOsMjByGok50VQq9OHjXt2iZMdoR51xqc5PshbKjWlTOU09k9dSw6zDIWNspGRLkyEdh4LkEteM=
X-Received: by 2002:a05:6214:4410:b0:6b5:e2da:8bec with SMTP id
 6a1803df08f44-6bf4f89a375mr28560176d6.55.1723538401526; Tue, 13 Aug 2024
 01:40:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805212536.2172174-1-almasrymina@google.com>
 <20240805212536.2172174-8-almasrymina@google.com> <20240806135924.5bb65ec7@kernel.org>
 <CAHS8izOA80dxpB9rzOwv7Oe_1w4A7vo5S3c3=uCES8TSnjyzpg@mail.gmail.com>
 <20240808192410.37a49724@kernel.org> <CAHS8izMH4UhD+UDYqMjt9d=gu-wpGPQBLyewzVrCWRyoVtQcgA@mail.gmail.com>
 <fc6a8f0a-cdb4-4705-a08f-7033ef15213e@gmail.com> <20240809205236.77c959b0@kernel.org>
 <CAHS8izOXwZS-8sfvn3DuT1XWhjc--7-ZLjr8rMn1XHr5F+ckbA@mail.gmail.com>
 <48f3a61f-9e04-4755-b50c-8fae6e6112eb@gmail.com> <20240812105732.5d2845e4@kernel.org>
 <7e2ffe62-032a-4c5e-953b-b7117ab076be@gmail.com> <71260e3c-dee4-4bf0-b257-cdabd8cff3f1@gmail.com>
 <20240812171548.509ca539@kernel.org>
In-Reply-To: <20240812171548.509ca539@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 13 Aug 2024 04:39:47 -0400
Message-ID: <CAHS8izPyGwe_i4eNemW+A+MgMVHqJ0fdp=+-ju2ynqgc0mb_Ow@mail.gmail.com>
Subject: Re: [PATCH net-next v18 07/14] memory-provider: dmabuf devmem memory provider
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Donald Hunter <donald.hunter@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, David Wei <dw@davidwei.uk>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 8:15=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> BTW, Mina, the core should probably also check that XDP isn't installed
> before / while the netmem is bound to a queue.

Sorry if noob question, but what is the proper check for this? I tried
adding this to net_devmem_bind_dmabuf_to_queue():

if (xdp_rxq_info_is_reg(&rxq->xdp_rxq))
                 return -EEXIST;

But quickly found out that in  netif_alloc_rx_queues() we initialize
all the rxq->xdp_rxq to state REGISTERED regardless whether xdp is
installed or not, so this check actually fails.

Worthy of note is that GVE holds an instance of xdp_rxq_info in
gve_rx_ring, and seems to use that for its xdp information, not the
one that hangs off of netdev_rx_queue in core.

Additionally, my understanding of XDP is limited, but why do we want
to disable it? My understanding is that XDP is a kernel bypass that
hands the data directly to userspace. In theory at least there should
be no issue binding dmabuf to a queue, then getting the data in the
queue via an XDP program instead of via TCP sockets or io uring. Is
there some fundamental reason why dmabuf and XDP are incompatible?

--=20
Thanks,
Mina

