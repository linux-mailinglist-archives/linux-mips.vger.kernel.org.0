Return-Path: <linux-mips+bounces-12380-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 489B5C966F0
	for <lists+linux-mips@lfdr.de>; Mon, 01 Dec 2025 10:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D2E273416FF
	for <lists+linux-mips@lfdr.de>; Mon,  1 Dec 2025 09:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443B03019D9;
	Mon,  1 Dec 2025 09:45:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E4B3016FF;
	Mon,  1 Dec 2025 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582307; cv=none; b=oemXwyq0Kyc77ofOEhmSJ0DDmrm2dl0IsqvRQ3pJXX+RYbAnK5vBV45TcPeqVj/TTxRzPdhwK05TV4TYzzxmxsGiDIC2Q835Grxj1SZ4ttpZDwATMG2oEyMxNB+/dQPu9RV0pAtThZWgqwtVkE+K/kfs5cWYUZETALZq7uWSPE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582307; c=relaxed/simple;
	bh=X4KHRr8qM5FrljnxnIGsfd/uzUZx9ygEZKHeKdqkl9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1kFFBM35wLl6yNa38BynQQBQ6STv4NH8I98IQNbXNnfcx3/J+qw6NDOuFVPH+Y3Z2I7Zo5IhMLG0pTh4BV3kD742f0ZVVFzI9KmQUb+NySqYF1wBy1VYjcf8dYEFB5wddXAXQhuHTY1DJAkfRpysXXBo6IX4sKmjK3Gpd5/HNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vQ0Sn-0002fw-00; Mon, 01 Dec 2025 10:44:57 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E1D2AC07E9; Mon,  1 Dec 2025 10:42:32 +0100 (CET)
Date: Mon, 1 Dec 2025 10:42:32 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: dts: Always descend vendor subdirectories
Message-ID: <aS1jCDNfAFrGZzT2@alpha.franken.de>
References: <20251120204717.1982418-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120204717.1982418-1-robh@kernel.org>

On Thu, Nov 20, 2025 at 02:47:16PM -0600, Rob Herring (Arm) wrote:
> Commit 41528ba6afe6 ("MIPS: DTS: Only build subdir of current platform")
> broke building of all DTBs when CONFIG_OF_ALL_DTBS is enabled unless all
> the various kconfig options were also enabled. The only effect that commit
> had was getting rid of some harmless build lines such as:
> 
>       AR      arch/mips/boot/dts/mti/built-in.a
> 
> Those lines were part of the built-in DTB support. Since commit
> 04e4ec98e405 ("MIPS: migrate to generic rule for built-in DTBs"), how the
> built-in DTBs are handled has changed and those lines are no longer
> generated, so revert to the prior behavior.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/mips/boot/dts/Makefile         | 35 +++++++++++++----------------
>  arch/mips/boot/dts/realtek/Makefile |  4 ++--
>  2 files changed, 18 insertions(+), 21 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

