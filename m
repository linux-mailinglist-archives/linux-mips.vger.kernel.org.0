Return-Path: <linux-mips+bounces-8047-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBBAA49E4D
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 17:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A0351898B30
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 16:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D066C186294;
	Fri, 28 Feb 2025 16:07:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFACF16F265;
	Fri, 28 Feb 2025 16:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740758848; cv=none; b=Y4OvIjATAtwX3UfXu6S1EUEDZPdEPJwqrEtnDoVrGN6ntibYLlynRnvQlIT8Y3Hqi/quPdbCMgIxPGSOPwGeTC11JMB/h8jBL6hoXdW3zGyIZ/RV05jFzWOmlOrzln3+9ro8VZezIgKbIRfF2xWOZfGzChr+U/QhjuC7LNqbrrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740758848; c=relaxed/simple;
	bh=iS7aMQrTuwwVHhltihhmeLdmbIQGuaKuwqL1dNTMGQ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YPz6mQpbE3wVr1S8DOUyuk1uzGITib93BYGFSIqrlyIcxU0xyjohJFOjPlCavMFCHzvK7yTfMc0vjoCivDpNzekpak9I5UDsjRCvLgfqoN568ePVjgATtCXaB6D7/xgTP3xLZOO/O+Sshoj35n/NOjJwg+66vo6iBJ4geN5kNSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E4F5792009E; Fri, 28 Feb 2025 17:01:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id DDD8792009C;
	Fri, 28 Feb 2025 16:01:16 +0000 (GMT)
Date: Fri, 28 Feb 2025 16:01:16 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: chenlinxuan@uniontech.com, guanwentao@uniontech.com, 
    linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
    niecheng1@uniontech.com, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    zhanjun@uniontech.com
Subject: Re: [PATCH 5/7] MIPS: dec: Remove dec_irq_dispatch()
In-Reply-To: <222468E85948B141+20250218125842.667798-1-wangyuli@uniontech.com>
Message-ID: <alpine.DEB.2.21.2502220019210.65342@angie.orcam.me.uk>
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com> <222468E85948B141+20250218125842.667798-1-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Feb 2025, WangYuli wrote:

> Currently, dec_irq_dispatch() is exclusively invoked by int-handler.S.

 It always has been, since its inception, see commit 187933f23679 ("[MIPS] 
do_IRQ cleanup").

> Inline the do_IRQ call into int-handler.S to silence the compiler
> warning.

 Up to commit 8f99a16265353 ("MIPS: Tracing: Add IRQENTRY_EXIT section for 
MIPS") `do_IRQ' used to be a macro, that's why.  At the time `do_IRQ' was 
converted to a macro `dec_irq_dispatch' was created and previously this 
place used to call `do_IRQ' too.

 It's always good finding out why things are as they are so as to make 
sure you haven't been missing something.  This cleanup should have been 
made along with commit 8f99a16265353, so it's pretty old a technical debt 
being sorted here.

 Please add these findings to your commit description in v2.

 NB I'm off on holiday starting from tomorrow and I had issues with DEC 
hardware in my lab (now sorted, required a visit on site) so I couldn't 
get to your stuff sooner and also I won't be able to verify any of this 
until I'm back mid-March.

  Maciej

