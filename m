Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6CA01BF305
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 10:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbgD3IhD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 04:37:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44832 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgD3IhD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Apr 2020 04:37:03 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C95AA2A2332;
        Thu, 30 Apr 2020 09:37:00 +0100 (BST)
Date:   Thu, 30 Apr 2020 10:36:58 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     qi-ming.wu@intel.com, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        cheol.yong.kim@intel.com, hauke.mehrtens@intel.com,
        anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
        richard@nod.at, brendanhiggins@google.com,
        linux-mips@vger.kernel.org, robh+dt@kernel.org,
        miquel.raynal@bootlin.com, tglx@linutronix.de,
        masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200430103658.4b0b979e@collabora.com>
In-Reply-To: <1df71cf7-4cae-4cd0-864c-0812bb2cc123@linux.intel.com>
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
        <20200429162249.55d38ee8@collabora.com>
        <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
        <20200429164832.6800fc70@collabora.com>
        <2e83a2f7-853c-f0e2-f686-daf1e0649eae@linux.intel.com>
        <20200429173107.5c6d2f55@collabora.com>
        <1de9ba29-30f1-6829-27e0-6f141e9bb1e6@linux.intel.com>
        <20200430102114.29b6552f@collabora.com>
        <1df71cf7-4cae-4cd0-864c-0812bb2cc123@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 30 Apr 2020 16:30:15 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> >>>
> >>> And now I'd like you to explain why 5 is the right value for that field
> >>> (I guess that has to do with the position of the CS/ALE/CLE pins).  
> >>
> >> 5 : bit 26, 25, 24, 23, 22 to be included for comparison in the  
> > 
> > That's 6 bits to me, not 5.  
> 
> No , 5 bits only the above case.

Oops, right, sorry for the brain fart.

> > 
> > The question is, is it the same value we have in nand_pa or it is
> > different?
> >   
> Different address which is 0xE1400000 NAND_BASE_PHY address.

Then why didn't you tell me they didn't match when I suggested to pass
nand_pa? So now the question is, what does this address represent? Do
you have a reference manual I can look at to understand what this is?
