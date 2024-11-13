Return-Path: <linux-mips+bounces-6742-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 295BA9C7D85
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 22:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5C9D1F239C9
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 21:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7141C8FD7;
	Wed, 13 Nov 2024 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qobWQf6w"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECE118B48F;
	Wed, 13 Nov 2024 21:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731532671; cv=none; b=DqRvIzXey98zKkWFzzgRAlbnvsQ9sSjJXC0mw6x+KIN0YfCAz0mfVx3RlvJuLmXRzrnFCR9+j82oGg+GSQc5cH93rsAP49tKo/rZQ00NEL7NbBB6bvfmsHU6sykcJV4EF6rSDDiQos3RRYSvYs3XVwcnkr05MxYk2AgYZthrK3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731532671; c=relaxed/simple;
	bh=m1eLhEj4EKzxqNTtsCphMOGJfA8yOPNQo6qRDOfw4dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlIZQbB75N9lfFMeaclZg87UoVcrM7rZd4IcFUbpK7Jd3yFRnhlNCkEhyL56vjMXd8OgQky3+vSPH0pQzS+Ypaf32bRHOvrZ+rzwqumN4g5SLskpIFXQ3YT9aMr650+ce30xqVXGL8VYEcViKJ6+KvRoM18Fox3jSYGI/VaVmJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qobWQf6w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BEAC4AF09;
	Wed, 13 Nov 2024 21:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731532671;
	bh=m1eLhEj4EKzxqNTtsCphMOGJfA8yOPNQo6qRDOfw4dQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qobWQf6wk19/9x8DrE8JtMqTY/74uteQfRCZSDnhsQz2UGLriIMGMjUH8tt8GS8DE
	 u0FzV/cu7ZKCXHSd2qB0pwv7ibilcSNictzfX06fEyvxuQJ7WZI5bcPEFSop9YAGAN
	 jlZxwcgUlCi64e6eGbFONDsk6k2M8gEHnz9pTNMj5bvPErhWhlvKuqUsxWPkKj52GQ
	 AbFlhzXMXOjwy+Ell+iUL8TXPh9buhAu9V6BZsVVzKy3qPtk/q/retDXnzdUNV/zMf
	 kc8M6WOcvnhahw+LrMgqxO/sQ92v0VqdGcYDvsSqYW8N7XVJowHr/II40kEt2xtY4l
	 TIgT8fs/cHgXg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so65016261fa.3;
        Wed, 13 Nov 2024 13:17:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFCqjOlrPWLsvnNhM1zvlbE+qRTjH3ddx5GiIOq/Y+UFb1scIfFLTwOI/BbDi+2ayXg8+S3ySpMaPSLzc=@vger.kernel.org, AJvYcCWhhiktbMOOfgd2HgV59GUfZDT1PFLc0fPAl61S2Mj+EvwC4Y4dZc6EaLLzcdAxVIHywUSeku8tZpOGDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzju52gX5kuHJGw1/l61hU3z/nkaCDUpX7Bqj6fpSM8A3Sp+RjJ
	UE2HbyugFxG46dqve5oBVisNMcP8b2VUl6KLQyqINeJXyjLrJ5jCmdqF5Mdc1NINUoNWMLtXaX5
	we8jonD23BIEvKjLVsFTC25ZfGyY=
X-Google-Smtp-Source: AGHT+IE+CGmouIjNUZ7U/WrQAz4IWJaQw88hUesHTej6pbTyvQZwYQJxZDIukau2enMU0Pl8IScsPpwmrVWXpurSEVg=
X-Received: by 2002:a05:651c:881:b0:2f6:649e:bf5c with SMTP id
 38308e7fff4ca-2ff4c59d9d1mr28438041fa.17.1731532670075; Wed, 13 Nov 2024
 13:17:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113064028.2795128-1-xur@google.com> <alpine.DEB.2.21.2411131542500.9262@angie.orcam.me.uk>
 <CAF1bQ=TUYoc3kUnBOtO4BWfuDLb5_YdxduVGsMfsyP7jLWmH5w@mail.gmail.com>
In-Reply-To: <CAF1bQ=TUYoc3kUnBOtO4BWfuDLb5_YdxduVGsMfsyP7jLWmH5w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 14 Nov 2024 06:17:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS6rG2Pez+r1UWpWccokKBRVgjoYrxf+_+s2H98BFukhA@mail.gmail.com>
Message-ID: <CAK7LNAS6rG2Pez+r1UWpWccokKBRVgjoYrxf+_+s2H98BFukhA@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: move _stext definition to vmlinux.lds.S
To: Rong Xu <xur@google.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Klara Modin <klarasmodin@gmail.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 3:13=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> "
>
> On Wed, Nov 13, 2024 at 7:55=E2=80=AFAM Maciej W. Rozycki <macro@orcam.me=
.uk> wrote:
> >
> > On Tue, 12 Nov 2024, Rong Xu wrote:
> >
> > > The _stext symbol is intended to reference the start of the text sect=
ion.
> > > However, it currently relies on a fragile link order because the exis=
ting
> > > EXPORT(_stext) resides within the .text section, which is not guarant=
eed
> > > to be placed first.
> >
> >  Umm, arch/mips/kernel/head.S does mean to be linked first.  We rely on=
 it
> > for environments where there's no entry point is available and executio=
n
> > starts from the beginning of the image.  See the comment right below yo=
ur
> > change.
> >
> When you said "arch/mips/kernel/head.S does mean to be linked first", is =
it
> a hard requirement in mips? This patch only moves _stext but leaves other
> symbols from heads.S for TEXT_TEXT macro to order. For example,
> __kernel_entry is placed in the middle of the text segment.
>
> If we want head.S to be linked first, I can change the patch to place
> all symbols from head.S before TEXT_TEXT.

No change is needed for this.

arch/mips/kernel/head.o is always passed to the linker first.

This is guaranteed by scripts/head-object-list.txt





--=20
Best Regards
Masahiro Yamada

