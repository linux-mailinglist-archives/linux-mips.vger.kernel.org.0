Return-Path: <linux-mips+bounces-7487-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98820A13972
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 12:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0541168D17
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 11:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4767E1DE3DF;
	Thu, 16 Jan 2025 11:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Atzo783H"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38051DC1A7;
	Thu, 16 Jan 2025 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737028276; cv=none; b=gyf8FdWF76BsYP8gpME/W3XrGE1yOG/J9zkyXiy/8+NVN5TKUBJBu8/thck1GVgiZlgCRbPefLMBWI36cfP2xlLYMSuomxT9kAkO758lXT2VLCCQQzuWemyJMBO3+2UFWbSzmC7uXPpjMMKeE7kzE/2BccTRTlLvT/dKBk2kq+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737028276; c=relaxed/simple;
	bh=/kFKOJL+hGoYTr5uFvzkOXah/nGKmj9qoWXRpZWZGeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OH6ESpBFvkMxpv4WsWCe4YNKyc4sCiI9ShClm+NNpuHa6MTR0lLr1u9KaVDPvQLn7XeNLi1iHPFQpRjpdpc/fSCtzDQHoejluZK4XHIpRFXqFE/29RW5mgs+Y0msqnA5RXsk3v2gRPHlpygvNElCKIrm2UzPEdr01mKmaKZSQvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Atzo783H; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=qP0CwaiMm1sOrPWnRedLx8q0TZjAnzqhqLimuXuGChc=; b=Atzo783Haw3JAfjQ
	+si3tt+zPq1mu1gFN0tKcCpoaHM8o5EF437BNZc36bpVo/pUHMeI+hixoK/cef7P+V2ZP2WgO14LH
	+aBznzVU0GxIt2UitE2r112aljQ4FlBoix54SnsngxLQRpqRZ+0rL8TD+R0otUWvE8eiDh6sfOQYa
	51cXMtm0wybOB8E5zY8YBsWCNFBVGDFnhGrUhJispmn3RkRW+Q+IjrpbmRi1voyAuVaYjnujjDUug
	uJGDyD2D3MQo09WQkkcTFjDCXLrXyMzu0oZgd3YYhva6YBRWYFrjr7GZhyXVJTE2pxW3oUazTc1vf
	50dsgqPNBvvBZkbYHA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tYOOx-00Ab3B-0S;
	Thu, 16 Jan 2025 11:51:07 +0000
Date: Thu, 16 Jan 2025 11:51:07 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	x86@kernel.org, oe-kbuild-all@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] irqchip/irq-brcmstb-l2: Replace
 brcmstb_l2_mask_and_ack() by generic function
Message-ID: <Z4jyq3xwlkPVrtts@gallifrey>
References: <20250116005920.626822-1-linux@treblig.org>
 <87ed13b2jv.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87ed13b2jv.ffs@tglx>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 11:50:50 up 252 days, 23:04,  1 user,  load average: 0.05, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Thomas Gleixner (tglx@linutronix.de) wrote:
> David!
> 
> On Thu, Jan 16 2025 at 00:59, linux@treblig.org wrote:
> > Replace brcmstb_l2_mask_and_ack() by the generic
> > irq_gc_mask_disable_and_ack_set().
> >
> > brcmstb_l2_mask_and_ack() was added in commit 49aa6ef0b439
> > ("irqchip/brcmstb-l2: Remove some processing from the handler") in
> > September 2017 with a comment saying it was actually generic and someone
> > should add it to the generic code.
> >
> > commit 20608924cc2e ("genirq: generic chip: Add
> > irq_gc_mask_disable_and_ack_set()") did that a few weeks later, however no
> > one went back and took the brcmstb variant out.
> 
> That's too late. The original patch is already applied and I'm not going
> to redo the whole branch for this minor hickup. I've converted it to a
> delta fix.

Thanks.

> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> 
> You cannot add my Signed-off-by to a new submission.

Apologies.

Dave

> Thanks,
> 
>         tglx
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

