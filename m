Return-Path: <linux-mips+bounces-3656-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCF090663E
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 10:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A815B20B71
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 08:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86A613D24A;
	Thu, 13 Jun 2024 08:11:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20D813BC0D;
	Thu, 13 Jun 2024 08:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718266289; cv=none; b=BsURrG9/MfILn26B/BU5VMalCsheFE1kQU9JnVr+XmilUpPEeuGYtz1faY4j8ao5z+Ok+i182JkmP28gIfVDNY451cAVG7OqHr8jtAKr/ciKkGHfjx4IW+fsESRDO3BGkBItjuP8/L9iOtZRRCEjthWk+bVdNJRXbFC1YO9FLKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718266289; c=relaxed/simple;
	bh=0Whgikdh0A9ZjDD2kwRWTabvViRWZPhQsbf62STcyTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cx82eNc3lrto1naevJphmz+inPXkN7UmJAAxttzew6B96jclhqpoucoSmFGUGFl5dy3h1thuevtUREnpK4MbdTTAkw3YKXTHJrOcvAkNzMUrrVAwQMKU8TvbosYgwzlJi6PyHnOvshuhYqGL7B7StfGGmiJ9L78ViLMxlCJW6C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sHfXo-0007LL-00; Thu, 13 Jun 2024 10:10:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 9EE03C0120; Thu, 13 Jun 2024 10:10:22 +0200 (CEST)
Date: Thu, 13 Jun 2024 10:10:22 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Martin Schiller <ms@dev.tdt.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, hauke@hauke-m.de,
	rdunlap@infradead.org, robh@kernel.org, bhelgaas@google.com,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
Message-ID: <ZmqpbpiDTAfChn8T@alpha.franken.de>
References: <20240607090400.1816612-1-ms@dev.tdt.de>
 <ZmnfQWFoIw5UCV-k@google.com>
 <7d34eb4017e809245daa342e3ccddf4f@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d34eb4017e809245daa342e3ccddf4f@dev.tdt.de>

On Wed, Jun 12, 2024 at 08:39:59PM +0200, Martin Schiller wrote:
> @Thomas Bogendoerfer:
> Would it be possible to stop the merging of this patch?
> I think We have to do do some further/other changes.

I'll revert the patch in mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

