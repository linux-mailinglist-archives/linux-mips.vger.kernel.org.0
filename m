Return-Path: <linux-mips+bounces-3335-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1B88D0F70
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 23:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8295328300D
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 21:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD49161306;
	Mon, 27 May 2024 21:27:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63B216133E
	for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 21:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716845272; cv=none; b=b+gxKccwmDGvk6c3ERo9Yr0yIP/Z3xrhIUsziTDoITVW3pJurlasrS0ZLxFL7esFqXQrzG0twVesg9sl1D4wvPeJ1efa+wyDKuTMyCZ9wD8gr/ujXJa8Sn+FgKz7mieFPi/Bke27sI6grAzyBfd4rsJaUBRZu1v7HdRakph5V8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716845272; c=relaxed/simple;
	bh=hcPCGtyNt9BtsRv3MK9CcRwmRQmt//+7sIK53y3Zy5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RXvJo0eaiUvw+iQ1HEVQP1T5rCJgpABjmK6mZ9UH75gXUgpj7F58/02dYyNg2KkuCa5ReIKGDOHpXUXipkdksQtE5nj0gScEhaxuKMxlheL2TA02vJdrXZZ1pVJRf8BfEYLRO4WXzLEa+eisVi6abM8tqW59c0vmrA8pjS6fleo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id f5f62320-1c6f-11ef-8e2a-005056bdf889;
	Tue, 28 May 2024 00:27:47 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
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
Subject: [PATCH v1 00/11] pinctrl: pinmux: Embed and reuse struct pinfunction
Date: Tue, 28 May 2024 00:24:35 +0300
Message-ID: <20240527212742.1432960-1-andy.shevchenko@gmail.com>
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
pinfunction respectively).

I haven't compiled everything, some builds might fail. Anyway, comments, reviews,
testing are all appreciated.

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

 drivers/pinctrl/berlin/berlin.c           |  33 +-
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
 drivers/pinctrl/pinctrl-equilibrium.c     |  18 +-
 drivers/pinctrl/pinctrl-equilibrium.h     |  12 -
 drivers/pinctrl/pinctrl-ingenic.c         | 707 +++++++++++-----------
 drivers/pinctrl/pinctrl-keembay.c         |  22 +-
 drivers/pinctrl/pinmux.c                  |  15 +-
 drivers/pinctrl/pinmux.h                  |  19 +-
 17 files changed, 501 insertions(+), 515 deletions(-)

-- 
2.45.1


