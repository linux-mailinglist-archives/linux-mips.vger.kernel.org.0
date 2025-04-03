Return-Path: <linux-mips+bounces-8427-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF00A7A345
	for <lists+linux-mips@lfdr.de>; Thu,  3 Apr 2025 15:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7967C7A1238
	for <lists+linux-mips@lfdr.de>; Thu,  3 Apr 2025 13:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3F184D08;
	Thu,  3 Apr 2025 13:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MpS7KcBb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816D9288DA
	for <linux-mips@vger.kernel.org>; Thu,  3 Apr 2025 13:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685323; cv=none; b=J/bNYB1jusCXL3PZ2EBlk2LkkdZIXSDv8Msnuwy8mprryldTQ0kh5FT5vCIHV6gzDoh2KhehFo26qDpO7QxAnEYODhGCcf9Cm8TKX1LXJXUh/RoQkYYzekmbWdrEsUu894YYVyBHbbM85zsAtk7rX0rdUgBSeTWrecYTZgkb8cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685323; c=relaxed/simple;
	bh=XPXWeGpojpRYioPWxTUuwayBB+AsIOsFFzoGkTRwnyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGnK3FKzlf7cRVWDCS8LY+6MQAd4GRTuy2YtzCBpCaono2so1bH5xVcq/KzMZJZOpbYH3sKJ67HF5fow7HVhLdEGia1WECmlZ/F3KwxIRbpVcGCpoNO3VqAEuGNQDeeev5mnVdYhLioUSRZ48ZBw/cBN4jbLBtqwvK+/IoEjoyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MpS7KcBb; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso973869e87.3
        for <linux-mips@vger.kernel.org>; Thu, 03 Apr 2025 06:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743685319; x=1744290119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drTjAgjzVMuQip0MkHMIsxHd6WXVpRugoMYLwpJngIs=;
        b=MpS7KcBbTt9ZdOJt6EcWYWZgawPmbPoU+Rjd0eqw+rf8djFVSPxdW4Ic5/L0rQikFE
         wsyiknQGDqCUUlHvHTe+e9zZEmlZdX36KrTyXafYrKH99t85wRn/vV3KJtdg9BXuJmE1
         nEr2HiLmuUbuRD5tqRlKZdjMmQCzqD1mpgAf7mVL1T2EjAMmOTpnuOGXLorBKS+YRHjT
         5G9MIsFG+yGeo4a6ArlOBC/1Ux9Nvy8dO/SFf0Ta0HAm1NP4tb73jcDkjeJCmVFqR3XC
         id4Cg0Qio1FayCEfs+9XkbteWrsiJIKy37l94geHqU7qhgvyPyxQT0KnFQFkjW6/VkRl
         yKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743685319; x=1744290119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drTjAgjzVMuQip0MkHMIsxHd6WXVpRugoMYLwpJngIs=;
        b=kcCNKoudfzdOZ36k1sj3M6JWxqO1y0o4cIZe2n9wff8SRGC89il4ABwjNPhLtZB5Gy
         vPc5ElWwtTWy6mOIhw5/1hkecYfXAQYCQWf26CVIofrFAnpOfxBhUYaNIB+zniqbAMTt
         XPLRbje1OorGt97h5Hkf0f2O0Hs8WskGjDyB67vK8/6ciyUUUc34MOm8IumHhe0eeuAW
         X4QEWYREmLu2RoRjdmyB/jqYj4hrQ+dYAn/sV8IIqHkAxc28k3ojf3wUxnecM6KSyqac
         4ufEmcS8MMu8sPdoqYLTUnq8cYvkduZnsZGZO3GIp+jbAV55tYjup5iessFcaSYO7Iz5
         a0hA==
X-Gm-Message-State: AOJu0Yxo8BnB5TX4vqvMTq/f4e0ZaXSVgmDqOdoK0oEtb32enMUpNNvp
	o212TZBv8NHuFm9x9vkLyfEdpkJ6EZwrJuGLzea5oRQAd3BE85+FMEtp+JaESXt5FfnyJUfOqtw
	vmcsVvjrr7gl2hUyEfRVhhGqudbd4SHHGeiPZUQ==
