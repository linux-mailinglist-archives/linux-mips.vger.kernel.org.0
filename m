Return-Path: <linux-mips+bounces-13446-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDOTIQXer2kzdAIAu9opvQ
	(envelope-from <linux-mips+bounces-13446-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 10:01:57 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B64D8247CDC
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 10:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0EFE316BD98
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 08:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B2843CEDE;
	Tue, 10 Mar 2026 08:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZDQM11q"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A8B43CED2
	for <linux-mips@vger.kernel.org>; Tue, 10 Mar 2026 08:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133098; cv=none; b=ndPWl5Wa/PsewyXs+9AGWPxkdJYYlFEksdG9PAveb7oAP4edcd9hASP4grwXUVOzBVookeOqWgl+QjHpd4WAxuDnuOf73foQdg+oaDpkLZRMrOmlZQrrm5peGf/dwI6Aj7I8eIBVjTNoKGdRbfWlL11vurXwJ34FulnzhNb3ABc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133098; c=relaxed/simple;
	bh=M6JPfbr9d5IciKIoqHHW920nfQtcVt9K8aP07ynrnlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3LrorFmDnib+CDTO9mJmXiUj77jibs0csSwjlSCFTaAkwY0xFLypUpnNuZqVW8wNPZeT+N2XmnSoDs/7LH8AJhV3LsWcnQ2pGLUqY85Vvm92CfLc31xFNGLirPGpuBLmLXJWV+e22TtubiunIPt02v6z7ScFUrAzaUtvQni8hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZDQM11q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6193C2BCC6
	for <linux-mips@vger.kernel.org>; Tue, 10 Mar 2026 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133098;
	bh=M6JPfbr9d5IciKIoqHHW920nfQtcVt9K8aP07ynrnlo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tZDQM11qneSYqNndJJ+rDgCWCXaubztC0EU2cNYNl/DrHnKZ5Laa4TpxPCIr1Tr6A
	 PCrDcHv6Dr+xwk0QDncYwcPtzLnCmHNdMwjuU0NrvakPKmAKW7k+3L6nvvlJD0ih2/
	 PgVHQ6tQTtVwn6bAzDrJCbfg2qQHfwElUiTysHN8dwnn/Q2Rskunb3ViyCzBvLDBOB
	 +gh0Ubvtbj7EF+ns8yNPoWO6SsLO0Wg79q7JFUVqTg9W/ek+Cjtdwq3h7GxILDIGiS
	 vgWjY4s7SNRl8FPprWwQ3ndAPjFXStqqRlON74Ufj5u74XwPToW4LvPUfh5TVENmZb
	 iWWiL4NaGQI4A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a3fd333eeso31920611fa.1
        for <linux-mips@vger.kernel.org>; Tue, 10 Mar 2026 01:58:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrPqi15rCQIorJ5ogn0TuEsglbSKjNEaTUZlSOihVXvJOr7YEH+CHdNZBEBxPB5izwikCOENu56Cfd@vger.kernel.org
X-Gm-Message-State: AOJu0YymIQEWnWD4rbFWrLRZ9Ce+RdePGvmwxJ3+yW3WOjVTMEPEzDT0
	aWXQjekro09FpHWixiKwCA7DmOq7GQSdmZIBdxuIOaI5g9gFVMbLioHqiIS+2wCVKz8MULu2Uv3
	SdmvvgTdwKbWTuZuTvrLzQ58JTLENxHW/pI2fkyikTQ==
X-Received: by 2002:a2e:b012:0:b0:389:e2e8:4f4c with SMTP id
 38308e7fff4ca-38a5d05131dmr6527231fa.21.1773133095795; Tue, 10 Mar 2026
 01:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com> <4728554b256f016d9a5f3e019ed831387b0f059b.camel@redhat.com>
In-Reply-To: <4728554b256f016d9a5f3e019ed831387b0f059b.camel@redhat.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 10 Mar 2026 09:58:03 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me8pw5ROaopJ8bcon_NGR5TEZdkJL-F4H1-8b-U2FU9GQ@mail.gmail.com>
X-Gm-Features: AaiRm50drSEJRzFk2cE1mtMmfBxUomqwHAi_2o4urYZsnhjuUaH2OaO1HdaVg_g
Message-ID: <CAMRc=Me8pw5ROaopJ8bcon_NGR5TEZdkJL-F4H1-8b-U2FU9GQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 0/7] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
To: Radu Rendec <rrendec@redhat.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B64D8247CDC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,foss.st.com,st.com,synopsys.com,sholland.org,altera.com,linaro.org,baylibre.com,googlemail.com,pengutronix.de,oss.nxp.com,nxp.com,bootlin.com,bp.renesas.com,sntech.de,outlook.com,esmil.dk,starfivetech.com,mail.toshiba,glider.be,eswincomputing.com,intel.com,rock-chips.com,samsung.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13446-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[77];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 2:10=E2=80=AFAM Radu Rendec <rrendec@redhat.com> wr=
ote:
>
> On Fri, 2026-03-06 at 16:46 +0100, Bartosz Golaszewski wrote:
> > Add support for the firmware-managed variant of the DesignWare MAC on
> > the sa8255p platform. This series contains new DT bindings and driver
> > changes required to support the MAC in the STMMAC driver.
> >
> > It also reorganizes the ethqos code quite a bit to make the introductio=
n
> > of power domains into the driver a bit easier on the eye.
> >
> > The DTS changes will go in separately.
>
> As Jakub pointed out, it conflicts with the latest net-next, but does
> apply cleanly on the latest mainline, so I tested there (on a SA8775P
> board running the SCMI firmware).
>
> The two NICs come up as expected. Basic iperf3 throughput and jitter
> tests look good. I would offer a Tested-by tag and a summary of the
> test results, but I think it's a moot point because you'll have to
> submit a new version anyway.
>
> I will wait for you to rebase, then test again and come back with the
> results.
>

Thank you for the tests. The rework after the changes turned out to be
quite extensive. I should have it ready by the end of the week. I will
appreciate if you could retest it again by then and leave your tag.

Bart

