Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F0F3B5689
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 03:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbhF1BO4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 21:14:56 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:54435 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231882AbhF1BOy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 21:14:54 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id DF6EB32001AB;
        Sun, 27 Jun 2021 21:12:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 27 Jun 2021 21:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=V
        BFZ1y1JnPKv7iC+LVfspLTUDbJtJZyrRNLbQEMjIDI=; b=Y3Bwq+W5knwZYoV+n
        3CYNpnLi2f5G+BUbFO3xC2P0FVRKDlyXbPe7G8/BzsKFA5iTr2uBRT2r492z5UEn
        0UKNzGhCJIkdeGIsuAn8Cf6DLEClqbSZCbmyBLV4ka8Dmpbg74dBkugvgG/MaELu
        VJw0BfVcYtVEMIWSBZUXCDqtrTPjWtjv5o0KOp4BilK39B+sTATCQfYBiljb0xwv
        /nP24bhn3INWPNEdeK5rvp+yE/UjJC2WnvrqjXh30pazvIals88bj/pwLLxSl77V
        9L0bBWD1J2NbFdsIGPl68fdWB54UDL9fYN0alHcx0rLd78zjLm+PECmaKJqe4OIG
        ODrvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=VBFZ1y1JnPKv7iC+LVfspLTUDbJtJZyrRNLbQEMjI
        DI=; b=L2iTuaNs9lVeG2e1kqImbY592aPJpPI7GBwaGs/dVtFUBRAZlkFWq80CK
        qEP7TSa9VwuJ/dM+V05Drji966OTD4z22a29sPBtLk8mQVi9NbTop5H7wn1i5h1g
        jbdPdhLw0d/Wum2k0gsRrpj6ZwbdYBXlyLefoZQhDnIr51N2PuEpThyeJfLfq4um
        5Ic77FUN3u293oWzLcj7kzuDkNH8W9tvkmZcxoxdOKPBb5NrFbBOA7vcOxudzjmt
        az/pV9rayNJlHoGi+IwJT9X7NxAjRHLLV7vuDMAKBc175qq0XUh8GAej331EWca9
        PDnFPdqEXeJdFdnNfEcs42Y67REDg==
X-ME-Sender: <xms:-yHZYLD_h5LgXOgOFRnC0YtG9PDXuWRlGV9US02Hdf9-ZKn3ADgx3g>
    <xme:-yHZYBga1jFI8-quJzSb3y9MmraeEEib_FT_XYoEUvwF2pxcQXwCDMwKKXbXUrGi3
    WJT8gnAC7qIHqlBKbs>
X-ME-Received: <xmr:-yHZYGkEG2mj9rGaZHsc2pKco2sijmTdM9FWNF23LQ4y9SX0k26RLyR7ZfdJDrBvYbSIWeDyMTgteySLbkI0-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehfedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:-yHZYNyiJmpkDwUsCUayNZW4FB3SfPsadaPNHGmLouNEoLlSbDijkg>
    <xmx:-yHZYATE2A_0Kejafj8GdHnuz80omhSffCJNsCYLtdnGh-oVi4J5dQ>
    <xmx:-yHZYAaq_SureWX-dCY-hZVf1FtWFCAU9JUj-7esbq6vXPhv7gs9nQ>
    <xmx:_CHZYFJdb2-VUQYl8VD3TTnvG9gHDx-VfIRhL4hBsOglgz0-MW6IVw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Jun 2021 21:12:24 -0400 (EDT)
Subject: Re: [PATCH v2] MIPS: Loongson64: Add Loongson-2K1000 reset support
To:     Qing Zhang <zhangqing@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210627073806.32564-1-zhangqing@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <08a4ce65-91e0-122e-6f17-b66e08270350@flygoat.com>
Date:   Mon, 28 Jun 2021 09:12:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210627073806.32564-1-zhangqing@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


ÔÚ 2021/6/27 ÏÂÎç3:38, Qing Zhang Ð´µÀ:
> Add power management register operations to support reboot and poweroff.
>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>
> v1-v2:
> - Add pm block node
>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
>
> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> index 569e814def83..929e8ddf86eb 100644
> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> @@ -101,6 +101,14 @@ uart0: serial@1fe00000 {
>   			no-loopback-test;
>   		};
>   
> +		pm: power-controller {
> +			device_type = "power management";

Hi Qing,

Not compatible?


> +			reg = <0 0x1fe0700c 0 0x8>,
> +				<0 0x1fe07014 0 0x8>,
> +				<0 0x1fe07030 0 0x8>;
> +			reg-names = "pm1_sts", "pm1_cnt", "rst_cnt";
> +		};
> +
>   		pci@1a000000 {
>   			compatible = "loongson,ls2k-pci";
>   			device_type = "pci";
> diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
> index c97bfdc8c922..ea125e925d44 100644
> --- a/arch/mips/loongson64/reset.c
> +++ b/arch/mips/loongson64/reset.c
> @@ -10,6 +10,7 @@
>   #include <linux/delay.h>
>   #include <linux/init.h>
>   #include <linux/kexec.h>
> +#include <linux/of_address.h>
>   #include <linux/pm.h>
>   #include <linux/slab.h>
>   
> @@ -20,12 +21,50 @@
>   #include <loongson.h>
>   #include <boot_param.h>
>   
> +static char *pm_reg_name[] = {"pm1_sts", "pm1_cnt", "rst_cnt"};
> +
> +static void __iomem *get_reg_byname(struct device_node *node, const char *name)
> +{
> +	int index = of_property_match_string(node, "reg-names", name);
> +
> +	if (index < 0)
> +		return NULL;
> +
> +	return of_iomap(node, index);
> +}

We do have that helper in of_address.h.

Btw, I'd prefer make it as a driver in driver/platform/mips.

Also the approach using PRID to tell protocol type doesn't really make 
sense to me.

You can override _machine_restart callback in diver once FDT node is found.

Thanks.

- Jiaxun

> +
> +static int  __init loongson_fdt_reset_init(void)
> +{
> +	struct device_node *np;
> +	int i;
> +
> +	np = of_find_node_by_type(NULL, "power management");
> +	if (!np) {
> +		pr_info("Failed to get PM node\n");
> +		return -ENODEV;
> +	}
> +
> +	for (i = 0; i < sizeof(pm_reg_name)/sizeof(char *); i++) {
> +		pm_reg_name[i] = get_reg_byname(np, pm_reg_name[i]);
> +		if (!pm_reg_name[i])
> +			iounmap(pm_reg_name[i]);
> +	}
> +
> +	of_node_put(np);
> +	return 0;
> +}
> +arch_initcall(loongson_fdt_reset_init);
> +
>   static void loongson_restart(char *command)
>   {
> +	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R) {
> +		writel(0x1, (void *)pm_reg_name[2]);
> +	} else {
> +		void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
>   
> -	void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
> +		fw_restart();
> +	}
>   
> -	fw_restart();
>   	while (1) {
>   		if (cpu_wait)
>   			cpu_wait();
> @@ -34,9 +73,18 @@ static void loongson_restart(char *command)
>   
>   static void loongson_poweroff(void)
>   {
> -	void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
> +	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R) {
> +		/* Clear */
> +		writel((readl((void *)pm_reg_name[0]) & 0xffffffff), (void *)pm_reg_name[0]);
> +		/* Sleep Enable | Soft Off*/
> +		writel(GENMASK(12, 10)|BIT(13), (void *)pm_reg_name[1]);
> +	} else {
> +
> +		void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
> +
> +		fw_poweroff();
> +	}
>   
> -	fw_poweroff();
>   	while (1) {
>   		if (cpu_wait)
>   			cpu_wait();
