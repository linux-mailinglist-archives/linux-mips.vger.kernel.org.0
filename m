Return-Path: <linux-mips+bounces-12403-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD104CA7EA5
	for <lists+linux-mips@lfdr.de>; Fri, 05 Dec 2025 15:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E21C03408D17
	for <lists+linux-mips@lfdr.de>; Fri,  5 Dec 2025 11:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8C732E73E;
	Fri,  5 Dec 2025 11:54:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C965301716;
	Fri,  5 Dec 2025 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764935670; cv=none; b=SEm8yDX7njXjxX6T8YSbSPXXjmn47Pn2U9Jbn/eB8EfTR/fhIDSa20NVpiBCSGPDBWvxFuZtr868tCR8xhdxEKGhDQG28ThWIA5D//axCRnbANlsOhhj9zhnAHZ6vmsZwQYgcOcKbAJ0oklDRU8zrzDlHwdc6/y/Zi+SrZ8kWko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764935670; c=relaxed/simple;
	bh=Ud4CaEe0NOOXwTCH8tjoEYM7QbMgIjLyfJdqfV+mZjs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mECUfuXofeDD+FeWxQyCqmq5nvC2I0RpzqO3t98AiEGssrq9HbF1C/ju6pk9wMlLMJ+jBNKgFuWlVrQvA1ADhTHJHQVVUB+Gvdd/zs1Q2fFM3OGCIWlJdx7lsMvYIx7RZsdOl/LnTmjdfvXXptsd3C+xDGLrDWKF/dDN4xcikfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 4F48C92009C; Fri,  5 Dec 2025 12:54:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 487D592009B;
	Fri,  5 Dec 2025 11:54:02 +0000 (GMT)
Date: Fri, 5 Dec 2025 11:54:02 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Haoxiang Li <haoxiang_li2024@163.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, FlorianSchandinat@gmx.de, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix a reference leak bug in ip22_check_gio()
In-Reply-To: <20251204103618.89502-1-haoxiang_li2024@163.com>
Message-ID: <alpine.DEB.2.21.2512050429410.49654@angie.orcam.me.uk>
References: <20251204103618.89502-1-haoxiang_li2024@163.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Dec 2025, Haoxiang Li wrote:

> If gio_device_register fails, gio_dev_put() is required to
> drop the gio_dev device reference.
> 
> Fixes: e84de0c61905 ("MIPS: GIO bus support for SGI IP22/28")
> Cc: stable@vger.kernel.org

 Even if this does ever trigger in reality, it's seems like a benign issue 
that does not qualify for the -stable tree.  Please read the first section 
of Documentation/process/stable-kernel-rules.rst for the acceptance rules 
and if you still think this needs to be backported, then give rationale.

  Maciej

