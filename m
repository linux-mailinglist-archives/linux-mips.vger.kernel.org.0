Return-Path: <linux-mips+bounces-8390-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D460CA738E2
	for <lists+linux-mips@lfdr.de>; Thu, 27 Mar 2025 18:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4950A1771AF
	for <lists+linux-mips@lfdr.de>; Thu, 27 Mar 2025 17:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DED2192F1;
	Thu, 27 Mar 2025 17:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pquV8/Lv"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942EF1B0437;
	Thu, 27 Mar 2025 17:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743095249; cv=none; b=LMxZEqSG8yvHe4iFZO8cBPc5p8OasA8k/GARZiprt8tBVAhwxU9fgvVw2xU78ymCnQV0ALf5jhcf48+U6Be0pvKk9evZuL7BM3Zkb8MnzoyvjbefuaeLOK/7pbxBOWnub3VrTHTWtLJIL93E6dn6G1+g3eiAjRU6iJasUUjsv4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743095249; c=relaxed/simple;
	bh=eIXFtol+0vZBbIYFckLTPfC2WG9dNrHXYKkM9EBg79A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=b52IFeDjfE7TBjDsrsr30ccnunHwPuDudveZVoiBTuL9dkRcZK4mLDz2tan0W4Bo+XL6EKs6v67QeA1RA/zNv+zlFOff+x7OdopsZO5wpsxji/PcbYDXUFCYNwbfUfydIRJ1BIQZQVH3j4E7356r8vrOjJp5UR1/szx2QgmXPcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pquV8/Lv; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E20B4424E;
	Thu, 27 Mar 2025 17:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743095239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UdhTLdNrpirrNqXWYpfQ6mk/u/0zez3SEY7a+4LtZhQ=;
	b=pquV8/LvdCRSxF1toX4HU3e4N4ii7PO8LWLGS+EgcwbdcmadVNBPmg5Nf/azep1I0TZUIE
	m/nnZlbO7I1ftRSXTmW+JI+AwbHWQiMBEWgYlUip+F7xF5XXhHqIW5FRGxkD8EmvG49Y1s
	ednGhlGdPjkrxnYTdXROvmp6wLAAPv+yRAyZx4oR6biquHn4qRlp7V/QdsI6Fdz/JHqRhx
	Czhn71bpeZpnq4UBjrkXkMtrAQmgqUJ3tUWvZ2lGJE2Je1WGMP2WvyHVKPYPhUyLI5scod
	OjFzxi+gCgnjgZksfgD+049BKcvlUgDPOXp5WlXi0MSBZMUAf9p7asMmoLDI5A==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Mar 2025 18:07:13 +0100
Message-Id: <D8R7OVRDZF3J.3FH8JD5J0AWWF@bootlin.com>
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Samuel Holland" <samuel.holland@sifive.com>,
 "Richard Cochran" <richardcochran@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Katakam, Harini" <harini.katakam@amd.com>, "Andrew Lunn"
 <andrew@lunn.ch>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next 07/13] net: macb: move HW IP alignment value to
 macb_config
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-7-537b7e37971d@bootlin.com>
 <45b3e613-90c6-4499-b50b-383106172184@lunn.ch>
 <D8OOPAXK16CI.3TE75O760JRSL@bootlin.com>
 <967fcb66-6a64-4e97-8293-a38b0ef1bc01@lunn.ch>
 <SJ2PR12MB8739A1E03E116F9D6A312EB99EA62@SJ2PR12MB8739.namprd12.prod.outlook.com>
In-Reply-To: <SJ2PR12MB8739A1E03E116F9D6A312EB99EA62@SJ2PR12MB8739.namprd12.prod.outlook.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieekleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefvhffuofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeigfelffeuffetteetuddufffghefhudeuteeigeekteevgeeileejgfdvffelheenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvledprhgtphhtthhopehhrghrihhnihdrkhgrthgrkhgrmhesrghmugdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpt
 hhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Harini, Andrew,

