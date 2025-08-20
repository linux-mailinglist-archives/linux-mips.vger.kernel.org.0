Return-Path: <linux-mips+bounces-10400-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C33C0B2E523
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 20:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D093D5E2B4B
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 18:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECA327A91D;
	Wed, 20 Aug 2025 18:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRw0Y2Kq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4E92F4A;
	Wed, 20 Aug 2025 18:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755715300; cv=none; b=p8eWaOWGA/b5XzIfv1R3Ls08n2HydWDpFyB+tYfgBdd35w9mKDhRPdwEZWuO4T0AnJTQLoJro3jvD8z9hA6BbQHvwhlHk/wGKPoGQMKoIGN6L6tUGmRmb37asVy+JsgQmvjLGYpQgLOWMJqqs7uK/rUCmm/JJnrpQJpWoxm70Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755715300; c=relaxed/simple;
	bh=M5XEnOFREG6GMi9TBf8OOHitW0MuoZ1UyjUQop82X9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGAzcW8LZ/t7KN2zUmLGpDDKUiCzvQp4rNLdsshrEPaSzn0/NZDpXJz1eyGTKCrm8lI0dD/+tg5fH2lywehra4592zKJfkASQiNYF+ZpiWmnmReNDNQIk2uF/mj+0XrKhoFp3b2h/JxZCbBmVZtCnT6o1AMyez3SZHbyBSxToS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRw0Y2Kq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1A2C4CEE7;
	Wed, 20 Aug 2025 18:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755715299;
	bh=M5XEnOFREG6GMi9TBf8OOHitW0MuoZ1UyjUQop82X9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRw0Y2KqhY/SDk6LaVeVThSNpmLyzDfFQs5bFtAVoFUqtP1ZFfOotLhbfO7Zp+hTs
	 DLfqafLN2d7muUQ8yVUrXfsNf9/5PggxSi0DyRd2ivehu+Mu0uLQd5jLMkU/O6Lr4K
	 rJxE0kXBkzWLCMUoj/oXA7ee3yAaIDG1LPq+siSbD6ks/R0XSvXostGjYxKWVcLGqt
	 VtXRDdecITNNNM8TqV4Vz6WH0xhdCFMobtBq70ojgUTnfif0dn4eIZvoPjxgH6cl3l
	 Sk4T0cItD60JQ+WEgP360a+AE2+OEzFxGTnrcvE7mdUDGAXIWOxMnILycRhVCzjyBW
	 YfzzXASMN9dwQ==
Date: Wed, 20 Aug 2025 19:41:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
Message-ID: <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ykJoQEoXCL0DuqqK"
Content-Disposition: inline
In-Reply-To: <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
X-Cookie: BARBARA STANWYCK makes me nervous!!


--ykJoQEoXCL0DuqqK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 09:12:49AM +0200, Linus Walleij wrote:

> The qualcomm 32bit platforms fail in next anyway so I dropped the patches
> for now.

FWIW the i.MX8MP also seems to have been broken by this:

# bad: [5303936d609e09665deda94eaedf26a0e5c3a087] Add linux-next specific f=
iles for 20250820
# good: [3233c80d0aae77da9bf9a69c06c5bc1778e45fd0] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [ec0be3cdf40b5302248f3fb27a911cc630e8b855] regulator: consumer.rst:=
 document bulk operations
# good: [27848c082ba0b22850fd9fb7b185c015423dcdc7] spi: s3c64xx: Remove the=
 use of dev_err_probe()
# good: [c1dd310f1d76b4b13f1854618087af2513140897] spi: SPISG: Use devm_kca=
lloc() in aml_spisg_clk_init()
# good: [da9881d00153cc6d3917f6b74144b1d41b58338c] ASoC: qcom: audioreach: =
add support for SMECNS module
# good: [cf65182247761f7993737b710afe8c781699356b] ASoC: codecs: wsa883x: H=
andle shared reset GPIO for WSA883x speakers
# good: [2a55135201d5e24b80b7624880ff42eafd8e320c] ASoC: Intel: avs: Stream=
line register-component function names
# good: [550bc517e59347b3b1af7d290eac4fb1411a3d4e] regulator: bd718x7: Use =
kcalloc() instead of kzalloc()
# good: [0056b410355713556d8a10306f82e55b28d33ba8] spi: offload trigger: ad=
i-util-sigma-delta: clean up imports
# good: [daf855f76a1210ceed9541f71ac5dd9be02018a6] ASoC: es8323: enable DAP=
M power widgets for playback DAC
# good: [90179609efa421b1ccc7d8eafbc078bafb25777c] spi: spl022: use min_t()=
 to improve code
