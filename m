Return-Path: <linux-mips+bounces-3301-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C78888C9F61
	for <lists+linux-mips@lfdr.de>; Mon, 20 May 2024 17:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 619EF1F21A2E
	for <lists+linux-mips@lfdr.de>; Mon, 20 May 2024 15:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D2F136E0C;
	Mon, 20 May 2024 15:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltclPiRv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADAA1369AF;
	Mon, 20 May 2024 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716217929; cv=none; b=ZHrzV4dxY8TCVNMoPX1+9vcqQSFYktbtyT0NA6z6zhbT0S6LW2FCRHotFx03JyYAQfVlRpfc85TWSLiJpqMy8eRw3OCha/EGmdobkYhXRc+caUnf/N+gg0nBgvDJh8OtYnMHyBFbgJ1wKyBkcD629p27roDzOZ6iLQBYUT2fYBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716217929; c=relaxed/simple;
	bh=CqITRP3HvOUhv+CLwPKkqznN2CVoZFJoOynUjb76pHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0LqAli+ObfTFkqvkw7P7FycZyY1rFNzCE1Hg6k/Yw30ekCzjThpgvc8/EZuPnOrLt7OGHyFecuGJiobwlbTfy6mAP5BTJnNUNBrW5x6xM2FDjdjYmNKdTyoSV2WjZmdvzM0TeIqddAAGR9tLmFisxSo79AXrt102UwRNXnC+uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltclPiRv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31117C2BD10;
	Mon, 20 May 2024 15:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716217928;
	bh=CqITRP3HvOUhv+CLwPKkqznN2CVoZFJoOynUjb76pHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ltclPiRv0EHCt0sEpJJLkNKcb0Y1LQb30bqAXOTMUhxgVlFClbHgN8yE6D5epWZ6M
	 mjqTuUfmAK4tYtDW0pCvgtN7P+42kH/P59Kl2cr3l8N/D+UJSd7TQ9hvsUjMXm+hGk
	 mB4aHvGZ5ZwpeOCwW0JrB2w/Nm28B6Nt/sIjmDuUIcpGvcgRf6gqb7DfIR70f7UQPE
	 ULPeI8JZ8Ggl3u9FEJbnCtQmmTbupBP1pov8wp8KRzWRkd2XOV0/BBueQLwJzRzw/k
	 jpysawP7sE5pjCgeTqEm96CzFoezfFiX9M7VRyi982cUDMVx7v8ydxriE20FZEVM5z
	 gE1GN4vy0eoFg==
Date: Mon, 20 May 2024 10:12:07 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Saravana Kannan <saravanak@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Baoquan He <bhe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Bauer <mail@david-bauer.net>, Liviu Dudau <liviu@dudau.co.uk>,
	Serge Semin <fancer.lancer@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/4] of: bootargs handling improvement
Message-ID: <20240520151207.GA541701-robh@kernel.org>
References: <20240512132513.2831-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512132513.2831-1-ansuelsmth@gmail.com>

On Sun, May 12, 2024 at 03:25:07PM +0200, Christian Marangi wrote:
> This is a very simple series that try to solve a very simple problem.
> 
> Many emebedded devices have very hacked (by OEMS) bootloader that do all
> kind of modification and makes the kernel unbootable with the very first
> small modification. And also many times these broken bootloader have
> hardcoded values that can't be modified and would require risky
> procedure that can brick the device.
> 
> One of the common modification done is hardcoding bootargs in the
> appended kernel DT trashing the bootargs set in the /chosen.
> 
> The main usage of this is to have dynamic stuff to support dual
> partition scheme and make the kernel load a dedicated rootfs. But the
> other usage of this is to effectively lockup the device and cause kernel
> panic on modification like using squashfs instead of legacy jffs2.
> 
> The simple solution to this is to let the bootloader override the
> bootargs in /chosen and make the kernel parse a different property.

What happens when bootloaders start using these new "standard" bootarg 
properties and you need to override them? Perhaps name it something the 
OEM wouldn't use (maybe): 
"use-this-bootargs-instead-for-the-broken-bootloader"

> >From long time on OpenWRT we use bootargs-override as the alternative
> property for this task fixing the problem of overridden bootargs.
> 
> The second feature is bootargs-append. This is self-explanatory,
> sometimes bootargs from bootloader might be good but lack of some
> crucial things that needs to be appended, like rootfstype or rootfs
> path.

It is unfortunate that the kernel's handling of appending or prepending 
to bootargs is ambiguous. And MIPS is a further mess with handling 
cmdline from multiple sources.

I'm not really interested in adding any more complexity to the cmdline 
handling until it is made common. There's been at least 2 approaches to 
doing that.

Rob

