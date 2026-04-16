Return-Path: <linux-mips+bounces-14163-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIHFJgyO4GnNjgAAu9opvQ
	(envelope-from <linux-mips+bounces-14163-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 09:21:48 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DC740AFA0
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 09:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F06530151C1
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 07:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97437389444;
	Thu, 16 Apr 2026 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="i34JygI2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBC138911F;
	Thu, 16 Apr 2026 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776324002; cv=none; b=UhPwN8HPlXXnPwj8T92mZ1RyZ6T8w7bRaHsIQAUoRl9/VAIEws95e8f2HulDYF0BIeDMGBHC7YmIbip7/ulXkAJKPw0kDBjjGnpwkE/TGqpi8ErQgwNFANNX3tBHNH2selVuNrtmJZXsBIBOSvWJvMJSWy2oR1JN/Gbjdee7uPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776324002; c=relaxed/simple;
	bh=bEB4GKxu7PGJsPh9uUKYuLDV0TknxOuP/A6+A4bI8m8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mTRyJVNxpdJeCmBYkm+75wSMAFcm+touE6dydDx1TSWZfXVCfhiSVHCboTrN+hxiYnEVJaPW+WblaO4FbyVp9Q7iwEqUWcC9QBM1ukeQfSHcdHApLw1r9NtXx3iTqd2oA6W2Ix8hXk3aL2fEjlZafh3xHdBP1VH4P6fhGaCuTwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=i34JygI2; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1776323988; x=1776583188;
	bh=6UfSAw/OG+ar9V5ULRkW++v8Oe5kL4ySm/1UCMG2sdo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=i34JygI2NOAst8yQGLH+97GFeCphMu8EEJcVuz4I8kJwsl89wBC8NQhD4dnGHSHiy
	 wNlwWewKC1XnuBAqXzp8Tn2VFmCLFIYmv+9t851TxpaIQHA6Hc0Yw06aytA0hNM08p
	 oM7791FpYd1H5wBp1i0HWnCPeLTKhnoJvfuvSPjgwsDsUWn/JNgAugheq+/4FKKgAL
	 l5zsn6IoG9+dJOQdXhWpiSKsvqkU49DCwBtJkW5PXQR2mCfO8DGeXmyiY7K8DVBI2j
	 1NNOgrsqR28RuYMzq9FrpLkDNDu9ZF1WZnGT0hzU1SOnsOCmKwGRXO7ZoR3EH2t9Pc
	 2SbZAc24sYlUg==
Date: Thu, 16 Apr 2026 07:19:45 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>
From: kpursoty@proton.me
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "cjd@cjdns.fr" <cjd@cjdns.fr>, "naseefkm@gmail.com" <naseefkm@gmail.com>
Subject: Re: [PATCH v3 1/2] clocksource: timer-econet-en751221: fix timer block mapping at boot
Message-ID: <WYwhiNQWwEXQoD7-dVONf2PgvQQR5adVWEcJzlAcgyF2XcoXEw3atvsPu5qiNzGPbu_rT6i6OD5Utc4L_dCxwmkxRQ5ugS4wOMH1G80JyNw=@proton.me>
In-Reply-To: <o_cMD_cD6PNolsucCVtoojfSsfFgjsNiEop7YJ_QW8jrX1aCkIF8Rhdk-8_DSCBU1WrKSjr9STxTuCjiRK8yJ6vDA4Q1Ck2BCgOzYaBqSEs=@proton.me>
References: <o_cMD_cD6PNolsucCVtoojfSsfFgjsNiEop7YJ_QW8jrX1aCkIF8Rhdk-8_DSCBU1WrKSjr9STxTuCjiRK8yJ6vDA4Q1Ck2BCgOzYaBqSEs=@proton.me>
Feedback-ID: 133470881:user:proton
X-Pm-Message-ID: d137fa02c85bf25b5302929e1509da6386b9cd2a
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,alpha.franken.de,cjdns.fr,gmail.com];
	TAGGED_FROM(0.00)[bounces-14163-lists,linux-mips=lfdr.de];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kpursoty@proton.me,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NO_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:email,proton.me:dkim,proton.me:mid,cjdns.fr:email]
X-Rspamd-Queue-Id: 64DC740AFA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks for your notes. Patch withdrawn.

On Wednesday, 15 April 2026 at 08:53, kpursoty@proton.me <kpursoty@proton.m=
e> wrote:

> timer_init() used DIV_ROUND_UP(num_possible_cpus(), 2) to determine how
> many register blocks to iomap. At early boot with VPE-based SMP, MIPS
> reports num_possible_cpus()=3D1 (VPEs not yet brought online), giving
> num_blocks=3D1. Only membase[0] is then mapped via of_iomap.
>
> The EN751627 SoC has 2 physical cores, each with 2 VPEs, giving NR_CPUS=
=3D4
> and two timer register blocks (one per core). Each block serves two VPEs:
> block 0 handles CPU0+CPU1 (core 0), block 1 handles CPU2+CPU3 (core 1).
> The block count is a silicon constant: DIV_ROUND_UP(NR_CPUS, 2) =3D 2.
>
> cevt_init() calls cevt_dev_init(i) for each possible CPU via
> for_each_possible_cpu(). On EN7528/EN751627 with 4 VPEs, NR_CPUS=3D4 so
> cevt_dev_init(2) is called. cevt_dev_init(2) writes to reg_compare(2)
> which dereferences membase[2>>1] =3D membase[1], which is NULL:
>
>   CPU 0 Unable to handle kernel paging request at virtual address 0000000=
8
>   epc : iowrite32+0x4/0x10
>   ra  : cevt_dev_init+0x40/0x64
>
> Fix: replace the runtime calculation with ECONET_NUM_BLOCKS, which is
> DIV_ROUND_UP(NR_CPUS, 2) evaluated at compile time. This is the same
> expression used to declare the membase[] array, so the loop bound and
> array size are provably consistent. For NR_CPUS=3D4 this is always 2,
> correctly mapping both register blocks regardless of how many VPEs are
> visible at early boot.
>
> Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
> Signed-off-by: Kervin Pursoty <kpursoty@proton.me>
> Reviewed-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
> v3: No changes. Resent as v3 to keep version in sync with 2/2.
> v2: Add Reviewed-by from Caleb James DeLisle.
>
>  drivers/clocksource/timer-econet-en751221.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -160,5 +160,4 @@ static u64 notrace sched_clock_read(void)
>  static int __init timer_init(struct device_node *np)
>  {
> -=09int num_blocks =3D DIV_ROUND_UP(num_possible_cpus(), 2);
>  =09struct clk *clk;
>  =09int ret;
>
> @@ -172,5 +171,5 @@ static int __init timer_init(struct device_node *np)
>
>  =09econet_timer.freq_hz =3D clk_get_rate(clk);
>
> -=09for (int i =3D 0; i < num_blocks; i++) {
> +=09for (int i =3D 0; i < ECONET_NUM_BLOCKS; i++) {
>  =09=09econet_timer.membase[i] =3D of_iomap(np, i);
>  =09=09if (!econet_timer.membase[i]) {
>  =09=09=09pr_err("%pOFn: failed to map register [%d]\n", np, i);

