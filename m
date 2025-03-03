Return-Path: <linux-mips+bounces-8071-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE45A4B8E6
	for <lists+linux-mips@lfdr.de>; Mon,  3 Mar 2025 09:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33F473AE2C2
	for <lists+linux-mips@lfdr.de>; Mon,  3 Mar 2025 08:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0B91EF091;
	Mon,  3 Mar 2025 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2ehdjlK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEDB1EF08F;
	Mon,  3 Mar 2025 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740989621; cv=none; b=fQTaY3u4khuSEvEnDuIWq2MlM5jLJfYF39OJjbF/4sqPLc2HEMrmkepyKfkl7kuh924mJ+UWjI4GeCE+gobFvfMfpAy3TCNcPVWUaEBWrSuI4iVYJz1A52f5kePA/bdwu/2n86WR2TvwPoWP025epXcKjNBxQDn+2XTZXCFIk58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740989621; c=relaxed/simple;
	bh=s0S+9I80CpjevCy0wig5fQiXNuZjfab+nVx5S87Gnn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FBDGkDfmYXhaF5740x5nr2XiTu5e+zA4+y5tWFLAdvPiPMG6aecSWA60AvZvR6TpwIIs939hc/l18XsAfFIhGi7fUhuliuJKyR/Akri8ipgUoWZBawtRmy/HvWdW/0REx8kjZB79RsqYniFAjeTbmVGojQtFcmrsbb+XTTswVB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2ehdjlK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB44C4CEE5;
	Mon,  3 Mar 2025 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740989620;
	bh=s0S+9I80CpjevCy0wig5fQiXNuZjfab+nVx5S87Gnn8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V2ehdjlK3AKuDNZj9cLT95CKk17kosICa0yoyGXiTwXBT67Ho8dcHidqH8kuTixAX
	 vfdy8zxrGWowDxmhbznCK3UEFQsny632e9GL1MLwHpznMO5m9lTZpXiCg0C+J06hgI
	 zRZESt98qUdnEm9EbqRRut4D2Q0D3JJwYuXb1ObuwNJarlFkYMiFRbLhPj6boe/jnI
	 FxSvbSvci2YI6BIUXdBw066UrRDOnkTtWAiRf75Mim+9P7INT0a7ZlFoR18cXm3HdE
	 oo2cqaS188F3Bb8FoVrJ591EqyyZL6LSC64HaPdcXCJ8jFLEXcttINelEYmnxD/mEC
	 FEK+jWTqjKRhA==
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso42878815e9.1;
        Mon, 03 Mar 2025 00:13:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1cO7erh4XTIohCZ+jWayIiVtlhXN+vq8v63qLAAJc3PnFurHOYEYy1teYtIHgT05qh7SCmedSEXBG6bE=@vger.kernel.org, AJvYcCWURf2ikZ2SjV0tAaDOpHywNFZDY++3dDQKzfquTYcoPcZlpqRAEo/PiUdZj51fv5nh6t8dVYTQWvdCqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUXk9p1a8zaUryIKtDqbobKRzRZRyKfn1n5oQRy5Z98nON42y3
	NlVi7IFwjyyk6HV/lxlY+TxEvuD5YV8Az5YD1Wo24ct42goWiPPb31ODx9H1v0sPCTZrXLteAlO
	6QdXUaCgeGvGKBNKtHdmKuN0rGp8=
X-Google-Smtp-Source: AGHT+IEKV152w3ZCXo5m2irL1a0Bi2dlRqTEhpiMErmu+NKb75HiAlqyHvRjhSl8H5J5VDkj4QHZcQWv/twz6KnAJcQ=
X-Received: by 2002:a05:6000:154b:b0:390:ffd0:4142 with SMTP id
 ffacd0b85a97d-390ffd04280mr5293943f8f.26.1740989619182; Mon, 03 Mar 2025
 00:13:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228100509.91121-1-marco.crivellari@suse.com>
 <20250228100509.91121-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503020042100.12637@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2503020042100.12637@angie.orcam.me.uk>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 3 Mar 2025 16:13:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5ptAzHTPAr1bxrgByZrnFmMK8zJ68Z++RwC=NHWjqZmw@mail.gmail.com>
X-Gm-Features: AQ5f1JrruRq92flANTEM2Gs5u5CQJLL2VyoJGiBUlU68yQOpfTov7anWEVRtAeQ
Message-ID: <CAAhV-H5ptAzHTPAr1bxrgByZrnFmMK8zJ68Z++RwC=NHWjqZmw@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] MIPS: Fix idle VS timer enqueue
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Marco Crivellari <marco.crivellari@suse.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Maciej,

On Sun, Mar 2, 2025 at 8:54=E2=80=AFAM Maciej W. Rozycki <macro@orcam.me.uk=
> wrote:
>
> On Fri, 28 Feb 2025, Marco Crivellari wrote:
>
> > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > index a572ce36a24f..474738d9124e 100644
> > --- a/arch/mips/kernel/genex.S
> > +++ b/arch/mips/kernel/genex.S
> > @@ -104,27 +104,30 @@ handle_vcei:
> >
> >       __FINIT
> >
> > -     .align  5       /* 32 byte rollback region */
> > +     .align  5
> >  LEAF(__r4k_wait)
> >       .set    push
> >       .set    noreorder
> > -     /* start of rollback region */
> > -     LONG_L  t0, TI_FLAGS($28)
> > -     nop
> > -     andi    t0, _TIF_NEED_RESCHED
> > -     bnez    t0, 1f
> > -      nop
> > -     nop
> > -     nop
> > -#ifdef CONFIG_CPU_MICROMIPS
> > -     nop
> > -     nop
> > -     nop
> > -     nop
> > -#endif
> > +     /* start of idle interrupt region */
> > +     MFC0    t0, CP0_STATUS
> > +     /* Enable Interrput */
>                         ^^
>  Typo here; also please capitalise sentences and use full stops.
>
> > +     ori     t0, 0x1f
>
>  No time for a thorough review here as I'm heading for a holiday right
> away, but I can see you still have a coprocessor move hazard here with
> MIPS III hardware.  The incoming value of $t0 to ORI is not what MFC0 has
> obtained.  It's the value from before MFC0.
If this is a problem, then the current local_irq_enable() is also
wrong for all MIPS III hardware, because this patch uses the same
instruction sequence of local_irq_enable().


Huacai

>
> > +     xori    t0, 0x1e
>
>  And then it's only this XORI that sees the output from MFC0 (though
> there's actually a race between the two competing writes to $t0), so
> effectively you clobber the CP0.Status register...
>
> > +     MTC0    t0, CP0_STATUS
>
>  ... here.  You need to schedule your instructions differently.  But do
> you need `.set noreorder' in the first place?  Can you maybe find a way t=
o
> avoid it, making all the hazard avoidance stuff much easier?
>
>   Maciej

