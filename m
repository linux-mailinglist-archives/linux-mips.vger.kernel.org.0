Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9585227AFF4
	for <lists+linux-mips@lfdr.de>; Mon, 28 Sep 2020 16:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgI1O0B convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 28 Sep 2020 10:26:01 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:47261 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgI1O0B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Sep 2020 10:26:01 -0400
X-Greylist: delayed 577 seconds by postgrey-1.27 at vger.kernel.org; Mon, 28 Sep 2020 10:26:00 EDT
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id B25BF100005;
        Mon, 28 Sep 2020 14:25:51 +0000 (UTC)
Date:   Mon, 28 Sep 2020 16:25:50 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com,
        christophe.kerello@st.com, piotrs@cadence.com,
        robert.jarzmik@free.fr, brendanhiggins@google.com,
        devicetree@vger.kernel.org, tglx@linutronix.de,
        hauke.mehrtens@intel.com, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, arnd@arndb.de,
        andriy.shevchenko@intel.com, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com
Subject: Re: [PATCH v14 0/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200928162550.30bbce71@xps13>
In-Reply-To: <20200924084842.41741-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200924084842.41741-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

"Ramuthevar,Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote on Thu, 24 Sep 2020
16:48:40 +0800:

> This patch adds the new IP of Nand Flash Controller(NFC) support
> on Intel's Lightning Mountain(LGM) SoC.
> 
> DMA is used for burst data transfer operation, also DMA HW supports
> aligned 32bit memory address and aligned data access by default.
> DMA burst of 8 supported. Data register used to support the read/write
> operation from/to device.
> 
> NAND controller also supports in-built HW ECC engine.
> 
> NAND controller driver implements ->exec_op() to replace legacy hooks,
> these specific call-back method to execute NAND operations.
> 
> Thanks Miquel, Boris, Andy, Arnd and Rob for the review comments and suggestions.
> ---
> v14:
>   - Address Andy's review comments
>   - align the headers and revome Duplicates 
>   - replcace numerical const values by HZ_PER_MHZ and USEC_PER_SEC
>     defined macros
>   - add dev_err_probe() api instead of legacy err check
>   - add get_unaligned_le32() api instead of manual endiness
>   - remove redudent check
>   - split the lines logically in between and add require spaces
> v13:
>   - Address Miquel Raynal review comments
>   - update the return type with variable 'ret'
>   - handle err check statement properly
>   - change the naming convention aligned with recently changed the naming
>     around the data interface
>     data structure and function names
>   - replace by div 8 instead of <<4 in ecc calculation better code readability
>   - handle check_only properly like existing drivers

I am sorry but there are two to three comments which you did not
address or addressed partially while not so impacting on the logic,
can you please review and address them all? (please note that I checked
the patch adding the driver before telling you that).

Thanks,
Miquèl
