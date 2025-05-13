Return-Path: <linux-mips+bounces-9006-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C499CAB5D04
	for <lists+linux-mips@lfdr.de>; Tue, 13 May 2025 21:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79E5F1B6111D
	for <lists+linux-mips@lfdr.de>; Tue, 13 May 2025 19:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A5B27CCC1;
	Tue, 13 May 2025 19:19:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDEF1CD0C;
	Tue, 13 May 2025 19:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747163966; cv=none; b=ZaChw4lJUPnl7abn74jCFvXzMrn1owm0os7lgjOoXOnT/KKWxGqQAtGV+ztfU/gPPbuvkPAk8g3kIERNE5uUgmpc3pQcVCsGg5jKjHNRotgQ2f17HFFEOmgHhqUh99DHhIMfnrfZvhktKYP7UOIXRq5hgMD4S15BZm7M96Q62Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747163966; c=relaxed/simple;
	bh=q9uhQ69sMkdZ4u7RzMocjUphcOGlyx+dW/ynSSI77hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9mid27OYQ8oaAl3qPcU46XYHYtXU1kJKXPhc1vziw8E3jCzOyGBCuDmZ/IiHWPNJKOTOahC1hoaDvLy+B9PacvVNq+CUttDcBcYFtocvqlHBhvkj3mny2ABEF7GCcavgqw6n3a/tYp96naHdaFIYN3kFBvX8edNtjAxF8TXyhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uEv9i-0002eV-00; Tue, 13 May 2025 21:19:10 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 45646C0895; Tue, 13 May 2025 17:12:23 +0200 (CEST)
Date: Tue, 13 May 2025 17:12:23 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org,
	tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
Message-ID: <aCNhVw7oMRhHQNq_@alpha.franken.de>
References: <20250507134500.390547-1-cjd@cjdns.fr>
 <aCNWM5Xq7wnHVCrc@mai.linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCNWM5Xq7wnHVCrc@mai.linaro.org>

On Tue, May 13, 2025 at 04:24:51PM +0200, Daniel Lezcano wrote:
> On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
> > EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
> > processors. They are found in xDSL and xPON modems, and contain PCM
> > (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
> > 
> > The EcoNet MIPS SoCs are divided broadly into two families, the
> > EN751221 family based on the 34Kc, and the EN751627 family based on
> > the 1004Kc. Individual SoCs within a family are very similar, only
> > with different peripherals.
> > 
> > This patchset adds basic "boots to a console" support for the EN751221
> > family and adds SmartFiber XP8421-B, a low cost commercially available
> > board that is useful for testing and development.
> > 
> > Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
> > peripherals, and for historical reasons Airoha chips are sometimes
> > referred to with the EN75xx prefix. However this is a different
> > platform because Airoha chips are ARM based.
> > 
> > This patchset is against mips-next.
> > 
> > v4 -> v5
> > * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
> >   * Improve explanation of HPT timer in changelog
> >   * Move pr_info to pr_debug per recommendation
> >   * Remove pointless debug on spurious interrupt
> >   * Small code-style change
> 
> Shall I pick the clocksource + bindings changes through my tree ?

please do, I'll take the remaining patches.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

