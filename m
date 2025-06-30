Return-Path: <linux-mips+bounces-9548-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C1FAEDF3E
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 15:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 550061885E74
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 13:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA5028B3F6;
	Mon, 30 Jun 2025 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="1Ck77Bxu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OAgRftnr"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802AA2CCC9;
	Mon, 30 Jun 2025 13:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290582; cv=none; b=oFr9C99ldm3VmZ1pQRZ/Alu2w0DnflcWOPkT8cLLE9TQSYW33/v2bq8PNzLZWlB4NkbbUH600qnTEpUiOWU+chGY9s1UQquGKe5LXY3o92J3XAhUyKggGlu3MunPWFOarlbgwv4wphi1tYflldqeFfUUaLlnFWErSvkzEk5SQVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290582; c=relaxed/simple;
	bh=Pb4IoNggSqEdmedEpRIpUE25EINncePR4G0HuxwQTSA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=PrSY4vAUjVe+B9Bqlws3wJzQ0gpJscVbpOUMlr/FskLLbN6/MNdfCVfJUu5UDDUxrhdiMBWmKAYOyTVzyUgAZjf6xn/hoiavAHrB5ccVW/TBjCITLGW1dQpzZpbMbNloTG6MSnh/NXjY/w22Rv09RLkxolJp7QkldzLtg7wc2jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=1Ck77Bxu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OAgRftnr; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AB4B17A028A;
	Mon, 30 Jun 2025 09:36:18 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-06.internal (MEProxy); Mon, 30 Jun 2025 09:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1751290578;
	 x=1751376978; bh=sEJ54Vv0MKysQVh8ZZThGPEIYeoAzfDcUt3/WS4I3aY=; b=
	1Ck77Bxu+qRsqjIc1GeGMqiDluXPHlmc+u3HsUpCc+yE/m+C059TvHvzdeDfTZCg
	DjiqvmmRwA0iu2Z6E3vMmDpRxggdAYq9a3cQGdL1IAniwdVTeXXU9DCAP0tEF3ZG
	7vP4LQ+5TXAcaa6YJyx+XPcqaqutHaoxZU1QGv4A2RUcdWEKiwYL3C2buhuAJeY9
	53Rtrtb4gokLy7alPCtC5KzHJC/xyDO3o8wEtdWf/Iad7rLzfg6AjlQLSyoKzn+O
	o13WYWe/ibIwpZH7BMeC9qav3wED/iUmkwbVvpZkaUt/N7LadKdF/YLpr4DSofCh
	frtgWjzOvovE6apgC7Kt7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751290578; x=
	1751376978; bh=sEJ54Vv0MKysQVh8ZZThGPEIYeoAzfDcUt3/WS4I3aY=; b=O
	AgRftnrSCElHAYl69PJH2WAxdW0C+xo13S2wIHkPj75qtg+c8mmcEwkvCFToqJ7O
	EH6AL51wdbAeiP94nXWQtZAWm72XlxFLvuVKEooVBkZlBvwHJZAXoCg72QHA2ndj
	XVfwgAOSHEYGCbwp4A5KStMEWhKFYTCJrSHXJ1A5IDhMDxCh6x1+/OkP+hrHadLR
	JldCChL0jabESvngrlVjP7VrA3QjKOMn48mLvi3nuxV1qvw9tvW/pWleiup6hqfU
	zY+ouVL6BtKrVRSq6fyXLt4gVvCLR2z7JflbsYm6HS5S715o6oiPIHfdpHqUxj9F
	o9Pla5umPveFZtTMKHcpw==
X-ME-Sender: <xms:ypJiaAGUKc9juD2ygJc6gAQDRDDb69IhFLXjikqdogHKGGbG6WVrOA>
    <xme:ypJiaJUGjybum50JJYy259ashIWukFEOdIFn0F88VPQAomV-jQSC25ZCq-UrYqQnX
    nYwIowVR-TBvEpVQOI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgrgihu
    nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffekteehhfelgfdvvedvkeeuffefkeeh
    heegvefhveetjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphht
    thhopeeffedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhguse
    grlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehlihhnuhigsegrrhhmlhhi
    nhhugidrohhrghdruhhkpdhrtghpthhtoheptgihrhhilhhlvgdrphhithgthhgvnhesrg
    htmhgvlhdrtghomhdprhgtphhtthhopehhshhkihhnnhgvmhhovghnsegrthhmvghlrdgt
    ohhmpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtg
    homhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhr
    tghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpd
    hrtghpthhtoheprhgrfhgrlhhosegtrgguvghntggvrdgtohhmpdhrtghpthhtohepphgr
    lhhmvghrsegurggssggvlhhtrdgtohhm
