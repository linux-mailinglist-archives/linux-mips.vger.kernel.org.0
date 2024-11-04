Return-Path: <linux-mips+bounces-6664-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 372169BC1AD
	for <lists+linux-mips@lfdr.de>; Tue,  5 Nov 2024 00:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0416280E29
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2024 23:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DE31A76A4;
	Mon,  4 Nov 2024 23:51:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B784718C015;
	Mon,  4 Nov 2024 23:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730764270; cv=none; b=RiINk7GFMP4GsAkFz8KLCZY2PtGa0mtGPAXtsNmkjQO5tcTLGz2Y2aNnMDDs/QRVTfRoTpCk2CSduRf1Evuqm1VE/AHcbJxX3tD4lOWe4VU+ORPfIgd0a4gfbtZ9HZt8qs26yl2onIJQ9+jjL17R6+W1BvwBHXwyXt4PvL1L3G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730764270; c=relaxed/simple;
	bh=hzURyC9DN4sSJq8RqKFggFrKsbsIfB5dN0tDIK/DqNo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KvzbgeXTlNN1WHXaRZiG5OZDWvXrlXkj/Qu7AbH6YfbtiuE2CC7XRkfKjNwUPFF4NMl8o1eMk6EaE+GHvsnERPCfBwqFtyS6UOa/Hy27+p4eIwadlygvlnwsC8zaN+ynBh+s6SuAkeL49Jl5t7tzGBv+UmcbSOXtYG4iSPZkcbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id EA6F992009C; Tue,  5 Nov 2024 00:51:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E34FF92009B;
	Mon,  4 Nov 2024 23:51:05 +0000 (GMT)
Date: Mon, 4 Nov 2024 23:51:05 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kernel: proc: Use str_yes_no() helper function
In-Reply-To: <F2FC5695-440E-4A29-B683-4335452F6FAB@linux.dev>
Message-ID: <alpine.DEB.2.21.2411042349440.9262@angie.orcam.me.uk>
References: <20241102220437.22480-2-thorsten.blum@linux.dev> <alpine.DEB.2.21.2411031921020.9262@angie.orcam.me.uk> <F2FC5695-440E-4A29-B683-4335452F6FAB@linux.dev>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Nov 2024, Thorsten Blum wrote:

> > I like this cleanup, but now that it matters I suggest restructuring code 
> > such that the latter `seq_printf' is converted as well.
> 
> What about the comma and newline? Using str_yes_no() would remove them.

 This is why a minor code restructuring is needed so that the comma and 
the new line are produced elsewhere (arguably a cleaner structure anyway).

  Maciej