# good: [258384d8ce365dddd6c5c15204de8ccd53a7ab0a] ASoC: es8323: enable DAP=
M power widgets for playback DAC and output
# good: [6d068f1ae2a2f713d7f21a9a602e65b3d6b6fc6d] regulator: rt5133: Fix s=
pelling mistake "regualtor" -> "regulator"
# good: [a46e95c81e3a28926ab1904d9f754fef8318074d] ASoC: wl1273: Remove
# good: [48124569bbc6bfda1df3e9ee17b19d559f4b1aa3] spi: remove unneeded 'fa=
st_io' parameter in regmap_config
# good: [37533933bfe92cd5a99ef4743f31dac62ccc8de0] regulator: remove unneed=
ed 'fast_io' parameter in regmap_config
# good: [0e62438e476494a1891a8822b9785bc6e73e9c3f] ASoC: Intel: sst: Remove=
 redundant semicolons
# good: [5c36b86d2bf68fbcad16169983ef7ee8c537db59] regmap: Remove superfluo=
us check for !config in __regmap_init()
# good: [714165e1c4b0d5b8c6d095fe07f65e6e7047aaeb] regulator: rt5133: Add R=
T5133 PMIC regulator Support
# good: [9c45f95222beecd6a284fd1284d54dd7a772cf59] spi: spi-qpic-snand: han=
dle 'use_ecc' parameter of qcom_spi_config_cw_read()
# good: [bab4ab484a6ca170847da9bffe86f1fa90df4bbe] ASoC: dt-bindings: Conve=
rt brcm,bcm2835-i2s to DT schema
# good: [b832b19318534bb4f1673b24d78037fee339c679] spi: loopback-test: Don'=
t use %pK through printk
# good: [8c02c8353460f8630313aef6810f34e134a3c1ee] ASoC: dt-bindings: realt=
ek,alc5623: convert to DT schema
# good: [6b7e2aa50bdaf88cd4c2a5e2059a7bf32d85a8b1] spi: spi-qpic-snand: rem=
ove 'clr*status' members of struct 'qpic_ecc'
# good: [2291a2186305faaf8525d57849d8ba12ad63f5e7] MAINTAINERS: Add entry f=
or FourSemi audio amplifiers
# good: [a54ef14188519a0994d0264f701f5771815fa11e] regulator: dt-bindings: =
Clean-up active-semi,act8945a duplication
# good: [595b7f155b926460a00776cc581e4dcd01220006] ASoC: Intel: avs: Condit=
ional-path support
# good: [cf25eb8eae91bcae9b2065d84b0c0ba0f6d9dd34] ASoC: soc-component: unp=
ack snd_soc_component_init_bias_level()
# good: [3059067fd3378a5454e7928c08d20bf3ef186760] ASoC: cs48l32: Use PTR_E=
RR_OR_ZERO() to simplify code
# good: [a1d0b0ae65ae3f32597edfbb547f16c75601cd87] spi: spi-qpic-snand: avo=
id double assignment in qcom_spi_probe()
# good: [2d86d2585ab929a143d1e6f8963da1499e33bf13] ASoC: pxa: add GPIOLIB_L=
EGACY dependency
# good: [9a200cbdb54349909a42b45379e792e4b39dd223] rust: regulator: impleme=
nt Send and Sync for Regulator<T>
# good: [162e23657e5379f07c6404dbfbf4367cb438ea7d] regulator: pf0900: Add P=
MIC PF0900 support
# good: [886f42ce96e7ce80545704e7168a9c6b60cd6c03] regmap: mmio: Add missin=
g MODULE_DESCRIPTION()
git bisect start '5303936d609e09665deda94eaedf26a0e5c3a087' '3233c80d0aae77=
da9bf9a69c06c5bc1778e45fd0' 'ec0be3cdf40b5302248f3fb27a911cc630e8b855' '278=
48c082ba0b22850fd9fb7b185c015423dcdc7' 'c1dd310f1d76b4b13f1854618087af25131=
40897' 'da9881d00153cc6d3917f6b74144b1d41b58338c' 'cf65182247761f7993737b71=
0afe8c781699356b' '2a55135201d5e24b80b7624880ff42eafd8e320c' '550bc517e5934=
7b3b1af7d290eac4fb1411a3d4e' '0056b410355713556d8a10306f82e55b28d33ba8' 'da=
f855f76a1210ceed9541f71ac5dd9be02018a6' '90179609efa421b1ccc7d8eafbc078bafb=
25777c' '258384d8ce365dddd6c5c15204de8ccd53a7ab0a' '6d068f1ae2a2f713d7f21a9=
a602e65b3d6b6fc6d' 'a46e95c81e3a28926ab1904d9f754fef8318074d' '48124569bbc6=
bfda1df3e9ee17b19d559f4b1aa3' '37533933bfe92cd5a99ef4743f31dac62ccc8de0' '0=
e62438e476494a1891a8822b9785bc6e73e9c3f' '5c36b86d2bf68fbcad16169983ef7ee8c=
537db59' '714165e1c4b0d5b8c6d095fe07f65e6e7047aaeb' '9c45f95222beecd6a284fd=
1284d54dd7a772cf59' 'bab4ab484a6ca170847da9bffe86f1fa90df4bbe' 'b832b193185=
34bb4f1673b24d78037fee339c679' '8c02c8353460f8630313aef6810f34e134a3c1ee' '=
6b7e2aa50bdaf88cd4c2a5e2059a7bf32d85a8b1' '2291a2186305faaf8525d57849d8ba12=
ad63f5e7' 'a54ef14188519a0994d0264f701f5771815fa11e' '595b7f155b926460a0077=
6cc581e4dcd01220006' 'cf25eb8eae91bcae9b2065d84b0c0ba0f6d9dd34' '3059067fd3=
378a5454e7928c08d20bf3ef186760' 'a1d0b0ae65ae3f32597edfbb547f16c75601cd87' =
'2d86d2585ab929a143d1e6f8963da1499e33bf13' '9a200cbdb54349909a42b45379e792e=
4b39dd223' '162e23657e5379f07c6404dbfbf4367cb438ea7d' '886f42ce96e7ce805457=
04e7168a9c6b60cd6c03'
# test job: [ec0be3cdf40b5302248f3fb27a911cc630e8b855] https://lava.sirena.=
org.uk/scheduler/job/1694307
# test job: [27848c082ba0b22850fd9fb7b185c015423dcdc7] https://lava.sirena.=
org.uk/scheduler/job/1693517
# test job: [c1dd310f1d76b4b13f1854618087af2513140897] https://lava.sirena.=
org.uk/scheduler/job/1693018
# test job: [da9881d00153cc6d3917f6b74144b1d41b58338c] https://lava.sirena.=
org.uk/scheduler/job/1693440
# test job: [cf65182247761f7993737b710afe8c781699356b] https://lava.sirena.=
org.uk/scheduler/job/1687555
# test job: [2a55135201d5e24b80b7624880ff42eafd8e320c] https://lava.sirena.=
org.uk/scheduler/job/1685791
# test job: [550bc517e59347b3b1af7d290eac4fb1411a3d4e] https://lava.sirena.=
org.uk/scheduler/job/1685919
# test job: [0056b410355713556d8a10306f82e55b28d33ba8] https://lava.sirena.=
org.uk/scheduler/job/1685951
# test job: [daf855f76a1210ceed9541f71ac5dd9be02018a6] https://lava.sirena.=
org.uk/scheduler/job/1685448
# test job: [90179609efa421b1ccc7d8eafbc078bafb25777c] https://lava.sirena.=
org.uk/scheduler/job/1686039
# test job: [258384d8ce365dddd6c5c15204de8ccd53a7ab0a] https://lava.sirena.=
org.uk/scheduler/job/1673401
# test job: [6d068f1ae2a2f713d7f21a9a602e65b3d6b6fc6d] https://lava.sirena.=
org.uk/scheduler/job/1673160
# test job: [a46e95c81e3a28926ab1904d9f754fef8318074d] https://lava.sirena.=
org.uk/scheduler/job/1673778
# test job: [48124569bbc6bfda1df3e9ee17b19d559f4b1aa3] https://lava.sirena.=
org.uk/scheduler/job/1670205
# test job: [37533933bfe92cd5a99ef4743f31dac62ccc8de0] https://lava.sirena.=
org.uk/scheduler/job/1668953
# test job: [0e62438e476494a1891a8822b9785bc6e73e9c3f] https://lava.sirena.=
org.uk/scheduler/job/1669557
# test job: [5c36b86d2bf68fbcad16169983ef7ee8c537db59] https://lava.sirena.=
org.uk/scheduler/job/1667973
# test job: [714165e1c4b0d5b8c6d095fe07f65e6e7047aaeb] https://lava.sirena.=
org.uk/scheduler/job/1667708
# test job: [9c45f95222beecd6a284fd1284d54dd7a772cf59] https://lava.sirena.=
org.uk/scheduler/job/1667594
# test job: [bab4ab484a6ca170847da9bffe86f1fa90df4bbe] https://lava.sirena.=
org.uk/scheduler/job/1664700
# test job: [b832b19318534bb4f1673b24d78037fee339c679] https://lava.sirena.=
org.uk/scheduler/job/1659191
# test job: [8c02c8353460f8630313aef6810f34e134a3c1ee] https://lava.sirena.=
org.uk/scheduler/job/1659680
# test job: [6b7e2aa50bdaf88cd4c2a5e2059a7bf32d85a8b1] https://lava.sirena.=
org.uk/scheduler/job/1656553
# test job: [2291a2186305faaf8525d57849d8ba12ad63f5e7] https://lava.sirena.=
org.uk/scheduler/job/1655728
# test job: [a54ef14188519a0994d0264f701f5771815fa11e] https://lava.sirena.=
org.uk/scheduler/job/1656000
# test job: [595b7f155b926460a00776cc581e4dcd01220006] https://lava.sirena.=
org.uk/scheduler/job/1653539
# test job: [cf25eb8eae91bcae9b2065d84b0c0ba0f6d9dd34] https://lava.sirena.=
org.uk/scheduler/job/1654787
# test job: [3059067fd3378a5454e7928c08d20bf3ef186760] https://lava.sirena.=
org.uk/scheduler/job/1654021
# test job: [a1d0b0ae65ae3f32597edfbb547f16c75601cd87] https://lava.sirena.=
org.uk/scheduler/job/1654843
# test job: [2d86d2585ab929a143d1e6f8963da1499e33bf13] https://lava.sirena.=
org.uk/scheduler/job/1654129
# test job: [9a200cbdb54349909a42b45379e792e4b39dd223] https://lava.sirena.=
org.uk/scheduler/job/1654752
# test job: [162e23657e5379f07c6404dbfbf4367cb438ea7d] https://lava.sirena.=
org.uk/scheduler/job/1652983
# test job: [886f42ce96e7ce80545704e7168a9c6b60cd6c03] https://lava.sirena.=
org.uk/scheduler/job/1654290
# test job: [5303936d609e09665deda94eaedf26a0e5c3a087] https://lava.sirena.=
org.uk/scheduler/job/1697747
# bad: [5303936d609e09665deda94eaedf26a0e5c3a087] Add linux-next specific f=
iles for 20250820
git bisect bad 5303936d609e09665deda94eaedf26a0e5c3a087
# test job: [a04a7cfd17ecdf952dad025c42602e35f06cbe26] https://lava.sirena.=
org.uk/scheduler/job/1697920
# good: [a04a7cfd17ecdf952dad025c42602e35f06cbe26] Merge branch 'for-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git
git bisect good a04a7cfd17ecdf952dad025c42602e35f06cbe26
# test job: [9dee0ee90f388dcd58c3cde7a4ebf2f9e3754862] https://lava.sirena.=
org.uk/scheduler/job/1697987
# good: [9dee0ee90f388dcd58c3cde7a4ebf2f9e3754862] Merge branch 'drm-xe-nex=
t' of https://gitlab.freedesktop.org/drm/xe/kernel.git
git bisect good 9dee0ee90f388dcd58c3cde7a4ebf2f9e3754862
# test job: [58e76aa12190454eb2edcb1cc651d77186e6a2be] https://lava.sirena.=
org.uk/scheduler/job/1698079
# good: [58e76aa12190454eb2edcb1cc651d77186e6a2be] Merge branch 'usb-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
git bisect good 58e76aa12190454eb2edcb1cc651d77186e6a2be
# test job: [1135450b9d5cef61b2b9e6127f1b9436fcc2f043] https://lava.sirena.=
org.uk/scheduler/job/1698167
# good: [1135450b9d5cef61b2b9e6127f1b9436fcc2f043] Merge branch 'for-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git
git bisect good 1135450b9d5cef61b2b9e6127f1b9436fcc2f043
# test job: [e8fa3be5815c2241a72d1875e0e34bebe83c296a] https://lava.sirena.=
org.uk/scheduler/job/1698576
# bad: [e8fa3be5815c2241a72d1875e0e34bebe83c296a] Merge branch 'for-next' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
git bisect bad e8fa3be5815c2241a72d1875e0e34bebe83c296a
# test job: [c5998be4099bd35f2959e7a22072f33cc7791262] https://lava.sirena.=
org.uk/scheduler/job/1699088
# bad: [c5998be4099bd35f2959e7a22072f33cc7791262] Merge branch 'devel' into=
 for-next
