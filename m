Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAB335E6D4
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 21:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344040AbhDMTF0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 15:05:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:60620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231734AbhDMTFZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 15:05:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7AFD613CA;
        Tue, 13 Apr 2021 19:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618340705;
        bh=adPubgfpOrI6A9TuJBDs8NDXHEvW3E+ZI2frnmYzgaM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gUREuKWiLE9Bq+o/j58E6XCRWi5cFvHI0oGGS5LjGmUsAtF6mR6lFZXwkpJpVNdcC
         HRCsQVs8ovmUhm9rVONpaoBV9xk2UfMC6zAHhtrSC6ylO+yMQuFvLn+LVwArG314bk
         FYveLJw6UeDOthVe/Dy3NRNdtC9KfuNeQ5z+f+Uj+kaVT5m+zg36b/1ik5W2YixD5g
         oW0j32qRPtoCOVoYTFlno8VAVMFBCHjflBROwJWUBukPn7/BUHjMy1NALWSaVmEPiH
         ZYt5MEZ2EBzGV8Fyiub/ODlmZqrXKsMqoGBQt96bpGKUVwVddDGF8kt0vIuzQQLORV
         HRqsp9Sr1JNfQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210410055059.13518-2-sergio.paracuellos@gmail.com>
References: <20210410055059.13518-1-sergio.paracuellos@gmail.com> <20210410055059.13518-2-sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v13 1/4] clk: ralink: add clock driver for mt7621 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 13 Apr 2021 12:05:03 -0700
Message-ID: <161834070385.3764895.8150982536236653732@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Sergio Paracuellos (2021-04-09 22:50:56)
> The documentation for this SOC only talks about two
> registers regarding to the clocks:
> * SYSC_REG_CPLL_CLKCFG0 - provides some information about
> boostrapped refclock. PLL and dividers used for CPU and some
> sort of BUS.
> * SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable
> clocks for all or some ip cores.
>=20
> Looking into driver code, and some openWRT patched there are
> another frequencies which are used in some drivers (uart, sd...).
> According to all of this information the clock plan for this
> SoC is set as follows:
> - Main top clock "xtal" from where all the rest of the world is
> derived.
> - CPU clock "cpu" derived from "xtal" frequencies and a bunch of
> register reads and predividers.
> - BUS clock "bus" derived from "cpu" and with (cpu / 4) MHz.
> - Fixed clocks from "xtal":
>     * "50m": 50 MHz.
>     * "125m": 125 MHz.
>     * "150m": 150 MHz.
>     * "250m": 250 MHz.
>     * "270m": 270 MHz.
>=20
> We also have a buch of gate clocks with their parents:
>   * "hsdma": "150m"
>   * "fe": "250m"
>   * "sp_divtx": "270m"
>   * "timer": "50m"
>   * "pcm": "270m"
>   * "pio": "50m"
>   * "gdma": "bus"
>   * "nand": "125m"
>   * "i2c": "50m"
>   * "i2s": "270m"
>   * "spi": "bus"
>   * "uart1": "50m"
>   * "uart2": "50m"
>   * "uart3": "50m"
>   * "eth": "50m"
>   * "pcie0": "125m"
>   * "pcie1": "125m"
>   * "pcie2": "125m"
>   * "crypto": "250m"
>   * "shxc": "50m"
>=20
> With this information the clk driver will provide clock and gates
> functionality from a a set of hardcoded clocks allowing to define
> a nice device tree without fixed clocks.
>=20
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Applied to clk-next
