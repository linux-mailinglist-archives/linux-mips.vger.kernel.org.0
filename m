Return-Path: <linux-mips+bounces-8243-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D72FA6A1A6
	for <lists+linux-mips@lfdr.de>; Thu, 20 Mar 2025 09:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F3B1466BDB
	for <lists+linux-mips@lfdr.de>; Thu, 20 Mar 2025 08:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A96214A74;
	Thu, 20 Mar 2025 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zt7drcpH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BB7213245
	for <linux-mips@vger.kernel.org>; Thu, 20 Mar 2025 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742460278; cv=none; b=lvzOlXLld/er6UPpYEJSHftENS84wdr/VKEsgZUkg5/3JTkYglIDUNqks+Dc4H4WUucgILDykuEIWNglWNuG11EmlyOVqoaeMjmc3caIjI93bofHLW8wwEUV9LMbBrCIyySoARCg8YrHDKxBOlFYvWxqtv+f7z8nVd0hBey6vcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742460278; c=relaxed/simple;
	bh=sNlZgEoM5+8aD5NbLEVmAJRTCvDhbMemNyvFDAP0U7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=py6ZuSwQIIwKG1q//6ljQjTODsA9P7Dqb3A7KD19VTh0jzhx8RYv8Nn1hh1OHdmEqKOUjRjEDJjvP3W2DLKWMZGZe7MFq/9oC+SDawstseL1/DhgrqeDrzQ6GQjdF69RUJ9ohzGs+CvDcgX06QpEX9NHFx+3p1j+Fw3hgljF2bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Zt7drcpH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549963b5551so594919e87.2
        for <linux-mips@vger.kernel.org>; Thu, 20 Mar 2025 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742460274; x=1743065074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/k1TBH3sxq1FZoSFnZ47X5UW8nMXZ6o8WkSmhqI6VCM=;
        b=Zt7drcpHLiUY7ibCOp0G6krqNUnhmgJrfECLZdsS4fVkmxOOpO1FFSLC+6wIDxnGep
         uRG4EReaxjiBEyPD0l3NCdGC9FDn3N1F80qjtaLPUZkj1HfffIT/QdxPZVtvw6HGNicP
         VGLLWSu1trMcVh0uPYeqyQyJar1fjBMCnjHOyFAvgubGriYRqyLyyDZ17utw4GuLVDhF
         DPQ7VjOY68bJL8cbsxpEdYig43gTlneiIk28fsf2a+3osTn/klVt0NkmXVuOt+LO6iPO
         VKxFR0gu3/u4ejNcNYtf7Xh7BMZfOMeizuff2w7FBT88zFS6fy6x3oTrfC39AtJdWOrx
         VMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460274; x=1743065074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/k1TBH3sxq1FZoSFnZ47X5UW8nMXZ6o8WkSmhqI6VCM=;
        b=mpoDN7nb+BjBh2KjuGFWZxkH/xa5wBY/pczjbmnoBuLYkqmERaCiqOQaf5JYV9zOH5
         sbreJidRHyLQTsJyj9t3kU9rmlUxOUcnKa6qoIEVdcJ11kMxyE/m1wJjUGaq9V0GvdDl
         MIY2xEh1iAbl+fhrcqour3wWBiXmCrOj4HgujZ/ItbbyOxJoZ7H9y7G8tnnpc+BUJ0ID
         80lg8oYnDmsEi+sFVtyZNsmy0XNzfWwgMJXPZ7f0k3T4ipiEOU72hrq63tUsXP0d/G21
         MuCQYhFeSCHGp4BBOY7xI37hjOphXA5Ka/r/+lY8jd1FoND64gvrm9EmccT+9BiUBzV1
         rLKg==
X-Forwarded-Encrypted: i=1; AJvYcCXb8OgiGN8jW16w6bgykOVN1ziS+E7PdpcoHSU59nYntUTW4sls7p8ISIHU8BlsN48xUGsYOIUeqv3y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Y3E/hzNuP0ljM3QFCd+dosYNctQuK4DpofD40/t27mXOQGos
	FQtuiiQy+eGdCFxpAkQGQizD6a4rtiVbYf8syxXwvBMGpv7uJ4hB2R39lV3/mwBiy+kdjkWvt74
	ICpmDC9aAkhZnZIGhiX0vQIjp3492Zm418q2RVfsP1vazdBGpDUg=
