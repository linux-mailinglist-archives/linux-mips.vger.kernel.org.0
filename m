Return-Path: <linux-mips+bounces-11538-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E59F6B8F34B
	for <lists+linux-mips@lfdr.de>; Mon, 22 Sep 2025 08:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CA083BB73C
	for <lists+linux-mips@lfdr.de>; Mon, 22 Sep 2025 06:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9903276024;
	Mon, 22 Sep 2025 06:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="l/zsR0G5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QzwoyyBX"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B910182B7;
	Mon, 22 Sep 2025 06:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758524373; cv=none; b=bo+dOQPadDsG6YwpCEgk1IQErzbhYN9aQxJJMtDC5H28VgRaZVYrcQ+M/NZsDyRaloMTuqv8yg/GQfjMFouhDvmzSLAXHDQiLLRtfGTZVMdq5LQ+Jua5kElrQtwV2booOrQ4Mmka6/kBHxabzcN/FLfhTeyenlPis2Cs7wgvHY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758524373; c=relaxed/simple;
	bh=Z4a99FyJQzgGi/pMN3UMIYUuikvwd00kIlYCCwNP6pI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Vyc5pqmhlpp5bDAZEaaid6tOm7EWqjwd19uj0kT8BXTKbbC1Zh9PzgH3A1AUiX463EIl13rbin+5oK3i4Pyebtsyb8zqkzDuw4gn7pUPhB7R4RrHqfNuzL9AJUX1WP8bXlmFuvpt+EUY2bSHq1Q2y54/5cmSexrWgf5i4GzMB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=l/zsR0G5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QzwoyyBX; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 535241D0018C;
	Mon, 22 Sep 2025 02:59:29 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 22 Sep 2025 02:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758524369;
	 x=1758610769; bh=tw7JZ6uQ+dSxRm1cR3ykcHwmxGgsza4QaeIC4IgS1AM=; b=
	l/zsR0G5eT2gz2q4CXpfCwEpXLiXIWeuSMMOfqTnOtjbPdFXKq1o5OVaHjeuQvok
	O/W1x65coIcNpApW8qDJuJ4wKYWnuGNwyn7j6woJVBtie9xTAb11d6HngQbvPBKf
	HkCNYVpWqebU7GhZ9Qey2zLtrgNjUWrVxAmBONRPhSMCY64Yky9DXR9XDsvA3+XZ
	ZbbjO4HokYqsR0tDqaso05RrMm8/wXDNhWRhP1S8JSdqgGPk660msIOs8xolJTTe
	2E/lysfyyJ9YlxYZ8Aor/xg7B2nhZhTFHzG0yoqk3Jvxl/t/B3hFBhIboNtcexas
	F/U17mzbpFvEthrXVADCEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758524369; x=
	1758610769; bh=tw7JZ6uQ+dSxRm1cR3ykcHwmxGgsza4QaeIC4IgS1AM=; b=Q
	zwoyyBXTJ/xlyTuAl6eaDR08Yk7cKQ/BYb5Q+OZLHccYXOTq0s/D4PTdaj96/BWY
	ggJn+VsyjX4BR1Hr2f98K40hOZatGzQ2cuJfCPnbWUbSoltfyoQfrYcbTyI5AP3z
	cdO1sLjEizaP++pe3JWdqMUu8E/hcLc6Ezoa3b1J8l3zBl/LcuFy2NWUviuBLo+j
	hEda/Sd5M2ZGiE+v/q3X7Sq/5MeU9PWw3eI+9cHwC3G6RvYy60ZxsD8o6B1XVsHD
	/+UIoZdinlSwV09zE0r1PRQKkYVnb6LlKZJUsMPxXN8tUA+c46acCx0AdynNnU3F
	AWgKAlnztXyZ2gLYJNgsQ==
