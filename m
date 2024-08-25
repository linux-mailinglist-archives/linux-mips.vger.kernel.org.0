Return-Path: <linux-mips+bounces-5077-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E26495E421
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 17:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8C2AB20E67
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 15:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4A8155399;
	Sun, 25 Aug 2024 15:18:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFE91FA5;
	Sun, 25 Aug 2024 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724599104; cv=none; b=MAuynX+hnV4mHn41PbEOt3rGsXIgQxUf7rcoePUZOXTICUZY9ocC3uH0BE+vB9mv4gIiINsiTKxe94r3crsVcpI29MsMXC/e0VUFjUw+s4LcwGJ8Y2tUWzVsMvkuffb1Q2UhcYpBDIZ5tCoVx+Br/nbYflKMLjr6xh7QBobj4i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724599104; c=relaxed/simple;
	bh=lJw8g/0UD/7O7fg4U8NWwAWSvZ0jEi66ORXrJE+k8+s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=V1bvXvuF+7pJa/PVFY4OedutZT2PfmaoE2uHjoj+g0PRtwK211Q4a+Q70H529wX0XVYU9wk3gnLUBSLUA8OygOAbKiNq9taiUyG+lpauRuljgtcZt93zwKX2iFnxY0gEBCaZ2dyS0oXvUEbaTE0e6a3Obklnn0hurd7kC5hM/S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 60B1F92009C; Sun, 25 Aug 2024 17:18:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5ACB092009B;
	Sun, 25 Aug 2024 16:18:19 +0100 (BST)
Date: Sun, 25 Aug 2024 16:18:19 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
    linux-kernel@vger.kernel.org, 
    "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] MIPS: fw: Gracefully handle unknown firmware protocols
In-Reply-To: <87o75gy85b.fsf@miraculix.mork.no>
Message-ID: <alpine.DEB.2.21.2408251612500.30766@angie.orcam.me.uk>
References: <20240824144133.1464835-1-bjorn@mork.no> <7f0602dc-8a47-46cb-a12f-09afc082b48f@app.fastmail.com> <87o75gy85b.fsf@miraculix.mork.no>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 25 Aug 2024, Bjørn Mork wrote:

> But I can't make that match what U-Boot does.  AFAICS,
> u-boot/arch/mips/lib/bootm.c doesn't care about 32 or 64 bit, and simply
> does:

 U-Boot isn't the only firmware used with MIPS systems, and in fact it's 
quite a recent addition; e.g. DEC REX and SGI ARCS firmware goes back at 
least to 1990 and we continue supporting these systems.  There's also CFE, 
PMON, YAMON, etc.

  Maciej

