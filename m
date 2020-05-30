Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5191F1E9306
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 20:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729205AbgE3SOU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 14:14:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:57054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728927AbgE3SOU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 30 May 2020 14:14:20 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9BD820722;
        Sat, 30 May 2020 18:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590862459;
        bh=0qzzlb2ffV3eSRc8l+4dNlSOBafxMtx6NILKNj7tD9k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=b7U7wmIZE2tg0pxk4SipBod+gMplUQpQrbWiHUkNuGTsOXS5D2i+fimQUQpNSS4/4
         bPUqpX0C6BlGs3FtftPVxZV3IJ3EGEn3XCXi78YWV3Cz4C1drb7lviNu4EkrC0BiN4
         gEU0vTnD4SwRAaOiwKNMK5mXSC3y2X4ISQnzar3s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200526222056.18072-3-Sergey.Semin@baikalelectronics.ru>
References: <20200526222056.18072-1-Sergey.Semin@baikalelectronics.ru> <20200526222056.18072-3-Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v3 2/4] dt-bindings: clk: Add Baikal-T1 CCU Dividers binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date:   Sat, 30 May 2020 11:14:19 -0700
Message-ID: <159086245922.69627.8712418852780364601@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Serge Semin (2020-05-26 15:20:54)
> After being gained by the CCU PLLs the signals must be transformed to
> be suitable for the clock-consumers. This is done by a set of dividers
> embedded into the CCU. A first block of dividers is used to create
> reference clocks for AXI-bus of high-speed peripheral IP-cores of the
> chip. The second block dividers alter the PLLs output signals to be then
> consumed by SoC peripheral devices. Both block DT nodes are ordinary
> clock-providers with standard set of properties supported. But in addition
> to that each clock provider can be used to reset the corresponding clock
> domain. This makes the AXI-bus and System Devices CCU DT nodes to be also
> reset-providers.
>=20
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-mips@vger.kernel.org
>=20
> ---

Applied to clk-next
