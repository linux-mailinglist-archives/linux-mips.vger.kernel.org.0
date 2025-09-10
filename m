Return-Path: <linux-mips+bounces-11199-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E67BBB518DB
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 16:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C09B43AC486
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 14:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4BC322C68;
	Wed, 10 Sep 2025 14:04:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B121322A13;
	Wed, 10 Sep 2025 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757513079; cv=none; b=O9H+l6jPiTAmJGF55PhinCezCRCqTuQknDoUHW+L3yV38PwVzgMr8pKQaYGiSBe7JytqEtbqofe22urcCXVi1pgA5bu+2Rfc5hxZIYYfqBCWzQnwc4MOnZZv9eYxjIzBmecWwQ4hxIWh4Kxr3VeWbwkCemGjD+nlBwuo/DcTj2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757513079; c=relaxed/simple;
	bh=XGf6An9pkuacotas4PAUho44h/2LaY9ZaYpivcI6rZY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ImeF2pWs+rxRZD+RH7GPQCw6PA1bR1Y/WmYNzejVqQxGNx9uwyIvTJ3L5V7hD3GBdvOo49PYLSDkOB5inOrZ+n99e0IaAHF3ja3IAAUzhklQo6QqPapgh5XYre/89MyDGYQcX/3zf110wdG/4QlX7J8shgfnMo3lxMbaqWadDiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D2E8683E14;
	Wed, 10 Sep 2025 16:04:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id LaIcEPcDfBsv; Wed, 10 Sep 2025 16:04:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1A4472FFDA5;
	Wed, 10 Sep 2025 16:04:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id X4a51J5LvQXj; Wed, 10 Sep 2025 16:04:33 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C16AD83E14;
	Wed, 10 Sep 2025 16:04:33 +0200 (CEST)
Date: Wed, 10 Sep 2025 16:04:33 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Arnd Bergmann <arnd@arndb.de>
Cc: ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev@lists.ozlabs.org, 
	linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx@lists.linux.dev, 
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
Message-ID: <497308537.21756.1757513073548.JavaMail.zimbra@nod.at>
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
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
Thread-Index: xOQifXk0CYTOSYO4gO/z6lk9BLmNXg==

Arnd,

----- Urspr=C3=BCngliche Mail -----
> Von: "Arnd Bergmann" <arnd@arndb.de>
> High memory is one of the least popular features of the Linux kernel.
> Added in 1999 for linux-2.3.16 to support large x86 machines, there
> are very few systems that still need it. I talked about about this
> recently at the Embedded Linux Conference on 32-bit systems [1][2][3]
> and there were a few older discussions before[4][5][6].
>=20
> While removing a feature that is actively used is clearly a regression
> and not normally done, I expect removing highmem is going to happen
> at some point anyway when there are few enough users, but the question
> is when that time will be.
>=20
> I'm still collecting information about which of the remaining highmem
> users plan to keep updating their kernels and for what reason. Some
> users obviously are alarmed about potentially losing this ability,
> so I hope to get a broad consensus on a specific timeline for how long
> we plan to support highmem in the page cache and to give every user
> sufficient time to migrate to a well-tested alternative setup if that
> is possible, or stay on a highmem-enabled LTS kernel for as long
> as necessary.

I am part of a team responsible for products based on various 32-bit SoCs,
so I'm alarmed.
These products, which include ARMv7 and PPC32 architectures with up to 2 Gi=
B of RAM,
are communication systems with five-figure deployments worldwide.

Removing high memory will have an impact on these systems.
The oldest kernel version they run is 4.19 LTS, with upgrades to a more rec=
ent
LTS release currently in progress.
We typically upgrade the kernel every few years and will continue to suppor=
t
these systems for at least the next 10 years.

Even with a new memory split, which could utilize most of the available mem=
ory,
I expect there to be issues with various applications and FPGA device drive=
rs.

Thanks,
//richard

