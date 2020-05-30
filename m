Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79B911E9304
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 20:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729083AbgE3SOR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 14:14:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:56896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728927AbgE3SOQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 30 May 2020 14:14:16 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FB3E20722;
        Sat, 30 May 2020 18:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590862456;
        bh=nkYFO52Wz9gD47nkE3uJCDtB/pInehNr3iZBDa1Wc/0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SbQEc+DVB6cII+RbY747UmgUGE+2mj0+nBAlMXNV7uorN68DFc1aM/S5oUiNjtPPD
         tv1DUEG0AZTfNo+P78YB5oihselIftCf6c1PZXZ5e2nCWXoBkXTUnh5AqOcXhnvSoC
         SXaexHPxLL+66U8yK0BtMMtflK/kQY4vFfxiWjHk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200526222056.18072-2-Sergey.Semin@baikalelectronics.ru>
References: <20200526222056.18072-1-Sergey.Semin@baikalelectronics.ru> <20200526222056.18072-2-Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v3 1/4] dt-bindings: clk: Add Baikal-T1 CCU PLLs binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date:   Sat, 30 May 2020 11:14:15 -0700
Message-ID: <159086245542.69627.16106186464838114976@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Serge Semin (2020-05-26 15:20:53)
> Baikal-T1 Clocks Control Unit is responsible for transformation of a
> signal coming from an external oscillator into clocks of various
> frequencies to propagate them then to the corresponding clocks
> consumers (either individual IP-blocks or clock domains). In order
> to create a set of high-frequency clocks the external signal is
> firstly handled by the embedded into CCU PLLs. So the corresponding
> dts-node is just a normal clock-provider node with standard set of
> properties. Note as being part of the Baikal-T1 System Controller its
> DT node is supposed to be a child the system controller node.
>=20
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-mips@vger.kernel.org
>=20
> ---

Applied to clk-next
