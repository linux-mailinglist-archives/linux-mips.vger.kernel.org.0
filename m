Return-Path: <linux-mips+bounces-8094-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EE3A4FC7A
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 11:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4DEB3ADCFA
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 10:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C65120B1F5;
	Wed,  5 Mar 2025 10:42:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8235E20ADDC
	for <linux-mips@vger.kernel.org>; Wed,  5 Mar 2025 10:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171370; cv=none; b=FfWF7H+bWxelgFxDG0y794YJq67ZDLB9STlPSswj6hzKgNzoIqEca3gS/rGXV27+y7wP8JE6XDt6VJrZHkiLcgv5fHsiVho0OwD7zUhWIxOpZw8f944sLJFlwcJQIje7Zfj22HEPxfDDvVpAbpNrqFpP3aANxZS561EFojylSnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171370; c=relaxed/simple;
	bh=q+P1kxlxk9nhHGxz1YAHbBytE232Dzrq0K9V62hixoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHHFRNXVC7NTZPX5ImHoekq9POlr+mtQE/cS76snEmI8WZraiV8sCsX5QB7MTvdabzeRGX+0uOf6yQSpyMHDzVAhsoVzJ80xCPJVoh8HzNJSUSCaevlwjs9L2Qdf/7Y+E3prKJjgY3LEclSRKuYh0iMCkqEyL2eSw0buFabbGUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tpmCM-00054k-Ob; Wed, 05 Mar 2025 11:41:58 +0100
Message-ID: <43fb0965-04b7-41dc-ae3f-54676eefdbb5@pengutronix.de>
Date: Wed, 5 Mar 2025 11:41:49 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add stop_on_panic support for watchdog
To: George Cherian <george.cherian@marvell.com>, linux@roeck-us.net,
 wim@linux-watchdog.org, jwerner@chromium.org, evanbenn@chromium.org,
 kabel@kernel.org, krzk@kernel.org, mazziesaccount@gmail.com,
 thomas.richard@bootlin.com, lma@chromium.org, bleung@chromium.org,
 support.opensource@diasemi.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, andy@kernel.org,
 paul@crapouillou.net, alexander.usyskin@intel.com, andreas.werner@men.de,
 daniel@thingy.jp, romain.perier@gmail.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen@kernel.org, mwalle@kernel.org, xingyu.wu@starfivetech.com,
 ziv.xu@starfivetech.com, hayashi.kunihiko@socionext.com, mhiramat@kernel.org
Cc: chrome-platform@lists.linux.dev, linux-watchdog@vger.kernel.org,
 imx@lists.linux.dev, patches@opensource.cirrus.com,
 openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20250305101025.2279951-1-george.cherian@marvell.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250305101025.2279951-1-george.cherian@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org

Hi George,

On 05.03.25 11:10, George Cherian wrote:
> This series adds a new kernel command line option to watchdog core to
> stop the watchdog on panic. This is useul in certain systems which prevents
> successful loading of kdump kernel due to watchdog reset.
> 
> Some of the watchdog drivers stop function could sleep. For such
> drivers the stop_on_panic is not valid as the notifier callback happens
> in atomic context. Introduce WDIOF_STOP_MAYSLEEP flag to watchdog_info
> options to indicate whether the stop function would sleep.

Did you consider having a reset_on_panic instead, which sets a user-specified
timeout on panic? This would make the mechanism useful also for watchdogs
that can't be disabled and would protect against system lock up:
Consider a memory-corruption bug (perhaps externally via DMA), which partially
overwrites both main and kdump kernel. With a disabled watchdog, the system
may not be able to recover on its own.

If you did consider it, what made you decide against it?

Thanks,
Ahmad

