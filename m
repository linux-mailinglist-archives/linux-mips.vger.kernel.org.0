Return-Path: <linux-mips+bounces-8819-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18151A9E5DB
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 03:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80046189633D
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 01:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D91141C72;
	Mon, 28 Apr 2025 01:38:32 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4DC8BF8;
	Mon, 28 Apr 2025 01:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745804312; cv=none; b=jTDR8AcYsYyROyGmVFlYCLKfAW9c/wUMwViku7TvOcQY74r/z1vkcoheKxqszstNPqil+P2LJsPhDCCzujyziq6q12+6xShBQx54IZNFX0nFU1XD+jPfD2retfpLY2TFhRJ3mlM/m1nXACexeBmQp9TzC38WfjkMUnpGTBTOKoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745804312; c=relaxed/simple;
	bh=2kFp7r6fupdWFFANCr/4/j7ojmTs3iFY/1TiMfvtOE4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=js7qyHyWOfEXxGPqgCVvYIbaScFMXf0tMABWjHH2ga1Q0qMaECiwEJekRfkYLXueYlwQM7BPon5xJ4NVYWvnhtgnRQTb7cMdia2I587CN1RtpdjLfTfuTumX2uhpLOxunMyacu62gI4ge3GSV3XOY6aYl8zIMUwe5PW2Gfvv7cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5634092009C; Mon, 28 Apr 2025 03:32:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 531F292009B;
	Mon, 28 Apr 2025 02:32:55 +0100 (BST)
Date: Mon, 28 Apr 2025 02:32:55 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Huacai Chen <chenhuacai@kernel.org>
cc: Marco Crivellari <marco.crivellari@suse.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v7 1/2] MIPS: Fix idle VS timer enqueue
In-Reply-To: <CAAhV-H6WszbD2o=fUqzz-FcOho-=ZxMQjW3EHKE5z=azntdbeQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2504280224110.31828@angie.orcam.me.uk>
References: <20250403161143.361461-1-marco.crivellari@suse.com> <20250403161143.361461-2-marco.crivellari@suse.com> <CAAhV-H6WszbD2o=fUqzz-FcOho-=ZxMQjW3EHKE5z=azntdbeQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 27 Apr 2025, Huacai Chen wrote:

> > +r4k_wait_exit:
> > +       .set    mips0
> > +       local_irq_disable
> >         jr      ra
> > -        nop
> > -       .set    pop
> > -       END(__r4k_wait)
> > +       END(r4k_wait)
> > +       .previous
> I'm very sorry for the late response, but I think ".previous" should
> be moved to the second patch.

 Indeed; does it even assemble?  Correctness aside I'd rather it didn't 
cause someone a problem with bisecting sometime.  NB I had no opportunity 
either to look at this version earlier.

  Maciej

