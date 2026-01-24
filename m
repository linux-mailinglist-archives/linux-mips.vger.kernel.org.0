Return-Path: <linux-mips+bounces-13001-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJw6C6hHdWlxDQEAu9opvQ
	(envelope-from <linux-mips+bounces-13001-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jan 2026 23:28:56 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E80C7F1FC
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jan 2026 23:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5B2B3008A77
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jan 2026 22:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FB51C84DC;
	Sat, 24 Jan 2026 22:28:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D7C269D18;
	Sat, 24 Jan 2026 22:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769293732; cv=none; b=i0HTMIdtB6r/qg+FVlp8O3HOImWnLbebh1/bvSKfb9kchOh30cMEo3gxGtJcLtb6+agJYvA8jSU531bp8OYb7kOoKHTxY4Qon0DOAeGVSs2bNAediY3/u0Z5QdzGDzcfVvVE8sue8hZQMcJ6ljxGZcrlRTaFS02NV/ApxQgRoNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769293732; c=relaxed/simple;
	bh=gNHI4GP4jn0MwBr2m41gSNDFtAukzP6zt0QRbiG/CUw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ufYNyc1tdT2RxOEmBcDNd8kjvvHHOurKIwyS3FDZLqaCbM2uUY2zHCKGq2dgTj9RD9unKFxVTttIvQb65X9GrOiK2tAiEGTcjPe23myeQzygEtaWKGN52zZxuFrSca9dXfulh17v/vTy7DOONGeIzzDPkOdzUdu1NmN5gaHOX4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 489A192009C; Sat, 24 Jan 2026 23:28:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 39E6092009B;
	Sat, 24 Jan 2026 22:28:41 +0000 (GMT)
Date: Sat, 24 Jan 2026 22:28:41 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Gleixner <tglx@kernel.org>
cc: LKML <linux-kernel@vger.kernel.org>, 
    "Paul E. McKenney" <paulmck@kernel.org>, John Stultz <jstultz@google.com>, 
    Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
    "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
    Jiri Wiesner <jwiesner@suse.de>, Daniel J Blueman <daniel@quora.org>, 
    Scott Hamilton <scott.hamilton@eviden.com>, Helge Deller <deller@gmx.de>, 
    linux-parisc@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org
Subject: Re: [patch 2/5] MIPS: Dont select CLOCKSOURCE_WATCHDOG
In-Reply-To: <20260123231521.723433371@kernel.org>
Message-ID: <alpine.DEB.2.21.2601242221580.6421@angie.orcam.me.uk>
References: <20260123230651.688818373@kernel.org> <20260123231521.723433371@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13001-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,suse.de,quora.org,eviden.com,gmx.de,alpha.franken.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7E80C7F1FC
X-Rspamd-Action: no action

On Sat, 24 Jan 2026, Thomas Gleixner wrote:

> MIPS selects CLOCKSOURCE_WATCHDOG, but none of the clocksources actually
> sets the MUST_VERIFY flag. So compiling the watchdog in is a pointless
> exercise. Remove the selects.

 Based on commit 385864280597 ("mips: csrc-r4k: Mark R4K timer as unstable 
if CPU freq changes") which added some of this stuff shouldn't the flag be 
set instead?

 At first glance the situation seems analogous to that of the x86 TSC: 
just as the TSC the R4k timer is a CPU onchip free-running counter driven 
by the CPU clock (typically at half the rate).

  Maciej

