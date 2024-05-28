Return-Path: <linux-mips+bounces-3360-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4BA8D2519
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 21:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E778281D36
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 19:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B49176FA8;
	Tue, 28 May 2024 19:49:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA78423BF
	for <linux-mips@vger.kernel.org>; Tue, 28 May 2024 19:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925798; cv=none; b=lsmiuCFD0vatKkGGS2C3HnOCWiSUDdtw1aMy+JkNolfXEEG6k8ph3qMmGhofazziI8ij7hRrU1knjjhH/ea/zXPw+jPsSGyAcrFW19JK9PD1tKMASt4SZM8fndzJqpdtozv5Qi1vsYJBwLvBvTLfC7Die6NBsclmN+X4KsWZPUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925798; c=relaxed/simple;
	bh=uR49CWG0UeYTwW1fa6tgkCtbg0rKg8I1n0NkFO1bw4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OMzNmSvzmKXMUfMe9fY3FHvV+QBWIAbGaYFrMTX62cgXhqrSgmYhB8OH0hmNDGeJsEUluC7/AoIBZJ4RMqWePMIOhPLwbJE4LEpB+HGawBYhRTXt8WSqJgZ5ZpO77ExufLtnjgdVVdeelXjKa0g6LhZDBOJhwxi9m0qP5sYbdzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 73e10ddf-1d2b-11ef-80c1-005056bdfda7;
	Tue, 28 May 2024 22:49:54 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 00/11] pinctrl: pinmux: Embed and reuse struct pinfunction
Date: Tue, 28 May 2024 22:44:51 +0300
Message-ID: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As promised to Linus W. there is a series that converts struct function_desc
to use struct pinfunction. With this it both struct group_desc and struct
function_desc will rely on the generic data types (struct pingroup and struct
pinfunction respectively). I haven't compiled everything, some builds might
fail. Anyway, comments, reviews, testing are all appreciated. 

In v2:
- fixed compilation problems found so far by LKP

Andy Shevchenko (11):
  pinctrl: berlin: Make use of struct pinfunction
  pinctrl: equilibrium: Make use of struct pinfunction
  pinctrl: ingenic: Provide a helper macro INGENIC_PIN_FUNCTION()
  pinctrl: mediatek: Provide a helper macro PINCTRL_PIN_FUNCTION()
  pinctrl: pinmux: Add a convenient define PINCTRL_FUNCTION_DESC()
  pinctrl: pinmux: Embed struct pinfunction into struct function_desc
  pinctrl: imx: Convert to use func member
  pinctrl: ingenic: Convert to use func member
  pinctrl: keembay: Convert to use func member
  pinctrl: mediatek: Convert to use func member
  pinctrl: pinmux: Remove unused members from struct function_desc

 drivers/pinctrl/berlin/berlin.c           |  21 +-
 drivers/pinctrl/berlin/berlin.h           |   6 -
 drivers/pinctrl/core.h                    |   2 +-
 drivers/pinctrl/freescale/pinctrl-imx.c   |  14 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c  |  10 +-
 drivers/pinctrl/mediatek/pinctrl-moore.h  |   6 +
 drivers/pinctrl/mediatek/pinctrl-mt7622.c |  32 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c |  42 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c |  20 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c |  34 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c |  24 +-
 drivers/pinctrl/pinctrl-equilibrium.c     |  24 +-
 drivers/pinctrl/pinctrl-equilibrium.h     |  12 -
 drivers/pinctrl/pinctrl-ingenic.c         | 707 +++++++++++-----------
 drivers/pinctrl/pinctrl-keembay.c         |  22 +-
 drivers/pinctrl/pinmux.c                  |  19 +-
 drivers/pinctrl/pinmux.h                  |  19 +-
 17 files changed, 503 insertions(+), 511 deletions(-)

-- 
2.45.1


