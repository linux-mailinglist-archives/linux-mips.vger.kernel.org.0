Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7646D199E5C
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 20:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgCaSrW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 14:47:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48738 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgCaSrV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 31 Mar 2020 14:47:21 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 09D86291976;
        Tue, 31 Mar 2020 19:47:20 +0100 (BST)
Date:   Tue, 31 Mar 2020 20:47:16 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Weijie Gao <weijie.gao@mediatek.com>
Cc:     <linux-mtd@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Piotr Sroka <piotrs@cadence.com>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: add driver support for MT7621 nand
 flash controller
Message-ID: <20200331204716.52f611db@collabora.com>
In-Reply-To: <1585678079-5999-1-git-send-email-weijie.gao@mediatek.com>
References: <1585678079-5999-1-git-send-email-weijie.gao@mediatek.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 1 Apr 2020 02:07:58 +0800
Weijie Gao <weijie.gao@mediatek.com> wrote:

> This patch adds NAND flash controller driver for MediaTek MT7621 SoC.
> 
> The NAND flash controller is similar with controllers described in
> mtk_nand.c, except that the controller from MT7621 doesn't support DMA
> transmission, and some registers' offset and fields are different.
> 

Please don't duplicate driver the driver for those minor differences:
use regmap/reg_field to abstract reg field positions and make the DMA
optional.
