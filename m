Return-Path: <linux-mips+bounces-7853-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB20FA3BD72
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 12:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7C66168166
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 11:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7826A1DF27F;
	Wed, 19 Feb 2025 11:51:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2C0286291;
	Wed, 19 Feb 2025 11:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965887; cv=none; b=CuEWf5SWQfZJFbQjOpULphS2Ya4xiVevWOs1IdKj5nRdHihHpP8LSoxdeu1adk7YLpJj5tUGJwUV0NfTp18r8rie4SLRXh9XtOOQiYl3fBkDF8ZmcGLZghrixJh/W0lW5Xqm+QCWhdFOOOeaRL8KoedA/Dbqj8toY5wlCO4R1wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965887; c=relaxed/simple;
	bh=Ita7kNj5CCYwIzI8chMNb3gXZL0/nvoaYRkBK0HTYoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFy1wk4sDQNrXCvsfQEMDK/MU58oYXTNJisEAWJBZAc430O+AJjva0fCKvJ3PmAeKzepqvp3EgHabTDa5T9M0la3EZMsFu0FcaLBKzJS2tp67ttZdRTeLU5O0mCIZim0wGmQdq95b6eV4x2mKQQny1ifmB/ETpdDeS8nsgw4cDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tkibo-0001XT-00; Wed, 19 Feb 2025 12:51:20 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 49308C024D; Wed, 19 Feb 2025 12:50:54 +0100 (CET)
Date: Wed, 19 Feb 2025 12:50:54 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: daniel.lezcano@linaro.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>, Chao-ying Fu <cfu@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Aleksandar Rikalo <arikalo@gmail.com>
Subject: Re: [PATCH v9 1/4] clocksource: mips-gic-timer: Enable counter when
 CPUs start
Message-ID: <Z7XFnshoa_VS91HN@alpha.franken.de>
References: <20250129123250.711910-1-arikalo@gmail.com>
 <20250129123250.711910-2-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129123250.711910-2-arikalo@gmail.com>

On Wed, Jan 29, 2025 at 01:32:47PM +0100, Aleksandar Rikalo wrote:
> From: Paul Burton <paulburton@kernel.org>
> 
> In multi-cluster MIPS I6500 systems there is a GIC in each cluster,
> each with its own counter. When a cluster powers up the counter will
> be stopped, with the COUNTSTOP bit set in the GIC_CONFIG register.
> 
> In single cluster systems, it has been fine to clear COUNTSTOP once
> in gic_clocksource_of_init() to start the counter. In multi-cluster
> systems, this will only have started the counter in the boot cluster,
> and any CPUs in other clusters will find their counter stopped which
> will break the GIC clock_event_device.
> 
> Resolve this by having CPUs clear the COUNTSTOP bit when they come
> online, using the existing gic_starting_cpu() CPU hotplug callback. This
> will allow CPUs in secondary clusters to ensure that the cluster's GIC
> counter is running as expected.
> 
> Signed-off-by: Paul Burton <paulburton@kernel.org>
> Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Tested-by: Serge Semin <fancer.lancer@gmail.com>
> Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  drivers/clocksource/mips-gic-timer.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
> index 7907b740497a..abb685a080a5 100644
> --- a/drivers/clocksource/mips-gic-timer.c
> +++ b/drivers/clocksource/mips-gic-timer.c
> @@ -115,6 +115,9 @@ static void gic_update_frequency(void *data)
>  
>  static int gic_starting_cpu(unsigned int cpu)
>  {
> +	/* Ensure the GIC counter is running */
> +	clear_gic_config(GIC_CONFIG_COUNTSTOP);
> +
>  	gic_clockevent_cpu_init(cpu, this_cpu_ptr(&gic_clockevent_device));
>  	return 0;
>  }
> @@ -288,9 +291,6 @@ static int __init gic_clocksource_of_init(struct device_node *node)
>  			pr_warn("Unable to register clock notifier\n");
>  	}
>  
> -	/* And finally start the counter */
> -	clear_gic_config(GIC_CONFIG_COUNTSTOP);
> -
>  	/*
>  	 * It's safe to use the MIPS GIC timer as a sched clock source only if
>  	 * its ticks are stable, which is true on either the platforms with
> -- 
> 2.25.1

Daniel are you ok to take this patch trough the mips tree ? If yes,
could I get an ack for it ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

