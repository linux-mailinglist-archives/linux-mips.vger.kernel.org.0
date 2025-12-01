Return-Path: <linux-mips+bounces-12379-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFDAC95EA9
	for <lists+linux-mips@lfdr.de>; Mon, 01 Dec 2025 07:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 966303A1B41
	for <lists+linux-mips@lfdr.de>; Mon,  1 Dec 2025 06:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A594A23E330;
	Mon,  1 Dec 2025 06:50:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F2178F4A;
	Mon,  1 Dec 2025 06:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764571820; cv=none; b=Gq2tLPlgYXYc3pWw4ZHp0dbAhkgv6lpYY2BYhQiOeqTjwNcGR/5D2y/AolJLHrymM8UcXSWvwmEZ822nxckf3Dksrdpgf16HxdPtGAwEwkejCt1KQzBXmUZgOv9bIgnPRg45FZ9bnyammcTC4coHEOREMhiZ0LmIZbMuZRtuJ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764571820; c=relaxed/simple;
	bh=MM0fw6+/bo7KaYo+RObp9nV6RaZvtuMlytnTLKmqIUM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uxkhxCq7VU2Dv0e/aaLcFHiG7KxkD3UPOw5l81RSfCzVfDroPl+bSM+DYMsgrgzUK7rJk8tS1HNferFrTEQD6TB83r0us573gaF9Me45IUPnZVnAY7aynepdUIvd8p1ga2B7mkLALmxOw6gsDm0Z8hPsORDk4O7TGEVrRPnSeo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id EE35992009C; Mon,  1 Dec 2025 07:50:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E7AD592009B;
	Mon,  1 Dec 2025 06:50:16 +0000 (GMT)
Date: Mon, 1 Dec 2025 06:50:16 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: Marco Crivellari <marco.crivellari@suse.com>, 
    Frederic Weisbecker <frederic@kernel.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PING][PATCH] MIPS: Fix whitespace damage in r4k_wait from VS timer
 fix
In-Reply-To: <alpine.DEB.2.21.2510191229030.39634@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2512010648070.36486@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2510191229030.39634@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 19 Oct 2025, Maciej W. Rozycki wrote:

> Remove stray spaces/tabs introduced with commit 56651128e2fb ("MIPS: Fix 
> idle VS timer enqueue") and add missing indentation for a branch delay 
> slot.

 Ping for: 
<https://lore.kernel.org/r/alpine.DEB.2.21.2510191229030.39634@angie.orcam.me.uk/>.

  Maciej

