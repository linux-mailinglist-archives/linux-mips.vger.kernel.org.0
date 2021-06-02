Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D4C3983A7
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jun 2021 09:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232270AbhFBH4J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Jun 2021 03:56:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:33036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229810AbhFBH4I (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Jun 2021 03:56:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7168B61042;
        Wed,  2 Jun 2021 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622620465;
        bh=X3FXKtQRmh7PNWZo8YL0z+MrxH2lNOXEggG/o4VH4PY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=m7ML+M1F3sZl715WG4XD0pK5pcFyRAXVDQV01KFdlItxJZzWWf2E5OQJGJvrRLpbn
         eEEpwtMq+G9kUMOPpAfbxpeQY7BGpcmPwXMHHTPIFuwLDHtC0Tq1wvxkzbu+iMMYri
         Z82VQno+hQ8r1sWeh7t0qCORkizidZPUM+tt4VJT/f8RG7s+zKRqU0NksIBHTmtIk0
         SJj+2HndUEZV+S5r9/veguVu7K6IGiWuJ+QAAVxIxcgqt7XqH3LsnzAVjJab/pyuuP
         eSaf6HqzgetagZjmUqCR0UfyESic9jBbxsxE5ZqaepiRP7SkbCqCrnnFX4sC2B82pP
         KL3CIae8cwhuQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210531184749.2475868-8-arnd@kernel.org>
References: <20210531184749.2475868-1-arnd@kernel.org> <20210531184749.2475868-8-arnd@kernel.org>
Subject: Re: [PATCH 7/7] clkdev: remove unused clkdev_alloc() interfaces
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org
To:     Arnd Bergmann <arnd@kernel.org>, linux-clk@vger.kernel.org
Date:   Wed, 02 Jun 2021 00:54:24 -0700
Message-ID: <162262046414.4130789.1161354377550746226@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Arnd Bergmann (2021-05-31 11:47:49)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The last user of clkdev_alloc() and clkdev_hw_alloc() was
> removed last year, so everything now calls clkdev_create()
> and clkdev_hw_create() instead.
>=20
> Removing the unused functions lets the compiler optimize
> the remaining ones slightly better.
>=20
> Fixes: e5006671acc7 ("clk: versatile: Drop the legacy IM-PD1 clock code")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
