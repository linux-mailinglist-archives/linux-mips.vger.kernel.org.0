Return-Path: <linux-mips+bounces-3507-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E93FF8FF325
	for <lists+linux-mips@lfdr.de>; Thu,  6 Jun 2024 18:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AFBE1C2209E
	for <lists+linux-mips@lfdr.de>; Thu,  6 Jun 2024 16:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651271990CF;
	Thu,  6 Jun 2024 16:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ymO+zb85"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EC3198E60
	for <linux-mips@vger.kernel.org>; Thu,  6 Jun 2024 16:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717693102; cv=none; b=lUZTnnDXvTgDfQ/SGHndh/PH5qa0MPU40oXUmtN8yIdHs/3zJ+lkZNGEJi/apGnDU8b3nU68vZlvfUmtEo4/EQXIOSi8GzAbRb9MqUz+aZfBHWyZXwGc6vS0tw5LgAqXYfPZysoKIg+yff2criATtV+/mFxxaC0Rc+t5N5ZQbgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717693102; c=relaxed/simple;
	bh=4LAT/qwUx+hpUWMrCfCLSnOxPPMN46bQKs4JM+ecNVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzDJE65rRcGCwDTSW1NcfSxLZ/DZPc8iL8Wab9QkBPRR340VjU4btrtt+2iymAorGywNQLBfeIvx5EhepYiJlQ8NeJmQfH8X+I5jl/AJ17P6+ukhLAHOM9DkiHlSPWhdvwvWVJk/30sGlZykF4eKZn2GAzBXdERmDYvOgRN+T6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ymO+zb85; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-579fa270e53so1737699a12.3
        for <linux-mips@vger.kernel.org>; Thu, 06 Jun 2024 09:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717693097; x=1718297897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jylD5VdLotA86Z7MUVU8wz6TNgXb9980vHa3X2PNUNQ=;
        b=ymO+zb85cAZLDHJE/Q2j4AcadlWeBcb6wnlFVDkSgfUydQUphDuqPFEh3fzOICf5Ug
         S6930QhLrCEFBqOeEvijakHaPdZb4pcvdZFNyeeFn5OIxKUmLmreD+uAz4FxLtUYaT4i
         8+igBhkXPEi91hwoCvk6LCC83a751kELtVORkwxyasdVO+JjZ9bJCP+8DK6PbIpkcdTA
         DayoEFDxalP1IemDK6Al3zp7ltoiff5/CA5SRhaQ12t6LjsFDAwWv5EjIXHW/QUYoU+s
         fADBKLlGmzTxFwErv1j3cfv/f94mdc6pGuUDPQBLNsyScEte5k+Kutvy5sJZYWR9Zqis
         Yg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717693097; x=1718297897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jylD5VdLotA86Z7MUVU8wz6TNgXb9980vHa3X2PNUNQ=;
        b=bfw9OUUQa8z5jhi+Rmjp1z3WtptfZBaVxFlN1Qb4kg9kWKrMFkKCIb334flE3JbAOp
         9JVmxUpzfSMsGfOKmia4XEBDBV4iEI9yKkbwIMukJH93FuSJAtiEPc4ESDrllLjLYsUt
         Fv6ojemp/b3glbcq9w9EwrRUuhpNc7LfGYBxyWTWPndiyjypTVosMBMSZFd8/7/Qsh8B
         V6Xf2rd3rTkfVF2Qtnc/8MY+uh6LVhnWE9L/uEiSbpbi+rrV9MH93K+eLnpEk41zSOGr
         uUnNBF5GyAQs62omafWhA0+P21TK/LIF7nKzdWowF1E0Xpq+LT9XNEqQHMO8pV/asgmX
         iX8w==
X-Forwarded-Encrypted: i=1; AJvYcCX59Q5NSh2vOCFVt6jWd8ow/YJxUDgUR8VcQOsLE96aOkk5QPagm49JqKFW/qwwG4E46OdjAIzof0qRaqyOPjA9cQSsW04X/MsVpw==
X-Gm-Message-State: AOJu0Yy/9Lah5tBDNk01+jhkKgDGb2Nu4VI1CzpLZJd4DfMLL2K18/8d
	m8bGomgx06Ybc4s6WkIPa5nd9OFK/37ld6HNDMbcYYVJYacRcFR7ycLFYztg6A/zdDCm2uJwwfq
	YZ0+fGaVCZ/Xu9yjf2LNlfICL0tdAs/N3A87i
