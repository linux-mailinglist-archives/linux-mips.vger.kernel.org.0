Return-Path: <linux-mips+bounces-4152-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC4992839C
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 10:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C9181C20D0B
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 08:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7E841A81;
	Fri,  5 Jul 2024 08:24:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEF313AA2C;
	Fri,  5 Jul 2024 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720167873; cv=none; b=P9uBJ5J/VR1VD6Upe0WvU1LyIaR4fUrwDLsXBvbwy0sprhsJoHZZXUJm1OzkCgwuzTp55Zqhlo81V7Eu8PjZCp9AoHPluWC0z0CuIZn6QqrqSaofMr9yphuOuofp0Uz9TNTrDjxLiLJnKI7KUMQjA9uzCHBB4ShyHdy2yQ4t1Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720167873; c=relaxed/simple;
	bh=sUQZBTWUeBLL9upQa3A6QmjYnBHcEuC/z3Jz211+Fb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETmKASq5QXIboLyI8c7yWsuvL69XA2rDr5zamQVNCzsUVjNf4Lraexo8CbZnQxN4BTE+wmkPINiN7SExFtjZNTmhHh+pa+NJnMV48s92syhO26LRzJDXynrHbb/Y8va2mlgdfw6UWcz0ekdFXTfXRupBlxkIreQiLA3/YdLWGZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sPeEV-0003DF-00; Fri, 05 Jul 2024 10:23:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A8709C02A4; Fri,  5 Jul 2024 08:55:31 +0200 (CEST)
Date: Fri, 5 Jul 2024 08:55:31 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	"paulburton@kernel.org" <paulburton@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] MIPS: smp: Make IPI interrupts scalable
Message-ID: <ZoeY4xnbC9iVnVq6@alpha.franken.de>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-1-e332687f1692@flygoat.com>
 <ZoVokcDYqZnuqd2X@alpha.franken.de>
 <7a822a33-dd67-4827-bbd0-01e75e203951@app.fastmail.com>
 <alpine.DEB.2.21.2407032204331.38148@angie.orcam.me.uk>
 <e54ec104-2e19-46da-8c3d-b6b7f620f563@app.fastmail.com>
 <alpine.DEB.2.21.2407042324300.38148@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2407042324300.38148@angie.orcam.me.uk>

On Thu, Jul 04, 2024 at 11:36:02PM +0100, Maciej W. Rozycki wrote:
> On Thu, 4 Jul 2024, Jiaxun Yang wrote:
> > No worries, I'll try to fetch a BMIPS3000 SMP router to get Broadcom platform
> > undercover.
> 
>  But that's a completely different design from the SB-1 line, isn't it?

I have a BCM1480 system to test, so that's covered. I'm going to
test on IP27 and IP30, too.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