X-Gm-Gg: ASbGncsSSNkpKlLG6KmZOHFndxZhmWWvZ/4Tq9G2GcKjYfDbzVSaAh4lIvq2bWI5lag
	pYnDQ4eNkTY6tRw7mh5vG85QeJswxMJhKEpForHHw7nltRxo7YhdfJYZUvd8mQg4N727/5WF1aR
	KM7cGVy24QZLnlXkJywAulA2BD1/gr1GqO80YrfNTwWfBK3uqWZjebny7X0CQ=
X-Google-Smtp-Source: AGHT+IEuHwmPAR1ROEzqIm1aQrHOofhKz5uOBNf8gwg/I+sejCSoTONHquML3Fgi57OcUmPeeWD1YxzLYo+rSgbjh7g=
X-Received: by 2002:a05:6512:1392:b0:54a:c835:cc4d with SMTP id
 2adb3069b0e04-54acb21bbc6mr2508359e87.49.1742460274029; Thu, 20 Mar 2025
 01:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com> <Z9qlW81QikxeVzQa@alpha.franken.de>
 <Z9rYAT9i3Ko92uUo@p200300d06f3e987545685175b554ae65.dip0.t-ipconnect.de> <Z9rjZf0ZT7iejVlA@alpha.franken.de>
In-Reply-To: <Z9rjZf0ZT7iejVlA@alpha.franken.de>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 20 Mar 2025 09:44:23 +0100
X-Gm-Features: AQ5f1JqyLjiKXqmNpIwG9UcMdDGhB0TKhG-YIBjnpUe78TaXIeqSWf6otiVZBVU
Message-ID: <CAAofZF7XPm+tzPpwAPu0oDZem+EOVY18oAbVwAXzkGmtstnBQg@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Frederic Weisbecker <frederic@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Huacai Chen <chenhuacai@kernel.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

yesterday I made this changes:

@@ -128,7 +128,11 @@ LEAF(__r4k_wait)
        */
       wait
       /* End of idle interrupt region. */
-1:
+SYM_INNER_LABEL(__r4k_wait_exit, SYM_L_LOCAL)
+       /* Check idle interrupt region size. */
+       .ifne   __r4k_wait_exit - __r4k_wait - 36
+       .error  "Idle interrupt region size mismatch: expected 36 bytes."
+       .endif
       jr      ra
        nop
       .set    pop
@@ -139,7 +143,7 @@ LEAF(__r4k_wait)
       .set    push
       .set    noat
       MFC0    k0, CP0_EPC
-       PTR_LA  k1, 1b
+       PTR_LA  k1, __r4k_wait_exit
       /* 36 byte idle interrupt region. */
       ori     k0, 0x1f
       PTR_ADDIU       k0, 5


Would it be ok to have the check done in this way?

Thanks


On Wed, Mar 19, 2025 at 11:09=E2=80=AFPM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, Mar 19, 2025 at 03:43:13PM +0100, Frederic Weisbecker wrote:
> > > >   .set    MIPS_ISA_ARCH_LEVEL_RAW
> > > > + /*
> > > > +  * If an interrupt lands here, between enabling interrupts above =
and
> > > > +  * going idle on the next instruction, we must *NOT* go idle sinc=
e the
> > > > +  * interrupt could have set TIF_NEED_RESCHED or caused a timer to=
 need
> > > > +  * resched. Fall through -- see rollback_handler below -- and hav=
e
> > > > +  * the idle loop take care of things.
> > > > +  */
> > > >   wait
> > > > - /* end of rollback region (the region size must be power of two) =
*/
> > > > + /* End of idle interrupt region. */
> > > >  1:
> > >
> > > please give this label a name for example __r4k_wait_exit and do a
> > > runtime check that it really has 36 bytes offset to __r4k_wait
> >
> > Where would be the best place for that?
> >
> > arch/mips/kernel/setup.c:setup_arch() maybe?
>
> scratch runtime check, a compile check is what I wanted to write...
>
> something like
>
> .if ((__r4k_wait_exit - __r4k_wait) !=3D 36)
> .err
> .endif
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com

