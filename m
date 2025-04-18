Return-Path: <linux-mips+bounces-8649-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBCEA9342F
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 10:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBD3244848A
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 08:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2DE2571B2;
	Fri, 18 Apr 2025 08:09:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195A21D7E41;
	Fri, 18 Apr 2025 08:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963762; cv=none; b=ox0NMJq7P314QDPVvrNEEAdCSLoTkyo4pmgkdcBiaYj2e39vURvsL19ZWF1XZ/rZryGI5mogyWGuEs+S2ySeRetetrzHu/mDDrGfDKke874HpHBk7cI0+S8E0kcbuQQW/RWqn6+8kqj0P0le0eZyhnDxqxlsG0wspEy9kR2Ty4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963762; c=relaxed/simple;
	bh=K5dUGYaUpeOOczFTmENFZoJAMuNZqDDMLnk43Mz6ssE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmqMWDz/Jk75ld86iH7xSFFsOqTs8vAorfI2w+kf0kXLNLBPWY+/xti1KYaVa4Nw/ZHxua6aQTxcDc5UJZiTDCDNPjl1beuSdnKVet0xr3cquC0gp4Z7VSEPNk43zm0l0bbFZqq6wZMRYWvUuTi1Lcm2xk3L42b9XGJe2jZu7GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u5gbn-0003PB-00; Fri, 18 Apr 2025 09:57:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5AB86C01A2; Fri, 18 Apr 2025 09:57:50 +0200 (CEST)
Date: Fri, 18 Apr 2025 09:57:50 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Oleg Nesterov <oleg@redhat.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Fix MAX_REG_OFFSET and remove zero-length
 struct member
Message-ID: <aAIF_kEFlOOVNDaE@alpha.franken.de>
References: <20250417174712.69292-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417174712.69292-2-thorsten.blum@linux.dev>

On Thu, Apr 17, 2025 at 07:47:13PM +0200, Thorsten Blum wrote:
> Remove the unnecessary zero-length struct member '__last' and fix
> MAX_REG_OFFSET to point to the last register in 'pt_regs'.
> 
> Fixes: 40e084a506eba ("MIPS: Add uprobes support.")

what does it fix ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

