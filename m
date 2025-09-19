Return-Path: <linux-mips+bounces-11526-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B71F8B89E5D
	for <lists+linux-mips@lfdr.de>; Fri, 19 Sep 2025 16:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1674A5A4A05
	for <lists+linux-mips@lfdr.de>; Fri, 19 Sep 2025 14:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEE1313298;
	Fri, 19 Sep 2025 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="DqmZmjL1"
X-Original-To: linux-mips@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02B6220F34;
	Fri, 19 Sep 2025 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291803; cv=none; b=dHOAZKVHRO7PigHVlw9V+14R9eB/2rGu1jG2OzP11YG++BE5bGiFZayM9w+yytm6SF+3/bSkZschdsZ5dtkuInwg3B1plqWC19dbOxEFsrVQHP1ZNCFyJ7pgt5xFpgNIJclM3q8FQSpqEdWcAmm9xXNa41ZZlClt0aKa0KUZ3+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291803; c=relaxed/simple;
	bh=qurIkcqttoZIUncvhRG2Ez96lBIE03pACZ8DNjCjo6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hp+OhpUu8LpeLgKSdshSraSKajXo93vnnIKRxJEnfH6+gHGuIVSgEKWxmfuUxIjsRWt47e/2cwzwr5M7pPrKdBkjQ5ulSPaDgsILXy8Oc+iq3wksC5jl+eCx0XPvyYKDyvdkmKleqqyNVNB92Omwm7ruTV+MbPhDQu1GK7bkvJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=DqmZmjL1; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758291801; x=1789827801;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qurIkcqttoZIUncvhRG2Ez96lBIE03pACZ8DNjCjo6Y=;
  b=DqmZmjL1Vr01OtNXPufat1VE6VbfuXmbDYQpOXDPeFU4FzwuiYqbmhc2
   aB0qEH4vgv4ghrCQrhCDyQjHA1ivE5KkHpIeOBrFjd1DUoo0wr5W/VfDR
   wZ8uFZZCxDGCTgFVc+Ks8BNpjUtmhtxRvXrNfhQ9QASbNlZsiljTGXPsH
   gVLzq5kU3C4uZOzZXcs39D+Xs4ce6Gz8I/8bhTdMkDZdUNMAlEVTaSgRb
   UnukVxGtk3Zx5I4Gha+2nS+v8hhoRhhkODDG5QzyVkRYG4NKVlMmb0mv4
   aKsY1wyr1yH7i2tciBdgWIrxf14E3j/BnBH22saDnAvMKqOn1D+DAaaDS
   A==;
X-CSE-ConnectionGUID: JybeGcZkTJ+KqZUxcYOinw==
X-CSE-MsgGUID: 4qBXFe4MTX2xEanG6m6MKA==
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="52616540"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Sep 2025 07:23:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 19 Sep 2025 07:22:15 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 19 Sep 2025 07:22:10 -0700
Message-ID: <775e175a-6699-4b7b-a997-3d142fdf64e4@microchip.com>
Date: Fri, 19 Sep 2025 16:22:10 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@nvidia.com>
CC: <ksummit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-mips@vger.kernel.org>, <linux-mm@kvack.org>, <imx@lists.linux.dev>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger
	<richard@nod.at>, Lucas Stach <l.stach@pengutronix.de>, Linus Walleij
	<linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, Andrew
 Morton <akpm@linux-foundation.org>, "Liam R. Howlett"
	<Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Suren
 Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, Nishanth
 Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, "Chester A. Unal"
	<chester.a.unal@arinc9.com>, Sergio Paracuellos
	<sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 18/09/2025 at 15:12, Arnd Bergmann wrote:
> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>    get kernel updates, and the only one I can think of with
>    DDR3 support, but seems to be limited to 256MB total memory.

It is indeed.
No difficulty on this part of the product line ;-)

Best regards,
   Nicolas

