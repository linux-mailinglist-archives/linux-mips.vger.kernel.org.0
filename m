Return-Path: <linux-mips+bounces-12813-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C6FD0DAC5
	for <lists+linux-mips@lfdr.de>; Sat, 10 Jan 2026 20:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4C2C3017F18
	for <lists+linux-mips@lfdr.de>; Sat, 10 Jan 2026 19:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65B32C15B0;
	Sat, 10 Jan 2026 19:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCiyrFAU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B217121E087;
	Sat, 10 Jan 2026 19:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072294; cv=none; b=QwT1XYNeJFXuLjbcgEmh3MztQsokWMgiH+PSrcauS5N+SAX1cb9nvYyac8MVMFUTW7vaNKOfgIPk+a140jci5d7V/mWfD1y8NXSm2PgoEbufz8gpPeK3/srQ991VgVCJ4MDlCrs0ANd8MeqSCSFSCOa53ewfx5kMVUq2lzP0PNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072294; c=relaxed/simple;
	bh=ifQtDtBDcokzLccqf8aQCht97s3eipcMMEmXbpDw6Aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fA8vRN20KwBVAS1O9++wDTOR7UCFtDd0sNZAP9UFzr1t3q6eyWgJ9WsSAckSdEizj3PhNVvRad2I3NNHoX8wryLd2BxCv3vePVdSkxAdfvX1J4Qhd0icRCA9mccsUjnFVOckFMQcdqdYOdGtk8d7y86bWJrFSLqO4aHFVzdTDdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCiyrFAU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EEFC4CEF1;
	Sat, 10 Jan 2026 19:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072294;
	bh=ifQtDtBDcokzLccqf8aQCht97s3eipcMMEmXbpDw6Aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qCiyrFAU2xicKCibTXPIf3XhBQmk0g6ZWmSgHHXVP1B02QbrV77FWTZFOP1VjWDCw
	 qjMrQb+XKb5f4XadhrY/24Ap8FT4i3zPkyp8Hq83pZ7Qd05yBLYY/SjBLAoBYN1J91
	 tZcXYUR9WCowuaBnwQNH+5l+izoJ34YwXyJn9pNjN9mFqtBAcF6dVgtvosb5DN2PQH
	 UkWDCIMetOEIB1XAkKVOYI7Wkyc0F3Lm5PBO/vh7rnB4GSTP0L4HqCSOjm7fLM7dry
	 DJ/5zv35sUADTSmPEivxJvudoLJxOMiPSlaVLC0wreck+xhcPR7Tw1K+pdiPCNoYJW
	 fAQibqBj2d1ug==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	sophgo@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-actions@lists.infradead.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-mips@vger.kernel.org,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-arm-msm@vger.kernel.org,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Michal Simek <michal.simek@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH 00/27] clk: remove deprecated API divider_round_rate() and friends
Date: Sat, 10 Jan 2026 13:11:17 -0600
Message-ID: <176807228457.3708332.10766520174431957453.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 Jan 2026 16:16:18 -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.
> 
> Note that when I converted some of these drivers from round_rate to
> determine_rate, this was mistakenly converted to the following in some
> cases:
> 
> [...]

Applied, thanks!

[14/27] clk: qcom: alpha-pll: convert from divider_round_rate() to divider_determine_rate()
        commit: e1f08613e113f02a3ec18c9a7964de97f940acbf
[15/27] clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()
        commit: 35a48f41b63f67c490f3a2a89b042536be67cf0f
[16/27] clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()
        commit: b2f36d675e09299d9aee395c6f83d8a95d4c9441

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