git bisect bad c5998be4099bd35f2959e7a22072f33cc7791262
# test job: [15e3363af00a9e5b4f5c10b17940733a8613ef57] https://lava.sirena.=
org.uk/scheduler/job/1699178
# good: [15e3363af00a9e5b4f5c10b17940733a8613ef57] dt-bindings: pinctrl: Do=
cument Tegra186 pin controllers
git bisect good 15e3363af00a9e5b4f5c10b17940733a8613ef57
# test job: [1e42d3e06bef6548215c45288d12974bfa295ba0] https://lava.sirena.=
org.uk/scheduler/job/1700639
# bad: [1e42d3e06bef6548215c45288d12974bfa295ba0] pinctrl: imx: don't acces=
s the pin function radix tree directly
git bisect bad 1e42d3e06bef6548215c45288d12974bfa295ba0
# test job: [fe2e8f17a56fe14915cd6b709e9f56a16029f104] https://lava.sirena.=
org.uk/scheduler/job/1700756
# good: [fe2e8f17a56fe14915cd6b709e9f56a16029f104] pinctrl: sx150x: Make th=
e driver tristate
git bisect good fe2e8f17a56fe14915cd6b709e9f56a16029f104
# test job: [cb21815ebd17be84a93e49ce7e1641651424692b] https://lava.sirena.=
org.uk/scheduler/job/1700885
# good: [cb21815ebd17be84a93e49ce7e1641651424692b] pinctrl: airoha: replace=
 struct function_desc with struct pinfunction