On Wed Mar 26, 2025 at 6:01 AM CET, Katakam, Harini wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi Theo,
>
>> -----Original Message-----
>> From: Andrew Lunn <andrew@lunn.ch>
>> Sent: Tuesday, March 25, 2025 12:06 AM
>> To: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>> Cc: Andrew Lunn <andrew+netdev@lunn.ch>; David S. Miller
>> <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinsk=
i
>> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Rob Herring
>> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Doole=
y
>> <conor+dt@kernel.org>; Nicolas Ferre <nicolas.ferre@microchip.com>; Clau=
diu
>> Beznea <claudiu.beznea@tuxon.dev>; Paul Walmsley
>> <paul.walmsley@sifive.com>; Palmer Dabbelt <palmer@dabbelt.com>; Albert =
Ou
>> <aou@eecs.berkeley.edu>; Alexandre Ghiti <alex@ghiti.fr>; Samuel Holland
>> <samuel.holland@sifive.com>; Richard Cochran <richardcochran@gmail.com>;
>> Russell King <linux@armlinux.org.uk>; Thomas Bogendoerfer
>> <tsbogend@alpha.franken.de>; Vladimir Kondratiev
>> <vladimir.kondratiev@mobileye.com>; Gregory CLEMENT
>> <gregory.clement@bootlin.com>; netdev@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> riscv@lists.infradead.org; linux-mips@vger.kernel.org; Thomas Petazzoni
>> <thomas.petazzoni@bootlin.com>; Tawfik Bayouk <tawfik.bayouk@mobileye.co=
m>
>> Subject: Re: [PATCH net-next 07/13] net: macb: move HW IP alignment valu=
e to
>> macb_config
>>
>> On Mon, Mar 24, 2025 at 06:49:05PM +0100, Th=C3=A9o Lebrun wrote:
>> > Hello Andrew,
>> >
>> > On Fri Mar 21, 2025 at 10:06 PM CET, Andrew Lunn wrote:
>> > > On Fri, Mar 21, 2025 at 08:09:38PM +0100, Th=C3=A9o Lebrun wrote:
>> > >> The controller does IP alignment (two bytes).
>> > >
>> > > I'm a bit confused here. Is this hard coded, baked into the silicon?
>> > > It will always do IP alignment? It cannot be turned off?
>> >
>> > Yes, the alignment is baked inside the silicon.
>> > I looked but haven't seen any register to configure the alignment.
>> >
>> > Sorry the commit message isn't clear, it needs improvements.
>> >
>> > >>  skb_reserve(skb, NET_IP_ALIGN);
>> > >
>> > > Why not just replace this with
>> > >
>> > >         skb_reserve(skb, 2);
>> >
>> > On arm64, NET_IP_ALIGN=3D0. I don't have HW to test, but the current
>> > code is telling us that the silicon doesn't do alignment on those:
>>
>> This is part of the confusion. You say the hardware does alignment, and =
then say it
>> does not....
>>
>> >    skb =3D netdev_alloc_skb(...);
>> >    paddr =3D dma_map_single(..., skb->data, ...);
>> >    macb_set_addr(..., paddr);
>> >
>> >    // arm   =3D> NET_IP_ALIGN=3D2 =3D> silicon does alignment
>> >    // arm64 =3D> NET_IP_ALIGN=3D0 =3D> silicon doesn't do alignment
>> >    skb_reserve(skb, NET_IP_ALIGN);
>> >
>> > The platform we introduce is the first one where the silicon alignment
>> > (0 bytes) is different from the NET_IP_ALIGN value (MIPS, 2 bytes).
>>
>> This is starting to make it clearer. So the first statement that the con=
troller does IP
>> alignment (two bytes) is not the full story. I would start there, explai=
n the full story,
>> otherwise readers get the wrong idea.
>>
>> > >>     Compatible             |  DTS folders              |  hw_ip_ali=
gn
>> > >>    ------------------------|---------------------------|-----------=
-----
>> > >>    cdns,at91sam9260-macb   | arch/arm/                 | 2
>> > >>    cdns,macb               | arch/{arm,riscv}/         | NET_IP_ALI=
GN
>> > >>    cdns,np4-macb           | NULL                      | NET_IP_ALI=
GN
>> > >>    cdns,pc302-gem          | NULL                      | NET_IP_ALI=
GN
>> > >>    cdns,gem                | arch/{arm,arm64}/         | NET_IP_ALI=
GN
>> > >>    cdns,sam9x60-macb       | arch/arm/                 | 2
>> > >>    atmel,sama5d2-gem       | arch/arm/                 | 2
>> > >>    atmel,sama5d29-gem      | arch/arm/                 | 2
>> > >>    atmel,sama5d3-gem       | arch/arm/                 | 2
>> > >>    atmel,sama5d3-macb      | arch/arm/                 | 2
>> > >>    atmel,sama5d4-gem       | arch/arm/                 | 2
>> > >>    cdns,at91rm9200-emac    | arch/arm/                 | 2
>> > >>    cdns,emac               | arch/arm/                 | 2
>> > >>    cdns,zynqmp-gem         | *same as xlnx,zynqmp-gem* | 0
>> > >>    cdns,zynq-gem           | *same as xlnx,zynq-gem*   | 2
>> > >>    sifive,fu540-c000-gem   | arch/riscv/               | 2
>> > >>    microchip,mpfs-macb     | arch/riscv/               | 2
>> > >>    microchip,sama7g5-gem   | arch/arm/                 | 2
>> > >>    microchip,sama7g5-emac  | arch/arm/                 | 2
>> > >>    xlnx,zynqmp-gem         | arch/arm64/               | 0
>> > >>    xlnx,zynq-gem           | arch/arm/                 | 2
>> > >>    xlnx,versal-gem         | NULL                      | NET_IP_ALI=
GN
>
> Thanks for the patch. xlnx,versal-gem is arm64 and NET_IP_ALIGN is 0.
>
> AFAIK, IP alignment is controlled by the register field " receive buffer =
offset "
> in the NW config register. The only exception is when " gem_pbuf_rsc " i.=
e.
> receive coalescing is enabled in the RTL in the IP. In that case, the Cad=
enc
> specification states that these bits are ignored.
> So to summarize, if RSC is not enabled (see bit 26 of designcfg_debug6),
> then the current implementation works for all architectures i.e. these tw=
o
> statements are in sync:
> config |=3D MACB_BF(RBOF, NET_IP_ALIGN);  /* Make eth data aligned */
> skb_reserve(skb, NET_IP_ALIGN);
>
> Hope this helps simplify the patch (and also fill up the table that Andre=
w suggested)

