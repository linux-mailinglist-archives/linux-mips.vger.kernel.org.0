Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6083A1BDDA7
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 15:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgD2NcL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 09:32:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33816 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbgD2NcL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Apr 2020 09:32:11 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 147BA2A21EE;
        Wed, 29 Apr 2020 14:32:09 +0100 (BST)
Date:   Wed, 29 Apr 2020 15:32:05 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        anders.roxell@linaro.org, masonccyang@mxic.com.tw,
        robh+dt@kernel.org, linux-mips@vger.kernel.org,
        hauke.mehrtens@intel.com, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200429153205.09c498cd@collabora.com>
In-Reply-To: <4c946dbc-1518-0f0d-fac7-b2cfb4836440@linux.intel.com>
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200429133308.4f91c35c@collabora.com>
        <4c946dbc-1518-0f0d-fac7-b2cfb4836440@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 29 Apr 2020 21:29:40 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> Hi Boris,
> 
>     Thank you very much for the review comments and your time..
> 
> On 29/4/2020 7:33 pm, Boris Brezillon wrote:
> > On Wed, 29 Apr 2020 18:42:05 +0800
> > "Ramuthevar,Vadivel MuruganX"
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >   
> >> +#define NAND_WRITE_CMD		(EBU_CON_CS_P_LOW | HSNAND_CLE_OFFS)
> >> +#define NAND_WRITE_ADDR		(EBU_CON_CS_P_LOW | HSNAND_ALE_OFFS)
> >> +  
> > 
> > I thought we agreed on dropping those definitions.  
> 
> Yes , we agreed upon it, due to assertion/de-assertion of CS kept it.

And I keep thinking we don't need that, just pass
'HSNAND_CLE_OFFS | HSNAND_CS_OFFS' directly.
