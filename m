Return-Path: <linux-mips+bounces-5078-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA36E95E431
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 17:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 749C2B20E5A
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 15:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A058156C62;
	Sun, 25 Aug 2024 15:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b="IIEfaRjT"
X-Original-To: linux-mips@vger.kernel.org
Received: from dilbert.mork.no (dilbert.mork.no [65.108.154.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0607BEAD2;
	Sun, 25 Aug 2024 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.108.154.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724600889; cv=none; b=RlRmxkROmwOty+IfDjcpd9r0p6bapAD7uzbHFNk2Er6PCLkj6ZquHGvmpHFAcfUfmcrCpFQYNgs612AX26IrOu6Rff/aTDhDtJapsAmG+oEvEojeYT2N+VuRny/ZluYCBt2wvUcLhDhzjj/UE5/RdL2d2RO3HaEHWm6dgi9+KBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724600889; c=relaxed/simple;
	bh=ohUsZBfeJLhbYMH1Hmc4J+BpQPy2KSQNRB23EifFgo4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=VmSggpGQWU6DKodnntgYIvzGugl9zivbycNRUMsA7Dcroijo5bSRrco1djuBMGzsluTDVDlLXPH/AL7MGUS4/fbxKlouO3NZrSWkjoMcoPUp8jl7b7qGVPXfRIQww8XHll4jLNrTdHxeK0+fheiw+a4jg3/97Md2o4RSGPRBjX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mork.no; spf=pass smtp.mailfrom=miraculix.mork.no; dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b=IIEfaRjT; arc=none smtp.client-ip=65.108.154.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mork.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraculix.mork.no
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10da:6900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 47PFlmej3823289
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 25 Aug 2024 16:47:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1724600868; bh=SmYCpKZCY/D6APHs7+9JM9jUsBLWIXzVAVd6wSWXgxo=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=IIEfaRjTgwsVOulTHLxwASlDDrM63XQrcH6CZOqLGiL9jqZ7O2P6dx0A4dtdxB132
	 vH2imt2uX0LqZW2eylmxmh+Ps9eaakKAdIqL06MUi+q0pXqSBarxbUwkdaWelxB4fN
	 OM3xuYVDgXeB1hDwFzVkGLABT8z592doTIudXUlk=
Received: from miraculix.mork.no ([IPv6:2a01:799:10da:690a:d43d:737:5289:b66f])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 47PFlmtj2235566
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 25 Aug 2024 17:47:48 +0200
Received: (nullmailer pid 1539267 invoked by uid 1000);
	Sun, 25 Aug 2024 15:47:47 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] MIPS: fw: Gracefully handle unknown firmware protocols
Organization: m
References: <20240824144133.1464835-1-bjorn@mork.no>
	<7f0602dc-8a47-46cb-a12f-09afc082b48f@app.fastmail.com>
	<87o75gy85b.fsf@miraculix.mork.no>
	<alpine.DEB.2.21.2408251612500.30766@angie.orcam.me.uk>
Date: Sun, 25 Aug 2024 17:47:47 +0200
In-Reply-To: <alpine.DEB.2.21.2408251612500.30766@angie.orcam.me.uk> (Maciej
	W. Rozycki's message of "Sun, 25 Aug 2024 16:18:19 +0100 (BST)")
Message-ID: <87jzg4y57g.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 1.0.5 at canardo
X-Virus-Status: Clean

"Maciej W. Rozycki" <macro@orcam.me.uk> writes:
> On Sun, 25 Aug 2024, Bj=C3=B8rn Mork wrote:
>
>> But I can't make that match what U-Boot does.  AFAICS,
>> u-boot/arch/mips/lib/bootm.c doesn't care about 32 or 64 bit, and simply
>> does:
>
>  U-Boot isn't the only firmware used with MIPS systems, and in fact it's=
=20
> quite a recent addition; e.g. DEC REX and SGI ARCS firmware goes back at=
=20
> least to 1990 and we continue supporting these systems.  There's also CFE=
,=20
> PMON, YAMON, etc.

I know.  That's what I'm trying to make us support :-)

We can't blindly assume that all those firmwares implement the exact
same command line and environment protocol as U-Boot.  Yamon obviously
uses something similar enough.  But what about the others?

As mentioned, we're currently failing to boot from Bootware because of
the relaxed checking here.  Something needs to be done about that.


Bj=C3=B8rn

