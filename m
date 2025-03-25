Return-Path: <linux-mips+bounces-8358-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E87A7081F
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 18:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC63F3AE732
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 17:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56AC261396;
	Tue, 25 Mar 2025 17:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="djRgAH9Y"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DBB257AF2;
	Tue, 25 Mar 2025 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742923551; cv=none; b=q7U2IeiopDa6/dC6ooXOLw3irpoBupcn2hfeBlzQK4GL75OJMtSw+UNZ6JTX95VU2seqtvUj2/9284UXX5clNy6aZ/fWC2QZinPwSldFalDpKbTS9887qSKB98MM32rqKJy4cMMwsyxwDJWOaQUudYVNVFijZzV6HgDIfR4uouE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742923551; c=relaxed/simple;
	bh=S6T4TmlUdE7gvOPo3bQyO4uG51sRLu56OEoAsFNC4ek=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=rIzGdSk6a2wN13ym1YSnz593dNTtZEQ6K7dOKZ7v8znytSx6c78Do2k5Mr6rFWBPjHg73BrJYdl0FuSUv5MV9UNyJM6Vv8pueXEOfS5bfRRNjXqmKOK9OzrLoV7yigXMz2NRlTlx2XKuyXQdiqIWACIOvNAlP9BDAWahDGLYGKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=djRgAH9Y; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49E3A4433E;
	Tue, 25 Mar 2025 17:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742923540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LPvEeQoVwOan9vRz2MGLJjUipurACCpBk5gQyvnta10=;
	b=djRgAH9YaswUdPWsaCe87EAlbswo5U9GhK3K6k5EYX2bvj6cj9H9AR++Q4xTrMjSQ5oaeG
	rcgZDAWu9heu7gNHnzttKf1INMvKr+9LZuo1gvCZAUY1oDoIRAVMCJ/WLARxMlHSLL4LcR
	uR4n0biXynNB5c/tk1wx15MFRJG8J1WrjS72JV1JIVc9wCjBi/7ysxM2w4T8zo1cH8CWaf
	qJDgx/MHlD8/MDD2UNoAyImdQnzenXWLo9pfgfF1S/ruhg5GNfwtM4XkqyykzaobOQR38a
	fZSaHTaOlra0UWasXGnvQYGeOOxYV9B89I4/ap9vV1559suWOMT3MzmRzHpevQ==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Mar 2025 18:25:35 +0100
Message-Id: <D8PITUNTWTXA.366TNSXDUL48G@bootlin.com>
Cc: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-mips@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Claudiu Beznea" <claudiu.beznea@tuxon.dev>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Samuel
 Holland" <samuel.holland@sifive.com>, "Richard Cochran"
 <richardcochran@gmail.com>, "Russell King" <linux@armlinux.org.uk>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next 10/13] net: macb: Add "mobileye,eyeq5-gem"
 compatible
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-10-537b7e37971d@bootlin.com>
 <ea5de004-a26c-43a1-9408-0089fa18b44d@tuxon.dev>
In-Reply-To: <ea5de004-a26c-43a1-9408-0089fa18b44d@tuxon.dev>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieefvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefvhffuofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeigfelffeuffetteetuddufffghefhudeuteeigeekteevgeeileejgfdvffelheenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvjedprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com

On Mon Mar 24, 2025 at 9:18 AM CET, Claudiu Beznea wrote:
> On 21.03.2025 21:09, Th=C3=A9o Lebrun wrote:
>> Add support for the two GEM instances inside Mobileye EyeQ5 SoCs, using
>> compatible "mobileye,eyeq5-gem". With it, add a custom init sequence
>> that accesses two system-controller registers.
>>=20
>> Noteworthy: NET_IP_ALIGN=3D2 on MIPS but the hardware does not align and
>> low bits aren't configurable, so we cannot respect the requested IP
>> header alignment.
>>=20
>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>> ---
>>  drivers/net/ethernet/cadence/macb_main.c | 95 +++++++++++++++++++++++++=
+++++++
>>  1 file changed, 95 insertions(+)
>>=20
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethe=
rnet/cadence/macb_main.c
>> index 79161d559166478f85a6f8294d488ed961d9be7f..9f2a5bf9a5ebca5941229bd9=
6091a0fb96f0607d 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c

[...]

>> +static int eyeq5_init(struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct net_device *netdev =3D platform_get_drvdata(pdev);
>> +	struct macb *bp =3D netdev_priv(netdev);
>> +	struct device_node *np =3D dev->of_node;
>> +	unsigned int gp, sgmii;
>> +	struct regmap *regmap;
>> +	unsigned int args[2];
>> +	unsigned int reg;
>> +	int ret;
>> +
>> +	regmap =3D syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 2,=
 args);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	gp =3D args[0];
