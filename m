Return-Path: <linux-mips+bounces-7451-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C75FA11B1C
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 08:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C61E188AB70
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 07:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D081E260C;
	Wed, 15 Jan 2025 07:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="7btgNDP2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="u/ZFPW/u"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D74418952C;
	Wed, 15 Jan 2025 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736926816; cv=none; b=JpfW4V7yesX2mkE8XHIp8REuxAWo0fZ6MWSJeyF/65uSSVDJJFn/rPWL5PpeclVfmKo7X/UNPfS9MmgnD/DXi9hJmnaHQh6WvgprqYDFDcd3vgnlIP3FiM/+sO9z0RIlF/KKQEL1MaiMG3GSR29wsI3vdrfP3nTu3YULcVacqOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736926816; c=relaxed/simple;
	bh=tqtOiF3aj+eIdil+2uwLgo8A19tDJyH9LhKmQsFfqpY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=d/YT1aw6y46RHo4+aP0l/QYl33b70aZ+1Pal0/PXzST17Lr9GfLcwqZrmZ1unF8M5eX9VKQU8cCEKmJbZ0W1ivv0XDniCegLKqc8fZ0gmxin9GVpnJqW1tYM+8QAowvteGDcxDc5lR67v66FkbTxeYmwkZmVav+Ty1+iAe6geaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=7btgNDP2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=u/ZFPW/u; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D076A25401D8;
	Wed, 15 Jan 2025 02:40:11 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 15 Jan 2025 02:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1736926811;
	 x=1737013211; bh=nAJjcj2BGDopYbS6SMWIeAy5fwPHqqTKZFevk8AgF/M=; b=
	7btgNDP25U8IulQz7eItqhRXEPfGriEcTj6TzzCvpf+QUSpYG5uNeuYeqHsJc8+i
	qtP1DnotoLqEFLZqU6uYpMfzmJf3JgBg5+WpGyK2TwlMEPYwDlbST69V7baAtJkP
	ddEnbGBY9zlbVU9ES30X+Or/ETS/umwMbYFc5arfqMUWgG2TOgFxsqboScEw0JcD
	oT1TQRhlg0DcgP7RUAV4p/5y9/zJ2jXEJg2y67uMO0ycRlbT1N+7POzJfknDiNPv
	3tSUg2V5J10dkOAV9X5sApDWg0lL5xsrhihMNixHHe4R6NyPbQ2ePm8ZYFONJtXW
	VfHzY+ItZyWShOKKrIVeqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736926811; x=
	1737013211; bh=nAJjcj2BGDopYbS6SMWIeAy5fwPHqqTKZFevk8AgF/M=; b=u
	/ZFPW/u9GrhgMl2SnA6zjbBn/AZnY44SmAbYODAgUcA8ibHrzwe879qh4XxJKuoN
	sBYJ6eVB0dgWs1xEBHx/U/c7HNjd31BJgkmOCI4MHMeUVN+l2CTP0LVassENOcg8
	+dYb4CmRVJ4rl71pGtMxAgX895CTma8sujkm8nbi3ZgFQwrAHG2K7NGr0tGIAvdJ
	ADFlMWgm/sn83OhmQAzv0j/d455vk+FRhN7O5OUrsNO9njAu012yNqipKR8452l6
	dPXzfn5SejKPPuS6G+cnYGYWRDTzOrsSJ26e5x5Knqm+lRert0NlLhmTNyyrQjjF
	mAkNwpc4LOzPa4T8Wpx2w==
X-ME-Sender: <xms:WmaHZ4kpdOmJVZWYPoI4A6kIa30t28eMEsIiLUILgMiAk9_Nie06eg>
    <xme:WmaHZ33hCCSJqf6go6lylmmUcR9sC3854sEBEZf6xCaK_sEB2eMoXQn19tuc0ZZ2c
    6pwEGntdO-ejBUKL0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehjedguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddv
    geejvdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrg
    drfhhrrghnkhgvnhdruggvpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihg
    ohgrthdrtghomhdprhgtphhtthhopehmrghtrdhjohhntgiihihksehovddrphhlpdhrtg
    hpthhtohepsghhvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmh
    hiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtrggslhgvsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:WmaHZ2qo-o4aqgDQNIDPomjaQxxtBovgejipQe20AmfJajFnc7t-JQ>
    <xmx:WmaHZ0ldpIZjqq5oSSlrgRipVrRSVRbGaRTah_JhogTZc6xELOWh8A>
    <xmx:WmaHZ20SW4mYG8mz5glZ_hdo0L1x6Tl4m1q_1xY4sXzegbv_4U8MDA>
    <xmx:WmaHZ7tit1HGeow2hDlqVqYPDVRuM_eTH0MVwI5ZdMg-7Hl3tjtU7Q>
    <xmx:W2aHZwoDUwzwQT61tpOa24r5R3ipcipt0Kgkqi2S8sMYhWLfbJ-aRBbB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A7A412220072; Wed, 15 Jan 2025 02:40:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 08:38:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Baoquan He" <bhe@redhat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Message-Id: <23f46c23-a58e-4a85-8733-480b5ebf993b@app.fastmail.com>
