Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2ACE1B046E
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 10:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgDTIaE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 04:30:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46522 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDTIaE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Apr 2020 04:30:04 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 569992A0A02;
        Mon, 20 Apr 2020 09:30:02 +0100 (BST)
Date:   Mon, 20 Apr 2020 10:29:59 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        anders.roxell@linaro.org, masonccyang@mxic.com.tw,
        piotrs@cadence.com, robh+dt@kernel.org, linux-mips@vger.kernel.org,
        hauke.mehrtens@intel.com, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200420102959.2659774d@collabora.com>
In-Reply-To: <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 17 Apr 2020 16:21:47 +0800
"Ramuthevar,Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> +
> +	res = devm_platform_ioremap_resource_byname(pdev, lgm_host->cs_name);
> +	lgm_host->nandaddr_va = res;
> +	nandaddr_pa = res->start;
> +	if (IS_ERR(lgm_host->nandaddr_va))
> +		return PTR_ERR(lgm_host->nandaddr_va);

Hm, I didn't realize you needed the physical address for DMA transfers.
Just use platform_get_resource_by_name()+devm_ioremap_resource() in
that case.


> +
> +	writel(LGM_BUSCON_CMULT_V4 | LGM_BUSCON_RECOVC(1) |
> +	       LGM_BUSCON_HOLDC(1) | LGM_BUSCON_WAITRDC(2) |
> +	       LGM_BUSCON_WAITWRC(2) | LGM_BUSCON_BCGEN_CS | LGM_BUSCON_ALEC |
> +	       LGM_BUSCON_SETUP_EN, lgm_host->lgm_va + LGM_BUSCON(cs));

I'm sure some the timings you hardcode here can be extracted from the
NAND timings. Can you see if you can implement ->setup_data_interface()
instead.