X-ME-Sender: <xms:z_PQaHJgzXYKoYDzZ-ssaOLFznF26Q_ZnAG6-dRyqJQJmlL_yyLZLQ>
    <xme:z_PQaLKYJie8lkusfN2_LRJLymKL9CiEKO2L9JMaW6nU_INMf_a-KAqcU9AVkuY7H
    Dtm7lvTZTS76OqV9zI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehjedulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefuddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtohepnhhstghhihgthhgrnhesfhhrvggvsghogidrfhhrpdhrtghpthhtoheprg
    hnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghn
    vghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvg
    hrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgihhordhprghrrggt
    uhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgvnhgssehgohhogh
    hlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:z_PQaO-AbAyrchLt1gPFzz5ImqtdsCE4MtwCgozi9Nvp6tIrZcpE2Q>
    <xmx:z_PQaOrgvuN6qNmRYjHfGwBTMsdEkP_7cBTz8lKVYq6AnPpCxT48tA>
    <xmx:z_PQaPkdEcrkiW2nIGq5bH_Mu4Fdt4bCb8JYLLnUSHz6JcSrKkzR9Q>
    <xmx:z_PQaLbNi1YcKXD1-mIpvlgsrc7fhhvtK_CV_WIUToIeUNXLq5ldZg>
    <xmx:0fPQaCrlRiKZ3grcKLdDxNAcmQRYM5wxeUnR0jLm2DG7jGDKd4pLMQoQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 79F2D700065; Mon, 22 Sep 2025 02:59:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AneuvEk2E7Kg
Date: Mon, 22 Sep 2025 08:58:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Nishanth Menon" <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 "Sergio Paracuellos" <sergio.paracuellos@gmail.com>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Nicolas Schichan" <nschichan@freebox.fr>
Message-Id: <44f910bf-ac2c-4b2f-8e50-5cfc7dd0761a@app.fastmail.com>
In-Reply-To: <20250919143436.GC2132010@nvidia.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
 <547dcb81-434d-4910-aa7c-1d69019fcb3d@app.fastmail.com>
 <20250919143436.GC2132010@nvidia.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Sep 19, 2025, at 16:34, Jason Gunthorpe wrote:
> On Fri, Sep 19, 2025 at 04:22:20PM +0200, Arnd Bergmann wrote:
>
>> SAM9X7 in 2023 added DDR3 mode with up to 256MB according to
>> the datasheet, no idea why they chose not to support more,
>
> Quite possible the internal SOC wiring only has 28 address lines. :)
>
> I am right it sounds like we can drop vivt cache support with highmem?
> vivt is alot easier to understand if kmap isn't running around
> creating virtual addresses aliases!

I think so, yes. I've prototyped a patch for it to add a dependency
on !VIVT and the drop the code paths that are clearly no longer
needed without it. This obviously needs proper testing, but the
diffstat is promising:

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f14bac913d50..0a31cfaf3818 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1214,6 +1214,7 @@ config ARCH_SPARSEMEM_ENABLE
 config HIGHMEM
        bool "High Memory Support"
        depends on MMU
+       depends on !CPU_CACHE_VIVT
        select KMAP_LOCAL
        select KMAP_LOCAL_NON_LINEAR_PTE_ARRAY
        help
 arch/arm/Kconfig                    |  1 +
 arch/arm/configs/gemini_defconfig   |  1 -
 arch/arm/configs/multi_v5_defconfig |  1 -
 arch/arm/configs/mvebu_v5_defconfig |  1 -
 arch/arm/include/asm/highmem.h      | 56 +-----------------------
 arch/arm/mm/cache-feroceon-l2.c     | 31 +------------
 arch/arm/mm/cache-xsc3l2.c          | 47 +++-----------------
 arch/arm/mm/dma-mapping.c           | 14 ++----
 arch/arm/mm/flush.c                 | 19 ++------
 mm/highmem.c                        | 86 +++++--------------------------------
 10 files changed, 27 insertions(+), 230 deletions(-)

I did get an email from Nicolas Schichan (added to Cc here),
and he is still supporting a widely deployed Kirkwood based
platform that uses 1GB RAM configurations. He should get
a chance to test that with CONFIG_VMSPLIT_3G_OPT, but I
would expect that to continue working, possibly with minor
bugfixes.

For the timeline, the coming merge window is for an LTS
release, so if we remove VIVT highmem support in 6.19,
any remaining users we missed at least still be able to
use 6.18 for a couple of years and get security updates.

      Arnd