In-Reply-To: <fb3aa671-45bc-4d57-b90b-2056eeed0ea6@app.fastmail.com>
References: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>
 <5ef27e01-2c5a-400a-be32-d3bcdeea6d26@app.fastmail.com>
 <fb3aa671-45bc-4d57-b90b-2056eeed0ea6@app.fastmail.com>
Subject: Re: [PATCH] MIPS: pci-legacy: Override pci_address_to_pio
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025, at 20:20, Jiaxun Yang wrote:
> =E5=9C=A82025=E5=B9=B41=E6=9C=8814=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8B=
=E5=8D=887:03=EF=BC=8CArnd Bergmann=E5=86=99=E9=81=93=EF=BC=9A
>> On Tue, Jan 14, 2025, at 19:11, Jiaxun Yang wrote:
>>>=20
>>> +unsigned long pci_address_to_pio(phys_addr_t address)
>>> +{
>>> +	if (address > IO_SPACE_LIMIT)
>>> +		return (unsigned long)-1;
>>> +
>>> +	return (unsigned long) address;
>>> +}
>>> +
>>>  /*
>>
>> Isn't the argument to this function a CPU physical address? I
>> don't think there is a point comparing it to IO_SPACE_LIMIT
>> on architectures where I/O space is memory mapped.
>
> Actually not. It seems like the argument here is just raw PIO offset,
> without applying mips_io_port_base.
>
> We should validate it to ensure it's within the range specified by
> mips_io_port_base (which is sized by IO_SPACE_LIMIT).

I don't know what you mean with "raw PIO offset", but I don't think
that's how it's supopsed to be used. Here is how this gets called
in of_pci_range_to_resource()

        if (res->flags & IORESOURCE_IO) {
                unsigned long port;
                err =3D pci_register_io_range(&np->fwnode, range->cpu_ad=
dr,
                                range->size);
                if (err)
                        goto invalid_range;
                port =3D pci_address_to_pio(range->cpu_addr);
                if (port =3D=3D (unsigned long)-1) {
                        err =3D -EINVAL;
                        goto invalid_range;
                }
                start =3D port;
       }

Where "range->cpu_addr" is the phys_addr_t location of the
MMIO window that maps the host controllers port ranges, i.e.
the fully translated address from the "ranges" property.

The point of the pci_address_to_pio() function is to convert
this into the Linux-internal virtual port number that gets
used as an argument to inb()/outb() and reported in
/proc/ioports and that may or may not be the same as the
address on the bus itself, depending on the how the translation
gets set up.

On loongson, we seem to have two port ranges that are set up
like

                isa@18000000 {
                        compatible =3D "isa";
                        ranges =3D <1 0x0 0x0 0x18000000 0x4000>;
                };

                pci@1a000000 {
                        ranges =3D <0x01000000 0x0 0x00020000 0x0 0x1802=
0000 0x0 0x00020000>,
                                 <0x02000000 0x0 0x40000000 0x0 0x400000=
00 0x0 0x40000000>;
                }

Here, the cpu_addr is 0x18000000 for the isa bus and=20
0x18020000 for the PCI bus, apparently the intention being that
these are consecutive in physical space, though Linux is free
to rearrange the logical port numbers in a different way, e.g.
to ensure that the PCI bus can use port numbers below 0x10000.

On Malta, I see a very strange

        isa {
                compatible =3D "isa";
                ranges =3D <1 0 0 0x1000>;
        };

which maps the first 4096 port numbers into cpu_addr=3D0x0. The
actual port window appears to be at a board specific location

#define MALTA_GT_PORT_BASE      get_gt_port_base(GT_PCI0IOLD_OFS)
#define MALTA_BONITO_PORT_BASE  ((unsigned long)ioremap (0x1fd00000, 0x1=
0000))
#define MALTA_MSC_PORT_BASE     get_msc_port_base(MSC01_PCI_SC2PIOBASL)

So e.g. on Bonito, the ranges property would have to be

      ranges =3D <1 0 0x1fd00000 0x1000>;

Not sure if this is patched in by the bootloader, or where the
corresponding window for PCI gets defined, but I suspect that
the reason for the regression is that the caller of
pci_address_to_pio() accidentally passed in '0' instead of
the physical address, and it happened to work because of the
missing PCI_IOBASE definition but broke after that got defined.

       Arnd

