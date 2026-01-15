Return-Path: <linux-mips+bounces-12937-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFFAD24315
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jan 2026 12:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDE02301140F
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jan 2026 11:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8475131AF33;
	Thu, 15 Jan 2026 11:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jC80kSs+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502BE2EC0AA;
	Thu, 15 Jan 2026 11:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768476719; cv=none; b=GhY9oJoCd9yfm5vFs8wrcVqqUOaAQoyLRKnD8YOM0HJ1GCL4vGFEKNPSz/0lVx33T+IQpNW2/aPfjL0gQXWMVAY12WCzrNAoS02W92HstB4XQaJ6WOp7lFqZhh1N4KXaW5jwdM5If2ryFrkXBeGiQbMSo/AmH7oC3VAHKfgV0Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768476719; c=relaxed/simple;
	bh=lbPeG5ifWYuPbEVblSSKSqm0x1YF68s81wOt03u2mus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJHMM4u4H8Wv5ElRXKeD0SVruQc1pvRZWlNpM0ZzJ2+OkMnZsZ5YRmA4FEg1+v7YPFNGR3mxm7lO+ZvTryY8nPkXFAVIXcHfzxX4WZGsW6BSdjARkcBz50FG4JAWFCv3jR51o8buFGBP4/4AFjLnSOktt7MUfcz7TKsmWwTMrDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jC80kSs+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1ADC116D0;
	Thu, 15 Jan 2026 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768476718;
	bh=lbPeG5ifWYuPbEVblSSKSqm0x1YF68s81wOt03u2mus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jC80kSs+vZaLS9q/SxfO2/EZsGU/ZAgpE44bmUtq9KYqqXSSMbh0ssg9bOhTMPPkg
	 0PERw55QmbB7GnwVqfsNOPpqnfPm2tLNa4zR9eh3gqsM8ViEuDaWYjfJxHcQTTKOr2
	 OzKV763Vtzledx02+2Hs/YVv5VKdZYu81ndTqQ3w=
Date: Thu, 15 Jan 2026 12:31:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Karthikey Kadati <karthikey3608@gmail.com>
Cc: tsbogend@alpha.franken.de, linux-staging@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] staging: octeon: Remove port status typedefs
Message-ID: <2026011503-cardinal-wildcat-64b1@gregkh>
References: <20260114165834.33387-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114165834.33387-1-karthikey3608@gmail.com>

On Wed, Jan 14, 2026 at 10:28:34PM +0530, Karthikey Kadati wrote:
> Remove cvmx_pip_port_status_t and cvmx_pko_port_status_t typedefs and
> replace them with struct cvmx_pip_port_status and struct cvmx_pko_port_status
> to match Linux kernel coding style.
> 
> This also updates the MIPS architecture headers to name the anonymous
> structs so they can be referenced by the staging driver.
> 
> Reported-by: kernel test robot <lkp@intel.com>

The test robot reported that typedefs need to be removed?  Or did it
just find a failure in your previous change?

> Closes: https://lore.kernel.org/oe-kbuild-all/202601131108.A90iCRFi-lkp@intel.com/
> Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
> ---
> v3:
>   - Fix build failure by naming anonymous structs in MIPS headers
>     (Reported by kernel test robot).
>   - Add Reported-by and Closes tags.
> v2:
>   - Remove invalid "Unix Antigravity" Signed-off-by.
>   - Submit as standalone patch (detached from unrelated series).
> 
>  arch/mips/include/asm/octeon/cvmx-pip.h |  2 +-
>  arch/mips/include/asm/octeon/cvmx-pko.h |  2 +-
>  drivers/staging/octeon/ethernet.c       |  4 ++--
>  drivers/staging/octeon/octeon-stubs.h   | 12 ++++++------
>  4 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/mips/include/asm/octeon/cvmx-pip.h b/arch/mips/include/asm/octeon/cvmx-pip.h
> index 01ca7267a..cb3342313 100644
> --- a/arch/mips/include/asm/octeon/cvmx-pip.h
> +++ b/arch/mips/include/asm/octeon/cvmx-pip.h
> @@ -180,7 +180,7 @@ typedef union {
>  /**
>   * Status statistics for a port
>   */
> -typedef struct {
> +typedef struct cvmx_pip_port_status {

Why is this typedef left here?


>  	/* Inbound octets marked to be dropped by the IPD */
>  	uint32_t dropped_octets;
>  	/* Inbound packets marked to be dropped by the IPD */
> diff --git a/arch/mips/include/asm/octeon/cvmx-pko.h b/arch/mips/include/asm/octeon/cvmx-pko.h
> index f18a7f24d..46bb5ddcb 100644
> --- a/arch/mips/include/asm/octeon/cvmx-pko.h
> +++ b/arch/mips/include/asm/octeon/cvmx-pko.h
> @@ -114,7 +114,7 @@ typedef enum {
>  	CVMX_PKO_LOCK_CMD_QUEUE = 2,
>  } cvmx_pko_lock_t;
>  
> -typedef struct {
> +typedef struct cvmx_pko_port_status {

Same here, I thought you were removing typedefs?

thanks,

greg k-h

