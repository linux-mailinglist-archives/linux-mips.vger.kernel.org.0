Return-Path: <linux-mips+bounces-8038-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9DDA49A8C
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 14:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AE9D7A2B22
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 13:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FC41E4A9;
	Fri, 28 Feb 2025 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmTrjl1Q"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D5714A91;
	Fri, 28 Feb 2025 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740749571; cv=none; b=NWrB1A/Vk9/K49KeOjPqMWLaHC8j94wpxkP15Of4vHloaRnvESqQ4MtyVGtJTaRcGZbiV1U7X4HJdS0oAjj2LzQb7geE1cDK4E9ztA57k4Al84ccd+1+YCFoqbm7MI5B6MY1GffMIkA1BoLh4L1RMB5XdZSljcSTRoX9HOV1xo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740749571; c=relaxed/simple;
	bh=kgDeE8+XcYphoLn5z8e1z71txCG8MblkUvw3HyDBSw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVasiRwxNxRjgsNW8MYb4C9lKDTDI0SuctDPXtd/njbd2hYNpi+JYCFthAsYSDbuLHgH9+OqKwxurJCpLUiZ0+RaPUxB0+7z5fltJa+2dXAh924PFFfgb5QnKwWr/vL1ZAP9+7TV39L5IVWf68ER6qZlqpU4DOEVxbgMx51TO/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmTrjl1Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247BBC4CED6;
	Fri, 28 Feb 2025 13:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740749571;
	bh=kgDeE8+XcYphoLn5z8e1z71txCG8MblkUvw3HyDBSw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MmTrjl1QQ/nKU8rFC/blJ4DbdWIUJHnt2zf1uA2niuyVRSHvEANIhMX/bYbh5n3OM
	 of+vFC9o46Bc2J/sRtqnlCM+shENSGsmTBBCym/BUPZzSEqbm0//sZ8Kl1Y5rJXcwx
	 GVdvTGwXoxxoTbPCz3w9KA0Z84ohqK23YBh6uyEeVwymlu0U6eYETkhimv0y6mgxZA
	 gn4cv3D8KPrQf80vNqB0/gfBrvzDLYKKHJm6ogzGLPcBDWLgT8DlVPNpmPcBg2a7Kl
	 62LfeDRLXOMskJClxSrLyvNZXtE0trOj545MTojQodgZdfMi67nIGJQ9OhoGkD/mJY
	 Yy5yjM9GVuR+g==
Date: Fri, 28 Feb 2025 14:32:48 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v5 1/1] MIPS: Fix idle VS timer enqueue
Message-ID: <Z8G7ABDyvMPAx47Q@localhost.localdomain>
References: <20250228100509.91121-1-marco.crivellari@suse.com>
 <20250228100509.91121-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228100509.91121-2-marco.crivellari@suse.com>

Le Fri, Feb 28, 2025 at 11:05:09AM +0100, Marco Crivellari a écrit :
> MIPS re-enables interrupts on its idle routine and performs
> a TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
> 
> The IRQs firing between the check and the 'wait' instruction may set the
> TIF_NEED_RESCHED flag. In order to deal with this possible race, IRQs
> interrupting __r4k_wait() rollback their return address to the
> beginning of __r4k_wait() so that TIF_NEED_RESCHED is checked
> again before going back to sleep.
> 
> However idle IRQs can also queue timers that may require a tick
> reprogramming through a new generic idle loop iteration but those timers
> would go unnoticed here because __r4k_wait() only checks
> TIF_NEED_RESCHED. It doesn't check for pending timers.
> 
> Fix this with fast-forwarding idle IRQs return address to the end of the
> idle routine instead of the beginning, so that the generic idle loop
> handles both TIF_NEED_RESCHED and pending timers.
> 
> CONFIG_CPU_MICROMIPS has been removed along with the nop instructions.
> There, NOPs are 2 byte in size, so change the code with 3 _ssnop which are
> always 4 byte and remove the ifdef. Added ehb to make sure the hazard
> is always cleared.
> 
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Acked-by: Frederic Weisbecker <frederic@kernel.org>

