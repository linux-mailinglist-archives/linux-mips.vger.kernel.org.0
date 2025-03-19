Return-Path: <linux-mips+bounces-8232-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8FDA68E88
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 15:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 388547A71D8
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 14:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E6C1A841C;
	Wed, 19 Mar 2025 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpHK5Odu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDED19F103;
	Wed, 19 Mar 2025 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742393181; cv=none; b=Ccm/jIt+YBZEz783rs/mq/1eQpsXHl0Xv0xhVQ85vFpPl5ujis1mVC0GjIG0IlwO0ISH+oLaPnWg82Erg0eMw7F2+fTUYcpsWGMtUtiq1Pg1RW1Vf2bPhKOLvL/iEsUzGOxMF6lFn+6ayrfSsgxeRnGh8wQo7e93dy3w8BuddTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742393181; c=relaxed/simple;
	bh=oPitwtxvor18KD+TmPXmpU1x6jKftKsA2bKNw/wVapA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVESEbg0nTaZXJ2B4i9u9xTuH1KUy3UZcOgCiM80tt1YVFbpySIxH6xRyY1iCEMRNNgpBAfv8sZoF6dOqKGwmBxXFYm2ntQHoZgsBIHR0fz+f4+JIwJRTOFTr5Yc7mYPvfdTirhURdMo9oHFjf7Wgx+zL1m3SJJM/s7TzVDFiyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpHK5Odu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623F4C4CEE4;
	Wed, 19 Mar 2025 14:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742393181;
	bh=oPitwtxvor18KD+TmPXmpU1x6jKftKsA2bKNw/wVapA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpHK5Odu4L/qGehRTvwHYjMPYOamHMz/L5NCPHPwV056OHLdltpOkNE8kWZQp8U9q
	 PKimUy84YNfMRrIcg/+w+P2uSMf47o2Wc2Gj8uyYpN8dsKL/9viJ9VoDvee2uQu0yR
	 DeEerpHGbe6BMQQUkxNxQol70zwQ8pknE37JjcVjgGMphcWyN2XA68jgZGmQhOqAIi
	 FVv3aVKJGNQFA5lVXQS301uj/Pc854jNmHSXAYoUBSLaHOKJyCiEFaI4yTflgyMlnT
	 cuJSe6GR/ShwM9DdxEBS8BNZKpliMMMtB03GsX8A8RnvDxCXl4usnqNTbOgOGa8Pgw
	 vq1pHV0stDPeA==
Date: Wed, 19 Mar 2025 15:06:12 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
Message-ID: <Z9rPVHop5Ob5nAdc@p200300d06f3e987545685175b554ae65.dip0.t-ipconnect.de>
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com>
 <Z9qlW81QikxeVzQa@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9qlW81QikxeVzQa@alpha.franken.de>

Le Wed, Mar 19, 2025 at 12:07:07PM +0100, Thomas Bogendoerfer a écrit :
> On Sat, Mar 15, 2025 at 08:40:02PM +0100, Marco Crivellari wrote:
> > MIPS re-enables interrupts on its idle routine and performs
> > a TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
> > 
> > The IRQs firing between the check and the 'wait' instruction may set the
> > TIF_NEED_RESCHED flag. In order to deal with this possible race, IRQs
> > interrupting __r4k_wait() rollback their return address to the
> > beginning of __r4k_wait() so that TIF_NEED_RESCHED is checked
> > again before going back to sleep.
> > 
> > However idle IRQs can also queue timers that may require a tick
> > reprogramming through a new generic idle loop iteration but those timers
> > would go unnoticed here because __r4k_wait() only checks
> > TIF_NEED_RESCHED. It doesn't check for pending timers.
> 
> can you give a commit ID, when this change got introduced ?

That would be:

     Fixes: c65a5480ff29 ("[MIPS] Fix potential latency problem due to non-atomic cpu_wait.")

