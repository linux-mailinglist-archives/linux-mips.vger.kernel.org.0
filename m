Return-Path: <linux-mips+bounces-9666-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B32AFCF9A
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 17:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5193423088
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jul 2025 15:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5552E172E;
	Tue,  8 Jul 2025 15:47:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8232DF3FB;
	Tue,  8 Jul 2025 15:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751989656; cv=none; b=eEdxbh2a6BG1hhTBH2NalS7MvNySTeeGcLpEj3JUrUg6ZbQggNnepTE+Qd8gajteqa5fFO5ucIw7FZVvTehOp5BhiH5AMypbVsl5SB//+uqOM8k/GmYJyTcI6hEA2wInG/tqqVtzg9v8ng17+e7SlxcZKiaTEUcPFwBf+p9Y2sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751989656; c=relaxed/simple;
	bh=gaMKsqU+Nh1+keJmHDwOYUCbZaHBYH6JUWi1mu3uyx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KzYIzNLQp80PQP0nK7aJBiehCyksnG42kvoAcIDQlNs8xajHJ7l1gvHmxqCAh8gg+KFnXGRhJR+cPts8z3dMa3dYSOM4ehHwxRxshoj93Eniu3TWhNCZ6/RRonrcwQERPR3USJgiOG6y1iFZd3UaZ+c2pYjOavwMMCWikLQidsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB56C4CEED;
	Tue,  8 Jul 2025 15:47:33 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rahul Bedarkar <rahulbedarkar89@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: img: Imagination Technologies sound should depend on MIPS
Date: Tue,  8 Jul 2025 17:47:29 +0200
Message-ID: <242832f225ae68018111648ea9934dc059741567.1751989463.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before, all Imagination sound symbols were gated by the SND_SOC_IMG
symbol, offering the user a simple option to hide them all.  After the
removal of this gate symbol, all symbols are exposed to the user, even
when configuring a kernel for a non-Imagination platform.
Fix this by adding a dependency on MIPS, to prevent asking the user
about these drivers when configuring a kernel for a different
architecture.

Fixes: b13f7eef9ff82e01 ("ASoC: img: Standardize ASoC menu")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/img/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/img/Kconfig b/sound/soc/img/Kconfig
index 9a4cba6fdb505d69..22b75a8144a18170 100644
--- a/sound/soc/img/Kconfig
+++ b/sound/soc/img/Kconfig
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "Imagination Technologies"
+	depends on MIPS || COMPILE_TEST
 
 config SND_SOC_IMG_I2S_IN
 	tristate "Imagination I2S Input Device Driver"
-- 
2.43.0