> 
> 
> Changelog:
> v1 -> v2
> - Remove the per driver flag setting option
> - Take the parameter via kernel command-line parameter to watchdog_core.
> 
> v2 -> v3
> - Remove the helper function watchdog_stop_on_panic() from watchdog.h.
> - There are no users for this. 
> 
> v3 -> v4
> - Since the panic notifier is in atomic context, watchdog functions
>   which sleep can't be called. 
> - Add an options flag WDIOF_STOP_MAYSLEEP to indicate whether stop
>   function sleeps.
> - Simplify the stop_on_panic kernel command line parsing.
> - Enable the panic notiffier only if the watchdog stop function doesn't
>   sleep
> 
> George Cherian (2):
>   watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
>   drivers: watchdog: Add support for panic notifier callback
> 
>  drivers/watchdog/advantech_ec_wdt.c |  3 ++-
>  drivers/watchdog/arm_smc_wdt.c      |  3 ++-
>  drivers/watchdog/armada_37xx_wdt.c  |  2 +-
>  drivers/watchdog/asm9260_wdt.c      |  2 +-
>  drivers/watchdog/bcm47xx_wdt.c      |  3 ++-
>  drivers/watchdog/bd9576_wdt.c       |  2 +-
>  drivers/watchdog/bd96801_wdt.c      |  2 +-
>  drivers/watchdog/cgbc_wdt.c         |  2 +-
>  drivers/watchdog/cros_ec_wdt.c      |  5 ++++-
>  drivers/watchdog/da9052_wdt.c       |  3 ++-
>  drivers/watchdog/da9055_wdt.c       |  4 +++-
>  drivers/watchdog/da9062_wdt.c       |  4 +++-
>  drivers/watchdog/da9063_wdt.c       |  4 +++-
>  drivers/watchdog/db8500_wdt.c       |  5 ++++-
>  drivers/watchdog/dw_wdt.c           |  5 +++--
>  drivers/watchdog/f71808e_wdt.c      |  3 ++-
>  drivers/watchdog/gpio_wdt.c         |  2 +-
>  drivers/watchdog/i6300esb.c         |  5 ++++-
>  drivers/watchdog/imx_sc_wdt.c       |  2 +-
>  drivers/watchdog/intel-mid_wdt.c    |  5 ++++-
>  drivers/watchdog/it87_wdt.c         |  5 ++++-
>  drivers/watchdog/jz4740_wdt.c       |  5 ++++-
>  drivers/watchdog/kempld_wdt.c       |  3 ++-
>  drivers/watchdog/lenovo_se10_wdt.c  |  5 ++++-
>  drivers/watchdog/max77620_wdt.c     |  5 ++++-
>  drivers/watchdog/mei_wdt.c          |  3 ++-
>  drivers/watchdog/menf21bmc_wdt.c    |  4 +++-
>  drivers/watchdog/mlx_wdt.c          |  2 +-
>  drivers/watchdog/msc313e_wdt.c      |  5 ++++-
>  drivers/watchdog/npcm_wdt.c         |  3 ++-
>  drivers/watchdog/omap_wdt.c         |  5 ++++-
>  drivers/watchdog/pm8916_wdt.c       |  5 +++--
>  drivers/watchdog/pseries-wdt.c      |  2 +-
>  drivers/watchdog/rave-sp-wdt.c      |  5 ++++-
>  drivers/watchdog/renesas_wdt.c      |  7 ++++--
>  drivers/watchdog/retu_wdt.c         |  5 ++++-
>  drivers/watchdog/rn5t618_wdt.c      |  6 +++--
>  drivers/watchdog/rzg2l_wdt.c        |  5 ++++-
>  drivers/watchdog/rzv2h_wdt.c        |  5 ++++-
>  drivers/watchdog/shwdt.c            |  6 +++--
>  drivers/watchdog/sl28cpld_wdt.c     |  5 ++++-
>  drivers/watchdog/softdog.c          |  5 ++++-
>  drivers/watchdog/sp805_wdt.c        |  5 ++++-
>  drivers/watchdog/starfive-wdt.c     |  3 ++-
>  drivers/watchdog/stpmic1_wdt.c      |  5 ++++-
>  drivers/watchdog/ts4800_wdt.c       |  5 ++++-
>  drivers/watchdog/twl4030_wdt.c      |  5 ++++-
>  drivers/watchdog/uniphier_wdt.c     |  3 ++-
>  drivers/watchdog/w83627hf_wdt.c     |  5 ++++-
>  drivers/watchdog/watchdog_core.c    | 35 +++++++++++++++++++++++++++++
>  drivers/watchdog/wm831x_wdt.c       |  5 ++++-
>  drivers/watchdog/wm8350_wdt.c       |  5 ++++-
>  drivers/watchdog/xen_wdt.c          |  5 ++++-
>  drivers/watchdog/ziirave_wdt.c      |  5 ++++-
>  include/linux/watchdog.h            |  2 ++
>  include/uapi/linux/watchdog.h       |  1 +
>  56 files changed, 198 insertions(+), 58 deletions(-)
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