X-Google-Smtp-Source: AGHT+IEy8tF4w5nFKpMjgp4LNCeJXDsMNuKu99RJBZQa2eob/f6gFlNSUxoAYqR0tlHBDkAdRThFWqNLt5Xt32HaUnk=
X-Received: by 2002:a17:906:1453:b0:a68:3e32:384 with SMTP id
 a640c23a62f3a-a6cd7a7eb86mr10614366b.46.1717693096783; Thu, 06 Jun 2024
 09:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-11-almasrymina@google.com> <84162ef4c695cb764454087ca0bc81082d4fac8d.camel@redhat.com>
 <CAHS8izNupu9u1zx9YD9KaNxahBeZeaajOUUSFePbQk+rfUFn+Q@mail.gmail.com>
In-Reply-To: <CAHS8izNupu9u1zx9YD9KaNxahBeZeaajOUUSFePbQk+rfUFn+Q@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 6 Jun 2024 09:58:04 -0700
Message-ID: <CAHS8izPw-R8MjZdgZTLcKoTe6=gSp1rh3GKZ9Q-Z7Txgc_RVjw@mail.gmail.com>
Subject: Re: [PATCH net-next v10 10/14] net: add support for skbs with
 unreadable frags
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
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
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 9:49=E2=80=AFAM Mina Almasry <almasrymina@google.com=
> wrote:
>
> On Tue, Jun 4, 2024 at 3:46=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
> >
> > On Thu, 2024-05-30 at 20:16 +0000, Mina Almasry wrote:
> > > diff --git a/net/core/gro.c b/net/core/gro.c
> > > index 26f09c3e830b7..7b9d018f552bd 100644
> > > --- a/net/core/gro.c
> > > +++ b/net/core/gro.c
> > > @@ -422,6 +422,9 @@ static void gro_pull_from_frag0(struct sk_buff *s=
kb, int grow)
> > >  {
> > >       struct skb_shared_info *pinfo =3D skb_shinfo(skb);
> > >
> > > +     if (WARN_ON_ONCE(!skb_frags_readable(skb)))
> > > +             return;
> > > +
> > >       BUG_ON(skb->end - skb->tail < grow);
> > >
> > >       memcpy(skb_tail_pointer(skb), NAPI_GRO_CB(skb)->frag0, grow);
> > > @@ -443,7 +446,7 @@ static void gro_try_pull_from_frag0(struct sk_buf=
f *skb)
> > >  {
> > >       int grow =3D skb_gro_offset(skb) - skb_headlen(skb);
> > >
> > > -     if (grow > 0)
> > > +     if (grow > 0 && skb_frags_readable(skb))
> > >               gro_pull_from_frag0(skb, grow);
> > >  }
> >
> > I'm unsure if this was already mentioned, so please pardon the eventual
> > duplicate...
> >
> > The above code is quite critical performance wise, and the previous
> > patch already prevent frag0 from being set to a non paged frag,
>
>
> Hi Paolo!
>
> The last patch, d4d25dd237a61 ("net: support non paged skb frags"),
> AFAICT doesn't prevent frag0 from being a non-paged frag. What we do
> is set ->frag0=3Dskb->data, then prevent it from being reset to
> skb_frag_address() for non-paged skbs. ->frag0 will likely actually be
> a bad value for non-paged frags, so we need to check in
> gro_pul_from_frag0() so that we don't accidentally pull from a bad
> ->frag0 value.
>
> What I think I should do here is what you said. I should make sure
> frag0 and frag0_len is not set if it's a non-paged frag. Then, we
> don't need special checks in gro_pull_from_frag0 I think, because
> skb_gro_may_pull() should detect that frag0_len is 0 and should
> prevent a pull.
>
> I will apply this fix to the next iteration for your review. Let me
> know if I missed something.
>
>

Actually, sorry you're right. As written, d4d25dd237a61 ("net: support
non paged skb frags") prevents frag0 from being a non-paged frag. I
can just drop these excessive checks with no downside. Sorry for the
noise!

--=20
Thanks,
Mina

