Return-Path: <linux-mips+bounces-28-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1867E9891
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 10:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 285FA1F20C20
	for <lists+linux-mips@lfdr.de>; Mon, 13 Nov 2023 09:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B8F18624;
	Mon, 13 Nov 2023 09:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gQ3C+vqt"
X-Original-To: linux-mips@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B8E18623
	for <linux-mips@vger.kernel.org>; Mon, 13 Nov 2023 09:09:39 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B5610D0;
	Mon, 13 Nov 2023 01:09:38 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 25D3C66003B2;
	Mon, 13 Nov 2023 09:09:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699866575;
	bh=+biIpFAEesmQeyQ0ajxFqoWe4IfKev4rpI+PhrI9rhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gQ3C+vqtj839O3n3L/ymQgH5t2FA4orXI/4KbT4WaNjrPKOE9Zd2VJsOerugMFMDK
	 7gxj104S3lY4XsC0+1zWzEjORjCy5vKauxi14SaX5z8noDgNuw8aoDj4GM3bQ6XZW5
	 5v7erfC5J0ixZXoprbrjUaiIQK+96g2IW61NrTRRuFSTHaXINn0BVekFaloiQoIyuy
	 j0DwcdKMIoMh+5EKeg9qKvTxq1q/mrjYZtKPpPd1wg2R54ahkspMyhbHSdZb8nuxxc
	 EaavpD76t7v/qgNdgboQD5sK0vkceUzToyzWcyjYaEU5TlVl28UA7jGHq/fJuGr/vv
	 7c2XU5BP2NyGA==
Message-ID: <023e2184-c2e4-4f3e-a1e1-492dbf7a2e7f@collabora.com>
Date: Mon, 13 Nov 2023 10:09:30 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/52] serial: 8250: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 John Ogness <john.ogness@linutronix.de>, Thomas Gleixner
 <tglx@linutronix.de>, Tony Lindgren <tony@atomide.com>,
 Petr Mladek <pmladek@suse.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Johan Hovold <johan@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas Richard <thomas.richard@bootlin.com>, Rob Herring <robh@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel@pengutronix.de,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
 <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231110152927.70601-4-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 10/11/23 16:29, Uwe Kleine-König ha scritto:
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

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


