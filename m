Return-Path: <linux-mips+bounces-4454-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E34939BEA
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2024 09:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA0721C21A02
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2024 07:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F352D14AD38;
	Tue, 23 Jul 2024 07:48:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8EA3D6A;
	Tue, 23 Jul 2024 07:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721720906; cv=none; b=KrKWCHqn/9f/pS8nYbrWOqJjgbU9+QzXIut2u0tZQWesPAgJaCtaoWyXZIKWjk+ecCa/0SXbXflai6m/TgUSbREuUqb8jfS16S0yjX0s6D+QiAnKuYLvmlOrQi77Qv+f+IpKVZwazsNV+Q9Zjpr5kL9b+sqmZOz925uloVJEuIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721720906; c=relaxed/simple;
	bh=vbvgwD+cGbGHd6xsCHsLBoTVpmyEcO3/PjQfo+PH4Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0V9DMT8VQa/WQU8plzBlahFJqeRvNp8F0tTYuo0TmFLp/o9jsB7UOP6RRtWn5mVb3jgUnQPq5L2zst+tMYnr1PHjS2uWF80H3uTvc40n+CCHii8A94/PPBVgNKZYEEcKs8TFSFjIVpXFSWEAAlIZssI+Ls2P3aYZgeuZ6Nb/A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sWAFu-0003M0-00; Tue, 23 Jul 2024 09:48:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 93450C0899; Tue, 23 Jul 2024 09:48:08 +0200 (CEST)
Date: Tue, 23 Jul 2024 09:48:08 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mips: sibyte: add missing MODULE_DESCRIPTION() macro
Message-ID: <Zp9gOOUp3ZWXY/B8@alpha.franken.de>
References: <20240718-md-mips-arch-mips-sibyte-common-v1-1-49b29b0555eb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718-md-mips-arch-mips-sibyte-common-v1-1-49b29b0555eb@quicinc.com>

On Thu, Jul 18, 2024 at 04:17:52PM -0700, Jeff Johnson wrote:
> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
> description is missing"), a module without a MODULE_DESCRIPTION() will
> result in a warning with make W=1. The following warning is being
> observed when ARCH=mips and CONFIG_SIBYTE_TBPROF=m:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/mips/sibyte/common/sb_tbprof.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> I'm trying to fix all of these issues in 6.11, so please take this
> through your "for current" path instead of your "for next" path. If
> you don't have a "for current" path, Greg KH has indicated he'll pick
> up the stragglers before the 6.11 rc-final.
> ---
>  arch/mips/sibyte/common/sb_tbprof.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/sibyte/common/sb_tbprof.c b/arch/mips/sibyte/common/sb_tbprof.c
> index af5333986900..149a9151bc0b 100644
> --- a/arch/mips/sibyte/common/sb_tbprof.c
> +++ b/arch/mips/sibyte/common/sb_tbprof.c
> @@ -589,4 +589,5 @@ module_exit(sbprof_tb_cleanup);
>  
>  MODULE_ALIAS_CHARDEV_MAJOR(SBPROF_TB_MAJOR);
>  MODULE_AUTHOR("Ralf Baechle <ralf@linux-mips.org>");
> +MODULE_DESCRIPTION("Support for ZBbus profiling");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 51835949dda3783d4639cfa74ce13a3c9829de00
> change-id: 20240718-md-mips-arch-mips-sibyte-common-7c51d90b31f2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