git bisect good cb21815ebd17be84a93e49ce7e1641651424692b
# test job: [3d2d080dc8bbe3ec23ee5b61aae81aaaf3009169] https://lava.sirena.=
org.uk/scheduler/job/1701027
# good: [3d2d080dc8bbe3ec23ee5b61aae81aaaf3009169] pinctrl: mediatek: moore=
: replace struct function_desc with struct pinfunction
git bisect good 3d2d080dc8bbe3ec23ee5b61aae81aaaf3009169
# first bad commit: [1e42d3e06bef6548215c45288d12974bfa295ba0] pinctrl: imx=
: don't access the pin function radix tree directly

--ykJoQEoXCL0DuqqK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmimFtcACgkQJNaLcl1U
h9Baywf4p+dojeFAcsrzcBqcjenyfuNAG1DS6m2FKGOdly3A0D/5bu2sHfE3OLPO
WnEv3kf/lxkHF8yH9pmPBiAojsJFymU0qPVZrzBMPuELDKK214f1tWFoevrj0AZg
0UVVPxnPE1DOczyzUGSt7pOnNly/Bz5XzLbIL6DCxl87fUua76KdXFzqMJlFUMSy
h3dLCNR9TJxm+sZ+4O5DuYyisMNQFHILWIp60ws5BbrseVcqhdc31basf8LJWpXC
wC7izJI9bu+Lb0ObJZxUFB/9z22PUYa3XjMy5lmDlV5/eTDiwL/x1TqNGt4JquuO
O8i4i1O03fUY1PGOa0AJ/NZIyRVV
=IcT8
-----END PGP SIGNATURE-----

--ykJoQEoXCL0DuqqK--

