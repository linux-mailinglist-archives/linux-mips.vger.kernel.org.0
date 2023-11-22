Return-Path: <linux-mips+bounces-187-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A1C7F5473
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 00:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 827FD2812A0
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 23:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F1F1CA84;
	Wed, 22 Nov 2023 23:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bf5Nk4oJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9ABC11F;
	Wed, 22 Nov 2023 15:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700695422; x=1732231422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wLu90c2ONU3nwRPuECsbNVwdI6Y/3s1bCFsGjUjQWds=;
  b=bf5Nk4oJ25NpqPjcgoH0qyyZwaybM8J+HOuiEmIO+HYRtQc7HJtYqal7
   Xs6igblHASFh/Y92xTaxgbiG4V3iH0btRpQW8ZIkVrC5Fijb+x6nfUubX
   kmDfCySXX0xtVXGnB2zosltPyG8fEZmZdgr0egi+j+szfzdU1V1u19SnK
   B0K0ta1uZwmDnPK+ye3IU6hZVH4wdaN/LF8wPNHFd0jtn1LdujloI3HCd
   3x5oYtSHQvxUN/dL2QoZVyznAo+5s2Y0cnuuL4oPJt15WKo60XkD73Osx
   jBZj8XLvkvmJAw82wWq7HTfR3tshGqVD80KOiVry0/Kpqyp39vNQYt9So
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="391935051"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="391935051"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:23:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="760507612"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="760507612"
Received: from amongesa-mobl.ger.corp.intel.com (HELO intel.com) ([10.252.57.132])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:23:31 -0800
Date: Thu, 23 Nov 2023 00:23:28 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Ilpo =?iso-8859-15?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tony Lindgren <tony@atomide.com>, Petr Mladek <pmladek@suse.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Johan Hovold <johan@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	kernel@pengutronix.de, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 03/52] serial: 8250: Convert to platform remove callback
 returning void
Message-ID: <ZV6NcAXBUcj5wYx8@ashyti-mobl2.lan>
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
 <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>

Hi Uwe,

On Fri, Nov 10, 2023 at 04:29:31PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

