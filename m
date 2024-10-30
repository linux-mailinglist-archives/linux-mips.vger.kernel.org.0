Return-Path: <linux-mips+bounces-6558-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC99B614B
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 12:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EC4428320A
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 11:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD0B1E6DC5;
	Wed, 30 Oct 2024 11:19:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A231E5027;
	Wed, 30 Oct 2024 11:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287196; cv=none; b=FAvTVtmjKh+hWT9Pr/LFaTXkVeVAxtToiG/OO8y55xT+u7QKttB14EU5orRfQLF/CvfiH7yfvsDbN289qNirCk7F+GMWFLcKOVcalQWI5HkxRlT4Z2y3f49RlmLSKl5NZbBQzvN21g9ZOxXZC48qQ3CxUr5OgD08AUx4DPsiLgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287196; c=relaxed/simple;
	bh=YBl8YqFWArYg49M+3K6FTmULyd3VL9oyiyfcla/wBU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mp47JsT/XBOchXxwIwzpDsGAAoC1+qEmeVnDWoQGHnEz0DXMB47Q2cUfW40M1n98yuCjX9hdVe20Dm58k8R91tN2lvG8nQfydZdiSZB0PV18t4yBv0fvbkDfr1uohn0tJbwWtW9MEDnI3iV/pKCGuR+R+Yl92LYYr+dL0apUACY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1t66jk-00061d-00; Wed, 30 Oct 2024 12:19:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 23D49C06E6; Wed, 30 Oct 2024 12:18:09 +0100 (CET)
Date: Wed, 30 Oct 2024 12:18:09 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mips: bmips: bcm6358/6368: define required
 brcm,bmips-cbr-reg
Message-ID: <ZyIV8bQbLs6rFhzs@alpha.franken.de>
References: <20241001152404.15830-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001152404.15830-1-ansuelsmth@gmail.com>

On Tue, Oct 01, 2024 at 05:23:59PM +0200, Christian Marangi wrote:
> For the bcm6358/6368 SoC the brcm,bmips-cbr-reg due to bootloader
> misconfiguration or HW bug from running the system from TP1.
> 
> A workaround is now present to handle broken system that suffer from
> this bug hence add the now required property.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409251520.pE12GzHd-lkp@intel.com/
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  arch/mips/boot/dts/brcm/bcm6358.dtsi | 1 +
>  arch/mips/boot/dts/brcm/bcm6368.dtsi | 1 +
>  2 files changed, 2 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

