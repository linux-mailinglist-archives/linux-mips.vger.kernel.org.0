Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92EC528D8B0
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 04:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgJNCs5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Oct 2020 22:48:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:38526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbgJNCs5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Oct 2020 22:48:57 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B76E921775;
        Wed, 14 Oct 2020 02:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602643736;
        bh=T5KdQI9GSUjmKTIA2ui0sjwycyBsTzwM7hUXIWlqk4Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dOO8H0b/Dx5/elZCR+j0k1GGC18UoisNo2ay5+5Opth1aPZR4ngna4y4URecxXRnt
         W8k+23szW3Fx+Oaf8M3/AfCqy5stduxTKzFneVoMNLlGKROyCL6IPXb9RloVw9kV+1
         iGdgPOL/qpPb+NOFrJVl56Lxl+kkyya/h9AGVL9o=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200920110335.18034-1-Sergey.Semin@baikalelectronics.ru>
References: <20200920110335.18034-1-Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH] clk: baikal-t1: Mark Ethernet PLL as critical
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Date:   Tue, 13 Oct 2020 19:48:55 -0700
Message-ID: <160264373556.310579.3895214313999622637@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Serge Semin (2020-09-20 04:03:35)
> We've discovered that disabling the so called Ethernet PLL causes reset of
> the devices consuming its outgoing clock. The resets happen automatically
> even if each underlying clock gate is turned off. Due to that we can't
> disable the Ethernet PLL until the kernel is prepared for the correspondi=
ng
> resets. So for now just mark the PLL clock provider as critical.
>=20
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: linux-mips@vger.kernel.org
> ---

Applied to clk-next
