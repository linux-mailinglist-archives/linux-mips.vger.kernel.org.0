Return-Path: <linux-mips+bounces-8235-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D76ABA69318
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 16:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 652AB1BA20F7
	for <lists+linux-mips@lfdr.de>; Wed, 19 Mar 2025 15:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8B61DE3DF;
	Wed, 19 Mar 2025 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSNMqmi7"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C079319DF99;
	Wed, 19 Mar 2025 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396473; cv=none; b=tnRhAB3La8mNusu0Uc9cimMJ5IkxWDCMs9tDlJe5PF8DQpH8WwWQLNs1ZsfXevEPIW3VlecbRPzdipOOBGGKKv1lm7DbRMW6b/2NBXpoA2nAGEGDLehWmhXLRgNPLhboyMmuE44xmIXTqZlMyi0e4raIr3/N51pPImCd4/QRn4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396473; c=relaxed/simple;
	bh=MxK+eqVKozInpCa3uETcJFbuie+6YfGWOqKJmeLtxmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fqm9IRmlibB6gSLk6hvvBXm7miGyIzOX3HZ0qpHgefeHQQ8WpfInQISjKEucWphgFOVIyNLI6WwxZZIWUrS3GJNr/PCLOdmI2vfcg7fv5ZiFdhJTuhYH9j6SQdixxDRSpxaJhVireVTByDuxNcIQZvJsdsCryWa6+g6Imx7FKJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSNMqmi7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221F7C4CEE8;
	Wed, 19 Mar 2025 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742396473;
	bh=MxK+eqVKozInpCa3uETcJFbuie+6YfGWOqKJmeLtxmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSNMqmi7ujEzARpX3zeWUm35kFN+TVoR53RZ1VV+Pc8jtgkF3gU9H2VaVR5RIow2C
	 BaeMdABa/q28P0pQItvfo/BF1tFbUQHTGNBWjS+ARtSY/2RL26fUwGg5RtqWRnny1h
	 WaI+ROFN9AcGzOmw8Yy3CKrwqJRN6ZX7xO/d4Uf6sBPkWj0fF6ia6TGIUxyw+q9N/P
	 +u1Pk4rVQYI58utkCFugc5K1jelbZnVgRDSJuegdrste/Tjt6s44sZ567+68bhd00S
	 Qo4ToKbCuHNYSXdoMwYu9dXjwFZf9rX2jl/ZAkqKs70UNxtWDKQDSX3+TC1cNmr+76
	 QzLPACARIxlxg==
Date: Wed, 19 Mar 2025 16:01:09 +0100
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
Message-ID: <Z9rcNdJg5Gi4skim@p200300d06f3e987545685175b554ae65.dip0.t-ipconnect.de>
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com>
 <Z9qlW81QikxeVzQa@alpha.franken.de>
 <Z9rPVHop5Ob5nAdc@p200300d06f3e987545685175b554ae65.dip0.t-ipconnect.de>
 <Z9rXyGQZFSIgvQrh@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9rXyGQZFSIgvQrh@alpha.franken.de>

Le Wed, Mar 19, 2025 at 03:42:16PM +0100, Thomas Bogendoerfer a écrit :
> On Wed, Mar 19, 2025 at 03:06:12PM +0100, Frederic Weisbecker wrote:
> > Le Wed, Mar 19, 2025 at 12:07:07PM +0100, Thomas Bogendoerfer a écrit :
> > > On Sat, Mar 15, 2025 at 08:40:02PM +0100, Marco Crivellari wrote:
> > > > MIPS re-enables interrupts on its idle routine and performs
> > > > a TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
> > > > 
> > > > The IRQs firing between the check and the 'wait' instruction may set the
> > > > TIF_NEED_RESCHED flag. In order to deal with this possible race, IRQs
> > > > interrupting __r4k_wait() rollback their return address to the
> > > > beginning of __r4k_wait() so that TIF_NEED_RESCHED is checked
> > > > again before going back to sleep.
> > > > 
> > > > However idle IRQs can also queue timers that may require a tick
> > > > reprogramming through a new generic idle loop iteration but those timers
> > > > would go unnoticed here because __r4k_wait() only checks
> > > > TIF_NEED_RESCHED. It doesn't check for pending timers.
> > > 
> > > can you give a commit ID, when this change got introduced ?
> > 
> > That would be:
> > 
> >      Fixes: c65a5480ff29 ("[MIPS] Fix potential latency problem due to non-atomic cpu_wait.")
> 
> hmm, so even then checking TIF_NEED_RESCHED wasn't enough  (we are talking
> about 2.6.27) ?

Right, the real issue dates even back earlier because the aforementioned fix only
handled the TIF_NEED_RESCHED part of the problem but the timer part of the problem
was there before.

However nohz was introduced only earlier the same year (2.6.21). We probably
don't need to dig much further...

> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

