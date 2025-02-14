Return-Path: <linux-mips+bounces-7771-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7540FA35DB0
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 13:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 397D416B058
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 12:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D48025A627;
	Fri, 14 Feb 2025 12:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijhrLFSg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053852153FA;
	Fri, 14 Feb 2025 12:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739536344; cv=none; b=m3pBRMHZ57pK8lYqzbyKYTKsfu/MM88WJ5AYpjjX/5uSu1YSNeznoye10Cfm5yVRQcgjil+Ok6evcY68vWYFV7kwRdeKZHEPnkcZ+c/r8mkpB3EEcFF2MQGBULM3dbx83P2XAGKJCL6ulJ03+TVPghkioM8qR+iHLH9UrH6D0Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739536344; c=relaxed/simple;
	bh=1j41TZ1aMWWianIaAaP0fiSASHpl3wJk3U3cv7nGUow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rq3bjO09NI1Fd5lxcOm/aro065BygXdVz/hYub+UTL86Y0QrEE9GWrOUAQjwClZ1q1jvr4AS6Ki3mpcenERwt+3ebo8wHIjPEeuyhaaJtVqwI+N2x44u1Uo/FjC/Y9c27n2pqj/RHzTfbT/lgJ/oTGGWe3HNcyvPaVvdmC2/mPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijhrLFSg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F49C4CEDF;
	Fri, 14 Feb 2025 12:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739536343;
	bh=1j41TZ1aMWWianIaAaP0fiSASHpl3wJk3U3cv7nGUow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijhrLFSgb0sU4FkGZefk12o0UQCw8LfMXdOIl7Wpy0MrFwQ4zHezXnvr/UKcpqwD6
	 QhdWGg1AzQQVaqphulCWvYQ6yYmr+R6F5Y4yqK1YB0s1c7IGBmV/mWwJqE2Z7G+SHE
	 loS/mkTI6ebL6/D9m5FHfJ/m2w8tYI6LtiAlR7jpKpTqvmAij7f972qvlTC1BP6/UN
	 7sNrNur/T903zSjPxa0KSWcArT91sj5BOGDWY4H1bHQz0msLfR4GJP+K5VW2tv+VzN
	 +G9jggls57r4H8cx6gwBJoUdIFGAuKTPWBWYWPbJxO0S6sQWIvV7U1UjnfeoJGg9nw
	 tgxcb/52owYdQ==
Date: Fri, 14 Feb 2025 13:32:20 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] MIPS: Fix idle VS timer enqueue
Message-ID: <Z6831Oh38UwORCkj@pavilion.home>
References: <20250214105047.150835-1-marco.crivellari@suse.com>
 <20250214105047.150835-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214105047.150835-2-marco.crivellari@suse.com>

Le Fri, Feb 14, 2025 at 11:50:47AM +0100, Marco Crivellari a écrit :
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
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Acked-by: Frederic Weisbecker <frederic@kernel.org>

Thanks a lot!

