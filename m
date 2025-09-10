Return-Path: <linux-mips+bounces-11222-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 698EAB52255
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 22:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D57C583181
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 20:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137482C21F5;
	Wed, 10 Sep 2025 20:33:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE419C546;
	Wed, 10 Sep 2025 20:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757536397; cv=none; b=EIknayxSztkbtGhJ4j3ipGR8TF6irHcpmC2JPWj2qUtSWfogo4nmXgsm3W56gqyvcTCLa6gly+ao0Ci9/ShJl56FVlMNyvYjLiobuPxoIIBbXUl/vo9LrkO14Mxptjd23gSAGQUVMwAMMRdTmZySUQY9lFhLVYIfye5xjEKIdR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757536397; c=relaxed/simple;
	bh=Xn32CgfsCdcgiZc5xVsldvxbovwbLiKF6pDU6aeqlX8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=SIx47eboTwhbXTcdGlaph7BITRcgGac3ROWI8oRR+9Cp+f/bhSF7nExkrXSjLWjate0eoWjek6w6NvYUVnK0WYZHzDmWs2SF2hAndqwRMYpxI3swLtEGDuBhuQGCb8s72tFGEPV9zRBJ24DakThdlIM15yc0lNhEJqQ14NuZWh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 511D5CE34D;
	Wed, 10 Sep 2025 22:33:07 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id aSKreuvdlGXI; Wed, 10 Sep 2025 22:33:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4BFD3CE34E;
	Wed, 10 Sep 2025 22:33:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YO9RM-IU3T_L; Wed, 10 Sep 2025 22:33:06 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 082B5CE34D;
	Wed, 10 Sep 2025 22:33:06 +0200 (CEST)
Date: Wed, 10 Sep 2025 22:33:05 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Dave Hansen <dave@sr71.net>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx <imx@lists.linux.dev>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Lucas Stach <l.stach@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>, 
	heiko <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Andreas Larsson <andreas@gaisler.com>
Message-ID: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
In-Reply-To: <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <497308537.21756.1757513073548.JavaMail.zimbra@nod.at> <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: Reaching consensus on CONFIG_HIGHMEM phaseout
Thread-Index: qX92QwLBi0un/69XQpQP6tb4aScRlQ==

Dave,

----- Urspr=C3=BCngliche Mail -----
> Von: "Dave Hansen" <dave@sr71.net>
>> Even with a new memory split, which could utilize most of the
>> available memory, I expect there to be issues with various
>> applications and FPGA device drivers.
> I'd be really curious what the _actual_ issues would be with a
> non-standard split. There are a lot of "maybe" problems and solutions
> here, but it's hard to move forward without known practical problems to
> tackle.
>=20
> Has anybody run into actual end user visible problems when using one of
> weirdo PAGE_OFFSET configs?

In the past I saw that programs such as the Java Runtime (JRE) ran into
address space limitations due to a 2G/2G split on embedded systems.
Reverting to a 3G/1G split fixed the problems.

Thanks,
//richard

