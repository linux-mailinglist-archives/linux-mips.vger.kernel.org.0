Return-Path: <linux-mips+bounces-8431-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD5DA7B052
	for <lists+linux-mips@lfdr.de>; Thu,  3 Apr 2025 23:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D40E13B6D85
	for <lists+linux-mips@lfdr.de>; Thu,  3 Apr 2025 21:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5191ACEC8;
	Thu,  3 Apr 2025 20:17:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A10133997;
	Thu,  3 Apr 2025 20:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743711473; cv=none; b=Lt/WTojetb10IpBqbEg4ZaLvofyg9Lb2zKGK6HHk6D4aUg0zHKFD8AyjEZSmA1Ho1b9rCkI3ftCt5n25bNya55hYJfEqbRj6bGHxdybARHvdVFRuhgquk7hBZZCK4bX8jcDJFbKPJIj82kuV8H3HXTPgK5LE8WfVRPJ1RXLpleU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743711473; c=relaxed/simple;
	bh=ejLLA06zLnyyVFtt9C0U6uklOKBjBiRO5UroAuh+hrM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tcj4zx954sCbQTHzJubDjGXtqIvn0r95F4Rj1FIlBcp0hvNKJMus3qHsDDthX8VwEGBRW52LY/AKJzI0r34TERYsLDMHmiOAGlXgkBp9ZlMrPesaGxlxc1YuyffK3MS2DcYiQFS8JQVLfZAqmVSL4I5QGnhZ7mgEThzDQm82hR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6FC1F92009C; Thu,  3 Apr 2025 22:17:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 68AB092009B;
	Thu,  3 Apr 2025 21:17:48 +0100 (BST)
Date: Thu, 3 Apr 2025 21:17:48 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Marco Crivellari <marco.crivellari@suse.com>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
In-Reply-To: <CAAofZF7YVK207bVYu5-p0CAKjpB7hHYomgd9wdV1J=5GkeNXbw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2504032112590.53907@angie.orcam.me.uk>
References: <20250315194002.13778-1-marco.crivellari@suse.com> <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk> <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
 <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk> <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com> <alpine.DEB.2.21.2503260300290.29685@angie.orcam.me.uk> <alpine.DEB.2.21.2503281345010.47733@angie.orcam.me.uk>
 <CAAofZF65p+DnH8xA0+sfuZv=VO63Zgv4rQ6frrdEzQYoZ0MaWA@mail.gmail.com> <alpine.DEB.2.21.2503311348560.47733@angie.orcam.me.uk> <CAAofZF6Gnzm9isPt3NUuSPBmBWQsj56O43pPZAf64WEP8no2Rg@mail.gmail.com> <alpine.DEB.2.21.2504021933160.53907@angie.orcam.me.uk>
 <CAAofZF7YVK207bVYu5-p0CAKjpB7hHYomgd9wdV1J=5GkeNXbw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Apr 2025, Marco Crivellari wrote:

> Great, so I think that I will send the v7 without the "rename" part,
> so we can address this in the future, if it sounds reasonable,
> and find an appropriate name.

 Well, from experience "future" sounds like "never" to me, but if Thomas 
is fine with that, I'm not going to fight a battle here.  I've got enough 
stuff to do now, including some rather urgent discovered last month, as 
far as the MIPS port is concerned, let alone other things.  Thank you for 
your perseverance with this effort anyway.

  Maciej

