Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2213B01A5
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 12:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhFVKqZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 22 Jun 2021 06:46:25 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:63997 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhFVKqY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 06:46:24 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 861B940012;
        Tue, 22 Jun 2021 10:44:06 +0000 (UTC)
Date:   Tue, 22 Jun 2021 12:44:05 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     linux-mtd@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH V5 RESEND] mtd: rawnand: Add Loongson1 NAND driver
Message-ID: <20210622124405.43bb5461@xps13>
In-Reply-To: <20210520224213.7907-1-keguang.zhang@gmail.com>
References: <20210520224213.7907-1-keguang.zhang@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Keguang,

Keguang Zhang <keguang.zhang@gmail.com> wrote on Fri, 21 May 2021
06:42:13 +0800:

> From: Kelvin Cheung <keguang.zhang@gmail.com>
> 
> This patch adds NAND driver for Loongson1B.
> 
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>

Sorry for the delay, I really need to focus an hour on this driver, I
didn't take the time to do so, this is still in my todo-list.

Thanks,
Miquèl
