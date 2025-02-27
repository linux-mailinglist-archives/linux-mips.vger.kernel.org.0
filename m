Return-Path: <linux-mips+bounces-8008-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9FCA479B9
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 11:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E64F7A2BFD
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 10:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C24228CB0;
	Thu, 27 Feb 2025 10:04:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEFD227E94;
	Thu, 27 Feb 2025 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650682; cv=none; b=TuaI4sYAJst/+0uiull5awh5mxWZISWCCX2figh6h0/QAecKiGukYCEMb7se0ezBS8n5GV/6SzQEsm+dhcZyTSTuacWoW5UP5dcgMTxJnznpM1RXd7CHy1DDZZJtCLRM4BB+ic6UXKG8dASPffGOqsX7oNCLvj/RS7HnJ1Eqz4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650682; c=relaxed/simple;
	bh=h6h6Ipg6/UyZo454uGDx+msKtkno23ocT+MfjB1APx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ey8bsl9VJjPepi84J6MPRbdL71RIfXZwRSTnEQtQ6qs9znZNpE+0yJw8BV11uOhL7SSyAj2sHh1OMRcwwr1phVocgFIKFzhxGpD9St2IzmT2bm3YU/5u3JgJf2CRgCRaanyNWji5Tpw7X4zIZVvBOHb+JAJDFWFBy8f/0olqmLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tnakv-0007xc-00; Thu, 27 Feb 2025 11:04:37 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6A065C03B4; Thu, 27 Feb 2025 11:00:48 +0100 (CET)
Date: Thu, 27 Feb 2025 11:00:48 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: WangYuli <wangyuli@uniontech.com>
Cc: chenlinxuan@uniontech.com, guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	macro@orcam.me.uk, niecheng1@uniontech.com, zhanjun@uniontech.com
Subject: Re: [PATCH 4/7] MIPS: ds1287: Match ds1287_set_base_clock() function
 types
Message-ID: <Z8A30NrFPzH3By_K@alpha.franken.de>
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
 <A769C7B3BA9BCC35+20250218125755.667335-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A769C7B3BA9BCC35+20250218125755.667335-1-wangyuli@uniontech.com>

On Tue, Feb 18, 2025 at 08:57:55PM +0800, WangYuli wrote:
> Synchronize the declaration of ds1287_set_base_clock() between
> cevt-ds1287.c and ds1287.h.
> 
> Fix follow error with gcc-14 when -Werror:
> 
> arch/mips/kernel/cevt-ds1287.c:21:5: error: conflicting types for ‘ds1287_set_base_clock’; have ‘int(unsigned int)’
>    21 | int ds1287_set_base_clock(unsigned int hz)
>       |     ^~~~~~~~~~~~~~~~~~~~~
> In file included from arch/mips/kernel/cevt-ds1287.c:13:
> ./arch/mips/include/asm/ds1287.h:11:13: note: previous declaration of ‘ds1287_set_base_clock’ with type ‘void(unsigned int)’
>    11 | extern void ds1287_set_base_clock(unsigned int clock);
>       |             ^~~~~~~~~~~~~~~~~~~~~
> make[7]: *** [scripts/Makefile.build:207: arch/mips/kernel/cevt-ds1287.o] Error 1
> make[6]: *** [scripts/Makefile.build:465: arch/mips/kernel] Error 2
> make[6]: *** Waiting for unfinished jobs....
> 
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  arch/mips/include/asm/ds1287.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/ds1287.h b/arch/mips/include/asm/ds1287.h
> index 46cfb01f9a14..51cb61fd4c03 100644
> --- a/arch/mips/include/asm/ds1287.h
> +++ b/arch/mips/include/asm/ds1287.h
> @@ -8,7 +8,7 @@
>  #define __ASM_DS1287_H
>  
>  extern int ds1287_timer_state(void);
> -extern void ds1287_set_base_clock(unsigned int clock);
> +extern int ds1287_set_base_clock(unsigned int hz);
>  extern int ds1287_clockevent_init(int irq);
>  
>  #endif
> -- 
> 2.47.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

