Return-Path: <linux-mips+bounces-8814-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FADA9E350
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 15:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B70317DB65
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 13:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B39527701;
	Sun, 27 Apr 2025 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8MDgaqL"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317F02FB2;
	Sun, 27 Apr 2025 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745760655; cv=none; b=TALSal9ocm34r5EXvRqEezKZR5XTFUasWKteIc2bhOE9eCPsFDc+Nx0G2hTyTKoXzLusbi1Wq8EQ9nShimWvJyPZlRzIXYmk7nleaBg3TNdQWNvE5QQbdUEERqW48hBXALozdSXoi8OMqzVVdgcpSYRCPYUy5+woWcwyxoybhcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745760655; c=relaxed/simple;
	bh=QLiSECn3J1/AoHA6NaWfFJNX/bjAlbfQgr0GWvmK1uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ts4Mbwtr7oAXnIqvFp6f882M32L4g9X06IQIA61QQ67IWsoOifDXBfQoR0vMvGA/uVyQoYefmBsFZSePvhgIxoQt9Y/IZAuMOik2pxedk9xR+jy2zeKDWtF8b9bFEJGcqJsMBigCKPj/xqUguo7/6q47+rEQOrFHe4OwJMuEzGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8MDgaqL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3430C4CEEE;
	Sun, 27 Apr 2025 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745760654;
	bh=QLiSECn3J1/AoHA6NaWfFJNX/bjAlbfQgr0GWvmK1uM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B8MDgaqLoKOPGGAsWYWN0ZxpmwAD8BT7JBGtAWIPfmq7jaRoGgaRSG0QIRUmqmu7R
	 7rZR8Xz2AUjUVzwGbna1M1V+fHNi4ZVs7Vc1lp3JnvLtmw6asc7XrHeFOCAQwp/2SB
	 dVZ44YlUk9I/tB+rTo58AsyGocAem4dobFg5Y8W983ldv7JBYKxvzIsIVqrlmbroII
	 EDFyKXdn8B0nRRtD+3SsunT5xlxBYVSSPfUWUIHbAL1anS32DQoRX7zsRHJ7FK+GTG
	 NU0CLZyZgv9ALAfbESwHQSC2H5+1fTPTrQ7pzapUiVgt66qFNpQmA3Mv8YsnlkyCk+
	 v5nb9JRLubupQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acbb48bad09so706267066b.0;
        Sun, 27 Apr 2025 06:30:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJWMcm3KyJjTVWkhrTaJYvOvBej6RZNQDBN32O+Vyt3DJJCEWac6mHXwRxM131ldqvtKwoB6PqYhsD2A==@vger.kernel.org, AJvYcCXK6AWyDGcGZWSYxkgSVY70VG2HaDf8On0mIs0jv2vpW/AAUoaDO+aXzO+GkrCXQtDxwWLlNi1AQYnmlL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxEO1EzRXEG7Dbl6IXft1IzibbFqWgaNJyIYOJJP+zXlu3zMEq
	WrMo8e50MJ5nUPaIDZ8cj0JEPLkrNNBa9zS1sZR22PZUNxQfIsVhSFOfvZeyuemF5mt3+HZGzuS
	BB1U4HWnxRiLgQwZNZk7h4lIFALI=
X-Google-Smtp-Source: AGHT+IELro+phFjtaVGxtncGcQOnucAqf+tQMoMbzdt3GTdUS9DdgwUZlCNRkRA243xc4XMIHCW9JV6DEPCljNYWiqc=
X-Received: by 2002:a17:906:7305:b0:ac7:391a:e158 with SMTP id
 a640c23a62f3a-ace84bb104fmr474167366b.59.1745760653256; Sun, 27 Apr 2025
 06:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427113423.67040-2-thorsten.blum@linux.dev>
 <CAAhV-H6kxy9NaWXqq1QLfobVvVz9-VMybHC6M+0V-sE3MY9SRA@mail.gmail.com> <aA4oag9MAXT3y0t8@alpha.franken.de>
In-Reply-To: <aA4oag9MAXT3y0t8@alpha.franken.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 27 Apr 2025 21:30:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5A_xFMXOXPJFz6FyD_FixDW2msGM1fRe-FdDSq=anS8w@mail.gmail.com>
X-Gm-Features: ATxdqUFip4HUK7Uxe6BBXA9iokWAlwJhotVBkFvZZQCh6f6NtaFBjOHIESBxbIo
Message-ID: <CAAhV-H5A_xFMXOXPJFz6FyD_FixDW2msGM1fRe-FdDSq=anS8w@mail.gmail.com>
Subject: Re: [PATCH v3] MIPS: Fix MAX_REG_OFFSET
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, Oleg Nesterov <oleg@redhat.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 8:52=E2=80=AFPM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Sun, Apr 27, 2025 at 08:32:05PM +0800, Huacai Chen wrote:
> > Hi, Thorsten,
> >
> > On Sun, Apr 27, 2025 at 7:35=E2=80=AFPM Thorsten Blum <thorsten.blum@li=
nux.dev> wrote:
> > >
> > > Fix MAX_REG_OFFSET to point to the last register in 'pt_regs' and not=
 to
> > > the marker itself, which could allow regs_get_register() to return an
> > > invalid offset.
> > >
> > > Fixes: 40e084a506eb ("MIPS: Add uprobes support.")
> > > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > > ---
> > > Compile-tested only.
> > >
> > > Changes in v2:
> > > - Fix MAX_REG_OFFSET as suggested by Maciej (thanks!)
> > > - Link to v1: https://lore.kernel.org/lkml/20250411090032.7844-1-thor=
sten.blum@linux.dev/
> > >
> > > Changes in v3:
> > > - Keep the marker and avoid using #ifdef by adjusting MAX_REG_OFFSET =
as
> > >   suggested by Thomas and Maciej
> > > - Link to v2: https://lore.kernel.org/lkml/20250417174712.69292-2-tho=
rsten.blum@linux.dev/
> > > ---
> > >  arch/mips/include/asm/ptrace.h | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/p=
trace.h
> > > index 85fa9962266a..ef72c46b5568 100644
> > > --- a/arch/mips/include/asm/ptrace.h
> > > +++ b/arch/mips/include/asm/ptrace.h
> > > @@ -65,7 +65,8 @@ static inline void instruction_pointer_set(struct p=
t_regs *regs,
> > >
> > >  /* Query offset/name of register from its name/offset */
> > >  extern int regs_query_register_offset(const char *name);
> > > -#define MAX_REG_OFFSET (offsetof(struct pt_regs, __last))
> > > +#define MAX_REG_OFFSET \
> > > +       (offsetof(struct pt_regs, __last) - sizeof(unsigned long))
> > There is no 80 columns limit now, so no new line needed here.
>
> but not forbidden to care about it. I still prefer this limit.
Of course you are free to choose. But in my opinion "force to long
lines" and "force to short lines" are both bad, code readability is
the first thing to be considered.

Huacai

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]

