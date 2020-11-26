Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F662C539B
	for <lists+linux-mips@lfdr.de>; Thu, 26 Nov 2020 13:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730115AbgKZMIy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Nov 2020 07:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729711AbgKZMIy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 26 Nov 2020 07:08:54 -0500
X-Greylist: delayed 614 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 26 Nov 2020 04:08:54 PST
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E148C0613D4
        for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2020 04:08:54 -0800 (PST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout1.hostsharing.net (Postfix) with ESMTPS id 85FCE3000A38D;
        Thu, 26 Nov 2020 12:58:41 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id A9C6B875D3; Thu, 26 Nov 2020 12:58:38 +0100 (CET)
Date:   Thu, 26 Nov 2020 12:58:38 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-spi@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] spi: Loongson: Add Loongson 3A+7A SPI controller
 driver support
Message-ID: <20201126115838.GA29170@wunner.de>
References: <1606123148-315-1-git-send-email-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606123148-315-1-git-send-email-zhangqing@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 23, 2020 at 05:19:06PM +0800, Qing Zhang wrote:
> +static struct platform_device loongson_spi_device = {
> +	.name           = "loongson-spi",
> +	.id             = 0,
> +	.num_resources  = ARRAY_SIZE(loongson_spi_resources),
> +	.resource   = loongson_spi_resources,
> +};

Why isn't this struct allocated at runtime?


> +	if (ret == PCIBIOS_SUCCESSFUL) {
> +		loongson_spi_resources[1].start = v8;
> +		loongson_spi_resources[1].end = v8;
> +		platform_device_register(&loongson_spi_device);
> +	}
> +
> +err_out:
> +	return ret;
> +}
> +
> +static void loongson_spi_pci_unregister(struct pci_dev *pdev)
> +{
> +	pci_release_region(pdev, 0);
> +}

Seems like platform_device_unregister() is missing here.

Thanks,

Lukas
