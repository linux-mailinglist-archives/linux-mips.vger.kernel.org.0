Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878173A087E
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jun 2021 02:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbhFIAp1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 20:45:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:51532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232568AbhFIAp0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Jun 2021 20:45:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A6E2613AD;
        Wed,  9 Jun 2021 00:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623199409;
        bh=+3nbsaIYk/9yAUNJxwycOrUZJOcVP4C0cA9bFgpvN1Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=V947suxOBLRh/R8cG/0idwsQNEccuscTWYgWGIfxx58Q9a8ZGN1do2O4RzQE7msXK
         fd+RRvSNSqBUg+4JSvaDCWwba6vxYzIoJzzfMhnedXMPRehrKqEG7h7T599ccTmjWs
         k2dtcOFXAdhQ3XasfnLrDkF1P4UKrWcmdCAdBe/A17snmb2fGG7DNjFpHKWXGglsvF
         qHUNR5YQHtc9IQ2ZNDP5Dy/cR2dl7+RXFpIvjCXiTnNLwe0ORxZR/Lw199UL+BlJJl
         PxzH/8o/RIDelePzZ6aR2PVwfD2V17MOV+IP4s5qjxPcYhG2cVNfJDOi0dP2ab5Na9
         CLMbDkoGfSXmQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210608152214.1231666-1-arnd@kernel.org>
References: <20210608152214.1231666-1-arnd@kernel.org>
Subject: Re: [GIT PULL v2] clk: clean up legacy clock interfaces
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
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Arnd Bergmann <arnd@kernel.org>, linux-clk@vger.kernel.org
Date:   Tue, 08 Jun 2021 17:43:27 -0700
Message-ID: <162319940793.1835121.10609879074370607740@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Arnd Bergmann (2021-06-08 08:22:07)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The following changes since commit 8124c8a6b35386f73523d27eacb71b5364a68c=
4c:
>=20
>   Linux 5.13-rc4 (2021-05-30 11:58:25 -1000)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git tags=
/clkdev-cleanup
>=20
> for you to fetch changes up to 84587cb0f9ed09b9b7f787276ef05beda4ae0ba8:
>=20
>   clkdev: remove unused clkdev_alloc() interfaces (2021-06-02 12:31:10 +0=
200)
>=20
> ---

Thanks. Pulled into clk-next
