Return-Path: <linux-mips+bounces-11171-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E1EB508F0
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 00:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFD40460FD4
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 22:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66CC26D4D4;
	Tue,  9 Sep 2025 22:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="TvOUc/rv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1963F260569;
	Tue,  9 Sep 2025 22:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757457604; cv=none; b=O+pwUpAqXC8IdZ9TPzVjTqR3fFpXoyjxmn99+qm9agiUmQvpOd46YDI6j8pV1QARajXjlACpqlJxWjAapOlHAHVNw35PGd0CBBOJ2hegl7I0FKcXrgKlYTsKkL/LIcya0lCWtyU/yibPWOpPmYyG+OrHTsaJoIQEPyq1bZoAZ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757457604; c=relaxed/simple;
	bh=dC8rz4BxW9SQ2JeI/WxcV0VECaDximE95TZAzqBomJM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gJGJFtGFL+C5l3z7/I3kF9uV4iXEzi4IW46a/H/rxpFBNJS1J51LCnGLGWre8ye9Icr+WoSssUYAGGGWlgvad50QJ/pvlfhKG3Bzq8DYPOATuKqBeDGrKkp+wn3PHlV0ZfO8pOL1o2L0JhbrdXmHpRqCxFFxTvrSfs8k3avOVJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=TvOUc/rv; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 589Md5a71810392
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 9 Sep 2025 15:39:05 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 589Md5a71810392
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025082201; t=1757457547;
	bh=o4pJzl4BWqncjRLwqdCVSmCaOJCq8m9Ifms3vJmzKBM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=TvOUc/rvPHuoAgZik4kP6Jrk/1+TPY9+I66slCEYRMAAVaJliSrzt+2sOFL7uxfep
	 TkUyZI254fJRZ0lrODF9atINh0A8S4jLrAmCkJHU6JXLFZKZC0KSUVdi0tmre9KWKN
	 XbKdciAhvqcaNOwc7fFmyUBOA5BxnpqIS4Eb0rGthQiBgS5HHj+CzVzQJOWVF0iflT
	 tgpvUETHe9/40V2F6BCYuDmvwT7GfqNk48CbFXskPApkAJTXDi/C8HYPbnObeJPLQM
	 4VGzdB3lbm4UCWwMufH5gTZgR2KMO3DzwNg9CgZkrpc9Dml+J/eRl9RSkkGtbvpN2l
	 PQy3pTIde+vBg==
Date: Tue, 09 Sep 2025 15:39:05 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, imx@lists.linux.dev,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Richard Weinberger <richard@nod.at>,
        Lucas Stach <l.stach@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
        =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "Chester A. Unal" <chester.a.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Andreas Larsson <andreas@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <C85C32F4-BD58-460B-ACCF-F0569ED0941A@zytor.com> <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Message-ID: <F6A7C7F9-54F0-4E97-B21D-FD0EE023B986@zytor.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 9, 2025 3:24:29 PM PDT, Linus Torvalds <torvalds@linux-foundat=
ion=2Eorg> wrote:
>On Tue, 9 Sept 2025 at 14:39, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>>
>> 1 GB systems used highmem too, sadly=2E And 1 GB was the norm for a big=
 chuck of the late 32-bit era=2E
>
>Well, while on x86 1GB systems did use highmem, they'd typically not
>use very much of it=2E
>
>IOW, they'd have about 900MB as lowmem (ok, I think it was 896MB to be
>exact), with something like 120MB highmem=2E
>
>So they'd either lose a bit of memory, or they'd use the 2G:2G split=2E
>
>Or - and I think this is the main point - they'd stay on old kernels
>like the ancient museum pieces they are=2E
>
>I'm not convinced it makes sense to have a modern kernel on a museum piec=
e=2E
>
>         Linus
>

Certainly=2E And the 2:2 split is probably the right thing for the old mac=
hines anyway=2E

