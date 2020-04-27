Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1291BA7DF
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 17:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgD0PXV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 27 Apr 2020 11:23:21 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:44439 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgD0PXV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Apr 2020 11:23:21 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3A9A2200011;
        Mon, 27 Apr 2020 15:23:19 +0000 (UTC)
Date:   Mon, 27 Apr 2020 17:23:18 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/4] mtd: rawnand: au1550nd: Get rid of the legacy
 interface implementation
Message-ID: <20200427172318.63e625d4@xps13>
In-Reply-To: <20200419193037.1544035-4-boris.brezillon@collabora.com>
References: <20200419193037.1544035-1-boris.brezillon@collabora.com>
        <20200419193037.1544035-4-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Sun, 19 Apr
2020 21:30:36 +0200:

> Now that exec_op() is implemented we can get rid of all other hooks.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miquèl
