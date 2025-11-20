Return-Path: <linux-mips+bounces-12313-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB40C73FFD
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 13:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id C759B2ABD7
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 12:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FED335577;
	Thu, 20 Nov 2025 12:38:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BA33370EC;
	Thu, 20 Nov 2025 12:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763642317; cv=none; b=dQHbOipC2dSYtTHz3Qs/BWPL/VWGVXEJQ7gNb1YxGIB8OYIg21dl2kDPY7tQwN5cv7dQzaAkPbJv7iHAJ7kIQEFtrIeB/ZYJNO30WDU9GizE1wCMblSNbkGfQJoCtfCy+0miEduAzFfC/Fk3lezHD0v58+NQBWInvcEDFmFpKLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763642317; c=relaxed/simple;
	bh=FB/I4vkd0SLVXGGvejhBwNCufCVbW8MzeHmaQUfFnhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MD8nAVX7m/EC7D031+BCdvRrpIw44097oXPhj/GBD6R0sANvPNrX5ukBxx9fN2eqCqghZAFIZyPaImMdOXf5JJa8tkqngdK2/gae5c+qfAkseicOI95Rbk1k1kdDT7qEy4rErQjqCahbPedaWzzYBEZIkB22thl7VnlEbIckUbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vM3Xs-0002VH-00; Thu, 20 Nov 2025 13:13:52 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 50243C0256; Thu, 20 Nov 2025 13:13:44 +0100 (CET)
Date: Thu, 20 Nov 2025 13:13:44 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kernel: Fix reservation for VDSO area
Message-ID: <aR8F-F41MOHi2edk@alpha.franken.de>
References: <20251117191815.69556-1-tsbogend@alpha.franken.de>
 <CAAhV-H7eoKgCWRVGWzgM55YOM9V8TRXe6Ax6-XQJF-STTpNpOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H7eoKgCWRVGWzgM55YOM9V8TRXe6Ax6-XQJF-STTpNpOg@mail.gmail.com>

On Tue, Nov 18, 2025 at 09:15:59AM +0800, Huacai Chen wrote:
> Hi, Thomas,
> 
> I think 69896119dc9d ("MIPS: vdso: Switch to generic storage
> implementation") changes the size of VDSO data from one page to
> VDSO_NR_PAGES pages, so here we need to remove "top -= PAGE_SIZE".

you are right, thank you. Sent v2 of the patch.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

