Return-Path: <linux-mips+bounces-4453-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC60939BE5
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2024 09:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D2DB282DA0
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2024 07:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0424714B96F;
	Tue, 23 Jul 2024 07:47:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F2C14A4C0;
	Tue, 23 Jul 2024 07:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721720819; cv=none; b=jsgiQdg9j/pwky3t/X7fwlIAF3xQ3OtXFslUPDhbzll0MgnFHzva6mSZNmGwtWkMEOraHy0zvoBkJPZAfOmoPIi98uDFBG39+BpW0H5pOpiiORz/FRvcOAUAsvz6HDKNAiQvQL4qNczosg7EbrjECjmHs9ncqVsXrQMq/a+kEqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721720819; c=relaxed/simple;
	bh=vdo8vLmIJW+GcfW1MWqESoMdq9meNVm2TVuHYG2Eb6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5WFblrv2cM6HNkysOTIcQ5pN/xjIDncAi1PZlmQlx5WU+zt0qk1TmaceM0YgVmxTKHhiPlrkdRbQA3MIC9QomQUUN151x17U/zLogUpbT57O2rRlDbpRcMY4D49gm2HObZA8ufNpj4634iCLElypveO4isFa8v2sMik9K853jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sWAEE-0003KF-00; Tue, 23 Jul 2024 09:46:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3290CC08E0; Tue, 23 Jul 2024 09:32:59 +0200 (CEST)
Date: Tue, 23 Jul 2024 09:32:59 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] MIPS: SMP-CPS: Fix address for GCR_ACCESS register
 for CM3 and later
Message-ID: <Zp9cq0YjMN77Fy6/@alpha.franken.de>
References: <20240722-smp_i6500-v2-1-3101459cba29@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722-smp_i6500-v2-1-3101459cba29@bootlin.com>

On Mon, Jul 22, 2024 at 03:15:39PM +0200, Gregory CLEMENT wrote:
> When the CM block migrated from CM2.5 to CM3.0, the address offset for
> the Global CSR Access Privilege register was modified. We saw this in
> the "MIPS64 I6500 Multiprocessing System Programmer's Guide," it is
> stated that "the Global CSR Access Privilege register is located at
> offset 0x0120" in section 5.4. It is at least the same for I6400.
> 
> This fix allows to use the VP cores in SMP mode if the reset values
> were modified by the bootloader.
> 
> Based on the work of Vladimir Kondratiev
> <vladimir.kondratiev@mobileye.com> and the feedback from Jiaxun Yang
> <jiaxun.yang@flygoat.com>.
> 
> Fixes: 197e89e0984a ("MIPS: mips-cm: Implement mips_cm_revision")
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> Changes in v2:
> - Based the detection on the CM version and not on a single CPU version
> - Renamed the macro accordingly
> - Link to v1: https://lore.kernel.org/r/20240719-smp_i6500-v1-1-8738e67d4802@bootlin.com
> ---
>  arch/mips/include/asm/mips-cm.h | 4 ++++
>  arch/mips/kernel/smp-cps.c      | 5 ++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

