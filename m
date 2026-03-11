Return-Path: <linux-mips+bounces-13541-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SA4eHd0hsWkOrQIAu9opvQ
	(envelope-from <linux-mips+bounces-13541-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 09:03:41 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0744E25E5F4
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 09:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00C2D303FBD3
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 08:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B493BB9E8;
	Wed, 11 Mar 2026 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITcS1kE+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2490A3B3889;
	Wed, 11 Mar 2026 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215893; cv=none; b=rBK+VM+LJ32Ptcjc2jae2eLKiVB6bg/swIfkBMN6Ka23VLD/kdhCGRWT+WP46df29hhvW5RPlAVAaZPMR+yHgTvZjXPpwAY/XrQXGTYGePODMV5/C53RXuzHg0T10+CsInAZNngSyTIab+0t3/zoKWBJT11eJKNbJ8NjmGIVIfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215893; c=relaxed/simple;
	bh=3K7vMw03oz0BFzEe+j4Kj47QGw1QUbwb06CQqUbXbuk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pPmeGg/+gJcl3/qms8kkCn13CzsrXLB9XzOhhcjXh5f0Panyr8X3GtyV7zz/surOwHHO0jFfhqxWO+QqHZShv2Vxzd0KEVQ2SzzlP3L6yaU9dMPSgST7W8075al25lRg+odNZ18luZrCBZs/abHunyKQF1t/YCw0f7+tk73Ovuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITcS1kE+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA67C4CEF7;
	Wed, 11 Mar 2026 07:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773215892;
	bh=3K7vMw03oz0BFzEe+j4Kj47QGw1QUbwb06CQqUbXbuk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ITcS1kE+RN1+ZQCWICGs3eTNpUYsDSRDphm2j0ic+mHygpTlIk7EA6LtN86dj8Uy4
	 8s/Esa2ElHxjpkbiB6JHpZYIE/dtosPJSDeyX25bw5zyDvqIWy80ty9+v8P/9QEGH0
	 nxxqb6Fvsj6wMf/XAzPPs3UrqxOhQp0FJIiaX/p3kjXu8NevObDsGd3V9lYwIsm2NP
	 RTdDhCh/n3+p+I3qMcKYdPLwEed37fippN5cyov9Hn1Mczr796hgehaFxTh9FG7PVo
	 HWR+MkZdW10QHHFPZnEWz+DkVM5Kfpp/uGazWMbIw8QMIIlVRA9uiBMTKAjuEZsYRr
	 dptIx3GHjjiWg==
From: Thomas Gleixner <tglx@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, John Stultz <jstultz@google.com>, Waiman Long
 <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 x86@kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jiri Wiesner
 <jwiesner@suse.de>, Daniel J Blueman <daniel@quora.org>, Scott Hamilton
 <scott.hamilton@eviden.com>, Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Subject: Re: [patch 5/5] clocksource: Rewrite watchdog code completely
In-Reply-To: <20260309154317.GPaa7qlRzYcQY1dBU3@fat_crate.local>
References: <20260123230651.688818373@kernel.org>
 <20260123231521.926490888@kernel.org>
 <20260309154317.GPaa7qlRzYcQY1dBU3@fat_crate.local>
Date: Wed, 11 Mar 2026 08:58:09 +0100
Message-ID: <87pl5are5q.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 0744E25E5F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13541-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,suse.de,quora.org,eviden.com,gmx.de,alpha.franken.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,alien8.de:email]
X-Rspamd-Action: no action

On Mon, Mar 09 2026 at 16:43, Borislav Petkov wrote:
> On Sat, Jan 24, 2026 at 12:18:01AM +0100, Thomas Gleixner wrote:
> The overall thing sounds good to me, I haven't done any indepth review but
> from a cursory look, it looks nice.
>
> Testing looks good too on one machine so
>
> Tested-by: Borislav Petkov (AMD) <bp@alien8.de>
>
> I say, let's queue it now so that it can get wider testing.

I'll wait for Daniel to report back from his 1920 CPU monstrosity and do
that then.

Thanks

        tglx

