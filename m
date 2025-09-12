Return-Path: <linux-mips+bounces-11267-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB2FB554F8
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 18:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4265CAC2D4F
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 16:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567BE3218D1;
	Fri, 12 Sep 2025 16:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="qr7OyQyB"
X-Original-To: linux-mips@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E823218AE;
	Fri, 12 Sep 2025 16:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757695791; cv=none; b=Ojhfdx6NGuX1xqZw/E4IQMzd2b/Z7/IuR/u26gPS6IlAvpr2WDjNd5r8vYuPtHudHeemXrdXcsmc3nkt0+Q34Li0eRQzzv2w9hC8Qgo0k0XgSzzhC/l+YWxQFNHdduslLxCwBtfDQibEJQa2FyaV/pacqDABYXivRKZzuH1kInk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757695791; c=relaxed/simple;
	bh=u1apkPsXybe68Jt3zrIWLyQZ7H3ZjR0gWhhluRQrN3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qcRp9/TpuhvvGBKitCa0U52rY+GnU4L4nAQFoYzwr0ASD/tKppUS3F8143rvigVahsgaBKPv7PYTSG5M8jensYp6FgWic5i5T3MFRVshnfmgP7XQ6qJkb7WqDFXefVop/MBDTtpLVBJ/jVNNK08fm2bYBJxkbK39E5gE9JrDAbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=qr7OyQyB; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757695790; x=1789231790;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u1apkPsXybe68Jt3zrIWLyQZ7H3ZjR0gWhhluRQrN3k=;
  b=qr7OyQyBDYKpscyEM28tV1X85Pv/vB1ZALdCQl5nK11rCN06r7vFP9vC
   eUtb48ZJh6c4S1kUpSweaQ3NECITpA/moz8qlP4iWoiynK8jSEzb3wcJN
   HxpEacSFyIXxWfRlA0JQGhQx5k4h0hwD+pBjSXQy32R+9iGvjDv4zkQQJ
   oNYP09vm1DsqpxZh/AGQ4zYVBnCkxFlXA6cGEo2VJ1IIGa2xVHqligvH2
   EbKTAQGWjnjM3fUKvCUbAJgZu5pKDydqVhw8dMrTuiYTC66ptHXpb1Nj4
   GZ/Eo+oaXovr0Dhq87eTY0hokCn2pS6o2w/5+UGcJpZbWfnQI+54Elkil
   A==;
X-CSE-ConnectionGUID: s3gPgfU6QPiurXqxeBySFg==
X-CSE-MsgGUID: 0XiE5fKtQqWtnhAnsP3idA==
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="46433595"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2025 09:49:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Sep 2025 09:49:38 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Sep 2025 09:49:32 -0700
Message-ID: <f931da29-5f10-494a-acc0-309bd805d41a@microchip.com>
Date: Fri, 12 Sep 2025 18:49:31 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>, <ksummit@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mips@vger.kernel.org>,
	<linux-mm@kvack.org>, <imx@lists.linux.dev>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, "Lucas
 Stach" <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora
	<ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, "Mike
 Rapoport" <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
	"Ira Weiny" <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Alexander Sverdlin
	<alexander.sverdlin@gmail.com>, "Chester A. Unal"
	<chester.a.unal@arinc9.com>, Sergio Paracuellos
	<sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>, "Mihai
 Sain" <Mihai.Sain@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Arnd,

On 09/09/2025 at 23:23, Arnd Bergmann wrote:
> I'm still collecting information about which of the remaining highmem
> users plan to keep updating their kernels and for what reason.

We have 1GB of memory on our latest Cortex-A7 SAMA7D65 evaluation boards 
[1] (full production announced beg. 2025). The wide range of DDR types 
supported make some of these types interesting to use at such density.
Both our Cortex-A7 SoCs don't have IOMMU; core and DMAs can address the 
full range of the 32 bit address space, so we're quite 
standard/simplistic in this area. We use CMA with large chunks as our 
camera or display interfaces address "modern-ish" resolutions (~1080p).

We use CONFIG_HIGHMEM and activated it for simplicity, conformance to 
usual user-space workloads and planned to add it to our sama7_defconfig 
[2]. I understand that we might reconsider this "by default" choice and 
move to one of the solutions you highlighted in your message, lwn.net 
article or recent talk at ELC-E.

Of course we plan to maintain these boards and keep updating our kernel 
"offer" once a year for those associated SoCs (with maintaining 
upstream, as usual). As you said, being ARMv7, we're quite confident for 
now.

As you mentioned, we've recently released one ARMv5te arm926ejs-based 
soc: the SAM9x75 family. But we don't have the intention to use too big 
memory sizes on them, even if they do address large screens, with LVDS 
and MIPI or modern camera interfaces...

I don't have too much info about our customer's use cases as they are 
very, very diverse, but don't hesitate to reach out to me if you have 
questions about a particular combination of use.
Thanks for your regular update on these topics.

Best regards,
   Nicolas

[1]: for instance: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts#n29

[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/configs/sama7_defconfig

