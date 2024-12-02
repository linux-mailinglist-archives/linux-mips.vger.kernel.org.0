Return-Path: <linux-mips+bounces-6839-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B413C9E0AE1
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2024 19:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 821F7163EF3
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2024 18:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA4B1DDA2F;
	Mon,  2 Dec 2024 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sh/Gsxzo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBE917C7CE
	for <linux-mips@vger.kernel.org>; Mon,  2 Dec 2024 18:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733163656; cv=none; b=diJf/NZRg6Yz/0XDIhnWusiC7eIfgkf59NTedsAu1xsJ6ZYpiE98dN/nxWDRRRTmmwDkqdNO9R6WgQvO/QpwR6HGXbKqMuxEsfBzajD+8ZHyyodsOgYBv+qWbqsxS9fAmu4lod88m/tCv63vV0x70ikwyAiLFwuFflEcqVsw3KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733163656; c=relaxed/simple;
	bh=uFwq90+lMU8mVw6V54IrcusVTE8Aqkyi9aFWaNmbwsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBkDtroFVDo3SolTq8nlLdkF5FVDEERK9NVvnd/Ex6gL0TfgEjOdlHTcZJZr5/5Y8DrJfrBGvxH1wH2oY9So3ZzdRScag7XobBrwUTL32zt0I+owKg1Xf/7+afhLpoPIjze30EEAk75OWLee6+gswPluSBhY1Ac5KO/xQ+ms5xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sh/Gsxzo; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4668caacfb2so1091691cf.0
        for <linux-mips@vger.kernel.org>; Mon, 02 Dec 2024 10:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733163654; x=1733768454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28XI+BDfImJSG+QVCqY4OmNHFKGjBLOdzMFLQlLfjWY=;
        b=sh/Gsxzo6G172sDSSj4oP7PeobZ3Z8erTkhB6nYsRCBQwVcQ9BxV6y8mP1u0Ox8RDb
         ZC8EHZ5zVwt5Xbok/E2rSYPOt4vB47cmeEV0yliezW2DEC7wZd2dtqFZcMyGFBUwXb+T
         3An4pryNg9oqfA9r79h4Epg0lQQ+pFx2i1k1SAE15Z300031y6pJdQAxFMhvP+qWK5+A
         BAu2zlBqC1be8iJqj8pSwXjJuti5/OMDoazCjlvKA060fC8txKI5vtQs55hyPX5Vurq9
         qh0JdNPi9oO2Ez2tsRm1b/jhvSUakDLijIXGzFwTtuCJ2KTsNr5sXEYPti0Tlk357sh7
         BcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733163654; x=1733768454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28XI+BDfImJSG+QVCqY4OmNHFKGjBLOdzMFLQlLfjWY=;
        b=Suzk3fRVXoj9KbdXZMaL+R761byItX3Bv79vRjTMnrU/5SUixYc6Kc1fZ0FKtKIMic
         gKhiGgQ03O+rSFVHW0OHEdiSl3QLf/rmJbu2oeeMTqQK1evBBuMmWd0JlqnqVR8GgQrW
         YCHrL2e878XHJwksC6WfKn4bswynQc5gK4lHowHHDpJWKzSHr27/FdDnK0Irs9GJ9zXB
         RgI8lSsznkZg3uVXb7UOdrJ8pYFyxXb27aSfVFFqOX1wUEjPP5C8nXK4zkhLR+Zt4UZz
         QF+CkKDq1KxHoEb6bMu58knoJz8EOU1Aon+hK0JkmdM3sXoHOaXGf6dVY+axrArEt89A
         UQVA==
X-Forwarded-Encrypted: i=1; AJvYcCWZD5/pPdNiBg9/7iGxSav6ti6cg20VHU4ecC6hgcPvi7XvfolMA8CdAIzkwcNmLpSCP4JTdB5U4l/m@vger.kernel.org
X-Gm-Message-State: AOJu0YzPLLj/pitRmFzU2dsxgkC004Hs+gntdHobsLE8oVxHh2XKEcqU
	gpZHFDRAzntTEh7dI1gJ8+L/MOmhL0/78FfPM4h0GbkdY7T0TeC5RiUggueQ3tWyF+cMEOai0Hx
	cP1TIo8VJzWPivqOu7bxsEw6EGsXfd5+vKKvQ
X-Gm-Gg: ASbGncsrnYhsajqbvnwt6D1bU8yj1RTJcNlz349QVi+OA2N12N2S22QJR1MMO6CmPrh
	7wqbGG7Q6sWaFQDnGCQdYwtZCuWUdYego0+XOxu7m6iudou20kas77XLRew9dWQ==
X-Google-Smtp-Source: AGHT+IHtm40jpUNDpfP1EU60JeetrmcNu1qiT/IXO8OWuLgPNpRNyllv6KKV2oasp8tc27sL22WShZ7+/gLs61Hcu40=
X-Received: by 2002:a05:622a:5b0e:b0:466:8f39:fc93 with SMTP id
 d75a77b69052e-466c3ead405mr11680921cf.3.1733163653973; Mon, 02 Dec 2024
 10:20:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126173409.3728585-1-xur@google.com> <alpine.DEB.2.21.2412021751110.30050@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2412021751110.30050@angie.orcam.me.uk>
From: Rong Xu <xur@google.com>
Date: Mon, 2 Dec 2024 10:20:42 -0800
Message-ID: <CAF1bQ=QRYu5-CY_r7wUcku9WT8sXmD47VW42eHWGNE3bZfr4Dw@mail.gmail.com>
Subject: Re: [PATCH v2] [MIPS] Place __kernel_entry at the beginning of text section
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Klara Modin <klarasmodin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicolas Schier <nicolas@fjasle.eu>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure. I'll send a separate patch for this format change (not v3 as
this patch was already submitted).

Thanks!

-Rong

On Mon, Dec 2, 2024 at 9:58=E2=80=AFAM Maciej W. Rozycki <macro@orcam.me.uk=
> wrote:
>
> On Tue, 26 Nov 2024, Rong Xu wrote:
>
> > diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
> > index e90695b2b60e..c7528d96dd1a 100644
> > --- a/arch/mips/kernel/head.S
> > +++ b/arch/mips/kernel/head.S
> > @@ -59,6 +59,7 @@
> >  #endif
> >       .endm
> >
> > +     __HEAD
> >  #ifndef CONFIG_NO_EXCEPT_FILL
> >       /*
> >        * Reserved space for exception handlers.
>
>  A new line would be preferable afterwards so as to visually separate the
> directive from the conditional part that follows.  It looks messy as it
> stands (and we have prior art further down the file with __REF).  Please
> send a fix.
>
>   Maciej

