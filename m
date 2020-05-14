Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101E21D3E1F
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 21:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbgENT5K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 15:57:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:48618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727117AbgENT5K (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 15:57:10 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A12BD2065C;
        Thu, 14 May 2020 19:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589486229;
        bh=tKWWpxgYPG4stldxvX9LV4nXlvk64bNtADCpumJxIS8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DnV2pqjEmRyOCXZKQIEqug66EC+hc9asFPpTuLcTnyudVx0bDXotfl7Pz5utF4cYJ
         BX9CmERuev/Arisrw13igQHXER6LmTxuvq30R6Kl27kbGu12YpOGKNGTxasZuPMzNE
         nS9VDd2hzL5tfWX0Gast9VuE//fzVBrUApHzS1Y4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200409064416.83340-8-sboyd@kernel.org>
References: <20200409064416.83340-1-sboyd@kernel.org> <20200409064416.83340-8-sboyd@kernel.org>
Subject: Re: [PATCH v2 07/10] clk: Allow the common clk framework to be selectable
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Salter <msalter@redhat.com>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
        linux-m68k@lists.linux-m68k.org,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Date:   Thu, 14 May 2020 12:57:08 -0700
Message-ID: <158948622898.215346.8325812794724480286@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Stephen Boyd (2020-04-08 23:44:13)
> Enable build testing and configuration control of the common clk
> framework so that more code coverage and testing can be done on the
> common clk framework across various architectures. This also nicely
> removes the requirement that architectures must select the framework
> when they don't use it in architecture code.
>=20
> There's one snag with doing this, and that's making sure that randconfig
> builds don't select this option when some architecture or platform
> implements 'struct clk' outside of the common clk framework. Introduce a
> new config option 'HAVE_LEGACY_CLK' to indicate those platforms that
> haven't migrated to the common clk framework and therefore shouldn't be
> allowed to select this new config option. Also add a note that we hope
> one day to remove this config entirely.
>=20
> Based on a patch by Mark Brown <broonie@kernel.org>.
>=20
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Mark Salter <msalter@redhat.com>
> Cc: Aurelien Jacquiot <jacquiot.aurelien@gmail.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Guan Xuetao <gxt@pku.edu.cn>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: <linux-mips@vger.kernel.org>
> Cc: <linux-c6x-dev@linux-c6x.org>
> Cc: <linux-m68k@lists.linux-m68k.org>
> Cc: <linux-arm-kernel@lists.infradead.org>
> Cc: <linux-sh@vger.kernel.org>
> Link: https://lore.kernel.org/r/1470915049-15249-1-git-send-email-broonie=
@kernel.org
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next