Well, big thanks! That'll make the patch much simpler. Either EyeQ5
is the first compatible with RSC enabled, or others with RSC enabled
have NET_IP_ALIGN=3D0.

Below is what the patch could look like for V2.
 - We detect at probe if the HW is RSC-capable.
 - If it isn't, we keep the code the same.
 - If it is, that means the alignment feature isn't available.
   We can't respect our arch alignment request.

That removes all the macb_config->hw_ip_align mess. Much better.

Note: I tried checking if the RBOF field is read-only when the "receive
buffer offset" isn't available but it isn't.

-

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cad=
ence/macb.h
index d8ee7878e144..478152f70563 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -525,6 +525,8 @@
 /* Bitfields in DCFG6. */
 #define GEM_PBUF_LSO_OFFSET        27
 #define GEM_PBUF_LSO_SIZE       1
+#define GEM_PBUF_RSC_OFFSET        26
+#define GEM_PBUF_RSC_SIZE       1
 #define GEM_PBUF_CUTTHRU_OFFSET       25
 #define GEM_PBUF_CUTTHRU_SIZE         1
 #define GEM_DAW64_OFFSET        23
@@ -736,6 +738,7 @@
 #define MACB_CAPS_NEED_TSUCLK         BIT(10)
 #define MACB_CAPS_QUEUE_DISABLE       BIT(11)
 #define MACB_CAPS_NO_LSO        BIT(12)
+#define MACB_CAPS_RSC_CAPABLE         BIT(13)
 #define MACB_CAPS_PCS           BIT(24)
 #define MACB_CAPS_HIGH_SPEED       BIT(25)
 #define MACB_CAPS_CLK_HW_CHG       BIT(26)
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/etherne=
t/cadence/macb_main.c
index db8da8590fe0..51e82d66403b 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -1329,8 +1329,19 @@ static void gem_rx_refill(struct macb_queue *queue)
         dma_wmb();
         macb_set_addr(bp, desc, paddr);

-        /* Properly align Ethernet header. */
-        skb_reserve(skb, NET_IP_ALIGN);
+        /* Properly align Ethernet header.
+         *
+         * Hardware can add dummy bytes if asked using the RBOF
+         * field inside the NCFGR register. That feature isn't
+         * available if hardware is RSC capable.
+         *
+         * We cannot fallback to doing the 2-byte shift before
+         * DMA mapping because the address field does not allow
+         * setting the low 2/3 bits.
+         * It is 3 bits if HW_DMA_CAP_PTP.
+         */
+        if (!(bp->caps & MACB_CAPS_RSC_CAPABLE))
+           skb_reserve(skb, NET_IP_ALIGN);
      } else {
         desc->ctrl =3D 0;
         dma_wmb();
@@ -2788,7 +2799,9 @@ static void macb_init_hw(struct macb *bp)
   macb_set_hwaddr(bp);

   config =3D macb_mdc_clk_div(bp);
-  config |=3D MACB_BF(RBOF, NET_IP_ALIGN); /* Make eth data aligned */
+  /* Make eth data aligned. If RSC capable, that offset is ignored. */
+  if (!(bp->caps & MACB_CAPS_RSC_CAPABLE))
+     config |=3D MACB_BF(RBOF, NET_IP_ALIGN);
   config |=3D MACB_BIT(DRFCS);    /* Discard Rx FCS */
   if (bp->caps & MACB_CAPS_JUMBO)
      config |=3D MACB_BIT(JFRAME);   /* Enable jumbo frames */
@@ -4109,6 +4122,8 @@ static void macb_configure_caps(struct macb *bp,
      dcfg =3D gem_readl(bp, DCFG2);
      if ((dcfg & (GEM_BIT(RX_PKT_BUFF) | GEM_BIT(TX_PKT_BUFF))) =3D=3D 0)
         bp->caps |=3D MACB_CAPS_FIFO_MODE;
+     if (GEM_BFEXT(PBUF_RSC, gem_readl(bp, DCFG6)))
+        bp->caps |=3D MACB_CAPS_RSC_CAPABLE;
      if (gem_has_ptp(bp)) {
         if (!GEM_BFEXT(TSU, gem_readl(bp, DCFG5)))
            dev_err(&bp->pdev->dev,

Thanks Andrew & Harini,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


