Return-Path: <linux-mips+bounces-10397-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7268FB2D9F9
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 12:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3245C1C40AB6
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 10:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537FE2DAFBF;
	Wed, 20 Aug 2025 10:25:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F5F19D8A8;
	Wed, 20 Aug 2025 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755685559; cv=none; b=oh4bOZLchlfVtReCTFa+pv1efVyHOauvuGUXVSRKubteyBmtNDi7XublzLwB6kpK8eNPR3n7A6J7RZoatXceVTSigAcMwd3b0CKi0g/LA0pwnc+LAujZXOzbakviPtJ5k8Him6EUpTXXYAC20RRU0T2kLF2hZVutB5DPYw8H94U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755685559; c=relaxed/simple;
	bh=e24nH6hB1zqybFzLAcWiXaeMPH2em6ptEvBmNhj1Ay4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7i14QplJezVLRk0Bna+FzeIQhxAXh6q1cB6gDj8xIfKwiXXcZJ9LtYIRBT9rapQB3UcLLC46goCvO1+O9zl26kOQ/S2JioGBeW4IFGUFxwkFwd1xpLkE/k8woSUUnvXzzboNQpaK8Wyrdi5FOXHJ2ccuM2DKJnEQg8hoxaFCY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uog0s-0006tc-00; Wed, 20 Aug 2025 12:25:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 79453C075D; Wed, 20 Aug 2025 12:24:25 +0200 (CEST)
Date: Wed, 20 Aug 2025 12:24:25 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	john@phrozen.org, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] mips: lantiq: fix ethernet support
Message-ID: <aKWiWX50F6kQNc13@alpha.franken.de>
References: <20250817131022.3796476-1-olek2@wp.pl>
 <20250819182641.1b7ff210@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819182641.1b7ff210@kernel.org>

On Tue, Aug 19, 2025 at 06:26:41PM -0700, Jakub Kicinski wrote:
> On Sun, 17 Aug 2025 14:49:05 +0200 Aleksander Jan Bajkowski wrote:
> > This series fixes broken Ethernet in the upstream danube dts. The
> > driver doesn't attach due to missing burst length property. OpenWRT
> > has its own dts, which is correct, so the problem has only been
> > spotted now. Other dts inconsistencies with bindings have been
> > fixed as well.
> 
> Hi Thomas, Aleksander tagged these for net, are you okay with us taking
> them via the networking tree? Looks like these are half DTS changes.

Aleksander is further changing the Lantiq DTs, so I'd prefer to take
this patches through the MIPS tree.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

