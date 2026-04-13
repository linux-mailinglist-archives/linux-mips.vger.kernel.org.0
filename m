Return-Path: <linux-mips+bounces-14126-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMvXHxr13GkvYgkAu9opvQ
	(envelope-from <linux-mips+bounces-14126-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 15:52:26 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB1D3ECC4B
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 15:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33368301C89E
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 13:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F483CEB9E;
	Mon, 13 Apr 2026 13:45:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C03032AAA7;
	Mon, 13 Apr 2026 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776087924; cv=none; b=b0D/dOkT50xAiCCN7V4BynJGLRH3jhg2bgz1hVu/i9SeMjpFXgvA6L+P8mT0S9EDpfhjfAvwoYd9DcMliyZWBQDYUKe6JFDlj7+aiTgMyrYlr86KnUB+5CGJygHw7HBfXR7wk7MyaX7WDIjtLw3jJf36RpkiGd4zCl8GeY9sjCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776087924; c=relaxed/simple;
	bh=909Q03nLYzRnV2uD3X2X/W7tkeK+QT5NOhuVd+eYU8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhfbsXkNDMUqbP2WUoQztqoRvbR19bDNXKCQTizLEIQZVWRLV0oDMxe8PLdM8VqSnN39AgrxIrWP7Cd8haGBg1gjJ/wxFCdgK+FpgF+gEQuqfHYN/iqsFD+/o0OPp6Jo23g1AOOE/zcqULJD5kX/wUffpHqKIcnnDkIB0QLOuvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wCHbE-0004aH-00; Mon, 13 Apr 2026 15:45:12 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D4B6BC0C39; Mon, 13 Apr 2026 15:44:14 +0200 (CEST)
Date: Mon, 13 Apr 2026 15:44:14 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 00/13] Introducing the Mobileye EyeQ6Lplus SoC
Message-ID: <adzzLvq2tA9mzwc2@alpha.franken.de>
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14126-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DAB1D3ECC4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:25:37PM +0100, Benoît Monin wrote:
> The Eyeq6Lplus is a new system-on-chip part of Mobileye's EyeQ family
> of SoC aimed at Advanced Driver Assistance Systems (ADAS). It is built
> around a multicore MIPS I6500 with 2 cores and 8 threads and integrates
> controllers and accelerators dedicated to driving assistance.
> 
> This patchset adds the initial support for the EyeQ6Lplus and its
> evaluation board with the following list of controllers:
> * The OLB ("Other Logic Block") providing clocks, resets and pin controls.
> * One UART from DesignWare.
> * One GPIO controller from DesignWare.
> * Two SPI controllers from DesignWare, one in host mode and one in target
>   mode.
> * One octoSPI flash controller from Cadence, identical to the one found
>   in the EyeQ5.
> * Two I2C controllers from Designware.
> 
> The patch series adds the device tree bindings for the SoC and the OLB.
> It also adds the Kconfig entry for the EyeQ6Lplus, the SoC and evaluation
> board device tree, and the defconfig. For the OLB, the series adds the
> match data to the clk-eyeq, reset-eyeq and pinctrl-eyeq5 drivers.
> 
> It also brings three other changes. One is for the pinctrl-eyeq5 driver
> to access the pin descriptions, pin functions, and pin bank registers
> via the match data instead of directly. This is needed to add support
> for the EyeQ6Lplus alongside the EyeQ5 to the pinctrl driver.
> 
> To be able to match against compatible entries, an OF node is needed
> but the pinctrl-eyeq5 does not have one as it is an auxiliary device
> of clk-eyeq. As part of his MACB phy series[1], Théo switched to
> devm_auxiliary_device_create() to register the auxiliary devices, and
> this helper sets the OF node of the auxiliary device.
> 
> So this series depends on Théo's patchset so that eq5p_probe() can use
> the OF node to get the match data, similar to what is done in eqr_probe()
> in reset-eyeq.
> 
> The two other changes are in the clk-eyeq driver. First we skip the
> post-divisor when computing the PLL frequency in the clk-eyeq driver,
> to match how the clock signal is wired internally in all EyeQ PLL and
> compute the correct frequency for the PLL of the EyeQ6Lplus. Second we
> adjust the accuracy and down spreading computation of the PLL frequency
> as the spread spectrum of all EyeQ PLL is in 1/1024 and not in 1/1000
> as previously thought.
> 
> [1]: https://lore.kernel.org/lkml/20260225-macb-phy-v7-0-665bd8619d51@bootlin.com/
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
> Changes in v4:
> - Simplify entries in Kconfig for clk-eyeq and reset-eyeq, since all
>   Mobileye EyeQ SoCs use these drivers.
> - Link to v3: https://lore.kernel.org/r/20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com
> 
> Changes in v3:
> - Rebase series on v7.0-rc1 + Théo's patchset[1].
> - Refresh the defconfig.
> - Add missing cdns,fifo-depth entry in octospi node of the SoC device tree.
> - Simplify eq5p_probe() now that the OF node is set in clk-eyeq driver.
> - Link to v2: https://lore.kernel.org/r/20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com
> 
> Changes in v2:
> - Rebased on v6.19-rc2.
> - Drop spidev nodes from the evaluation board DT, they were
>   here for test only.
> - Fix bug in eq5p_pinconf_set() using uninitialized value.
> - Link to v1: https://lore.kernel.org/r/20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com
> 
> ---
> Benoît Monin (13):
>       dt-bindings: mips: Add Mobileye EyeQ6Lplus SoC
>       dt-bindings: soc: mobileye: Add EyeQ6Lplus OLB
>       MIPS: Add Mobileye EyeQ6Lplus support
>       reset: eyeq: Add Mobileye EyeQ6Lplus OLB
>       pinctrl: eyeq5: Use match data
>       pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
>       clk: eyeq: Skip post-divisor when computing PLL frequency
>       clk: eyeq: Adjust PLL accuracy computation
>       clk: eyeq: Add Mobileye EyeQ6Lplus OLB
>       MIPS: Add Mobileye EyeQ6Lplus SoC dtsi
>       MIPS: Add Mobileye EyeQ6Lplus evaluation board dts
>       MIPS: config: add eyeq6lplus_defconfig
>       MAINTAINERS: Mobileye: Add EyeQ6Lplus files
> 
>  .../devicetree/bindings/mips/mobileye.yaml         |   5 +
>  .../soc/mobileye/mobileye,eyeq6lplus-olb.yaml      | 208 ++++++++++
>  MAINTAINERS                                        |   4 +-
>  arch/mips/boot/dts/mobileye/Makefile               |   1 +
>  arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts    | 103 +++++
>  arch/mips/boot/dts/mobileye/eyeq6lplus-pins.dtsi   |  84 ++++
>  arch/mips/boot/dts/mobileye/eyeq6lplus.dtsi        | 170 ++++++++
>  arch/mips/configs/eyeq6lplus_defconfig             | 117 ++++++
>  arch/mips/mobileye/Kconfig                         |   3 +
>  arch/mips/mobileye/Platform                        |   1 +
>  drivers/clk/Kconfig                                |   4 +-
>  drivers/clk/clk-eyeq.c                             |  90 ++++-
>  drivers/pinctrl/Kconfig                            |   4 +-
>  drivers/pinctrl/pinctrl-eyeq5.c                    | 437 +++++++++++++++------
>  drivers/reset/Kconfig                              |   4 +-
>  drivers/reset/reset-eyeq.c                         |  31 ++
>  .../dt-bindings/clock/mobileye,eyeq6lplus-clk.h    |  37 ++
>  17 files changed, 1156 insertions(+), 147 deletions(-)

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

