Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46EE31E930D
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 20:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729294AbgE3SOY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 14:14:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:57156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728927AbgE3SOX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 30 May 2020 14:14:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 42B5920774;
        Sat, 30 May 2020 18:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590862463;
        bh=UcgMnbWVfvBjv+v+D7HF4E+1En0QCkN0V0BLFqoCM6s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=e7bPydJqmjKqzrBfvCM3/4UwGU+fF4fezrySjJL4CZn7slwfG7KIGTCwV6iS0VDB/
         JQXWtHXnDnqNwTkzl5C0nVYDXWyUhPrsyD2IGNAd9dzinceEO3rja/69apDGoMKaAx
         9mMjnWUk0GZRUzF2dgTOsq5Myq1B0jFPr6764jKI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200526222056.18072-4-Sergey.Semin@baikalelectronics.ru>
References: <20200526222056.18072-1-Sergey.Semin@baikalelectronics.ru> <20200526222056.18072-4-Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v3 3/4] clk: Add Baikal-T1 CCU PLLs driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date:   Sat, 30 May 2020 11:14:22 -0700
Message-ID: <159086246246.69627.14574003566166284722@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Serge Semin (2020-05-26 15:20:55)
> Baikal-T1 is supposed to be supplied with a high-frequency external
> oscillator. But in order to create signals suitable for each IP-block
> embedded into the SoC the oscillator output is primarily connected to
> a set of CCU PLLs. There are five of them to create clocks for the MIPS
> P5600 cores, an embedded DDR controller, SATA, Ethernet and PCIe domains.
> The last three domains though named by the biggest system interfaces in
> fact include nearly all of the rest SoC peripherals. Each of the PLLs is
> based on True Circuits TSMC CLN28HPM IP-core with an interface wrapper
> (so called safe PLL' clocks switcher) to simplify the PLL configuration
> procedure.
>=20
> This driver creates the of-based hardware clocks to use them then in
> the corresponding subsystems. In order to simplify the driver code we
> split the functionality up into the PLLs clocks operations and hardware
> clocks declaration/registration procedures.
>=20
> Even though the PLLs are based on the same IP-core, they may have some
> differences. In particular, some CCU PLLs support the output clock change
> without gating them (like CPU or PCIe PLLs), while the others don't, some
> CCU PLLs are critical and aren't supposed to be gated. In order to cover
> all of these cases the hardware clocks driver is designed with an
> info-descriptor pattern. So there are special static descriptors declared
> for each PLL, which is then used to create a hardware clock with proper
> operations. Additionally debugfs-files are provided for each PLL' field
> to make sure the implemented rate-PLLs-dividers calculation algorithm is
> correct.
>=20
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
>=20
> ---

Applied to clk-next
