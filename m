Return-Path: <linux-mips+bounces-13111-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJNACZtxg2mFmwMAu9opvQ
	(envelope-from <linux-mips+bounces-13111-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Feb 2026 17:19:39 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3D9EA184
	for <lists+linux-mips@lfdr.de>; Wed, 04 Feb 2026 17:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D767319C193
	for <lists+linux-mips@lfdr.de>; Wed,  4 Feb 2026 15:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BD4423A7B;
	Wed,  4 Feb 2026 15:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChyBoGK2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5BF423A76;
	Wed,  4 Feb 2026 15:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219872; cv=none; b=PDd8r+Cc08M11Gz0XWzJP5zBH519oMpUgWYdC+dJyaPPTp1KpvHVMn9Ighp1zfU5aYpiDhejsd6Y5zIxzWN0FOqi8JVW6u1yd4NPlUecJWOnFGRTUDb3Hr1kWer5H6NB6iSIi00T59Q20oftLQ83/zWVI5+L6JS0D/iuksVAgrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219872; c=relaxed/simple;
	bh=+SiVY+/yNC7rLAU4MsNDlaFmt/l6M3hSIaCT9ls3sWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m72uba23pl4WjvM98glI9P4rnREvAsy0VgAg9S2Kc0bfyPHOT7zG+uGX3MsKh+yq9PLwtnN4UZ6XpEjCuow0dOyn6PVZ5K5XuuGCw3fAJ84N7r7CgeY94MdZDpbkrJ00Oi18puXxHqzpDyn6UPB7+gWWz6MhOL++U3ZvwkG1saY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChyBoGK2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86463C4AF09;
	Wed,  4 Feb 2026 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770219872;
	bh=+SiVY+/yNC7rLAU4MsNDlaFmt/l6M3hSIaCT9ls3sWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ChyBoGK2yE6SGuM1Drf5M172SdoJACKZFUrrNsUyxs9tGn1I7qqhqJE3n0SdMuKH8
	 WBsiwmPVq8rOQ6GO0hIm6TfZIkR7fNFOFSnqJ6Wdc5I/3L23nQxD+pLZgfso/lsmdU
	 N1ft/ntOh+AHs/UCG+Km7aago4ldSONLc+3r2AOXwQZfUcNSU1niG9vFP8cVLMaEBv
	 VG4YKOSwN1dDXgyUhW0x6meOz/fA8+ehA5Aie8KkSz3fTjfCixIQW19ESOaqSx9ox7
	 M5PMr/5rexa0xvN6NnkgCdEKKhyKZgRD5vul5MiJBcLirTLb81zxgj6ptueMw8TKGG
	 fD9D5P7F7CkxQ==
From: Vinod Koul <vkoul@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 sophgo@lists.linux.dev, Chen-Yu Tsai <wens@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Michal Simek <michal.simek@amd.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-phy@lists.infradead.org
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Subject: Re: (subset) [PATCH 00/27] clk: remove deprecated API
 divider_round_rate() and friends
Message-Id: <177021986017.133434.7084660742419779164.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 21:14:20 +0530
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13111-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,gmail.com,lists.linux.dev,kernel.org,sholland.org,lists.infradead.org,bootlin.com,suse.de,socionext.com,nuvoton.com,mleia.com,timesys.com,linux.alibaba.com,foss.st.com,st-md-mailman.stormreply.com,amd.com,oss.qualcomm.com,ffwll.ch,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7B3D9EA184
X-Rspamd-Action: no action


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

[25/27] phy: ti: phy-j721e-wiz: convert from divider_round_rate() to divider_determine_rate()
        commit: dbeea86fecef7cf2b93aded4525d74f6277376ef

Best regards,
-- 
~Vinod



