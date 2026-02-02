Return-Path: <linux-mips+bounces-13091-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CB0Ga50gGnU8QIAu9opvQ
	(envelope-from <linux-mips+bounces-13091-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 10:55:58 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6DFCA54D
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 10:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D5393001A78
	for <lists+linux-mips@lfdr.de>; Mon,  2 Feb 2026 09:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285332DE6FB;
	Mon,  2 Feb 2026 09:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Erft4jra"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050B12DC32E;
	Mon,  2 Feb 2026 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026154; cv=none; b=cCacn7Ek/oQsJ6a50ZbszKESO1Bha6WIS61wizH357dmhymmzEkt8iuX6Ml4HvmFCD4urgwIauowAzOsWP7bc+nbKmDQpVx8CE+6Pc7haJZV/xAH7vUfNGTe3ej3Ka45ftmC4zFRqXCh9kPMUyb4cmk1zIHiotdsJ2HWvVEoR1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026154; c=relaxed/simple;
	bh=nrWm3dhaEALUM7SquGpf0Lks7Y4JWRLOuswId+VvyNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XS42t7asTBXLszLyLE/8h2RZXsE/OcmQEyiue6v2WCY3x650UEbzMEQQ/EoS1tbO7hy5+eGLxBcTlqsyypb8xIqTPfoDqlqJU9SZd6yUfm89JhiqMgNZTDotEAiN68UQkS++vhaPlkdc/D7JSGrgKdcSS4d0ZQZ1g/QQkQ0gVY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Erft4jra; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD73CC116C6;
	Mon,  2 Feb 2026 09:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770026153;
	bh=nrWm3dhaEALUM7SquGpf0Lks7Y4JWRLOuswId+VvyNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Erft4jrayL8HvkDT2XuPHvpE9NgI+zoHEpPYe5P3FK2gphITvYwgUnusiYEPg61A+
	 GBdSLLfqqiFfWqzfLBEN3zNs/kQvKpH0Bd/vsRdxCArwG6NUD4Vh0sWRNblW8FOke8
	 Q0Xbj/y3B+g4ySD6zWiFvImpZrbTaTz7o8FkNBrfSEv0DQcH7rkLxUCSSFiHQUbqbx
	 lAyhaojF+ERyeoQgEIMlo53KlzMry8pRKHfrPFw6CMUk8PEqONsHt+xOV7Foho8pFA
	 1eSibwOwe2+MzI4OIyxUxS9vmMxnCBWX9o7PUVkZH/3v4RNwNMbXijSCMN8c0GrU/3
	 869PhsG9cPFWw==
From: Thomas Gleixner <tglx@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org
Subject: Re: [PATCH 5/8] irqchip/loongson-pch-lpc: add OF init code
In-Reply-To: <b26dd193fe62d490c6c3aa6df93c5b0dc6749ffe.camel@iscas.ac.cn>
References: <20260131094547.455916-1-zhengxingda@iscas.ac.cn>
 <20260131094547.455916-6-zhengxingda@iscas.ac.cn> <87v7ggfnby.ffs@tglx>
 <b26dd193fe62d490c6c3aa6df93c5b0dc6749ffe.camel@iscas.ac.cn>
Date: Mon, 02 Feb 2026 10:55:49 +0100
Message-ID: <87sebjfp0a.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13091-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8F6DFCA54D
X-Rspamd-Action: no action

On Mon, Feb 02 2026 at 13:50, Icenowy Zheng wrote:
> =E5=9C=A8 2026-02-01=E6=98=9F=E6=9C=9F=E6=97=A5=E7=9A=84 17:19 +0100=EF=
=BC=8CThomas Gleixner=E5=86=99=E9=81=93=EF=BC=9A
>> On Sat, Jan 31 2026 at 17:45, Icenowy Zheng wrote:
>>=20
>> > As the (kernel-internally) OF-based MIPS Loongson-3 systems can
>> > also
>>=20
>> What are kernel-internally systems?
>
> I mean kernel-internally-OF-based. These devices' firmware does not
> ship DT, but Linux kernel ships some DTs and pick one by arch code.
>
> Do you have any suggestions for rewording to make this more clear? Or
> should I just stop to mention this implementaion detail?

It's irrelevant for the driver where the device tree comes from, no?

>> > +{
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int parent_irq;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct fwnode_handle *irq_h=
andle;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct resource res;
>>=20
>> Variable ordering.
>
> Is there any rule for the ordering?

I gave you the link in the other reply.

>> If pch_lpc_init() fails the parent interrupt mapping is leaked, no?
>
> I don't know any reverse operation for irq_of_parse_and_map(), and most

irq_dispose_mapping()

> implementations I see has no cleanup codepath for this parent IRQ.

You looked at the wrong drivers then :)


