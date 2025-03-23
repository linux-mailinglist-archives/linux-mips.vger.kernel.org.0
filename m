Return-Path: <linux-mips+bounces-8317-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 117C2A6D077
	for <lists+linux-mips@lfdr.de>; Sun, 23 Mar 2025 18:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CC223B0DC9
	for <lists+linux-mips@lfdr.de>; Sun, 23 Mar 2025 17:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D145316BE17;
	Sun, 23 Mar 2025 17:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y87jEWOY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EDjk09+/"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E3853AC;
	Sun, 23 Mar 2025 17:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742752609; cv=none; b=RW093/hv47wAWtbaU6+FznpuhiDvux8fSk3qHWas7xbGDGLWyzVuqmT89uFj7bmU3YLT+LTK8ZX3JlzTiWjqRAFMYWtXtjlllfLIcy12ZMSiEL6G7uBvLb5UH+/s6zKg30lLw21+nxumOKb4zF+MpEBzlDVVu7v16qebCAiIv9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742752609; c=relaxed/simple;
	bh=KVf36YralWdv1yn+YqWFleHtYGS7OetRESKY/2lYMqA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CcmFLyAIIOMTZhSo83ujMZ6KfTD5diT7XF2aJL5k1KA355yekPVFdj6VbGIIN4kzUFypFKZnETiKl6KEdyJVhaZqmyxGzCo9H5E6IXBN7kxR+5+YwoW9XCOJXuckPZ+Bg72rD/mr4zwv0susTnFLOU+yfPVqsZ1MSSpE/scEwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y87jEWOY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EDjk09+/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742752606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ybbVEqQyi4LCnvj4QmAykSpUgiX8fgqqKRGS630vjfo=;
	b=y87jEWOYX4464VeoruYLaAPU0k/JzrSZc4nr7DcxkgC9nirArTyPxeyn0IQRV5MKfRpiz8
	j3ADuPA88mlbXhpawYzlNDXX0RZQwIbAFKfH7Td64JsgvIwAN5yL4LUV/kG0ZmU2t4ikVS
	ooSRXk+kSSmuz1304nczVLoCmP4Faf0pkbtCf63X/GiJPxps2rfyxwY1Iqtz2kUW/L1OhF
	cyfpuBY87JMXgtOy6FX5w6IsQBG7TLAO4S0CaASwZQknZBs6NsrB9x5NI87FvXCu3CfOHM
	Hy63du7RWi2S8nTtde2uxkwhGVjZpKHHvQL78BSWnn4NnZsxKycoJS3YkUp8sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742752606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ybbVEqQyi4LCnvj4QmAykSpUgiX8fgqqKRGS630vjfo=;
	b=EDjk09+/OtprWxZE4lAWSMMaI/bHuRBpN5/G4UE2i+WNOxMDc/s/GBUC2s1KD1L8ykPq1m
	sU+RAGmbQq9BfWBg==
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu
Subject: Re: [PATCH v1 3/8] irqchip: Add EcoNet EN751221 INTC
In-Reply-To: <7307e611-1cc6-425e-a066-478794878d8e@cjdns.fr>
References: <20250321134633.2155141-1-cjd@cjdns.fr>
 <20250321134633.2155141-4-cjd@cjdns.fr> <87tt7m1664.ffs@tglx>
 <ce72abfe-e822-48d6-9fc7-3cf9faffdc76@cjdns.fr> <87bjtt1nod.ffs@tglx>
 <7307e611-1cc6-425e-a066-478794878d8e@cjdns.fr>
Date: Sun, 23 Mar 2025 18:56:45 +0100
Message-ID: <8734f31vhe.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Mar 23 2025 at 04:06, Caleb James DeLisle wrote:
> So it's my belief that what I'm doing here is standard for 34Kc.
>
> The reason I asked the question in the beginning was because I wanted
> to check my assumptions and know if there's any way I can get SMP
> without writing this dispatcher.

Fair enough. If it just works as is then I don't have any objections and
the question vs. SMP has to answered by the MIPS wizards.

>>>> So this patch clearly should have been tagged with 'RFC'.
>>> Given the patchset works correctly in testing, does this comment
>>> stand?
>> Until the EI/VI issue is resolved so that it either works or cannot
>> happen.
>
> All said, if "depends on !EI && !VI" makes you happy then I'm OK to add it.

It's not about making me happy. I just want to avoid a situation where
this causes hard to diagnose issues.

> Just what I'm afraid of is being asked to find an authoritative answer to my
> question before merging, because if nobody decides to jump in with one
> then this could just be blocked indefinitely.

Nah. If it works the way you implemented it and you can arguably exclude
EI/VI interaction, then there is no reason to delay anything.

Thanks,

        tglx

