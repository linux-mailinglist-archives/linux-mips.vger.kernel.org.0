Return-Path: <linux-mips+bounces-8297-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 013BAA6C4DC
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 22:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C1A9464349
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 21:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B9A22E414;
	Fri, 21 Mar 2025 21:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bt6LTwGs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D6122D4F9;
	Fri, 21 Mar 2025 21:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742591378; cv=none; b=I3Wds0Xf+0O/7J4mhdReymNcrQQ/KgfwFS54u4V2PHgHWcgtI/5OELoMaexxfyRWe+ZlH0J+/Us4WNAazh/tNHuV5QazIw6IvzQu75XcYB27TOaLivsfoA/vnx8gXtjrRCopa1DjHRpthVaCb2kbWfF6sK9Ys6lRXywzAYSjdCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742591378; c=relaxed/simple;
	bh=whhP0KzmgT3qie63weZAIagQITxX3G+/arii0U/P9xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6cnkfZ6A2GtKEy4rDRluTLIU3dbQByKdNbLA8WRUDGGmGN14VZX7F+zythy6DDQfMIZe6Ih+m1FvAwyMFVB+ESEPBCB9VuHH0Iq0DP/SgLEmeJ39ZkfES38R90AD4m23GfRq88Zxui8c+UA1T1pbAsf/rnOtrv3LhGsU1cpY9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bt6LTwGs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE84EC4CEE3;
	Fri, 21 Mar 2025 21:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742591378;
	bh=whhP0KzmgT3qie63weZAIagQITxX3G+/arii0U/P9xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bt6LTwGszrLK/S8SedFfIYFgAesNMKsFUgjny2ejQRUvqpCRtwDIGfce5wi1G3WZK
	 Vl22jV9qO175QmGIGFZFCHzMeQho+GyIp9KMVZ1x7p6TJlj3065IMDqq4jWgO0zXkt
	 p8BrIeZlxP80mHx0gN/qrKmZ/jddrvPoaYQ9shTKfpzOI10bRaOdSJcuLr5Vw0b2VA
	 dtjhHnn0/ePP/rKCEY0k32wVPygNIf9vpXFHGw+AC6pet2IeiAsrBbLLtlqwAiPumo
	 YIq+rnEYKtSRCVszqFkFOKuvFEtBFsc4XsNcnFGceca29+eb+ZKLjTATTU+X9FeADY
	 ugAEc5Sut0+Fw==
Date: Fri, 21 Mar 2025 22:09:35 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
Message-ID: <Z93Vj7BLTEvgWwda@pavilion.home>
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com>
 <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>

Le Fri, Mar 21, 2025 at 11:53:54AM +0000, Maciej W. Rozycki a écrit :
> On Sat, 15 Mar 2025, Marco Crivellari wrote:
> 
> > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > index a572ce36a24f..4e012421d00f 100644
> > --- a/arch/mips/kernel/genex.S
> > +++ b/arch/mips/kernel/genex.S
> > @@ -104,27 +104,30 @@ handle_vcei:
> >  
> >  	__FINIT
> >  
> > -	.align	5	/* 32 byte rollback region */
> > +	.align	5
> >  LEAF(__r4k_wait)
> >  	.set	push
> >  	.set	noreorder
> > -	/* start of rollback region */
> > -	LONG_L	t0, TI_FLAGS($28)
> > -	nop
> > -	andi	t0, _TIF_NEED_RESCHED
> > -	bnez	t0, 1f
> > -	 nop
> > -	nop
> > -	nop
> > -#ifdef CONFIG_CPU_MICROMIPS
> > -	nop
> > -	nop
> > -	nop
> > -	nop
> > -#endif
> > +	/* Start of idle interrupt region. */
> > +	MFC0	t0, CP0_STATUS
> > +	/* Enable interrupt. */
> > +	ori 	t0, 0x1f
> 
>  This instruction sequence still suffers from the coprocessor move delay 
> hazard.  How many times do I need to request to get it fixed (counting 
> three so far)?

This is because your request had follow-ups from Huacai and Marco that
were left unanswered:

     https://lore.kernel.org/all/CAAhV-H5ptAzHTPAr1bxrgByZrnFmMK8zJ68Z++RwC=NHWjqZmw@mail.gmail.com/
     https://lore.kernel.org/all/CAAofZF4HAczyRmuRe-JmQ2wcZatevLwGTOMLf1V1okGbj7q5Wg@mail.gmail.com/

We have detected this longstanding architecture specific timer handling bug on
loongson and MIPS and we could have just dropped a report and let you guys deal with
it. Instead we decided to spend time ourselves (especially Marco) working on
fixes for these architectures we don't run and which we are not familiar with,
alongway taking reviews seriously and patiently re-iterating accordingly.

So please be gentle with us.

Thanks.

