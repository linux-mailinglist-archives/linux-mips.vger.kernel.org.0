Return-Path: <linux-mips+bounces-8375-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2EDA71B7C
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 17:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 167CD84262F
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 16:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2335D1F5402;
	Wed, 26 Mar 2025 16:02:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EBB1F4703;
	Wed, 26 Mar 2025 16:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743004923; cv=none; b=d9QA+HLkyDq5eCwF+r8SwqDNkLdK94UfADEfIzmko9Z28jH2AHWsF85Ln7iu6PWgwp5SqjvzpTtDMT0EidHKTk4MaV0ZuhQYdpCIJFp9LcHuta5Q/ctM/etylmTZdu8jMpvK9qa9N2wC+XoCeRtBVp5UKBCC03HOsBLFaGoMFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743004923; c=relaxed/simple;
	bh=gikYG0N+HwVfMssT3V0KA6C5t3HSmahHn5KJWzp9fNo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=auO4ZXUK3IzXUVRZAX93UfqlPJnGuRTR7tQ6Q6MHYBt9rtYKZ65gV0nsB9vm9RLsiP1YAUs85ZER1O1LetCpWg6WiFxxTLjkAWT1NW8XjnmjOQARBrTMEgLwc6SoMDF5qfLOsr6C03GGbpXOmv8QmmmSLTAGIiCB5UPs0QucbhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id AF46192009C; Wed, 26 Mar 2025 17:01:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id A89E292009B;
	Wed, 26 Mar 2025 16:01:51 +0000 (GMT)
Date: Wed, 26 Mar 2025 16:01:51 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Marco Crivellari <marco.crivellari@suse.com>
cc: Huacai Chen <chenhuacai@kernel.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
In-Reply-To: <CAAofZF52_yKcpd+GBE9ygggeNTOVQDP7AKau5xZE+N4fHGCgSQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2503261556020.47733@angie.orcam.me.uk>
References: <20250315194002.13778-1-marco.crivellari@suse.com> <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk> <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
 <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk> <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com> <CAAhV-H7Tko290LSCJPuVFE2qds81N4C=8RPz4edC-xddFvZGjA@mail.gmail.com>
 <CAAofZF52_yKcpd+GBE9ygggeNTOVQDP7AKau5xZE+N4fHGCgSQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Mar 2025, Marco Crivellari wrote:

> I'm mostly thinking about future changes in this part of the code.
> But if it is ok what we have now, and future changes are not a
> problem, let's keep this version.
> 
> Would this be ok with you @Maciej?

 Nope, I think it's the wrong direction and I have a longer reply in the 
queue, but I yet need some time to complete it.  I just got off the plane 
having been away from home for a month and I have other stuff to do first.  
If it was broken for ~30 years, it can wait a couple days yet.

  Maciej

