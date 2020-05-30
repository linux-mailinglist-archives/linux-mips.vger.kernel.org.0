Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8981E930B
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 20:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgE3SO2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 14:14:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:57266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729301AbgE3SO0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 30 May 2020 14:14:26 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 42BAD20722;
        Sat, 30 May 2020 18:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590862466;
        bh=tSfDPBIbYxx3kqPw8xhvYc/YW+Aubv2fDo0gm7BKCh4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=d7ni3rVrImVCBxDFZsx41MNpKRZTRtHHhrVq0kVNLcwGGxM6G5LcBnGkpEYuRQa8t
         HkqwRtQXOftwbbG3Ey1jJ/BXrM3OdU5JxLbNLaS8LB7qWp5elCvc5aQ7GFDCkh0Bkd
         dPNcaXSqdcccVLRpujGmKCZQUCh9Rx23vq/5Tc+g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200526222056.18072-5-Sergey.Semin@baikalelectronics.ru>
References: <20200526222056.18072-1-Sergey.Semin@baikalelectronics.ru> <20200526222056.18072-5-Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v3 4/4] clk: Add Baikal-T1 CCU Dividers driver
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
Date:   Sat, 30 May 2020 11:14:25 -0700
Message-ID: <159086246567.69627.6187271777288137186@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Serge Semin (2020-05-26 15:20:56)
> Nearly each Baikal-T1 IP-core is supposed to have a clock source
> of particular frequency. But since there are greater than five
> IP-blocks embedded into the SoC, the CCU PLLs can't fulfill all the
> needs. Baikal-T1 CCU provides a set of fixed and configurable clock
> dividers in order to generate a necessary signal for each chip
> sub-block.
>=20
> This driver creates the of-based hardware clocks for each divider
> available in Baikal-T1 CCU. The same way as for PLLs we split the
> functionality up into the clocks operations (gate, ungate, set rate,
> etc) and hardware clocks declaration/registration procedures.
>=20
> In accordance with the CCU documentation all its dividers are distributed
> into two CCU sub-blocks: AXI-bus and system devices reference clocks.
> The former sub-block is used to supply the clocks for AXI-bus interfaces
> (AXI clock domains) and the later one provides the SoC IP-cores reference
> clocks. Each sub-block is represented by a dedicated DT node, so they
> have different compatible strings to distinguish one from another.
>=20
> For some reason CCU provides the dividers of different types. Some
> dividers can be gateable some can't, some are fixed while the others
> are variable, some have special divider' limitations, some've got a
> non-standard register layout and so on. In order to cover all of these
> cases the hardware clocks driver is designed with an info-descriptor
> pattern. So there are special static descriptors declared for the
> dividers of each type with additional flags describing the block
> peculiarity. These descriptors are then used to create hardware clocks
> with proper operations.
>=20
> Some CCU dividers provide a way to reset a domain they generate
> a clock for. So the CCU AXI-bus and CCU system devices clock
> drivers also perform the reset controller registration.
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
