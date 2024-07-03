Return-Path: <linux-mips+bounces-4103-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CCA9263AC
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 16:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB70E282D46
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 14:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E99317BB1F;
	Wed,  3 Jul 2024 14:43:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757FE17C9E8;
	Wed,  3 Jul 2024 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720017823; cv=none; b=h1VYPEsM5tn5ipc8FUhCaQm+IU34EGM3rkb6HsbqsvLgmbCftT/1dbUPbSDtr9+e5LfZvCAqxS+PJejzTtsd1s1wFw1C+/NVryug13aD9OxdPy+oOewqj4DhLzI9kvIrnhqnfOjf+yhe4bwA7UJEOpqJ0VJBzCjIH5o19DsTImk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720017823; c=relaxed/simple;
	bh=6i1GPb5W4C4z6CIP+KMnQBlUCdjbW33+ABJqX7Spv0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPdVrvRBIvbYsxzursj+C/+7I4wZtiNZD46FIv5jCDnWCUhgeYReYas/7Bde78ZTGOIpFqUBQ6V/zw/X+VuXUKLMxThAUBkHg/GcmKUW7ZMtWN+QgNOSbec5QGnxztQEAZ9DjY+N08iyaXo/holgc/4PGYbJvUVXlJ/Q/MbiyJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sP1Cc-0008NK-00; Wed, 03 Jul 2024 16:43:22 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3FE70C0120; Wed,  3 Jul 2024 16:35:27 +0200 (CEST)
Date: Wed, 3 Jul 2024 16:35:27 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH 0/3] MIPS: Add Mobileye EyeQ OLB system-controller
Message-ID: <ZoVhry8VFRx8x3w/@alpha.franken.de>
References: <20240628-mbly-mips-v1-0-f53f5e4c422b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240628-mbly-mips-v1-0-f53f5e4c422b@bootlin.com>

On Fri, Jun 28, 2024 at 06:11:49PM +0200, Théo Lebrun wrote:
> This is a new iteration on the Mobileye system-controller series [0].
> It has been split into separate series to facilitate merging.
> 
> This series contains a dt-bindings defining the system-controller
> (called OLB) used on EyeQ5, EyeQ6L and EyeQ6H. It then modifies the
> EyeQ5 devicetree to exploit that system-controller.

just to be sure, this replaces the v3 series ? And it's the only
series, which should go through the MIPS tree ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

