Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79166330326
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 18:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbhCGRIV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 12:08:21 -0500
Received: from aposti.net ([89.234.176.197]:40118 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232535AbhCGRHz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 12:07:55 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/2] mmc: jz4740: Support PLL frequency changes
Date:   Sun,  7 Mar 2021 17:07:40 +0000
Message-Id: <20210307170742.70949-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

This set of two patches enables the MMC driver to cope with the main PLL
updating its rate, typically when the CPU frequency is being updated.

The first patch introduces clk_get_first_to_set_rate(), which will allow
the MMC driver to get a pointer to the clock that will effectively be
modified when calling clk_set_rate(); this is required to avoid a
chicken-and-egg situation with the clock notifier.

If accepted, this function will be reused in a few more drivers which
need to perform the same operation.

The patch to the MMC driver adds a atomic/mutex couple so that the
frequency change will happen when we know that the controller is not in
use.

Cheers,
-Paul

Paul Cercueil (2):
  clk: Add clk_get_first_to_set_rate
  mmc: jz4740: Add support for monitoring PLL clock rate changes

 drivers/clk/clk.c             |  9 +++++
 drivers/mmc/host/jz4740_mmc.c | 70 ++++++++++++++++++++++++++++++++++-
 include/linux/clk.h           | 16 ++++++++
 3 files changed, 94 insertions(+), 1 deletion(-)

-- 
2.30.1

