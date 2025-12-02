Return-Path: <linux-mips+bounces-12393-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6402FC9ABCE
	for <lists+linux-mips@lfdr.de>; Tue, 02 Dec 2025 09:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2280A3A50BB
	for <lists+linux-mips@lfdr.de>; Tue,  2 Dec 2025 08:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6135123185E;
	Tue,  2 Dec 2025 08:45:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A518036D510;
	Tue,  2 Dec 2025 08:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764665135; cv=none; b=jx9AKpU4PJhy1ENwaBR18PJ4DAO0UUEyqyy7pzcLvla7Vj8sGKwWe6Rlyz3J8gnyAtVJK08HWX1Gx5Ni8IIxODh4cmoX4k/0zkOQkt+eebX1C4OUEOMKO7GkEzhQvCbP/PJrFsiF85Qf1JGY4gh7jDCy7pmbNGt/RUeHFDBpOSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764665135; c=relaxed/simple;
	bh=yEgvTmTI12iPrg38zpQ3FshLyTdJQlYEe0147FLQOc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Blk7etg1/B4qCLxoNxsopPnP/P5PR3vVGQl5ELiN4uB4oHH7fE7WXF6gz+0TS2pBmgU9SsnxsfrW+FVP94AdI7VaR9f9uHrM50wuGhzZtfJV88eFsBWdGEBkkM80I8VIjtB/o1yhm90pJm6QUk77PngsfXo6Z2VV+d/d5Dc19d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vQM0k-0007ei-00; Tue, 02 Dec 2025 09:45:26 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E2BF0C0256; Tue,  2 Dec 2025 09:37:18 +0100 (CET)
Date: Tue, 2 Dec 2025 09:37:18 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: ftrace: Fix memory corruption when kernel is
 located beyond 32 bits
Message-ID: <aS6lPlVHv2i0hhDQ@alpha.franken.de>
References: <20251128-fix_mips_ftrace-v1-1-e6169f8777f2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128-fix_mips_ftrace-v1-1-e6169f8777f2@bootlin.com>

On Fri, Nov 28, 2025 at 09:30:06AM +0100, Gregory CLEMENT wrote:
> Since commit e424054000878 ("MIPS: Tracing: Reduce the overhead of
> dynamic Function Tracer"), the macro UASM_i_LA_mostly has been used,
> and this macro can generate more than 2 instructions. At the same
> time, the code in ftrace assumes that no more than 2 instructions can
> be generated, which is why it stores them in an int[2] array. However,
> as previously noted, the macro UASM_i_LA_mostly (and now UASM_i_LA)
> causes a buffer overflow when _mcount is beyond 32 bits. This leads to
> corruption of the variables located in the __read_mostly section.
> 
> This corruption was observed because the variable
> __cpu_primary_thread_mask was corrupted, causing a hang very early
> during boot.
> 
> This fix prevents the corruption by avoiding the generation of
> instructions if they could exceed 2 instructions in
> length. Fortunately, insn_la_mcount is only used if the instrumented
> code is located outside the kernel code section, so dynamic ftrace can
> still be used, albeit in a more limited scope. This is still
> preferable to corrupting memory and/or crashing the kernel.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> To go further and remove the limitations of dynamic trace support, the
> ftrace implementation for MIPS should be completely rewritten and
> inspired by what was done for arm64. This approach was chosen by
> Loongson: instead of trying to manage multiple instructions added on
> the fly, the support relies on a breakpoint, which is more robust.
> 
> However, this effort is significant, so I’ll leave it to those who are
> motivated to work on it. If needed, I can provide some guidance on the
> topic.
> ---
>  arch/mips/kernel/ftrace.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