X-Gm-Gg: ASbGncvC6zz5wNSYwffESFaG9GU2bVGk7F4Sg556Qk8RYwIBolCdGgfIZ8if0Xlk/iU
	ymow8etQcr52dl87e8DcNDEjuuKtxDd54HCixpzPRCDvYykH+nIBumTHq8JDqj56jaHNs/idEHu
	dC0HBVmBgH9EqA+5B3NrKVdFuB62eISt/dmuWEIvqO+kIvPJ9jOGvQ1gmADTU=
X-Google-Smtp-Source: AGHT+IG6nzPxWS7ePYNZ5+Oga1vo3wC6ZFL8ar0lCio7Y6TC0yBWQbh8ezJUeJEUyKZPylD3oxsVZIdB9Xj4y0cfG/4=
X-Received: by 2002:a2e:bc8c:0:b0:30b:efa3:b105 with SMTP id
 38308e7fff4ca-30ef912cb2emr24640471fa.19.1743685319415; Thu, 03 Apr 2025
 06:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>
 <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
 <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk> <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com>
 <alpine.DEB.2.21.2503260300290.29685@angie.orcam.me.uk> <alpine.DEB.2.21.2503281345010.47733@angie.orcam.me.uk>
 <CAAofZF65p+DnH8xA0+sfuZv=VO63Zgv4rQ6frrdEzQYoZ0MaWA@mail.gmail.com>
 <alpine.DEB.2.21.2503311348560.47733@angie.orcam.me.uk> <CAAofZF6Gnzm9isPt3NUuSPBmBWQsj56O43pPZAf64WEP8no2Rg@mail.gmail.com>
 <alpine.DEB.2.21.2504021933160.53907@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2504021933160.53907@angie.orcam.me.uk>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 3 Apr 2025 15:01:47 +0200
X-Gm-Features: ATxdqUHHRCxTOIKVon_bE52UEuUO1m27yo1LeOEGmqIlI0SHMvGaSWD0QnhCK34
Message-ID: <CAAofZF7YVK207bVYu5-p0CAKjpB7hHYomgd9wdV1J=5GkeNXbw@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great, so I think that I will send the v7 without the "rename" part,
so we can address this in the future, if it sounds reasonable,
and find an appropriate name.

Thank you!


On Thu, Apr 3, 2025 at 2:00=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.uk=
> wrote:
>
> On Wed, 2 Apr 2025, Marco Crivellari wrote:
>
> > > Well, you should be able to set a breakpoint at `rollback_handle_int'=
 and
> > > fiddle with $epc by hand to see if the code sequence correctly skips =
over
> > > WAIT.  Though I reckon QEMU used to have an issue with presenting the=
 MIPS
> > > privileged context over its debug stub.  Has the issue been fixed?  E=
ither
> > > way you should be able to just operate on the copy in $k0 retrieved w=
ith
> > > (D)MFC0.
> >
> > Nope, seems not fixed so far. But yes, changing $k0 is working fine.
> > With the cpu in idle code (executing "wait"), ctrl+c, then placed a bp
> > in rollback_handle_init+4. Then "c" to hit the bp.
> > When the bp is hit, I can see $k0 =3D r4k_wait_exit.
> >
> > I changed $k0 with an address inside the region, and setting a bp on "b=
ne",
> >  the value is equal to $k1. I'm assuming the value is also saved
> > correctly in $epc,
> > considering it points correctly to r4k_wait_exit.
>
>  I think it's enough evidence to prove the code works as expected.
>
> >  > Hmm, "skipover" maybe?
> >
> > Now that I'm looking at the code, shouldn't it be better to address thi=
s in a
> > separate patch or another time?
> >
> > I can see the rollback_handler* is exported also in arch/mips/kernel/tr=
aps.c
> > And there are a few parts that makes use of the "rollback" name; I'm
> > wondering if also
> > the code should be refactored a bit then,
> > eg arch/mips /include/asm/idle.h:using_rollback_handler()
>
>  Yeah, I agree cluttering the semantics change with the rename is not the
> best idea, so a follow-up patch approach will be better.
>
>  Also I wonder if we could come up with yet another name that does not
> have the exact semantics implied, so that if in 20 years' time we change
> our minds again and decide: "Oh, let's do the rollback thing after all,"
> we don't have to do the rename again.  Though it's like I'm diverging int=
o
> the bikeshedding area here, so perhaps please just use whatever name you
> have found most reasonable at the time you're about to wrap up with this
> effort.
>
>   Maciej



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com

