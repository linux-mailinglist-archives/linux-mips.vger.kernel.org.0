Return-Path: <linux-mips+bounces-4105-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EF4926491
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 17:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E868D1C21232
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 15:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F387517DA2C;
	Wed,  3 Jul 2024 15:13:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29031DA318;
	Wed,  3 Jul 2024 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720019587; cv=none; b=T2G4lAMJad0AAM4E4M+Izdy3W4F1QdDU8O6Bm6K5B3FRTvFfQdSXqpKMk4uIFVA4Li0bUbzKUL2pAijAmyChP5cESDCbqNJrVsMd7ykn2Bj8afaJ19/nhJJfZuSbUB5c6xHzt+Y6IO3l20xZ0Eciw0bzW8tCmBhwsGkvHZChNEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720019587; c=relaxed/simple;
	bh=SLXF04FFNu6vy2oPin14t4V34tuaX2FpSx1g2C5Z1Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XITOLc9ILwbo9QDeiZ1TrWh239axxBvxrkBiDtdWcOszUOBESEsbUoqZVQFhl7GadBNNXQqXzaop14Kxmf6gPZ9N5jQjM+R8U8Kb5Pvz80vT6NF2tTeiSpME71jtEgPjpAwz2aoYCfL+h1lgGi4E7KWHknyw1KdJp/eNMQst38g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sP1eq-0000BJ-00; Wed, 03 Jul 2024 17:12:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 08C89C031A; Wed,  3 Jul 2024 17:09:54 +0200 (CEST)
Date: Wed, 3 Jul 2024 17:09:54 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	"paulburton@kernel.org" <paulburton@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] MIPS: Move mips_smp_ipi_init call after
 prepare_cpus
Message-ID: <ZoVpwrdeRaVrzJff@alpha.franken.de>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-4-e332687f1692@flygoat.com>
 <CAAhV-H4LsuLYBefKZb5aHx_+fYyWjvO+Bm8h5=NFtSvk6E0Szw@mail.gmail.com>
 <7cbf218e-d311-4c33-aabb-7208eac231ed@app.fastmail.com>
 <CAAhV-H7RQu6wdBBjOBptZX6R63Ypw1qFCoJnZ335bFKd1f=XdA@mail.gmail.com>
 <a3d57a7e-6134-4da5-bd4a-b150d2c97912@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3d57a7e-6134-4da5-bd4a-b150d2c97912@app.fastmail.com>

On Tue, Jun 18, 2024 at 03:50:33PM +0100, Jiaxun Yang wrote:
> 
> 
> 在2024年6月18日六月 上午4:51，Huacai Chen写道：
> > On Tue, Jun 18, 2024 at 6:10 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >>
> >>
> >>
> >> 在2024年6月17日六月 下午2:53，Huacai Chen写道：
> >> > Hi, Jiaxun
> >> >
> >> > On Mon, Jun 17, 2024 at 5:03 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >> >>
> >> >> This will give platform code a genuine chance to setup
> >> >> IPI IRQ in prepare_cpus.
> >> >>
> >> >> This is the best place for platforms to setup IPI as smp_setup
> >> >> is too early for IRQ subsystem.
> >> > mips_smp_ipi_init() is an early_initcall() function, why do you say it
> >> > is in smp_setup()?
> >>
> >> Sorry, I was trying to say that smp_setup is not a good point so we should
> >> go prepare_cpus.
> > It is not in smp_setup() now, then how do you move it from smp_setup()?
> [...]
> 
> Well I was trying to justify where should I move it to, not where
> does it from.
> 
> I should improve the commit message to justify the reason first.

please do

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

