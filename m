Return-Path: <linux-mips+bounces-8845-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62F9A9EDCA
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 12:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A60816677C
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 10:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE3F25F79E;
	Mon, 28 Apr 2025 10:24:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F153B25F7A3;
	Mon, 28 Apr 2025 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835869; cv=none; b=RWRM/zf0MYSl9jSVhuJtjuZu5vHK5WY2odR7RFkpdSLhe47PbNGyUtAQQA7aejagAdOhf+Qlu+MoAGWznVlC0URvJSsvNxHfberXJqJonkkjxHAQMm4a6aMNhC0mAp8kipQlG6a1XuC1FsD7n83YVMl6BsLphyKzEsoMZoXHUlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835869; c=relaxed/simple;
	bh=+kZVIERvcyGvWe3mkjV83hs94UpwZLtoI8+++t91CoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ofvaiwk7ahI6bkEJ+rNV84zg/5oqBFHCh+8Fvh/4hP61ccGUN+XCe61jGlOGQn7Gm5JS6viobATCrgd5fCbkOGloQMIO+KbHpeULDBix2LhUKOJP7lgPyML0I1IY9/bLWlUP76aOmqJger1Ga6rAlqKUxe0/+3vTBbFtzUUaAYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u9Leo-0007dz-00; Mon, 28 Apr 2025 12:24:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A4890C0895; Mon, 28 Apr 2025 12:23:50 +0200 (CEST)
Date: Mon, 28 Apr 2025 12:23:50 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v7 2/2] MIPS: Move r4k_wait() to .cpuidle.text section
Message-ID: <aA9XNgh7qGRZ5HBY@alpha.franken.de>
References: <20250403161143.361461-1-marco.crivellari@suse.com>
 <20250403161143.361461-3-marco.crivellari@suse.com>
 <CAAhV-H4dQ8hRfBm2JWmgMzYH5tuy4ph6hyOSXQBLOvtCQ+K9dQ@mail.gmail.com>
 <alpine.DEB.2.21.2504280426010.31828@angie.orcam.me.uk>
 <CAAhV-H4WTrYecBj0wev8AUi_of_qAnvHCk4heTU5P_3pMZv4fA@mail.gmail.com>
 <CAAofZF4J6H5jgqKu=KUowBrwfHJyGEzL5ThC_DOs-XPdgm497A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAofZF4J6H5jgqKu=KUowBrwfHJyGEzL5ThC_DOs-XPdgm497A@mail.gmail.com>

On Mon, Apr 28, 2025 at 12:20:31PM +0200, Marco Crivellari wrote:
> Hi,
> 
> If it sounds good also to Maciej, I will submit the new version with the
> space before "ax" (and of course, the ".previous").

save your time, this is already applied and I won't rebase the branch
just because of this minor bisection problem.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