X-ME-Proxy: <xmx:ypJiaKIDjCkyusFfkgBNhMk7LFXNmT2o5Ag8yvPSvsmTvlLeZDbKjw>
    <xmx:ypJiaCGEHJZPw4N69DXz1l8BumTrqz_MAivU6Za3Vemr2WQqzvdbNA>
    <xmx:ypJiaGWsiTEyymJTuPjZLZFpQUpXPG1ze56EMEjdaeMBqRKh8oOHOQ>
    <xmx:ypJiaFPBg8zesaEEF8vBWRkELBv3dpBarBlIvB2si3vDbZEJgwwVug>
    <xmx:0pJiaPk5vhhp_Whm7tXgy9jrXCmp5NUUyrActcYcLCuoup2TS2gBQij_>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C28682CE0071; Mon, 30 Jun 2025 09:36:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T1801f58283c6cf22
Date: Mon, 30 Jun 2025 14:35:50 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Richard Cochran" <richardcochran@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Cyrille Pitchen" <cyrille.pitchen@atmel.com>,
 "Harini Katakam" <harini.katakam@xilinx.com>,
 "Rafal Ozieblo" <rafalo@cadence.com>,
 "Haavard Skinnemoen" <hskinnemoen@atmel.com>,
 "Jeff Garzik" <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>
Message-Id: <984c1bea-7020-4121-9fea-7d657a5e8da1@app.fastmail.com>
In-Reply-To: <20250627-macb-v2-16-ff8207d0bb77@bootlin.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-16-ff8207d0bb77@bootlin.com>
Subject: Re: [PATCH net-next v2 16/18] MIPS: mobileye: add EyeQ5 DMA IOCU support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B46=E6=9C=8827=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=
=8D=8810:09=EF=BC=8CTh=C3=A9o Lebrun=E5=86=99=E9=81=93=EF=BC=9A
> Both Cadence GEM Ethernet controllers on EyeQ5 are hardwired through C=
M3
> IO Coherency Units (IOCU). For DMA coherent accesses, BIT(36) must be
> set in DMA addresses.

Hi Th=C3=A9o,

Just quick question, it seems like this special driver is only applying a
fixed offset (1 << 36) to the DMA physical address, can we achieve that =
with dma-ranges
property in DeviceTree?

I belive:
```
dma-coherent;
             # Bus addr       # Phys  # Size
dma-ranges =3D <0x10 0x00000000 0x0 0x0 0x10 0>;
```

Will do the job.

