Return-Path: <linux-mips+bounces-5075-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 034AC95E3BB
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 15:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 218011C2096D
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 13:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C0D1422D8;
	Sun, 25 Aug 2024 13:56:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4AD1E495;
	Sun, 25 Aug 2024 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724594196; cv=none; b=Xy9E23rs4RnYA61pytwxbWC8qp5k7dkU99oUFS5qU1Gw4hmWqt5TMUi8ifICrtaEPPCoaTrokyBZ1JEunERd0KAcBYzCNZQrUJyXzOWGPL7D0HNnWkNUHtK50mdip3nTQYspt3qbNCKlOstyYk8mZ5YUoSNDoNHEbmTL9Kp6W/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724594196; c=relaxed/simple;
	bh=YrByL0trjEm14IpG1ZnpDatog3d1e+lJ/ZgtWi5Id4Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kUq34k4rpIRuALggDwnqFwmmIxrN0/CJxW7rljvuowUnqT+k/+c40cqSy7D28uxZMfkXv6VfCDx32r7V0kozGjtHgwOURi3fZwyVZos1XlmuUQoGvKhh18sAEf+rn/QlArXT4plDu539rs0V4+Lk3oJGa7C8UXnxpqSHZQtf1To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id CF33092009E; Sun, 25 Aug 2024 15:56:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C7F5F92009B;
	Sun, 25 Aug 2024 14:56:33 +0100 (BST)
Date: Sun, 25 Aug 2024 14:56:33 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    linux-kernel@vger.kernel.org, 
    "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] MIPS: fw: Gracefully handle unknown firmware protocols
In-Reply-To: <7f0602dc-8a47-46cb-a12f-09afc082b48f@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2408251449540.30766@angie.orcam.me.uk>
References: <20240824144133.1464835-1-bjorn@mork.no> <7f0602dc-8a47-46cb-a12f-09afc082b48f@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Aug 2024, Jiaxun Yang wrote:

> Maybe something like:
> 
> static inline bool valid_fw_arg(unsigned long arg)
> {
> #ifdef CONFIG_64BIT
> 	if (arg >= XKPHYS && arg < XKSEG)
> 		return TRUE;
> #endif
> 	return arg >= CKSEG0 && arg < CKSSEG;
> }

 Or rather:

	if (IS_ENABLED(CONFIG_64BIT) && arg >= XKPHYS && arg < XKSEG)
		return TRUE;

as we want to avoid code interspersed with preprocessor conditionals where 
possible (cf. "21) Conditional Compilation" in our coding style document, 
also for the rationale).

  Maciej

