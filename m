Return-Path: <linux-mips+bounces-5469-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A297971B41
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 15:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6B5A1C222EB
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 13:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3248F1B9B28;
	Mon,  9 Sep 2024 13:40:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2FD1B86E3;
	Mon,  9 Sep 2024 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889231; cv=none; b=Xko67JzLnZ91xYxEca1OBSzju3J5tgIglAh1Mrusfx7gYZhsXvttKRly24awnPf22EPV7Ug6i9FHBI16sIYxSnKUcTuuYLiaWShQymPBOKB6gNqN/a5bOgi3VNOfbfmX3RLve3lVzydYt0oNxdbZnAY0rzj9IpdTS9zVS/qjskA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889231; c=relaxed/simple;
	bh=+h8rFlPpQv0bODovDLXRupdWzMjYvlHs+m+6h6oarJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBn8ckAOmOMxt806Ya3nPNa4UlZpS9FZ/i6FC26Bsek3mIgZiDAsFj5eM9kKJNo0ioVxUc032LJFJF5PmemrXAZ8agvl0QEKe78YNP2YDADLAWYgxRwv4wYust1/Eb9E/KlklWMPJbVycbq/FhFHgOG3CvRtINIGF7/x0dw8qy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sneVS-0004Aa-00; Mon, 09 Sep 2024 15:32:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A7D04C014D; Mon,  9 Sep 2024 15:32:21 +0200 (CEST)
Date: Mon, 9 Sep 2024 15:32:21 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/6] MIPS: cm: Probe GCR address from devicetree
Message-ID: <Zt745ZtuZmVH61uA@alpha.franken.de>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
 <3wemwdkev7pafyfu3yxhpvvpqaplhlejbzxtmahcarrnoeelzr@747sgyl63kwj>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3wemwdkev7pafyfu3yxhpvvpqaplhlejbzxtmahcarrnoeelzr@747sgyl63kwj>

On Tue, Aug 06, 2024 at 10:49:52PM +0300, Serge Semin wrote:
> Hi Jiaxun
> 
> On Wed, Jun 12, 2024 at 11:08:52AM +0100, Jiaxun Yang wrote:
> > Hi all,
> > 
> > This series enabled mips-cm code to probe GCR address from devicetree.
> > 
> > This feature has been implemented in MIPS's out-of-tree kernel for
> > a while, and MIPS's u-boot fork on boston will generate required
> > "mti,mips-cm" node as well.
> > 
> > Please review.
> > Thanks
> 
> Got this tested on my P5600-based SoC implemented as non-generic
> platform. Alas the system hangs up on the early boot-up stage with no
> even a single char printed to the console. I'll be able to get back to
> the problem debugging on the next week.

any news about that ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

