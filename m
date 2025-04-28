Return-Path: <linux-mips+bounces-8822-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEFAA9E683
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 05:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87D7B176268
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 03:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5FA192B84;
	Mon, 28 Apr 2025 03:28:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476DB2AEFE;
	Mon, 28 Apr 2025 03:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745810930; cv=none; b=pNU68tSHgY7HOZZ25/QQGkBGDG8Z+yws18QpxHOrezZdQCmfP6QO7yLnOyJAfyunSLP+7GnZ1pcmASOsnW2gbLlRipGgJ5LRTp2pVl3rSY8Qjn/G+7etZsffyhWDzf8kmaKMMeFp7xYVyxrex/rVwXZ4Mwz5k2cBGF8aAcDszGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745810930; c=relaxed/simple;
	bh=KQMDSHUmasssRNdMBdnS9s6n+ea1oWSOtZCCTSMQsCw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OVflU3oblTM9en0ldbb5LeCnCX71/+lraoyozSSYnTlSAY2DwRUw4tObu5MxiMuZnvs5AJ9OW1/d/lbexHSqCqvz5jJz6d5Yu36MzEH9tPmQ9dJpD8uypQHmPyiaOx+lzKGKyRmTXPyNQZ+H6zpGaLnJYF6nrqR3RU+bs2dCH+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 3792292009C; Mon, 28 Apr 2025 05:28:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 3135992009B;
	Mon, 28 Apr 2025 04:28:44 +0100 (BST)
Date: Mon, 28 Apr 2025 04:28:44 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Huacai Chen <chenhuacai@kernel.org>
cc: Marco Crivellari <marco.crivellari@suse.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v7 2/2] MIPS: Move r4k_wait() to .cpuidle.text section
In-Reply-To: <CAAhV-H4dQ8hRfBm2JWmgMzYH5tuy4ph6hyOSXQBLOvtCQ+K9dQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2504280426010.31828@angie.orcam.me.uk>
References: <20250403161143.361461-1-marco.crivellari@suse.com> <20250403161143.361461-3-marco.crivellari@suse.com> <CAAhV-H4dQ8hRfBm2JWmgMzYH5tuy4ph6hyOSXQBLOvtCQ+K9dQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Apr 2025, Huacai Chen wrote:

> > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > index 46d975d00298..2cf312d9a3b0 100644
> > --- a/arch/mips/kernel/genex.S
> > +++ b/arch/mips/kernel/genex.S
> > @@ -104,6 +104,7 @@ handle_vcei:
> >
> >         __FINIT
> >
> > +       .section .cpuidle.text,"ax"
> If you submit a new version, adding a space before "ax" will be a little better.

 We use no space across our port though, which is why I haven't requested 
that before.

  Maciej

