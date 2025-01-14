Return-Path: <linux-mips+bounces-7444-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7801FA1106E
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 19:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0C381885F3B
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2025 18:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E07C1CAA9B;
	Tue, 14 Jan 2025 18:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iY8ASPzh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1179818952C;
	Tue, 14 Jan 2025 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736880422; cv=none; b=ohOPIVoZdXCbrQMIGz2mAsC6slWxPxz2pWdsRiLSr6lr6D2mhPO/YNdLpk9WnHU3Anx/EQ0YEX8E0Or+3XDPS48bfuocWie3Z0VPhytJZANPgbE6GEZ+Z+nhpqk8jJZJ/UfTfAMr+Prky8uwzKirqdRaSiIlszyoKFbVNCUZlOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736880422; c=relaxed/simple;
	bh=/tw8aglFNZRlLWFhZqECPDQfsOTghx5QIxIq2HJjy/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9M1CSZaWzUSicvPghaSl+fF0LkXIeHVazN9Mc3iuey8KBxvrvTSydjEZdkXmigcHFQ971/zDe9A5p1lSuRsS9Wes/3r6RENawp75VsHiWEUqdfZk6i+L08Gkuyv+OXATrTusltxvNrPRrz4Qk8HgCqvX/OzWAinnTObDiNffaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iY8ASPzh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235B0C4CEDD;
	Tue, 14 Jan 2025 18:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736880421;
	bh=/tw8aglFNZRlLWFhZqECPDQfsOTghx5QIxIq2HJjy/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iY8ASPzh+tRr0Vn1P+3Y4HmMKEGXVp6T3Ca6OwBPZR8IzgCOv86HXi5DF9utCIi6Z
	 SURbRfR3449IzsAio0u9KnyEO1sNOcAvAHXdQqMrPznpGkYcgE51iKoNmShjqSwHCx
	 yOPpqUZIhiqeAiRFaG9HJAaq6dTlOtl07gDGRW1U=
Date: Tue, 14 Jan 2025 19:46:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: Re: [PATCH] MIPS: pci-legacy: Override pci_address_to_pio
Message-ID: <2025011441-mountable-glitch-da1b@gregkh>
References: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>

On Tue, Jan 14, 2025 at 06:11:58PM +0000, Jiaxun Yang wrote:
> pci-legacy systems are not using logic_pio to managed PIO
> allocations, thus the generic pci_address_to_pio won't work
> when PCI_IOBASE is defined.
> 
> Override the function to use architecture implementation to
> fix the problem.
> 
> Cc: stable@vger.kernel.org
> Fixes: 4bfb53e7d317 ("mips: add <asm-generic/io.h> including")
> Reported-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> Closes: https://lore.kernel.org/r/99f75c66-4c2d-45dc-a808-b5ba440c7551@app.fastmail.com/
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> This is a quick fix for fixes tree and stable backporting.
> In long term, we should get logic_pio accept fixed mapping,
> and make PCI core code aware of platforms not using vmap
> for PCI_IOBASE.

Why not do the real work now.  Don't worry about stable kernels, fix it
properly.

thanks,

greg k-h

