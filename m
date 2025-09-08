Return-Path: <linux-mips+bounces-11108-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C447B496A9
	for <lists+linux-mips@lfdr.de>; Mon,  8 Sep 2025 19:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 478EA206E47
	for <lists+linux-mips@lfdr.de>; Mon,  8 Sep 2025 17:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8942B31283A;
	Mon,  8 Sep 2025 17:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bDpRldxm"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C85C8E6
	for <linux-mips@vger.kernel.org>; Mon,  8 Sep 2025 17:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757351531; cv=none; b=twPRBGab9nqCndTz0Wd6jLWkCHY1Lysx4Ij3yeA3tEf933j0JQLKC49g073NmlLKVVzI5HP9AWKKfOJNDHs0XMyQTeF/XqzWe//LJvtcAd0Ims40RkiAp1/MOpENGd/88UZ1MD4X9WqFy/E/n19d24AOkEzHqm4y41D9Nu2ky9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757351531; c=relaxed/simple;
	bh=N0Ew5uLxMWlX2hxvzxeMznJDWzQfwf1IVExLfD9g+8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHGzn4rwNd6Oit0apUY+fmZc9mq841TLxWxoHuTlHnJ872PdRr2sA70VpDimHbvKNd4UcFN9cD0sAK7I8f1S0afmD6k4owzJd91X0MBq8E3hYyH7KZAh22yGI+0wQXK4ciLUxsbm1ZTa3kNkT0AVEuoITeIVJuNsKnrjTPgYl68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bDpRldxm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757351528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N0Ew5uLxMWlX2hxvzxeMznJDWzQfwf1IVExLfD9g+8c=;
	b=bDpRldxmzn4Roa5H8oW+ds6yyanYfIwABi+juurkehOzsOAOzhdQURu+jgSadQYY8hCiXN
	Tgynz4drBQRafTlrXHvlZ9xbuUmB8f9QOkj+imyw7adQrsh3sReQmNfPRzDh0uhuGzOobw
	0wIu3aRqOH7oOrBR6GidlFVFd7OWF1Q=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-rNdSbdVQOl2br-aHs5aZMg-1; Mon, 08 Sep 2025 13:12:06 -0400
X-MC-Unique: rNdSbdVQOl2br-aHs5aZMg-1
X-Mimecast-MFC-AGG-ID: rNdSbdVQOl2br-aHs5aZMg_1757351526
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5ecf597acso88646271cf.1
        for <linux-mips@vger.kernel.org>; Mon, 08 Sep 2025 10:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757351526; x=1757956326;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0Ew5uLxMWlX2hxvzxeMznJDWzQfwf1IVExLfD9g+8c=;
        b=SUNLSw5jtmTONPkJD8J6frZVUMlIMAhDKJkS+8zTUNhTE61Ip/AmE6icf5YIWqOxNV
         F4gHb7kTlqDN/eNs0VVxxl8Z1ZFH5fObUzLHbovOhZvs4teDzPZXk3vRrEpbK0PBLpMZ
         tamUY1tLJy0fHUDDdTzvoaMTpiFMc7gcXcZSaqGiDIelZXjrn0C1U0PbDO4VG8TEBgac
         40lRxZI07rviCfi1HrAi9Me/VITryH9xq3h9N52Y2TNNnlI0l0TvtU5Q4S4AYwnIX+uQ
         dNWrV36a0zni+uFRcILdbusdLsjDQTkNxDItI81cm4hwFswMCkpi2RKGMJgNuTeBkHpu
         X9dw==
X-Forwarded-Encrypted: i=1; AJvYcCUGWASf29GT9W6DN+kS89+RjNdeHzOAit0cfB/Cu70QrmzfumkNq08TEadEd+Bo1dPsaVk99PadnOe5@vger.kernel.org
X-Gm-Message-State: AOJu0YxWD7EoDDXEYQNIHEMhfPHhOIayYKIgPBxwW7bBCLwdd29y9cZF
	TfvakZj3K6T4QEjBAQV1FV8FIGFdwrjNk4FzIiSAzRkEjJYfPMyr8y5uW+00F3R2mUFBJLa9OLa
	W+l146dvJWqdZzGJJAV6qpU+1qQeszkj4TSe3yGCwVTzfF50WPK8kVozTONB++I4=
X-Gm-Gg: ASbGncuto7wxfXPzvsnrQ6wNL4w37QeIbAB6exMSGvS9ug6iO5FsAgHroe0mw2bkeDq
	O/avBqnUDRE/ObhBbi9pAVHvUAzXVvv79oRsb6w3b87TO3uBQqpQ2pYkJS5zBdzeKjURDhU0Jvb
	EO+lCraWsW9QSxIE4y7SGjSGM2vtqIVDQtlPJkiOGJgjeJME+Vkj7mOixVpImKN9gtyfpw01pEh
	BO1/dqbg0CTNOmBX8Yh3CxoIv2XcMfgB3nQ4nG33huE3+hl/+aNSXYdW0ZYk4e8jIzLBhzl3xHP
	woQUvH5oDjlFjywxXT8TEyZKTy3oYKM4cQ7+H9XbkiU4tGh5GmdSfY9vW4g=
X-Received: by 2002:ac8:5a12:0:b0:4b5:d739:6273 with SMTP id d75a77b69052e-4b5f8490345mr93489231cf.75.1757351525416;
        Mon, 08 Sep 2025 10:12:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVez0JttMWAhr/EpA5S3LWdvkJoIrJRGLs+fJ0AEeH7TgyS1UoHb0txwN7TUYVZQswHIwQlA==
X-Received: by 2002:ac8:5a12:0:b0:4b5:d739:6273 with SMTP id d75a77b69052e-4b5f8490345mr93488361cf.75.1757351524739;
        Mon, 08 Sep 2025 10:12:04 -0700 (PDT)
Received: from x1 ([2600:382:8507:870e:b6f8:ee72:4f09:a16a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aab5a062fsm1122872785a.48.2025.09.08.10.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:12:04 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:11:57 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-ID: <aL8OXeFC4N-J_kvC@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Aug 11, 2025 at 11:17:52AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> various clk drivers using the Coccinelle semantic patch posted below.
> I did a few minor cosmetic cleanups of the code in a few cases.

I included a subset of these patches in this pull request to Stephen:
https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u

Brian


