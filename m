Return-Path: <linux-mips+bounces-3549-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C22D59025CE
	for <lists+linux-mips@lfdr.de>; Mon, 10 Jun 2024 17:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50D8028A139
	for <lists+linux-mips@lfdr.de>; Mon, 10 Jun 2024 15:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DAE13E8AF;
	Mon, 10 Jun 2024 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NBC3BjeV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A713DDC0
	for <linux-mips@vger.kernel.org>; Mon, 10 Jun 2024 15:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718034103; cv=none; b=I6Afa8VjedZm4j9ef69u1I010Ta6sYUFk3F5j6LW/RGIOmJRUtHDbbwbt34+NScaIlS88Ixncot8/16XCq3Fpoun3oL6KR82joi4yJ4b4iHwnveZh1ShGlw+iboacGpuUWpvU6T4b9yZZSys6/x0SMZr3pD8YY+R4vv+AAkwXlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718034103; c=relaxed/simple;
	bh=NH9qOe8AuGn3R+TevtlS2pqQNAL05iIcoVXpQ7CPaGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7p8K6vKeTgzYtFDw0E4S/ksIrU3J/NdLdYLX+GAGLm569DFVmIxinwMK95uoVFlM0dIaBRl2TEmV3kQjXp7AuqTWFvIaxVhbXwrMpS32eYnnq155rhyF241bJwF/0dh7BO/ijuo2tyZeRB1H40vtghTncGx0PxqQb5n67gtPmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NBC3BjeV; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57a44c2ce80so5275347a12.0
        for <linux-mips@vger.kernel.org>; Mon, 10 Jun 2024 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718034100; x=1718638900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NH9qOe8AuGn3R+TevtlS2pqQNAL05iIcoVXpQ7CPaGI=;
        b=NBC3BjeV43Tto6rj7jzWS0apRPZAnZhJNBOou0IKmm3h/8DlAdjhG4Y5gsqiMZ3pAd
         eHigC7Qcovtju7HZ8zQbCH+6Mddcwh9xzZyF87jwWeINqrgM1FR10aoNpM9dZICtDvyc
         xpf/0lnr4kBXB8f4u7FUjoUTnij835IuH9nXp7+XMaRWHJ0DuFWMNuTFhWOjApFRaXYT
         7RG3m7uf6qb1wB3E+GyK9gA7GBP6oTu3azHkQzuLULoMA/9i+b2aihNWU9FBTH7e5imH
         Ehtos6vd4QKW9+lJTwoCRJli+5DpQDQDQZAogzlY1LO+FpPUy3lqrKWKLqAw+vVHctXA
         UdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718034100; x=1718638900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NH9qOe8AuGn3R+TevtlS2pqQNAL05iIcoVXpQ7CPaGI=;
        b=dw75UaEdFfsSxkzquBGvMiE7QAD5x105iu6RWOtIA0ld9jS6UcN8UrEEtg3clM4+eZ
         tX2TuCKIIRbaAt8YX+lZFFTTt7/2BbfwGHGIDzGETj+/uYPpWx510/+v62xGEmYVg7Vb
         TdQBvuJ197bnRsSjGwIj2q1EDgURzgCaK0WeBXWT+DLvbpH4H1slxPQJCo23x90FQdkG
         1lV74sUN49UFgo3TbIEem2D9RF1/A/C9E2/exaeRAu+ukXaNTtZt8Zm6H4UawGJ/rElG
         hy0VhJK+i2tpBY72Jz5xXStNA0Zqr4cPeUPBKGcyoNpyHmoE6qIP6/Do8dTw13UoDm8z
         XmxA==
X-Forwarded-Encrypted: i=1; AJvYcCXBjCtJfPRPnZ+goVwsQdrv1h19AkcvSHXNGkqGcRkk0HONRMqc0wja1ZZQXhf7bWIp5Q0JGJ8vM7CelC+1lFRAZu/uFGqG/Szj5g==
X-Gm-Message-State: AOJu0YwVjydWwx6Omc2q/URNJ2JDZiud/tu5butEnFOn3H0+t1SS5n0B
	8Lk6FCorW4l/uxrRKJ4hAYSpYAOwqjcf55EvxTOTxbcClKEpY4AMOIbPQx9S7VYHXk1ZJR4UoGV
	UPH6YkcrT6i+ab2f4JzPmcLn7A01wxF0SPq1P
X-Google-Smtp-Source: AGHT+IGhBtLDJFK2P+RcfVlyA2ZAGso96YWHpocomofOltg8xljfiwSKPnAsDJBDqZd1U8grgl7y/Dr4+a+0D+ppdnU=
X-Received: by 2002:a17:906:8888:b0:a6f:279b:37ca with SMTP id
 a640c23a62f3a-a6f279b38b3mr91530566b.51.1718034099331; Mon, 10 Jun 2024
 08:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org> <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com> <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com> <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca> <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
 <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com> <20240610121625.GI791043@ziepe.ca>
 <cdbc0d5f-bfbc-4f58-a6dd-c13b0bb5ff1c@amd.com>
In-Reply-To: <cdbc0d5f-bfbc-4f58-a6dd-c13b0bb5ff1c@amd.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 10 Jun 2024 08:41:25 -0700
Message-ID: <CAHS8izNwmXQTLc9VADpushYKyeJ4ZY4G9aV47W2-1St65-tKUg@mail.gmail.com>
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	David Ahern <dsahern@kernel.org>, Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
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
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 5:38=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 10.06.24 um 14:16 schrieb Jason Gunthorpe:
> > On Mon, Jun 10, 2024 at 02:07:01AM +0100, Pavel Begunkov wrote:
> >> On 6/10/24 01:37, David Wei wrote:
> >>> On 2024-06-07 17:52, Jason Gunthorpe wrote:
> >>>> IMHO it seems to compose poorly if you can only use the io_uring
> >>>> lifecycle model with io_uring registered memory, and not with DMABUF
> >>>> memory registered through Mina's mechanism.
> >>> By this, do you mean io_uring must be exclusively used to use this
> >>> feature?
> >>>
> >>> And you'd rather see the two decoupled, so userspace can register w/ =
say
> >>> dmabuf then pass it to io_uring?
> >> Personally, I have no clue what Jason means. You can just as
> >> well say that it's poorly composable that write(2) to a disk
> >> cannot post a completion into a XDP ring, or a netlink socket,
> >> or io_uring's main completion queue, or name any other API.
> > There is no reason you shouldn't be able to use your fast io_uring
> > completion and lifecycle flow with DMABUF backed memory. Those are not
> > widly different things and there is good reason they should work
> > together.
>
> Well there is the fundamental problem that you can't use io_uring to
> implement the semantics necessary for a dma_fence.
>
> That's why we had to reject the io_uring work on DMA-buf sharing from
> Google a few years ago.
>

Any chance someone can link me to this? io_uring, as far as my
primitive understanding goes, is not yet very adopted at Google, and
I'm curious what this effort is.

--=20
Thanks,
Mina

