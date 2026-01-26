Return-Path: <linux-mips+bounces-13009-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMIyEHAwd2lVdAEAu9opvQ
	(envelope-from <linux-mips+bounces-13009-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 26 Jan 2026 10:14:24 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B916C85E42
	for <lists+linux-mips@lfdr.de>; Mon, 26 Jan 2026 10:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 149BE30238F1
	for <lists+linux-mips@lfdr.de>; Mon, 26 Jan 2026 09:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7950B3033C0;
	Mon, 26 Jan 2026 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7UBSaQX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568843002B3;
	Mon, 26 Jan 2026 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769418612; cv=none; b=PREIO7F8ejd573hlBjARYsdKsQ9JWyj8rHZrrRV0ZD2LgSmXBQnPHzPoRUIGVR0uzh1u+BRnygJXQHiYIcHEaZZUNwG0rdPKmen9IH3Cc01ozN6vO1Z3+S7Wc65cxuUdUncP+GVy3ufjdHGGAoLgedERCfMD+/oUbJrJ/aqhJSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769418612; c=relaxed/simple;
	bh=70Coq37tNuAOmdc8T4bFtPfgSfptlkbCGyRHWMoIVtg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eUZ3Sjrvl7TAhnMxolmW0c0kzBahp/B3td3dLLgJlpzv7a9jcPa9HMYBNrB7A+RqvWuGF1yByieaak8IMXChi4+gb+U3qLbOYaU6hxFyEWUrpQXd5XUpE9JzgRZLQPmzAeG1U8odesOVj7n/f4fI1fKS30ZTuP146vE1GpkjLe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7UBSaQX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFB4C116C6;
	Mon, 26 Jan 2026 09:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769418612;
	bh=70Coq37tNuAOmdc8T4bFtPfgSfptlkbCGyRHWMoIVtg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g7UBSaQXiTV/6aYU0u6iERp4Jn6mn9mZi2D6mTIduZP3Br5px8g9sHMt8ad180Vzz
	 5ZYHT9JWvkQoi9HtzvMDpax7ULdfjJBMi/mW+ANfW9gRC7KQd4REkv5fXgqc1CZnu3
	 SDRSVeLXjlpfy5tKxBb0qfvPF879gjyzFmvis67OFEwyd56z2sXfha0owUBA96CcCp
	 YLDAEykesLtlQYM5mSo17oOqP+vgr1ZUwB4nSViYheJE8NOUoVlvF1NCg7m7i1xc8D
	 jVA54gqW5ZThNglRmCpErlJWwG1Q4IYN+z+ZhlcgdUgGkhj6kgr1E5I2lwXBNVpPVl
	 9TMtX8vHYJ3bA==
From: Thomas Gleixner <tglx@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, John Stultz <jstultz@google.com>, Waiman Long
 <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 x86@kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jiri Wiesner
 <jwiesner@suse.de>, Daniel J Blueman <daniel@quora.org>, Scott Hamilton
 <scott.hamilton@eviden.com>, Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Subject: Re: [patch 2/5] MIPS: Dont select CLOCKSOURCE_WATCHDOG
In-Reply-To: <alpine.DEB.2.21.2601242221580.6421@angie.orcam.me.uk>
References: <20260123230651.688818373@kernel.org>
 <20260123231521.723433371@kernel.org>
 <alpine.DEB.2.21.2601242221580.6421@angie.orcam.me.uk>
Date: Mon, 26 Jan 2026 10:10:08 +0100
Message-ID: <87ms20d9jj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13009-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,redhat.com,infradead.org,linaro.org,amd.com,suse.de,quora.org,eviden.com,gmx.de,alpha.franken.de];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B916C85E42
X-Rspamd-Action: no action

On Sat, Jan 24 2026 at 22:28, Maciej W. Rozycki wrote:
> On Sat, 24 Jan 2026, Thomas Gleixner wrote:
>
>> MIPS selects CLOCKSOURCE_WATCHDOG, but none of the clocksources actually
>> sets the MUST_VERIFY flag. So compiling the watchdog in is a pointless
>> exercise. Remove the selects.
>
>  Based on commit 385864280597 ("mips: csrc-r4k: Mark R4K timer as unstable 
> if CPU freq changes") which added some of this stuff shouldn't the flag be 
> set instead?
>
>  At first glance the situation seems analogous to that of the x86 TSC: 
> just as the TSC the R4k timer is a CPU onchip free-running counter driven 
> by the CPU clock (typically at half the rate).

On x86 the CPU frequency can be modified by the BIOS behind the kernels
back, so the watchdog is required to catch this situation. So R4K only
needs the watchdog when there is some magic going on even when the
kernel itself does not manage the CPU frequency.

Thanks,

        tglx