Thanks
Jiaxun
>
> Implement that in platform-specific dma_map_ops which get attached to
> both instances of `cdns,eyeq5-gem` through a notifier block.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  MAINTAINERS                         |   2 +-
>  arch/mips/mobileye/Kconfig          |   1 +
>  arch/mips/mobileye/Makefile         |   2 +
>  arch/mips/mobileye/eyeq5-iocu-dma.c | 160 +++++++++++++++++++++++++++=
+++++++++
>  4 files changed, 164 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index=20
> bb9df569a3fff41ab40d7da5843f1e8564b47bf2..7ee68d7f8e8d0632846f59579412=
458e301bd8fb=20
> 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16789,7 +16789,7 @@=20
> F:	Documentation/devicetree/bindings/mips/mobileye.yaml
>  F:	Documentation/devicetree/bindings/soc/mobileye/
>  F:	arch/mips/boot/dts/mobileye/
>  F:	arch/mips/configs/eyeq5_defconfig
> -F:	arch/mips/mobileye/board-epm5.its.S
> +F:	arch/mips/mobileye/
>  F:	drivers/clk/clk-eyeq.c
>  F:	drivers/pinctrl/pinctrl-eyeq5.c
>  F:	drivers/reset/reset-eyeq.c
> diff --git a/arch/mips/mobileye/Kconfig b/arch/mips/mobileye/Kconfig
> index=20
> f9abb2d6e1787dbc5a173db48606ed5a02088e41..b9040f3a9b3ddc7f5addcd8e5f11=
0cb9c775b6b1=20
> 100644
> --- a/arch/mips/mobileye/Kconfig
> +++ b/arch/mips/mobileye/Kconfig
> @@ -9,6 +9,7 @@ choice
>=20
>  	config MACH_EYEQ5
>  		bool "Mobileye EyeQ5 SoC"
> +		select ARCH_HAS_DMA_OPS
>=20
>  	config MACH_EYEQ6H
>  		bool "Mobileye EyeQ6H SoC"
> diff --git a/arch/mips/mobileye/Makefile b/arch/mips/mobileye/Makefile
> index=20
> 315c06b689cfbb83f9f205d1140ecf5058e2aa02..50fc7d0ae167c3fb3dc8585bcd45=
583c6cc3f2d2=20
> 100644
> --- a/arch/mips/mobileye/Makefile
> +++ b/arch/mips/mobileye/Makefile
> @@ -1 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
> +
> +obj-$(CONFIG_MACH_EYEQ5)               +=3D eyeq5-iocu-dma.o
> diff --git a/arch/mips/mobileye/eyeq5-iocu-dma.c=20
> b/arch/mips/mobileye/eyeq5-iocu-dma.c
> new file mode 100644
> index=20
> 0000000000000000000000000000000000000000..71d1c35f911636db141c4467dccc=
405af69835ec
> --- /dev/null
> +++ b/arch/mips/mobileye/eyeq5-iocu-dma.c
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/device/bus.h>
> +#include <linux/dma-direct.h>
> +#include <linux/dma-direction.h>
> +#include <linux/dma-map-ops.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/errno.h>
> +#include <linux/export.h>
> +#include <linux/gfp_types.h>
> +#include <linux/init.h>
> +#include <linux/mm.h>
> +#include <linux/mm_types.h>
> +#include <linux/notifier.h>
> +#include <linux/pfn.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/scatterlist.h>
> +#include <linux/types.h>
> +
> +static void *eyeq5_iocu_alloc(struct device *dev, size_t size,
> +			      dma_addr_t *dma_handle, gfp_t gfp,
> +			      unsigned long attrs)
> +{
> +	void *p =3D dma_direct_alloc(dev, size, dma_handle, gfp, attrs);
> +
> +	*dma_handle |=3D BIT_ULL(36);
> +	return p;
> +}
> +
> +static void eyeq5_iocu_free(struct device *dev, size_t size,
> +			    void *vaddr, dma_addr_t dma_handle,
> +			    unsigned long attrs)
> +{
> +	dma_handle &=3D ~BIT_ULL(36);
> +	dma_direct_free(dev, size, vaddr, dma_handle, attrs);
> +}
> +
> +static int eyeq5_iocu_mmap(struct device *dev, struct vm_area_struct=20
> *vma,
> +			   void *cpu_addr, dma_addr_t dma_addr, size_t size,
> +			   unsigned long attrs)
> +{
> +	unsigned long pfn =3D PHYS_PFN(dma_to_phys(dev, dma_addr));
> +	unsigned long count =3D PAGE_ALIGN(size) >> PAGE_SHIFT;
> +	unsigned long user_count =3D vma_pages(vma);
> +	int ret;
> +
> +	vma->vm_page_prot =3D dma_pgprot(dev, vma->vm_page_prot, attrs);
> +
> +	if (dma_mmap_from_dev_coherent(dev, vma, cpu_addr, size, &ret))
> +		return ret;
> +
> +	if (vma->vm_pgoff >=3D count || user_count > count - vma->vm_pgoff)
> +		return -ENXIO;
> +
> +	return remap_pfn_range(vma, vma->vm_start, pfn + vma->vm_pgoff,
> +			       user_count << PAGE_SHIFT, vma->vm_page_prot);
> +}
> +
> +static int eyeq5_iocu_get_sgtable(struct device *dev, struct sg_table=20
> *sgt,
> +				  void *cpu_addr, dma_addr_t dma_addr, size_t size,
> +				  unsigned long attrs)
> +{
> +	struct page *page =3D virt_to_page(cpu_addr);
> +	int ret;
> +
> +	ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> +	if (!ret)
> +		sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
> +	return ret;
> +}
> +
> +static dma_addr_t eyeq5_iocu_map_page(struct device *dev, struct page=20
> *page,
> +				      unsigned long offset, size_t size,
> +				      enum dma_data_direction dir,
> +				      unsigned long attrs)
> +{
> +	phys_addr_t phys =3D page_to_phys(page) + offset;
> +
> +	/* BIT(36) toggles routing through IOCU for DMA operations. */
> +	return phys_to_dma(dev, phys) | BIT_ULL(36);
> +}
> +
> +static void eyeq5_iocu_unmap_page(struct device *dev, dma_addr_t=20
> dma_handle,
> +				  size_t size, enum dma_data_direction dir,
> +		unsigned long attrs)
> +{
> +}
> +
> +static int eyeq5_iocu_map_sg(struct device *dev, struct scatterlist=20
> *sgl,
> +			     int nents, enum dma_data_direction dir,
> +			     unsigned long attrs)
> +{
> +	struct scatterlist *sg;
> +	int i;
> +
> +	for_each_sg(sgl, sg, nents, i) {
> +		sg->dma_address =3D eyeq5_iocu_map_page(dev, sg_page(sg),
> +						      sg->offset, sg->length,
> +						      dir, attrs);
> +		if (sg->dma_address =3D=3D DMA_MAPPING_ERROR)
> +			return 0; /* No cleanup because ->unmap_page() is a no-op. */
> +		sg_dma_len(sg) =3D sg->length;
> +	}
> +
> +	return nents;
> +}
> +
> +static void eyeq5_iocu_unmap_sg(struct device *dev, struct scatterlis=
t=20
> *sgl,
> +				int nents, enum dma_data_direction dir,
> +				unsigned long attrs)
> +{
> +	/* We know page ->unmap_page() is a no-op. */
> +}
> +
> +const struct dma_map_ops eyeq5_iocu_ops =3D {
> +	.alloc			=3D eyeq5_iocu_alloc,
> +	.free			=3D eyeq5_iocu_free,
> +	.alloc_pages_op		=3D dma_direct_alloc_pages,
> +	.free_pages		=3D dma_direct_free_pages,
> +	.mmap			=3D eyeq5_iocu_mmap,
> +	.get_sgtable		=3D eyeq5_iocu_get_sgtable,
> +	.map_page		=3D eyeq5_iocu_map_page,
> +	.unmap_page		=3D eyeq5_iocu_unmap_page,
> +	.map_sg			=3D eyeq5_iocu_map_sg,
> +	.unmap_sg		=3D eyeq5_iocu_unmap_sg,
> +	.get_required_mask	=3D dma_direct_get_required_mask,
> +};
> +EXPORT_SYMBOL(eyeq5_iocu_ops);
> +
> +static int eyeq5_iocu_notifier(struct notifier_block *nb,
> +			       unsigned long event,
> +			       void *data)
> +{
> +	struct device *dev =3D data;
> +
> +	/*
> +	 * IOCU routing is hardwired; we must use our above custom
> +	 * routines for cache-coherent DMA on ethernet interfaces.
> +	 */
> +	if (event =3D=3D BUS_NOTIFY_ADD_DEVICE &&
> +	    device_is_compatible(dev, "mobileye,eyeq5-gem")) {
> +		set_dma_ops(dev, &eyeq5_iocu_ops);
> +		return NOTIFY_OK;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block eyeq5_iocu_nb =3D {
> +	.notifier_call =3D eyeq5_iocu_notifier,
> +};
> +
> +static int __init eyeq5_iocu_init(void)
> +{
> +	return bus_register_notifier(&platform_bus_type, &eyeq5_iocu_nb);
> +}
> +postcore_initcall(eyeq5_iocu_init);
>
> --=20
> 2.50.0

--=20
- Jiaxun