>> +	sgmii =3D args[1];
>> +
>> +	/* Forced reset */
>> +	regmap_write(regmap, gp, 0);
>> +	regmap_write(regmap, sgmii, 0);
>> +	usleep_range(5, 20);
>> +
>> +	if (bp->phy_interface =3D=3D PHY_INTERFACE_MODE_SGMII) {
>> +		regmap_write(regmap, gp, EYEQ5_OLB_GP_SGMII_MODE);
>> +
>> +		reg =3D EYEQ5_OLB_SGMII_PWR_EN | EYEQ5_OLB_SGMII_RST_DIS |
>> +		      EYEQ5_OLB_SGMII_PLL_EN;
>> +		regmap_write(regmap, sgmii, reg);
>> +
>> +		ret =3D regmap_read_poll_timeout(regmap, sgmii, reg,
>> +					       reg & EYEQ5_OLB_SGMII_PLL_ACK,
>> +					       1, 100);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "PLL timeout");
>> +
>> +		regmap_read(regmap, sgmii, &reg);
>> +		reg |=3D EYEQ5_OLB_SGMII_PWR_STATE | EYEQ5_OLB_SGMII_SIG_DET_SW;
>> +		regmap_write(regmap, sgmii, reg);
>
> You can use regmap_update_bits() here.
>
>> +	}
>> +
>> +	regmap_read(regmap, gp, &reg);
>> +	reg &=3D ~EYEQ5_OLB_GP_RGMII_DRV;
>> +	if (phy_interface_mode_is_rgmii(bp->phy_interface))
>> +		reg |=3D FIELD_PREP(EYEQ5_OLB_GP_RGMII_DRV, 0x9);
>> +	reg |=3D EYEQ5_OLB_GP_TX_SWRST_DIS | EYEQ5_OLB_GP_TX_M_CLKE;
>> +	reg |=3D EYEQ5_OLB_GP_SYS_SWRST_DIS | EYEQ5_OLB_GP_SYS_M_CLKE;
>> +	regmap_write(regmap, gp, reg);
>
> To me it looks like this code could be abstracted as a phy driver. E.g.,
> check the init_reset_optional() and its usage on "cdns,zynqmp-gem" (phy
> driver here: drivers/phy/xilinx/phy-zynqmp.c).

I thought about that question. Options to implement that sequence are:

 - (1) Implement a separate PHY driver, what you are proposing. I just
   made a prototype branch to see what it'd look like. Nothing too
   surprising; mostly the above sequence is copy-pasted inside
   phy_init|power_on(). I see two issues:

    - First, a practical one. This adds a lot of boilerplate for no
      obvious benefit compared to a raw registers read/write sequence
      inside macb_config->init().

      The main reason for that boilerplate is to allow reuse of a PHY
      across MACs; here we already know that cannot be useful because
      the EyeQ5 has two GEMs and nothing else. Those registers are
      EyeQ5-specific.

    - Second, a semantic one. The registers we are touching are *not*
      the PHY's registers. They are configuring the PHY's integration:
      its input PLL, resets, etc.

 - (2) Second, taking into account that what we are configuring isn't
   the PHY itself but its resources, we could try modeling each
   individual register+field as a reset / clock / pin control (there is
   some drive strength in here, *I think*). Issue: this would get
   messy, fast.
    - A single register would expose many resources.
    - The sequence in macb_config->init() would need to be the exact
      same order. IE we can't abstract much.

   Something like this pseudocode (which is a bad idea, we'd all agree
   here):

      reset_deassert(bp->eq5_sgmii_reset);
      reset_deassert(bp->eq5_sgmii_reset_pwr);
      reset_deassert(bp->eq5_phy_reset_tx);
      reset_deassert(bp->eq5_phy_reset_sys);

      if (bp->phy_interface =3D=3D PHY_INTERFACE_MODE_SGMII) {
         pinctrl_select_state(bp->eq5_phy_input_pinctrl, bp->eq5_pins_sgmii=
);

         reset_deassert(bp->eq5_sgmii_reset);
         clk_prepare_enable(bp->eq5_sgmii_phy_input_pll);

         reset_deassert(bp->eq5_sgmii_reset_pwr);
      } else {
         pinctrl_select_state(bp->eq5_pinctrl, bp->eq5_pins_rgmii);
      }

      reset_deassert(bp->eq5_phy_reset_tx);
      reset_deassert(bp->eq5_phy_reset_sys);
      clk_prepare_enable(bp->eq5_phy_mclk_tx);
      clk_prepare_enable(bp->eq5_phy_mclk_sys);

 - (3) Keep the sequence in macb_config->init(). Plain and simple.
    - Issue: it is somewhat unrelated platform-specific code that's
      present inside macb_main.c.

The two serious options are (1) and (3).
(1) is what you proposed and (3) is what's in the series.

>>  static const struct of_device_id macb_dt_ids[] =3D {
>>  	{ .compatible =3D "cdns,at91sam9260-macb", .data =3D &at91sam9260_conf=
ig },
>>  	{ .compatible =3D "cdns,macb" },
>> @@ -5152,6 +5246,7 @@ static const struct of_device_id macb_dt_ids[] =3D=
 {
>>  	{ .compatible =3D "cdns,zynqmp-gem", .data =3D &zynqmp_config}, /* dep=
recated */
>>  	{ .compatible =3D "cdns,zynq-gem", .data =3D &zynq_config }, /* deprec=
ated */
>>  	{ .compatible =3D "sifive,fu540-c000-gem", .data =3D &fu540_c000_confi=
g },
>> +	{ .compatible =3D "mobileye,eyeq5-gem", .data =3D &eyeq5_config },
>
> Maybe move it after microchip to have it a bit sorted.

Argh those semi sorted lists. I saw "cdns" then "atmel" then "cdns" so I
ignored sorting.

Thanks for the review!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


