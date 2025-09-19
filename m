Return-Path: <linux-mips+bounces-11528-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E029CB8A0A9
	for <lists+linux-mips@lfdr.de>; Fri, 19 Sep 2025 16:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 907B31BC15C9
	for <lists+linux-mips@lfdr.de>; Fri, 19 Sep 2025 14:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD04730F7E3;
	Fri, 19 Sep 2025 14:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="G2DwRoqW"
X-Original-To: linux-mips@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3657A24DCEB;
	Fri, 19 Sep 2025 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758292925; cv=none; b=cnPd3olKk+NjI7BmpkMCxKeK5qqwQNyAkCFs4N2uiRESG+ZlSZgdCOwkd06QHMfPW4LXYgls2ytw8mq9/8LXtWftK44WwqMB377ZcyG8CmIce0xvwNkz1DgYTwz0Z7EPrVt/Kkd+uRbHQkeyhakfOHH7+I8ttZVLJhRxjpk7jJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758292925; c=relaxed/simple;
	bh=BUXNR1hckyrk8jBBQv+MEaTsb/Yxf7QPZcopTVXtsc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nBm4p9YnDLAWcKZkp7EUQCIdjhsW5fHTh6G/T+GEZW2aX3so+qdYemGvO0cPd+UYZLL664PNPrOC0TXbdtAsv0C3N507uVGHuPw0ivifKB0dzrWVo7R4lL5fdyYD9CmJ6y+aOPk1xxAIaVDtCA0zX5p3JVyz/ACK9/VCRIMlgXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=G2DwRoqW; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758292924; x=1789828924;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BUXNR1hckyrk8jBBQv+MEaTsb/Yxf7QPZcopTVXtsc0=;
  b=G2DwRoqWAFwBoeiHRW1PnVtBdkifBZ1fDCZYhjljRvAG10hTiyDtoaMm
   nVcvcUxm89ol5y5wO8MIGUwm4xR32rrdIIU/AC3D53XJ+o+uDcEHowrUJ
   /2Cezw4LW9el7AD1n6rods7WJpDafF+ZMP3id8XYE1XkhV/14uYSfydb3
   y9/j1K/spGAfBpKUewoyEqGBvZMFuQoTfJB2KmPagCMtMJm+uzFfIH5Kp
   Qe48WopOgTVvDZLpDD+/TSUKtDyaAHChh7QWG/ebYkrQaGPYLIlXdluUz
   H0oLzljSE8xSBBoOLPKZuIMBRU1xXomaMTMysJvHwkP/c0OpCOch6VFAK
   w==;
X-CSE-ConnectionGUID: rCtXrXuCRuWl+rA3xsHEKA==
X-CSE-MsgGUID: EJ/u+s4TQLuYDQ4Fe3Jepw==
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="52617186"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Sep 2025 07:42:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 19 Sep 2025 07:41:32 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 19 Sep 2025 07:41:27 -0700
Message-ID: <cc027fae-8d34-41ca-bd35-569c415fc657@microchip.com>
Date: Fri, 19 Sep 2025 16:41:26 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
CC: Jason Gunthorpe <jgg@nvidia.com>, <ksummit@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mips@vger.kernel.org>,
	<linux-mm@kvack.org>, <imx@lists.linux.dev>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, Lucas
 Stach <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora
	<ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, Mike
 Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira
 Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Alexander Sverdlin
	<alexander.sverdlin@gmail.com>, "Chester A. Unal"
	<chester.a.unal@arinc9.com>, Sergio Paracuellos
	<sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 19/09/2025 at 09:17, Geert Uytterhoeven wrote:
> Hi Arnd,
> 
> On Thu, 18 Sept 2025 at 15:13, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Wed, Sep 17, 2025, at 14:59, Jason Gunthorpe wrote:
>>> On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
>>>
>>>> I'm still collecting information about which of the remaining highmem
>>>> users plan to keep updating their kernels and for what reason.
>>>
>>> On this topic of removing some parts of highmem, can we say goodbye to
>>> kmap_high_get()? Only ARM uses it and only for
>>> !cache_is_vipt_nonaliasing() systems.
>>
>> Good idea. I think we are almost there, just need to verify that
>> there is actually no impact for existing users. I already knew
>> that there is very little highmem usage on ARMv6 and earlier, but
>> I tried to recheck all platforms that might be affected:
> 
>> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>>    get kernel updates, and the only one I can think of with
>>    DDR3 support, but seems to be limited to 256MB total memory.
> 
> Are they limited to DDR3?

For sam9x75:
- DDR2
- DDR3  (DLL Off/On mode)
- DDR3L (DLL Off/On mode)

For (older) sam9x60:
- LPDDR1
- DDR2
- SDRAM & Mobile SDRAM
> IIRC, someone (you? ;-) told me at ELCE that Microchip keeps on spinning
> new variants of old SoCs, to accommodate the changing DDR landscape
> and market.  So perhaps they also accept larger RAM sizes?
No, in fact we address 256 M Bytes max on sam9x60 and sam9x75 as well.

Regards,
   Nicolas

