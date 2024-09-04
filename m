Return-Path: <linux-mips+bounces-5329-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA1196BCF7
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 14:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E92D11F24C19
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 12:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975651D9D6A;
	Wed,  4 Sep 2024 12:49:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8073B1D9345;
	Wed,  4 Sep 2024 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454177; cv=none; b=MVswvyVtALKAh2wGNNlKYeFHdR883gthfbG1b3n4uN5acXalk3ZDPbeKi6AUWru7cdeba4vqjwa2FZKwj/XTQzxvhff1tVL8pH/HBPOJuDGAI3HoXzsmczJTuwnrbeMzYbjM4t958namusbbg1rzS6TNZvE3JRXr/dsmDoog1SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454177; c=relaxed/simple;
	bh=HSvC+r3Qqvoa3KHlQWgwoyU4FCgKHXca4J/TMcTX0U8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TcYHt1LduQQKn/SaVlLAdz3i7gmSNBqLrjWUO51E7I2ei4xrBScUM/Y7B13v5bOB6u0+iJqhRzvatJxCXWoVSY+ESZCtBuakU6CGQ6ElIMcOxqpnAfRX3c56LN1KIuHl5vSUfRhhJDJCS59373Anp5gi6mWEKaflj11bFqWBT68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 92E0892009C; Wed,  4 Sep 2024 14:49:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8D88C92009B;
	Wed,  4 Sep 2024 13:49:32 +0100 (BST)
Date: Wed, 4 Sep 2024 13:49:32 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Xi Ruoyao <xry111@xry111.site>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: Remove posix_types.h include from sigcontext.h
In-Reply-To: <f47376d9dfc174fc6eeb29ee45c67413ecc1feb6.camel@xry111.site>
Message-ID: <alpine.DEB.2.21.2409041348170.1802@angie.orcam.me.uk>
References: <20240828030413.143930-2-xry111@xry111.site>  <alpine.DEB.2.21.2409040229030.1802@angie.orcam.me.uk> <f47376d9dfc174fc6eeb29ee45c67413ecc1feb6.camel@xry111.site>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Sep 2024, Xi Ruoyao wrote:

> Yes, I just mean *changing* the include file is not explained and it
> seems an error.  I'm not familiar with ancient kernels but AFAIK for
> using __u32 etc. we should use linux/types.h since Linux 1.2.

 As I say the use of __u32, etc. is not needed here in the first place.

  Maciej

