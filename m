Return-Path: <linux-mips+bounces-12382-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F275C966F9
	for <lists+linux-mips@lfdr.de>; Mon, 01 Dec 2025 10:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BDC7F340ECD
	for <lists+linux-mips@lfdr.de>; Mon,  1 Dec 2025 09:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18BB302177;
	Mon,  1 Dec 2025 09:45:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31ECC301701;
	Mon,  1 Dec 2025 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582307; cv=none; b=PcmPDMNoA75JrmaWM7g9gVrIhb3uf6+HyKXnQekYk3/C0NVGIobsCWcwXRVOKmm3BQOg1+7UNcHZImysZGWoIK/OygmomA7Phdlfo5ux5LFMjqd7+6jzS3u9bkXfLa/NYWpfcM7rS7fWbs+BLWsZq8jZou9gHToLbXTO3jV+Jn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582307; c=relaxed/simple;
	bh=IlYFrMp+EBUMEe5YrpVjLk8D9ITuKjOgXQgK1ntJSRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEq49/1Ht0ZiWsY9VMAHBjS/sqUJ0zVVWfyNZizSdIjqv937/sgntpOmteIUN0oZ9iHUFv/D6vUrFRhsLuM838d+UsuQzQ/pFozqg/GDt6/q03LVsnPJXHMK+/TZrnwpgP4SU74LbB7InHVA9RWsIJkZMS59raDywVjuH8EGAvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vQ0Sm-0002fo-00; Mon, 01 Dec 2025 10:44:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1A2F6C0256; Mon,  1 Dec 2025 10:40:47 +0100 (CET)
Date: Mon, 1 Dec 2025 10:40:47 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix whitespace damage in r4k_wait from VS timer fix
Message-ID: <aS1in-g4pb7J0Xez@alpha.franken.de>
References: <alpine.DEB.2.21.2510191229030.39634@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2510191229030.39634@angie.orcam.me.uk>

On Sun, Oct 19, 2025 at 12:49:02PM +0100, Maciej W. Rozycki wrote:
> Remove stray spaces/tabs introduced with commit 56651128e2fb ("MIPS: Fix 
> idle VS timer enqueue") and add missing indentation for a branch delay 
> slot.
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
> It would have been caught, for the most issues, with:
> 
> whitespace = indent-with-non-tab,space-before-tab,trailing-space
> 
> in git configuration.  Is there a way to get it propagated with checkouts?
> ---
>  arch/mips/kernel/genex.S |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

