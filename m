Return-Path: <linux-mips+bounces-14908-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MohXJIk7ImphUAEAu9opvQ
	(envelope-from <linux-mips+bounces-14908-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 04:59:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C56644C5F
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 04:59:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Eua4KSTI;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14908-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14908-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C3D6304BD97
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2026 02:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80169150997;
	Fri,  5 Jun 2026 02:58:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D6221A447
	for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2026 02:58:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780628305; cv=none; b=rNAfndSwRFg0zbbaxwyFrTSp5+ivHcO4tKXOXn/HlqTKYFymyhzdtaY7gLr1M0B4V7LghISeSvaReQIttjvWhcCXA7PPfDys1rFglRfzOFRlt6KgLr/84euGWVM9+YA95b+dsrR5rD+sqixxK/uikfGDP7Ej1DrOFFTpNzyVgqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780628305; c=relaxed/simple;
	bh=o+/PtSqXAX34dsMuEnsO65jQvtJSlKeuiNIBboPvtkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2YG0AzzEUj63zEhJEI33cwoioQomf4hrAM5jdIHwvrrkBKUDIJEDW67mcadZ/SEFYUGmrbUbw0EhaooZCEZF6YDC1FZYgdwqtD+EqhkrcwpquxiDOGQ7LTrSQEyIkKrYg7MPu2knKsQWfZn1fHVP6NNTy2h7p8uxbwcEDOicIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eua4KSTI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B351F00893
	for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2026 02:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780628300;
	bh=o4/gtuY4rDjODNkSVcliXzjeCYk36SUwHSb1oQckJyM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Eua4KSTIguulYp/inuy0aWnD1493Rhz4OXyVbzXxg1jcN6GAyASf0MuDRM2tgjDol
	 fVjjwVl+Wa6EYxv/Hf1Fv0JzlMvYyjoKyJJ/WXXk5SyMGNsX32naHGKYWhb7DVo7bs
	 tA2oufhi7ahqWfq1sAnOJpbno/IeSKNmqrtMLSD28YZPvOy0odsWwjiuWYkQ/aVV1d
	 uhv7CNfco5BNVg+sp/TINT8IXRGksYViTVFgDROC+/1rs2+7qnmkm44T1edFNSQI4j
	 tLZ9Y3Yq/giWtI8EcZq39Opwi9x72IgZGFjYiP2LuUThPhTnFlywrpHz7OHCufl8Gr
	 5BqUrsWH6sGtg==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68d232e119dso2257184a12.0
        for <linux-mips@vger.kernel.org>; Thu, 04 Jun 2026 19:58:20 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyr/YtpPJWhySZynH/r+nUygLpvpObat+UYyA6/KUXXVAEh5Cjq
	E/qIsg00pWxo0S3ykmVJxO1U3kNSVs1tBdY0+aJhX49cn+gnKO2Okmo4uPy31vQZVp7XLt33qqA
	72Z/yjdPAsnjnZBzrCWAwRnTvj41UkcQ=
X-Received: by 2002:a17:907:96a2:b0:bda:8e57:5639 with SMTP id
 a640c23a62f3a-bf370f6abd5mr64198466b.20.1780628299069; Thu, 04 Jun 2026
 19:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
In-Reply-To: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 5 Jun 2026 10:58:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6eFwN-f3UnXxo==Ywt80krR5L_8qFTWriwSpk5sF978A@mail.gmail.com>
X-Gm-Features: AVVi8CdZ5nQcQsP6vzLwlMEtDKpuY1W5PFb2ZlJD6pFiZ_GeiQdNlREzTC0FhBc
Message-ID: <CAAhV-H6eFwN-f3UnXxo==Ywt80krR5L_8qFTWriwSpk5sF978A@mail.gmail.com>
Subject: Re: [PATCH 0/4] MIPS: kernel: proc: More efficient data output in show_cpuinfo()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mips@vger.kernel.org, 
	=?UTF-8?Q?Thomas_Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14908-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Markus.Elfring@web.de,m:linux-mips@vger.kernel.org,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[web.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0C56644C5F

Hi, Markus,

I suggest squash these pieces to a single patch.

Huacai

On Fri, Jun 5, 2026 at 1:52=E2=80=AFAM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 4 Jun 2026 19:33:55 +0200
>
> A few update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (4):
>   Simplify data output
>   Combine two seq_puts() calls
>   Use seq_putc() calls
>   Delete unnecessary braces
>
>  arch/mips/kernel/proc.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> --
> 2.54.0
>
>

