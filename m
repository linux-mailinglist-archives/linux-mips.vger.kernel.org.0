Return-Path: <linux-mips+bounces-7103-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 419629F864E
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 21:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A2BF18948AB
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 20:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B888B1A4E70;
	Thu, 19 Dec 2024 20:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="o3J3f/8N"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6C189BB5
	for <linux-mips@vger.kernel.org>; Thu, 19 Dec 2024 20:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734641444; cv=none; b=FSk4jZBiFbxanQwu/Ww+br/H6RFfDPdIEZ5/v47WWQv8S6Ufv5BAamAiQ+N4omVlZ2wcX/V05f7D4r+tJWEit2BJRF/vIHLVqArxc3OqHj49BWWM7jaFQbQgdw7abQZ21SlQVlwPTA/3Q6aK3tHy71i3DjNP1UGpvklCoEqbuUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734641444; c=relaxed/simple;
	bh=9xmHHI5/quMmmR4rp3VeCfmGXY9B6uCmOF34QVpAjwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5G32bc9jRDTUSZ3l+j8Can0t1c6SfWYR2Tqsn83CLyTHht8D2R94vKqKmTjG6m1EvLk1eb/uOxO6NXIlTFPsJlW2osI+Bgi/eudxNya/xiVfPYr7JTl+1PXqWirFAk8V5G+Yb6LXBOIuz9FpAZ0fI0t8fMhkdqW7G62fiYv7pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=o3J3f/8N; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 99E882C0A10;
	Fri, 20 Dec 2024 09:50:40 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734641440;
	bh=IJewloyzQP8QD3M6cSDceGRsjsevbmToqia9hbkmL+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o3J3f/8NG08l231PWvTvYqWFg7pjxA1EVYfr3HuqYuO7Su6bUzfcd8Jokqi1K7BeO
	 CPLjCpDyHTDUG7G0YFWpsIS6DkR6BzlwccD5yo7p2PG+BZHSXMUFcYZ3+LV+2kVr9k
	 ow8jY5sroZFtggt7ZrUlLeY0rVDEGly9bbZqYaSvk/l9BS5L/pHiJRL1ULdg4YjUjT
	 6+49u79L+laO3IMVQzrWlYejvTgtmQS5s6hJw2xX5uL36/MX1bMt97SPiAkmqXn1m2
	 VofuLbIL1iwchFjmBCxQONio4X+S3u3AX7VGjt5LcjqN6abpVc+vCv+5RK5K0WHhn4
	 ZvbcULMJgUkEQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B676487200000>; Fri, 20 Dec 2024 09:50:40 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 7DFE913EE00;
	Fri, 20 Dec 2024 09:50:40 +1300 (NZDT)
Message-ID: <057a3004-f771-432f-a60b-962c2ebf399a@alliedtelesis.co.nz>
Date: Fri, 20 Dec 2024 09:50:40 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 4/4] net: mdio: Add RTL9300 MDIO driver
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de,
 hkallweit1@gmail.com, linux@armlinux.org.uk, markus.stockhausen@gmx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-5-chris.packham@alliedtelesis.co.nz>
 <CAJq09z49uBPPZqDyc3O+4nVppKoKdrJunQnQKBUfQmwzdV+ZFQ@mail.gmail.com>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <CAJq09z49uBPPZqDyc3O+4nVppKoKdrJunQnQKBUfQmwzdV+ZFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=67648720 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=5ljOSnMwgXI2k2dc92oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 19/12/2024 17:46, Luiz Angelo Daros de Luca wrote:
>> +#define SMI_GLB_CTRL                   0x000
>> +#define   GLB_CTRL_INTF_SEL(intf)      BIT(16 + (intf))
>> +#define SMI_PORT0_15_POLLING_SEL       0x008
>> +#define SMI_ACCESS_PHY_CTRL_0          0x170
>> +#define SMI_ACCESS_PHY_CTRL_1          0x174
>> +#define   PHY_CTRL_RWOP                        BIT(2)
>> +#define   PHY_CTRL_TYPE                        BIT(1)
>> +#define   PHY_CTRL_CMD                 BIT(0)
>> +#define   PHY_CTRL_FAIL                        BIT(25)
>> +#define SMI_ACCESS_PHY_CTRL_2          0x178
>> +#define SMI_ACCESS_PHY_CTRL_3          0x17c
>> +#define SMI_PORT0_5_ADDR_CTRL          0x180
>> +
>> +#define MAX_PORTS       28
>> +#define MAX_SMI_BUSSES  4
>> +#define MAX_SMI_ADDR   0x1f
>> +
>> +struct realtek_mdio_priv {
>> +       struct regmap *regmap;
>> +       u8 smi_bus[MAX_PORTS];
>> +       u8 smi_addr[MAX_PORTS];
>> +       bool smi_bus_isc45[MAX_SMI_BUSSES];
>> +       u32 reg_base;
>> +};
>> +
>> +static int realtek_mdio_wait_ready(struct realtek_mdio_priv *priv)
>> +{
>> +       struct regmap *regmap = priv->regmap;
>> +       u32 reg_base = priv->reg_base;
>> +       u32 val;
>> +
>> +       return regmap_read_poll_timeout(regmap, reg_base + SMI_ACCESS_PHY_CTRL_1,
> All regmap funcs are adding reg_base to the register address. Isn't a
> remap job to do that sum? It just looks odd but I never worked with
> MFD. It looks like it is missing a subregmap-like variant.
I'm thinking about dropping the base and just using the full 16-bit 
address. I've already confused myself between this code and the datasheet.

