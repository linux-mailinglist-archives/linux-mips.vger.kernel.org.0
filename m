Return-Path: <linux-mips+bounces-13740-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDl/HfpluWkyDgIAu9opvQ
	(envelope-from <linux-mips+bounces-13740-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 15:32:26 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE48D2AC018
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 15:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9E1F31D00C6
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 14:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FED3E3DB1;
	Tue, 17 Mar 2026 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZAEscpa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32603EAC8C
	for <linux-mips@vger.kernel.org>; Tue, 17 Mar 2026 14:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756788; cv=none; b=debFOZ5N0lZjdUbc44mqVz+x/SLEUyMMuNm+lMIPSzgFMFkaA/Q1mB5kO445b5YWCr7LyHtfRX1v+TF+TNpi8oMnGPbOxbKc+4eIRKGxkv44cB5M1+F+t2YCT0ouAWuhT3c+iv32lUa+jWTbf2xpzJQe9F4m3iLfGIyYjAsY/eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756788; c=relaxed/simple;
	bh=9QDalKJYBUEDUJPFs8n5F17T6oCLIOfRdQADKKa+dtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLujsfuzbLE855ELQRNd7OppE6YBri2CTGLE2Wko5162tCATWQbF8HF8Q7t9uqRUYtIWgLmQDszk1z76gt8mb6lnb8vo10Rs4vD2FUv9UV+fQrQmj24vQmPIxABxly+10wpnGeQi5fUUDqnG5CGcDwnBhPfrWQdCWPEnm4y3lBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZAEscpa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C4FC2BCAF
	for <linux-mips@vger.kernel.org>; Tue, 17 Mar 2026 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773756787;
	bh=9QDalKJYBUEDUJPFs8n5F17T6oCLIOfRdQADKKa+dtg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tZAEscpa8SCC5cIZ2JquMfgXyJ2cYbjRRZovEZ4pp9iCwMtzoyZvoUvuYiYMbRTYC
	 SnQwovSWExy1qzNu8gKN2Re3kiqbZF6sZmkIooWlWa9EIx1ERfsbgtRs5rZB0SAIxf
	 3lPrGMQ4Ue2TuM4ia8nL9lBYQlDl9Z6+Gmi7Vne8vrfCzyTk9J2Ck3dsbBaTLAPSfD
	 NPCO+IQ8fm5HTfq9yr/wXF7f1MJldHxMFhyKqH3oTfoTSoTC0Dh5v2G2YRcDRDQgL5
	 ObXNTsitNLuKk+KvWrgZ9pPDroH39BoYVIyc5TZiwHYdHQ131NS6aY+w9jvXRnJOfo
	 pYQYSw8TEnjrw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38ad26e3992so5511591fa.1
        for <linux-mips@vger.kernel.org>; Tue, 17 Mar 2026 07:13:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKiV6Y+qCTYW8fhYWfZVfHanBcdfogfPadSwFapoEfdxQVoU5/6Sdu7xCWU8NuYQhIrlYdK168HwV3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzar2fL0AJxhPQm2jc6EnfInBWHD79mrxr6IqTnDNp1UE3V/A5O
	MQEH9kWaTLOXhWo8V60SLASECBWkEsIQOFT7YulJ2kv73rOc/V7tqg16OwaPGx80EZt0rD07ydh
	26qlPFxi2vvES8MJqi8rCByaU27Kq9a4KALD6PuYN7A==
X-Received: by 2002:a05:651c:2115:b0:37f:c5ca:a6d4 with SMTP id
 38308e7fff4ca-38a89666433mr58706271fa.6.1773756785569; Tue, 17 Mar 2026
 07:13:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com> <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
In-Reply-To: <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 17 Mar 2026 15:12:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
X-Gm-Features: AaiRm52mh793CgOH9S8BNXU-tBYi1I-pfEq9XQjt50faEkjR5xH42aEvJgG19dM
Message-ID: <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
Subject: Re: [PATCH net-next v9 0/6] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
To: Radu Rendec <rrendec@redhat.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Christophe Roullier <christophe.roullier@foss.st.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,bootlin.com,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev,googlemail.com,bp.renesas.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13740-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EE48D2AC018
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 7:31=E2=80=AFPM Radu Rendec <rrendec@redhat.com> wr=
ote:
>
> On Mon, 2026-03-16 at 13:05 +0100, Bartosz Golaszewski wrote:
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
> I'm seeing some weird behavior with this version. The probe part looks
> good (but see below), but when I try to bring an interface up, it fails
> with ETIMEDOUT. The relevant part of the stack trace leading to the
> error is this:
>
> dwmac4_dma_reset+0x208/0x220 [stmmac]
> stmmac_reset+0x2c/0x68 [stmmac]
> stmmac_init_dma_engine+0x108/0x400 [stmmac]
> stmmac_hw_setup+0x5c/0x538 [stmmac]
> __stmmac_open+0xc8/0x2a0 [stmmac]
> stmmac_open+0xcc/0x238 [stmmac]
> __dev_open+0x138/0x2a8
>
> Now dwmac4_dma_reset() is very simple. It sets the soft reset bit in
> the DMA_BUS_MODE register, then waits for the hardware to clear it, and
> that never happens.
>
> Now, getting back to the probe part, there is one extra message
> (compared to my previous successful test on v7), which I see at the
> very end of the probing:
>
>   qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00
>   exceeds mask 0x00000f00), truncating
>
> This is a sa8775p ride board, so there are two stmmac devices. I only
> see that message for the 2nd one, which is also the one I'm trying to
> enable, and which fails.
>
> I realize this may or may not be related to your changes. But there is
> no way to test on a SCMI-pd board without them. I'm not sure how
> relevant it would be to test on the non-SCMI variant. I'm assuming the
> DMA part should work the same way (regardless of SCMI-pd), so if I can
> reproduce it there, and since I know it works on mainline Linux (that's
> where I tested v7), I could bisect and see which commit in net-next
> breaks it. If you don't have any better idea, let me know and I can
> try. Meanwhile, I'll keep poking at v9.
>

Does current net-next on its own still work? Or is the second
interface broken even without this series?

Bart

